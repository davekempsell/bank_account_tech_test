# frozen_string_literal: true

# used to create an easy to read statement
class Statement
  def initialize(account)
    @transactions = account.transactions
  end

  def print_statement
    @transactions.length > 0 ? 
      deposit = @transactions[0]["debit"] : 
      deposit = ""
    
      "date || credit || debit || balance\n
    #{deposit}"
  end
end
