require_relative '../../db/config'

class Teacher < ActiveRecord::Base
	validates :email,
		:uniqueness => true,
		:format => { :with => /\w+(.)*\w+@\w+(.)*\w+/}
	validates :phone,
		:format => { :with => /\d{3}.+\d{3}.+\d{4}/}

end