require_relative '../app/models/student'
require_relative '../app/models/teacher'
require_relative '../app/models/assignment'

require 'faker'
module StudentsImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/students.csv")
 
    field_names = nil
    Student.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          student = Student.create!(attribute_hash)
        end
      end
    end
  end

  def self.create_teachers

    10.times do
    Teacher.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, phone: "111-111-1111")
    end
  end

    def self.assign
          students = Student.all
          teachers = Teacher.all

          students.each do |student|
              assigned = []

              3.times do
                  assignment = Assignment.new
                  assignment.student_id = student.id
                  assignment.teacher_id = (teachers - assigned).sample.id
                  assignment.save
              end
          end
      end
end
