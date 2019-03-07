require 'bundler'
Bundler.require
require 'dotenv/load'
require 'http'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger.level = 1
