class Ticket_Admin
  attr_reader :from, :subject, :description
  attr_writer

  def initialize(number,from, subject, description, status, priority)
    @number = number
    @from = from
    @subject = subject
    @description = description
    @status = status
    @priority = priority
  end

  def print_ticket_contents
    puts "From: ",@from, "Subject: ",@subject, "Description: ",@description, "Status: ",@status, "Priority: ",@priority
  end

end

# This is the structure for the ticket. Will now need to ask for each of these from user input
# ticketcreate = Ticket_Admin.new('Aiden Waring', 'Help Me', 'My computer is broken.', 'Open', 'High')

def helpdesk_start
  puts "Welcome to the Aidos IT helpdesk.\nWhat would you like to do? (options: [a]dmin, [g]uest)"
  login_selection = gets.chomp.downcase
  case login_selection
  when 'a'
    admin_login_method
  when 'g'
    puts "Guest login successful."
  end
end

def admin_login_method
  password = "aiden123"
	puts "Welcome to the helpdesk app. \nWhat is your password?"
	passwordfailcount = 0
	inputpassword = gets.chomp
	
		if inputpassword != password
			puts "Incorrect password."
      return
    else
      ticket_creation
		end
end

list_of_tickets = []
ticket_count = 0
def ticket_creation
  puts "Please enter the following to create a new support ticket."
  ticket_count =+ 1
  number = ticket_count
  puts "From?"
  from = gets.chomp
  puts "Subject?"
  subject = gets.chomp
  puts "Description?"
  description = gets.chomp
  puts "Status?"
  status = gets.chomp
  puts "Priority?"
  priority = gets.chomp

  return Ticket_Admin.new(number, from, subject, description, status, priority)
  # new_ticket = Ticket_Admin.new(number, from, subject, description, status, priority)
  # list_of_tickets << new_ticket
  # p list_of_tickets
end

new_ticket = ticket_creation()
list_of_tickets.push new_ticket
p list_of_tickets
