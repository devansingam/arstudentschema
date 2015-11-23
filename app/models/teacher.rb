require_relative '../../db/config'

class Teacher < ActiveRecord::Base
	validates :email,
		:uniqueness => true,
		:format => { :with => /\w+(.)*\w+@\w+(.)*\w+/}
	validates :phone,
		:format => { :with => /\d{3}.+\d{3}.+\d{4}/}
	has_many :classrooms, :foreign_key => :teacher_id
	has_many :teachers, :through => :classrooms

end