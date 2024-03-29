# frozen_string_literal: true

ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
require 'sidekiq/web'
require 'sidekiq/cron/web'

if ENV['SINATRA_ENV'] == 'development'
  require 'dotenv'
  Dotenv.load
end

Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'db/organizer.sqlite3'
  )
end

require_all 'config/initializers'
require_all 'app'
