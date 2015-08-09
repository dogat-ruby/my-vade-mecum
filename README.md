my-vade-mecum
=============
[![Code Climate](https://codeclimate.com/github/tachyons/my-vade-mecum/badges/gpa.svg)](https://codeclimate.com/github/tachyons/my-vade-mecum)

##Installation
* rvm install 2.2.2
* cd my-vade-mecum
* bundle install
* rails s
* bin/delayed_job start
* whenever -w

##Production
* set SECRET_KEY_BASE env variable
* rails s -eproduction

##Email Configuration
Create an account in mailgun and set following credentials in envirnmment variables
* MAILGUN_API_KEY
* MAILGUN_DOMAIN
* MAILGUN_PASSWORD
* MAILGUN_USERNAME
