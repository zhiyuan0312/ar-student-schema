require_relative '../../db/config'

class Teacher < ActiveRecord::Base
# Teacher model implementation
	validates :email, :uniqueness => true
end