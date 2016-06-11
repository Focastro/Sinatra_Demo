require 'dm-core'
require 'dm-migrations'
require 'data_mapper'
DataMapper.setup(:default, 'sqlite::memory:')

class User
	include DataMapper::Resource
	property :id, Serial
	property :email, String
	property :nombre, String
	property :created_at, DateTime
end
DataMapper.finalize
