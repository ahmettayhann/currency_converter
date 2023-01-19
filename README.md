# README

First of all run the app


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.7.6

* Rails version 6.1.7

* DB Engine SQlite

* After download project:
* Run 'rails db:migrate'
* Run 'rails webpacker:install'
* Run 'rails s' to start server
* Run 'bundle exec sidekiq' to get currencies every 10 minute
* to see currencies faster you can change 3th row as "* * * * *" cron_schedule.rb file

* Enter 'http://localhost:3000/' page to see all currencies list
* With "Get Current Currencies" button, can get all current rates
* With "Pair Currency" button to can open pair page to pair selected currencies and list all of them

There is no test for this app