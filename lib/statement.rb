# frozen_string_literal: true

# used to create an easy to read statement
class Statement
  def initialize(account)
    @transactions = account.transactions
    puts @transactions
  end

  def print_statement
    if @transactions.length > 0
      deposit = @transactions[0]["credit"]
      withdrawal = @transactions[0]["debit"]
    end

      "date || credit || debit || balance\n
    #{deposit} || #{withdrawal}"
  end
end
