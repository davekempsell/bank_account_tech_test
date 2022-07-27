require 'bank'

RSpec.describe Bank do
  it 'should accept deposits' do
    my_bank = Bank.new
    expect{my_bank.deposit(10)}.not_to raise_error
  end

  it 'should accept withdrawals' do
    my_bank = Bank.new
    expect{my_bank.withdraw(10)}.not_to raise_error
  end

  it 'prints statement with no transactions when none made' do
    my_bank = Bank.new
    expect(my_bank.print_statement).to eq "date || credit || debit || balance"
  end
end