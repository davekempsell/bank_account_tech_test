# frozen_string_literal: true

require 'account'

RSpec.describe Account do
  it 'should accept deposits' do
    my_account = Account.new
    expect { my_account.deposit(10) }.not_to raise_error
  end

  it 'should accept withdrawals' do
    my_account = Account.new
    expect { my_account.withdraw(10) }.not_to raise_error
  end
end
