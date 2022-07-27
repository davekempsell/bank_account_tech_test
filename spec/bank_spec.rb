require 'bank'

RSpec.describe Bank do
  it 'should accept deposits' do
    my_bank = Bank.new
    expect{my_bank.deposit(10)}.not_to raise_error
  end
end