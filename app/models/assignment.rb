require_relative '../../db/config'

class Assignment < ActiveRecord::Base
    belongs_to :student
    belongs_to :teacher
end