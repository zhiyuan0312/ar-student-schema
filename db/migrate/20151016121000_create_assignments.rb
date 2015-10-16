require_relative '../config'

class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignment do |t|

        t.integer :student_id
        t.integer :teacher_id
    	t.timestamps null: false
    end
  end
end