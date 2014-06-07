class Rolodex
	attr_accessor :contacts

	def initialize
		@contacts = []
		@id = 1000
	end

	def add_contact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def search_contact(choice,search)
		case choice
		when "first"
			contacts = @contacts.find_all {|contact| contact.first_name == search}
		when "last"
			contacts = @contacts.find_all {|contact| contact.last_name == search}
		when "email"
			contacts = @contacts.find_all {|contact| contact.email == search}
		end

		return contacts
	end

	def modify_first_name(contact,change)
		contact.first_name = change
	end

	def modify_last_name(contact,change)
		contact.last_name = change
	end

	def modify_email(contact,change)
		contact.email = change
	end

	def delete_contact(contact)
		@contacts.delete(contact)
	end

end