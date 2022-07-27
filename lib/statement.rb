# frozen_string_literal: true

# used to create an easy to read statement
class Statement
  def initialize(account)
    @transactions = account.transactions
  end

  def print_statement
    statement = ["date || credit || debit || balance"]
    transactions = create_transaction
    transactions.each { |action| statement.push(action)}
    statement.join("\n")
  end

  private

  def create_transaction
    actions = []
    @transactions.each do |action|
      date = action["date"].strftime('%d/%m/%Y')
      actions.push("#{date} || #{action["credit"]} || #{action["debit"]} || #{action["balance"]}")
    end
    actions
  end
end
