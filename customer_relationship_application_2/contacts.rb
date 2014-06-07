class Contacts
	attr_accessor :first_name,:last_name,:email,:id
	def initialize(first_name,last_name,email)
		@first_name = first_name
		@last_name = last_name
		@email = email
	end
end