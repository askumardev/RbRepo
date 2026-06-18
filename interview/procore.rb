# rspec interview/procore.rb -v

require 'rspec/autorun'
require 'set'

# Scheduling work on a jobsite is one of the most difficult tasks in
# construction management. Different contractors work on different
# trades and can only do so much work in a single day. We need to
# make sure that we have the right people on the job site every day
# and anticipate how many days it will take to complete a set of tasks.
#
# *Requirements:*
#
#  ** Your solution should prefer to finish the work as fast as possible

class WorkScheduler
  attr_accessor :workers


  def initialize(workers)
    @workers = workers
  end

  # Given a suitable trade, returns a list of emails of workers who work the specified trade.
  #
  # @param trade [String] Specific trade desired.
  # @return [Array<String>] Array of worker emails, sorted alphabetically.
  def suitable_workers(trade)
    @workers
      .select { |worker| worker[:trades].include?(trade) }
      .map { |worker| worker[:email] }
      .sort
  end

  # Given a list of trades, return a list of worker emails that can work that day. A worker cannot work multiple
  # trades in one day, and if there are multiple workers available to work on a particular trade, the worker with the
  # cheapest cost should be chosen.
  #
  # @param trades [Array<String>] An array of trades. Each trade represents 1 unit of work that needs to be completed.
  # @return [Array<String>] Array of worker emails that are scheduled for the day, in the order that they were
  #   scheduled (i.e. in the same order that the trades were provided).
  def schedule_one_day(trades)
    scheduled = []
    used_workers = Set.new

    trades.each do |trade|
      # Find the cheapest available worker for this trade
      cheapest_worker = @workers
        .select { |worker| worker[:trades].include?(trade) && !used_workers.include?(worker[:email]) }
        .min_by { |worker| worker[:cost] }

      if cheapest_worker
        scheduled << cheapest_worker[:email]
        used_workers.add(cheapest_worker[:email])
      end
    end

    scheduled
  end

  # Given a list of trades, schedules work for each day, until all the trades are scheduled. A worker cannot work
  # multiple trades in one day, and if there are multiple workers available to work on a particular trade, the worker
  # with the cheapest cost should be chosen.
  #
  # @param trades [Array<String>] An array of trades. Each trade represents 1 unit of work that needs to be completed.
  # @return [Array<Array<String>>] A multidimensional array consisting of scheduled days. Each day is represented as an
  #   array of worker emails scheduled for work that day.
  def schedule_all_tasks(trades)
    remaining_trades = trades.dup
    scheduled_days = []

    while remaining_trades.any?
      scheduled_day = schedule_one_day(remaining_trades)
      break if scheduled_day.empty?

      scheduled_days << scheduled_day

      # Remove one trade that was scheduled by each worker
      scheduled_day.each do |email|
        worker = @workers.find { |w| w[:email] == email }
        trade_index = remaining_trades.index { |t| worker[:trades].include?(t) }
        remaining_trades.delete_at(trade_index) if trade_index
      end
    end

    scheduled_days
  end
end

RSpec.describe do
  describe 'simple schedules' do
    let(:workers) do
      [
        {
          email: 'bob@brickwork.com',
          trades: ['brickwork'],
          cost: 90
        },
        {
          email: 'alice@example.com',
          trades: %w[brickwork drywall],
          cost: 100
        },
        {
          email: 'charlie@cement.com',
          trades: ['cement'],
          cost: 80
        },
        {
          email: 'wally@walls.com',
          trades: %w[cement drywall],
          cost: 95
        }
      ]
    end

    let(:scheduler) { WorkScheduler.new(workers) }

    it 'can find a suitable worker for a task' do
      expect(scheduler.suitable_workers('cement')).to eq(['charlie@cement.com', 'wally@walls.com'])
      expect(scheduler.suitable_workers('brickwork')).to eq(['alice@example.com', 'bob@brickwork.com'])
      expect(scheduler.suitable_workers('drywall')).to eq(['alice@example.com', 'wally@walls.com'])
    end

    it 'can build a simple schedule for one day' do
      expect(scheduler.schedule_one_day(['cement'])).to match_array(['charlie@cement.com'])
      expect(scheduler.schedule_one_day(['brickwork'])).to match_array(['bob@brickwork.com'])
      expect(scheduler.schedule_one_day(['drywall'])).to match_array(['wally@walls.com'])
      expect(scheduler.schedule_one_day(%w[cement drywall]))
        .to match_array(['charlie@cement.com', 'wally@walls.com'])
      expect(scheduler.schedule_one_day(%w[cement brickwork]))
        .to match_array(['charlie@cement.com', 'bob@brickwork.com'])
      expect(scheduler.schedule_one_day(%w[drywall brickwork]))
        .to match_array(['wally@walls.com', 'bob@brickwork.com'])
      expect(scheduler.schedule_one_day(%w[cement brickwork drywall]))
        .to match_array(['charlie@cement.com', 'bob@brickwork.com', 'wally@walls.com'])
    end

    it 'does not double book workers' do
      expect(scheduler.schedule_one_day(%w[cement cement cement]))
        .to match_array(['charlie@cement.com', 'wally@walls.com'])
      expect(scheduler.schedule_one_day(%w[brickwork brickwork brickwork]))
        .to match_array(['bob@brickwork.com', 'alice@example.com'])
      expect(scheduler.schedule_one_day(%w[drywall drywall drywall]))
        .to match_array(['wally@walls.com', 'alice@example.com'])
    end

    it 'can schedule multiple days of work' do
      all_tasks = scheduler.schedule_all_tasks(%w[brickwork brickwork brickwork])
      aggregate_failures do
        expect(all_tasks[0]).to match_array(['bob@brickwork.com', 'alice@example.com'])
        expect(all_tasks[1]).to match_array(['bob@brickwork.com'])
      end

      all_tasks = scheduler.schedule_all_tasks(%w[drywall drywall drywall])
      aggregate_failures do
        expect(all_tasks[0]).to match_array(['wally@walls.com', 'alice@example.com'])
        expect(all_tasks[1]).to match_array(['wally@walls.com'])
      end

      all_tasks = scheduler.schedule_all_tasks(%w[cement cement cement])
      aggregate_failures do
        expect(all_tasks[0]).to match_array(['charlie@cement.com', 'wally@walls.com'])
        expect(all_tasks[1]).to match_array(['charlie@cement.com'])
      end
    end

    it 'can schedule all work optimistically' do
      all_tasks = scheduler.schedule_all_tasks(%w[cement cement cement brickwork])
      aggregate_failures do
        expect(all_tasks[0]).to match_array(['charlie@cement.com', 'bob@brickwork.com', 'wally@walls.com'])
        expect(all_tasks[1]).to match_array(['charlie@cement.com'])
      end

      all_tasks = scheduler.schedule_all_tasks(%w[cement cement drywall drywall cement brickwork])
      aggregate_failures do
        expect(all_tasks[0]).to match_array(
          ['bob@brickwork.com', 'charlie@cement.com', 'alice@example.com', 'wally@walls.com']
        )
        expect(all_tasks[1]).to match_array(['charlie@cement.com', 'wally@walls.com'])
      end

      all_tasks = scheduler.schedule_all_tasks(%w[cement cement brickwork brickwork cement brickwork])
      aggregate_failures do
        expect(all_tasks[0]).to match_array(
          ['charlie@cement.com', 'bob@brickwork.com', 'alice@example.com', 'wally@walls.com']
        )
        expect(all_tasks[1]).to match_array(['charlie@cement.com', 'bob@brickwork.com'])
      end
    end
  end
end
