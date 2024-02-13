# README

This project is a messaging app.

It relies on websockets to work.

This project was made on windows which lead to some creative design choices to get it working i.e redis doesn't 
really work well on windows and getting sidekiq to work with it locally is delicate dance so there is no sidekiq and 
redis in this project if I had made this on linux or MacOS I would've used sidekiq and redis.

Another issue due to the windows build is problem with whenever gem as cronjobs are not a windows native feature.

Also this project doesn't use webpacker due to I wanted to try out importmap.

This project uses sqlite as it is a prototype the development database contains data already and accounts.

This project can be installed via pulling down from the GitHub.

This requires `ruby "3.0.1"`

`bundle install` <- Running this will install all necessary gems.

`rails s` <- Running this will start the server.

`rspec` <- Running this will run the tests.

`whenever --update-crontab` <- Writes the crontab file for the weekly cronjob

To use this app. Go to localhost `http://127.0.0.1:3000/`

Sign in as abc123@abc.com with 123456 or sign up. There will be one room/channel that will allow you to message 
anyone else connected to chat.


