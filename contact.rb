class Contact
	attr_accessor :first_name,:last_name,:email,:note

	def initialize(first_name,last_name,email,note)
		@first_name,@last_name,@email,@note = first_name,last_name,email,note
	end

	def to_s
		"#{first_name}, #{last_name} is reachable at #{email}"
	end

end