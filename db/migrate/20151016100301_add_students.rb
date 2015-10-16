require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class AddStudents < ActiveRecord::Migration
    def up
      add_column :students, :teacher_id, :integer
    end
end