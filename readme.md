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

After sketching out the basic functions I wanted to the program to be able to do, I have decided on a design that uses one single class to deliver a solution to the problem.
This makes it easy to follow the code, and makes it easy to keep data in memory when running the program.

Class - BankAccount
- Has a balance variable ( = 0 ) and transactions array (empty) created when initialized.

- Deposit method adds amount to balance, and adds date, deposit amount, and current balance to the transactions array

- Withdrawal method removes amount from balance, and adds date, deposit amount, and current balance to the transactions array.

- Print Statement displays the latest statement, with all transactions listed, in reverse chronological order (most recent transaction at top). 