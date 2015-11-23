require_relative '../../db/config'

class Student < ActiveRecord::Base
	validates :email,
		:uniqueness => true,
		:format => { :with => /\w+(.)*\w+@\w+(.)*\w+/}
	validates_numericality_of :age, :greater_than => 5
	validates :phone,
		:format => { :with => /\d{3}.+\d{3}.+\d{4}/}

	has_many :classrooms, :foreign_key => :student_id
	has_many :teachers, :through => :classrooms
 def name
 	fullname = "#{first_name} #{last_name}"

 end

 def age
 	age = Time.now.year - birthday.year
 end

end