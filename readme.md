# Bank tech test

This program has been created during week 10 of the Makers Academy course.

# Technologies

This program is built in Ruby 3.0.
It uses Rspec as it's test suite. With simplecov.
It uses Rubocop as a linter.

## Getting started

Install dependencies
```sh
bundle install
```
## Running Tests

To run all tests

```sh
rspec
```

To get test coverage 
```sh
open coverage/index.html
```

To run rubocop
```sh
rubocop
```

# Requirements

* You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

# Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see:

date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00

# Design

My program will have two classes, an Account class, and a Statement class. This allows it to be possible to pass multiple accounts into the Statement class if so desired, and has a better separation of concerns than including everything in one place.


Class - Account
- Has a balance variable ( = 0 ) and transactions array (empty) created when initialized.
  - The transactions array is accessible through an attribute reader so it can be passed into the Statement class.

- Deposit method adds amount to balance, and adds date, deposit amount, and current balance to the transactions array as a hash.

- Withdrawal method removes amount from balance, and adds date, deposit amount, and current balance to the transactions array as a hash.

Class - Statement
- Is passed an account when created
- Has a transactions array created when initialized, which is the transactions of the account. It also has a formatted_transactions array where the transactions are pushed after being formatted.

- print_statement method returns the final statement with header, and the transactions from the account in reverse chronological order. It calls the create_transaction private method.

- create_transaction private method takes the transaction hash, and converts it into a formatted string that can be included in the statement.