# Gems used
require "tty-prompt"
require "colorize"
require "artii"
require "csv"

# Login method selection between administrator and guest (guest logic pending)
def helpdesk_start
	# Commented out for initial submission due to guest functionality not fully developed.

	# Clears terminal screen
	# system("clear")
	# # Declare new instance of tty-prompt gem class
	# prompt = TTY::Prompt.new
	# # Declare variable of artii gem class
	# a = Artii::Base.new  :font => 'slant'
	# # Print to screen program title screen with artii and colorize gem customization
	# puts a.asciify('OpenDesk').colorize(:green)
	# puts "\n---------------------------------------------\n\nWelcome to OpenDesk - the open source helpdesk app built using Ruby."
	# # Ask user for chosen input using tty-prompt menu selection
	# mode = prompt.select("\nSelect a login option:") do |menu|
	# 	menu.choice 'Admin', 1
	# 	menu.choice 'Guest', 2
	# end
	# Call a chosen method dependant on returned menu option
	# if mode == 1
		# admin_login_method
	# else
	# 	puts "Guest Mode!"
	# end
end

# Authentication for administrator logon
def admin_login_method
	system("clear")
	prompt = TTY::Prompt.new
	password = "offandon"
	passwordfailcount = 0
	# Password login loop
		while passwordfailcount < 3
			puts ""
			if prompt.mask("Welcome to the application. Please enter your password:") != password
				passwordfailcount += 1
				puts "Incorrect. Please try again. Attempt #{passwordfailcount} of 3."
			else
				main
		end
	end
end
 
# User input used to return ticket attribute information
def ticket_creation
	system("clear")
	prompt = TTY::Prompt.new
	puts "Please enter the following to create a new support ticket."
	puts ""
	puts "From: (E.g 'John Doe', 'johndoe@email.com, 'John Doe Enterprises')"
	from = gets.chomp
	puts "Subject: (E.g 'PC Not Working at Reception')"
	subject = gets.chomp
	puts "Description: (E.g 'Unable to turn computer on. Last working on Monday.')"
	description = gets.chomp
	status = prompt.select("Choose a Status:") do |menu|
		menu.choice 'Open'
		menu.choice 'Pending'
		menu.choice 'Waiting on 3rd Party'
		menu.choice 'Resolved'
	end
	priority = prompt.select("Choose a Priority:") do |menu|
		menu.choice 'Low'
		menu.choice 'Medium'
		menu.choice 'High'
		menu.choice 'Urgent'
	end
	return Ticket.new(from, subject, description, status, priority)
end

# Dashboard for viewing all tickets submitted
def ticket_dashboard(tickets)
	system("clear")
	prompt = TTY::Prompt.new
	# For loop to perform an action on each individual ticket in the tickets array (list_of_tickets argument)
	for ticket in tickets
		# Prints the index of each individual ticket in the tickets array | Prints the subject of each individual ticket
		# Add +1 to the index, as to ensure that ticket number does not begin at 0
    ticket_export = "All Submitted Support Tickets:\n\nTicket Number: #{tickets.index(ticket)+1} From: #{ticket.from} Subject: #{ticket.subject} Description: #{ticket.description} Status: #{ticket.status} Priority: #{ticket.priority}"
    convert_to_txt(ticket_export)
  end

	puts "\nWhat would you like to do?"
	selection = prompt.select("\nChoose an option:") do |menu|
		menu.choice 'Edit a ticket', 1
		menu.choice 'Delete a ticket', 2
		menu.choice 'Back to menu', 3
	end
	if selection == 1
		ticket_edit(tickets)
	elsif selection == 2
		ticket_delete(tickets)
	end
	return tickets
end
 
# Removal logic for tickets
def ticket_delete(tickets)
	system("clear")
	prompt = TTY::Prompt.new
  if tickets.empty? == false
    delete_selection = prompt.select("Choose a ticket to delete:") do |menu| 
      for ticket in tickets
        menu.choice (tickets.index(ticket) + 1)
      end
    end
  else
    puts "No tickets in dashboard. Press 'Enter' to return to menu."
    gets
    return
  end
	tickets.delete_at(delete_selection.to_i - 1)
end
  

# Edit logic for tickets
def ticket_edit(tickets)
	system("clear")
	prompt = TTY::Prompt.new
	# Asks for user input

	#####If array is empty, return error
  if tickets.empty? == false
    edit_selection = prompt.select("Select a ticket to edit:") do |menu|
      for ticket in tickets
        menu.choice (tickets.index(ticket) +1)
      end
    end
  else
    puts "No tickets in dashboard. Press 'Enter' to return to menu."
    gets
    return
  end	
	# You have selected ticket number (number +1). What would you like to edit?
	# > From, Subject, etc.
	ticket_attribute_selection = prompt.select("What would you like to edit?") do |menu|
		menu.choice "From", 1
		menu.choice "Subject", 2
		menu.choice "Description", 3
		menu.choice "Status", 4
		menu.choice "Priority", 5
	end

	# Subtract inflated 'ticket value' back to index for element selection
	edit_selection = edit_selection.to_i - 1

	# Overwrites the from contents of the ticket with the input of the user
	case ticket_attribute_selection
	when 1
		puts "Enter new data:"
		input = gets.chomp
		tickets[edit_selection].from = input
	when 2
		puts "Enter new data:"
		input = gets.chomp
		tickets[edit_selection].subject = input	
	when 3
		puts "Enter new data:"
		input = gets.chomp
		tickets[edit_selection].description = input	
	when 4
		status = prompt.select("Choose a Status:") do |menu|
			menu.choice 'Open'
			menu.choice 'Pending'
			menu.choice 'Waiting on 3rd Party'
			menu.choice 'Resolved'
		end
		tickets[edit_selection].status = status
	when 5
		priority = prompt.select("Choose a Status:") do |menu|
			menu.choice 'Low'
			menu.choice 'Medium'
			menu.choice 'High'
			menu.choice 'Urgent'
		end
		tickets[edit_selection].priority = priority	
	end
end
  
def convert_to_txt(variable)
  # To a file
  File.open("./file.txt", "a") do |file|
    file << variable
  end
end

# Main menu
def main
	system("clear")
	prompt = TTY::Prompt.new
	list_of_tickets = []

	
	loop do # Begins the main menu loop
		system("clear")
		a = Artii::Base.new  :font => 'slant'
		# Print to screen program title screen with artii and colorize gem customization
		puts a.asciify('OpenDesk').colorize(:green)
		puts "\n---------------------------------------------\n\nWelcome to OpenDesk - the open source helpdesk app built using Ruby."

		puts ""
		puts "OpenDesk - Main Menu"
		selection = prompt.select("\nChoose an option:") do |menu|
			# Menu selection for different method calls and program exit
			menu.choice 'Create a ticket'
			menu.choice 'Ticket dashboard'
			menu.choice 'Exit'
		end
		if selection == 'Create a ticket'        
			#Assigns the return value of the ticket_creation method as new_ticket
			new_ticket = ticket_creation()
			#Adds/pushes the class instance new ticket to the array
			list_of_tickets.push new_ticket
			# p list_of_tickets
		elsif selection == 'Ticket dashboard'   
			#Calls the ticket_dashboard method and parses the ticket array list_of_tickets as an argument
			list_of_tickets = ticket_dashboard(list_of_tickets)
		else
			exit
		end
	end
end