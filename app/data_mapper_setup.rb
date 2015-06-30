require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['postgres://fbgrvatjkdqndw:tM26wogqPAKLs3cyba8L2wicy9@ec2-54-225-130-164.compute-1.amazonaws.com:5432/d2g3gk55ff9t5d'] || "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link'

DataMapper.finalize

DataMapper.auto_upgrade!
