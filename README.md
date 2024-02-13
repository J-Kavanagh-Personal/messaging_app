# README

This project is a messaging app.

It relies on websockets to work..

This project uses sqlite as it is a prototype the development database contains data already and accounts.

This project can be installed via pulling down from the GitHub.

This requires `ruby "3.3.0"`

`bundle install` <- Running this will install all necessary gems.

`rails s` <- Running this will start the server.

`rspec` <- Running this will run the tests.

`whenever --update-crontab` <- Writes the crontab file for the weekly cronjob

To use this app. Go to localhost `http://127.0.0.1:3000/`

Sign in as abc123@abc.com with 123456 or sign up. There will be one room/channel that will allow you to message 
anyone else connected to chat.


