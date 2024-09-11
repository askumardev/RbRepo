# rbRepo

* dev is the default branch
* .env 

  SAMPLE=SomeText

  ABC=abc
* vscode extensions

  * Ruby, Ruby Runner, Ruby Solargraph, VSCode Ruby, Code Runner
* loops in ruby

  * while
  * do..while
  * until
  * for
* Enumerators

  * map/collect
  * select
  * each
  * each_with_index
  * reduce/inject

https://www.includehelp.com/ruby

https://www.includehelp.com/ruby/programs.aspx

# rspecTut
* bundle init to create Gemfile
* add rspec gem from rubygems in Gemfile
* type rspec in terminal to run all specs
* bundle binstubs rspec-core --> execute this command to create bin dependencies
* bin/rspec --init -->execute this command to create rspec dependency files
* bin/rspec --> execute this command to run rspecs

#
* rspec --profile 2 --> shows Top 2 slowest examples

## coderay
* rspec -fd or rspec --format documentation
* rspec -e <sample word here> -fd --> runs the specs which are matched with <sample word here>

##
--only-failures
* config.example_status_persistence_file_path = 'spec/examples.txt'
* rspec --only-failures or rspec --tag last_run_status:failed

## focus context
* config.filter_run_when_matching(focus: true)
* fcontext 'hello world' do or context 'hello world', focus:true do

## basic request spec format
use rspec-rails in gemfile\
Rspec.describe "xxx", type: :request do
> get ---_path\
> post ---_path, xxxx: {name: "bob", age: 25}\
> expect(response.body).to include 'xxxx successfully created!'\
> expect(response).to have_http_status(200)\
> end

## imp commands
* rails new --devcontainer myapp -d postgresql
* rails devcontainer(use on old rails application)
