# frozen_string_literal: true

require 'statement'

RSpec.describe Statement do
  before(:each) do
    allow(Time).to receive(:now).and_return Time.new(2000, 1, 1)
  end
  it 'receives an instance of Account' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([])
    expect { Statement.new(my_account) }.to_not raise_error
  end

  it 'prints a statement with no transactions when none have been made' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include 'date || credit || debit || balance'
  end

  it 'includes a deposit of 10 to be shown on statement' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([{
      "date" => Time.now,
      "credit" => 10,
      "debit" => 0,
      "balance" => 10
    }])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "10"
  end

  it 'includes a deposit of 20 to be shown on statement' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([{
      "date" => Time.now,
      "credit" => 20,
      "debit" => 0,
      "balance" => 20
    }])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "20"
  end

  it 'includes a withdrawal of 10 to be shown on statement' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([{
      "date" => Time.now,
      "credit" => 0,
      "debit" => 10,
      "balance" => -10
    }])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "10"
  end

  it 'includes balance at time of transaction on statement' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([
      {
      "date" => Time.now,
      "credit" => 10,
      "debit" => 0,
      "balance" => 10
      },
      {
        "date" => Time.now,
        "credit" => 10,
        "debit" => 0,
        "balance" => 20
      }
    ])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "20"
  end

  it 'includes date of transaction on statement' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([{
      "date" => Time.now,
      "credit" => 10,
      "debit" => 0,
      "balance" => 10
    }])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "01/01/2000"
  end

  it 'displays monetary amounts to two decimal places' do
    my_account = double :account
    expect(my_account).to receive(:transactions).and_return([
      {
      "date" => Time.now,
      "credit" => 20,
      "debit" => 0,
      "balance" => 20
      },
      {
        "date" => Time.now,
        "credit" => 0,
        "debit" => 5,
        "balance" => 15
        }
    ])
    my_statement = Statement.new(my_account)
    expect(my_statement.print_statement).to include "20.00"
    expect(my_statement.print_statement).to include "5.00"
    expect(my_statement.print_statement).to include "15.00"
  end
end
