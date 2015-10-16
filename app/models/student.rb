require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
	validates :age, :numericality => {greater_than: 4}
	validates :email, :uniqueness => true
	validates :email, :format => {with: /.+@.+[.][^.]{2,}\z/}
	# validates :phone, :format => { :with => /.+\d{3}.+\d{3}.+\d{4}.+/ }


	def name
		name = self.first_name + " " + self.last_name
	end

	def age
		now = Date.today
		age = now.year - self.birthday.year
	end
end