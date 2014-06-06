require './contact'
require './rolodex'


class CRM
	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "\nMain Menu:"
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts "Enter a number:"
	end

	def print_attribute_list 
		puts "Which attribute?"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Notes"
	end

	def print_contact_list
		i = 1
		@rolodex.contacts.each do |contact|
			puts "[#{i}] #{contact.first_name.capitalize!} #{contact.last_name.capitalize!}"
			i += 1
		end
	end


	def main_menu
		print_main_menu
		selection = gets.to_i
		call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then delete_contact
		when 4 then display_contacts
		when 5 then display_attribute
		when 6 then exit
		end
	end

	def add_contact
		clear_screen
		print "Enter First Name: "
		first_name = gets.chomp.downcase
		print "Enter Last Name: "
		last_name = gets.chomp.downcase
		print "Enter Email Address: "
		email = gets.chomp.downcase
		print "Enter a note: "
		note = gets.chomp.downcase

		contact = Contact.new(first_name,last_name,email,note)
		@rolodex.add_contact(contact)

		separator
		puts "Contact added"
		separator

		main_menu
	end

	def modify_contact
		contact = select_contact("modify")
		print_attribute_list
		selection = gets.chomp.to_i
		puts "What would you like to change it to?"
		change = gets.chomp
		case selection
			when 1 then contact.first_name = change
			when 2 then contact.last_name = change
			when 3 then contact.email = change
			when 4 then contact.notes = change
			else puts "Invalid Option"; modify_contact;
		end
		separator
		puts "Contact has been modified"
		separator
		main_menu
	end

	def separator
		puts "------------------------------------"
	end

	def select_contact(action)
		puts "Which contact would you like to #{action}?"
		print_contact_list
		contact = @rolodex.find(gets.chomp.to_i - 1)
		contact
	end

	def delete_contact
		contact = select_contact("delete")
		@rolodex.delete_contact(contact)
		separator; puts "Contact deleted.";separator
		main_menu
	end

	def display_contacts
		clear_screen
		separator
		@rolodex.display_contacts
		separator
		main_menu
	end

	def display_attribute
		clear_screen
		print_attribute_list
		choice = gets.chomp.to_i
		separator
		@rolodex.display_attribute(choice)
		separator
		main_menu
	end

	def self.run(name)
		crm = CRM.new(name)
		crm.main_menu
	end

	def clear_screen
		puts "\e[H\e[2J"
	end
end

CRM.run("name")




	

			