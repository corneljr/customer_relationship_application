class Rolodex
	attr_reader :contacts 
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		@contacts << contact
	end

	def find_contact(index)
		contacts[index]
	end

	def delete_contact(contact)
		contacts.delete(contact)
	end

	def display_contacts
		@contacts.each {|contact| puts "#{contact.first_name.capitalize} #{contact.last_name.capitalize}, Email:#{contact.email}, Notes: #{contact.note}"}

	end

	def display_attribute(attribute)
		case attribute
		when 1 
			contacts.each {|con| puts con.first_name.capitalize!}
		when 2
			contacts.each {|con| puts con.last_name.capitalize!}
		when 3
			contacts.each {|con| puts con.email.capitalize!}
		when 4
			contacts.each {|con| puts con.note.capitalize!}
		end
	end
end
