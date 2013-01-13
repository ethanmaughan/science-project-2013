#!/usr/bin/env ruby
require 'rest_client'

# deletes all but the last 5,000 rows in the heroku database
RestClient.delete 'http://cmm-imp-temp.herokuapp.com'
