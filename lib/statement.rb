# frozen_string_literal: true

# used to create an easy to read statement
class Statement
  def initialize(account)
    @transactions = account.transactions
    @formatted_transactions = []
  end

  def print_statement
    statement = ['date || credit || debit || balance']
    create_transaction
    @formatted_transactions.reverse.each { |action| statement.push(action) }
    statement.join("\n")
  end

  private

  def create_transaction
    @transactions.each do |action|
      date = action['date'].strftime('%d/%m/%Y')
      credit = (action['credit']).positive? ? format('%.2f', action['credit']) : ''
      debit = (action['debit']).positive? ? format('%.2f', action['debit']) : ''
      balance = format('%.2f', action['balance'])
      @formatted_transactions.push("#{date} || #{credit} || #{debit} || #{balance}")
    end
  end
end
