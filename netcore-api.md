# Parpera backend engineering test

Create 2 RESTful APIs from scratch. 

Please emphasise on clean code structure and demonstrate good understanding of any design patterns used.

## Criteria
- Use any .netcore framework

- Create a RESTful api that returns the following set of transaction data.
  - the data should be ordered by datetime in descending order

|ID|Datetime|Description|Amount|Status|
|---|---|---|---|---|
|11|2020-09-08'T'16:34:23Z|Bank Deposit|500.00|Completed|
|10|2020-09-08'T'09:02:23Z|Transfer to James|-20.00|Pending|
|9|2020-09-07'T'21:52:23Z|ATM withdrawal|-20.00|Completed|
|8|2020-09-06'T'10:32:23Z|Google Subscription|-15.00|Completed|
|7|2020-09-06'T'07:33:23Z|Apple Store|-2000.00|Cancelled|
|6|2020-08-23'T'17:39:23Z|Mini Mart|-23.76|Completed|
|5|2020-08-16'T'21:06:23Z|Mini Mart|-56.43|Completed|
|4|2020-06-15'T'18:17:23Z|Country Railways|-167.78|Completed|
|3|2020-04-09'T'16:26:23Z|Refund|30.00|Completed|
|2|2020-04-01'T'12:47:23Z|Amazon Online|-30.00|Completed|
|1|2020-03-30'T'23:53:23Z|Bank Deposit|500.00|Completed|

- Create a RESTful api that allows a transaction's status to be updated.

- You do not need to use an external database, you may persist data in memory.

- Appropriate test coverage

## Bonous objectives
- Secure the update API to only allow authenticated users. NOTE: You do not need to issue tokens, simply assume the client has already acquired a valid token.
- Persist the data in an SQL Lite database

## Submission
- Host your project on GitHub
- The application must be built and runnable in VS Code or VS Studio
- include a README with
    - Any instructions or dependencies required to run locally
    - Caveats
