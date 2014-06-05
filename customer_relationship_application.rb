def print_main_menu
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
	when 2
	when 3
	when 4
	when 5
	when 6
	end
end

def add_contact
end

def modify_contact
end

def delete_contact
end

def display_contacts
end

def display_attribute
end

def exit
end

		