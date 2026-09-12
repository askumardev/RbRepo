class Article < ApplicationRecord
  has_many :sections
end

class Section < ApplicationRecord
  belongs_to :article
end

 a.each do |x|
  x.sections.count
 end
  Section Count (1.8ms)  SELECT COUNT(*) FROM "sections" WHERE "sections"."article_id" = 1 /*application='DevLab'*/
  Section Count (1.0ms)  SELECT COUNT(*) FROM "sections" WHERE "sections"."article_id" = 2 /*application='DevLab'*/
  Section Count (0.9ms)  SELECT COUNT(*) FROM "sections" WHERE "sections"."article_id" = 3 /*application='DevLab'*/
  Section Count (1.0ms)  SELECT COUNT(*) FROM "sections" WHERE "sections"."article_id" = 4 /*application='DevLab'*/
  Section Count (1.0ms)  SELECT COUNT(*) FROM "sections" WHERE "sections"."article_id" = 5 /*application='DevLab'*/
  Section Count (1.0ms)  SELECT COUNT(*) FROM "sections" WHERE "sections"."article_id" = 6 /*application='DevLab'*/

 a.each do |x|
   x.sections.length
 pry(main)> end
  Section Load (1.0ms)  SELECT "sections".* FROM "sections" WHERE "sections"."article_id" = 1 ORDER BY "sections"."position" ASC /*application='DevLab'*/
  Section Load (0.9ms)  SELECT "sections".* FROM "sections" WHERE "sections"."article_id" = 2 ORDER BY "sections"."position" ASC /*application='DevLab'*/
  Section Load (0.7ms)  SELECT "sections".* FROM "sections" WHERE "sections"."article_id" = 3 ORDER BY "sections"."position" ASC /*application='DevLab'*/
  Section Load (0.7ms)  SELECT "sections".* FROM "sections" WHERE "sections"."article_id" = 4 ORDER BY "sections"."position" ASC /*application='DevLab'*/
  Section Load (0.9ms)  SELECT "sections".* FROM "sections" WHERE "sections"."article_id" = 5 ORDER BY "sections"."position" ASC /*application='DevLab'*/
  Section Load (0.8ms)  SELECT "sections".* FROM "sections" WHERE "sections"."article_id" = 6 ORDER BY "sections"."position" ASC /*application='DevLab'*/


  # app/services/money_transfer_service.rb

class MoneyTransferService
  class InsufficientBalanceError < StandardError; end
  class AccountNotFoundError < StandardError; end
  class InvalidTransferError < StandardError; end

  def self.call(from_account_id:, to_account_id:, amount:)
    raise InvalidTransferError, "Transfer amount must be greater than zero" if amount <= 0

    Account.transaction do
      # Lock accounts in a consistent order to avoid deadlocks
      account_ids = [from_account_id, to_account_id].sort

      accounts = Account.where(id: account_ids)
                        .lock
                        .index_by(&:id)

      from_account = accounts[from_account_id]
      to_account   = accounts[to_account_id]

      raise AccountNotFoundError, "Sender account not found" unless from_account
      raise AccountNotFoundError, "Receiver account not found" unless to_account

      raise InvalidTransferError, "Cannot transfer to the same account" if from_account.id == to_account.id

      if from_account.balance < amount
        raise InsufficientBalanceError, "Insufficient balance"
      end

      from_account.balance -= amount
      to_account.balance += amount

      from_account.save!
      to_account.save!

      {
        status: "success",
        from_balance: from_account.balance,
        to_balance: to_account.balance
      }
    end
  rescue ActiveRecord::RecordInvalid => e
    Rails.logger.error("Validation Failed: #{e.message}")
    raise
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error("Record Not Found: #{e.message}")
    raise AccountNotFoundError, e.message
  rescue ActiveRecord::Deadlocked => e
    Rails.logger.error("Deadlock Detected: #{e.message}")
    raise
  rescue => e
    Rails.logger.error("Transfer Failed: #{e.class} - #{e.message}")
    raise
  end
end



class TransfersController < ApplicationController
  def create
    result = MoneyTransferService.call(
      from_account_id: params[:from_account_id],
      to_account_id: params[:to_account_id],
      amount: params[:amount].to_d
    )

    render json: result, status: :ok

  rescue MoneyTransferService::InsufficientBalanceError => e
    render json: { error: e.message }, status: :unprocessable_entity

  rescue MoneyTransferService::AccountNotFoundError => e
    render json: { error: e.message }, status: :not_found

  rescue MoneyTransferService::InvalidTransferError => e
    render json: { error: e.message }, status: :bad_request

  rescue => e
    Rails.logger.error(e.full_message)

    render json: {
      error: "Internal Server Error"
    }, status: :internal_server_error
  end
end
