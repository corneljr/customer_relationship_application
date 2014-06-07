require './contacts.rb'
require './rolodex.rb'

class CRM

	def initialize
		@rolodex = Rolodex.new
	end

	def print_list
		puts "Main Menu"
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display a specific contact"
		puts "[5] Delete a contact"
		puts "[6] Exit"
		puts "Please select a number...."
	end

	def attribute_list
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] ID"
	end

	def main_menu
		print_list
		selection = gets.chomp.to_i

		case selection
		when 1 then add_contact
		when 2 then modify_contact_prompt
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then delete_contact
		when 6 then exit
		else main_menu
		end

	end

	def add_contact
		print "First name:"
		first_name = gets.chomp.downcase
		print "Last name:"
		last_name = gets.chomp.downcase
		print "Email:"
		email = gets.chomp.downcase

		contact = Contacts.new(first_name,last_name,email)
		@rolodex.add_contact(contact)

		puts "This contact has been created with an ID of #{contact.id}"
		main_menu
	end

	def search_contact
		puts "Which attribute would you like to search by?"
		attribute_list
		selection = gets.chomp.to_i
		puts "Please enter search"
		search = gets.chomp.downcase

		case selection
			when 1 then contacts =  @rolodex.search_contact("first",search)
			when 2 then contacts = @rolodex.search_contact("last", search)
			when 3 then contacts = @rolodex.search_contact("email", search)
			else puts "Something"
		end
		return contacts
	end

	def print_contacts(contacts)
		i = 1
		contacts.each {|contact| puts "[#{i}] #{contact.first_name.capitalize} #{contact.last_name.capitalize}"; i += 1}
	end

	def modify_contact_prompt
		contacts = search_contact
		puts "Please select a search result to modify"
		print_contacts(contacts)
		contact_selection = gets.chomp.to_i
		puts "What would you like to update?"
		attribute_list
		attribute_selection = gets.chomp.to_i
		puts "What would you like to change it to?"
		change = gets.chomp

		case attribute_selection
		when 1 then @rolodex.modify_first_name(contacts[contact_selection - 1],change)
		when 2 then @rolodex.modify_last_name(contacts[contact_selection - 1],change)
		when 3 then @rolodex.modify_email(contacts[contact_selection - 1],change)
		end

		puts "Contact modified....."
		main_menu
	end

	def display_all_contacts
		@rolodex.contacts.each do |contact|
			puts "#{contact.first_name.capitalize} #{contact.last_name.capitalize}, #{contact.email}, ID: #{contact.id}"
		end
		main_menu
	end

	def display_contact
		contacts = search_contact
		puts "Which contact would you like to see?"
		print_contacts(contacts)
		selection = gets.chomp.to_i
		puts " #{contacts[selection - 1].first_name.capitalize} #{contacts[selection - 1].last_name.capitalize!} #{contacts[selection - 1].email}, ID: #{contacts[selection - 1].id}"
		main_menu
	end

	def delete_contact
		contacts = search_contact
		puts "Which contact would you like to delete?"
		print_contacts(contacts)
		selection = gets.chomp.to_i
		@rolodex.delete_contact(contacts[selection - 1])
		puts "Contact deleted....."
		main_menu
	end

	def self.run
		crm = CRM.new
		crm.main_menu
	end

end

CRM.run
