require './contact'
require './rolodex'


class CRM
	def initialize
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "Main Menu"
		puts "[1] Add a new contact"
		puts "[2] Modify an existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
		puts "[5] Display an attribute"
		puts "[6] Exit"
		puts "Enter a number:"
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

		puts "Contact added"

		contact = Contact.new(first_name,last_name,email,note)
		@rolodex.add_contact(contact)
		main_menu
	end

	def modify_contact
		print "Please enter the last name of the contact you would like to modify."
		contact = @rolodex.find(gets.chomp)
		print "Are you sure you want to modify \"#{contact.first_name.capitalize} #{contact.last_name.capitalize}\"?"
		response = gets.chomp
		if response == "yes"
			@rolodex.delete_contact(contact)
			add_contact
		else
			main_menu
		end
	end

	def select_contact(action)
		puts "Which contact would you like to #{action}?"
		i = 1
		@rolodex.contacts.each do |contact|
			puts "[#{i}] #{contact.first_name.capitalize} #{contact.last_name.capitalize}"
			i += 1
		end
		contact = @rolodex.contacts[gets.chomp.to_i - 1]
		print "Are you sure you want to #{action} #{contact.first_name} #{contact.last_name}?"

	end

	def delelete_contact
		contact = select_contact("delete")
		
		response = gets.chomp
		@rolodex.delete_contact(contact)
		puts "Contact deleted."
		main_menu
	end

	def display_contacts
		@rolodex.display_contacts
		main_menu
	end

	def display_attribute
		puts "Which attribute would you like to see?"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Notes"
		choice = gets.chomp.to_i
		@rolodex.display_attribute(choice)
		puts "Press ENTER when finished"
		main_menu
	end

	def self.run
		crm = CRM.new
		crm.main_menu
	end

	def clear_screen
		puts "\e[H\e[2J"
	end
end

CRM.run()




	

			