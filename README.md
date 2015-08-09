my-vade-mecum
=============

my-vade-mecum
[![Code Climate](https://codeclimate.com/github/tachyons/my-vade-mecum/badges/gpa.svg)](https://codeclimate.com/github/tachyons/my-vade-mecum)

#Installation
rvm install 2.2.2
cd my-vade-mecum
bundle install
script/server
#background process
bin/delayed_job start
#cron jobs
whenever -w
