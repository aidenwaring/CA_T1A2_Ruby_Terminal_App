require "tty-prompt"
require "colorize"
require "artii"

class Ticket
  attr_reader :from, :subject, :description
  attr_writer :from
  def initialize(from, subject, description, status, priority)
    @from = from
    @subject = subject
    @description = description
    @status = status
    @priority = priority
  end
end

def helpdesk_start
  prompt = TTY::Prompt.new
  a = Artii::Base.new 'AIDOS IT HELPDESK'
  puts a.asciify('Aidos IT Helpdesk').colorize(:blue)
  puts "Welcome to the AIDOS IT Helpdesk.:"
  mode = prompt.select("Select a login option:") do |menu|
    menu.choice 'Admin'
    menu.choice 'Guest'
  end
  if mode == 'Admin'
    admin_login_method
  else
    puts "Guest Mode!"
  end
end

def admin_login_method
  prompt = TTY::Prompt.new
  password = "aiden123"
  passwordfailcount = 0
  puts "Welcome to the helpdesk app."
  # if prompt.mask("Please enter your password:") != password
    # puts "Incorrect password."
  # return
  # else
    main
  # end
end

def ticket_creation
  prompt = TTY::Prompt.new
  system("clear")
  puts "Please enter the following to create a new support ticket."
  puts "From?"
  from = gets.chomp
  puts "Subject?"
  subject = gets.chomp
  puts "Description?"
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

def ticket_dashboard(tickets)
  # For loop to perform an action on each individual ticket in the tickets array (list_of_tickets argument)
  for ticket in tickets
    # Prints the index of each individual ticket in the tickets array | Prints the subject of each individual ticket
    # Add +1 to the index, as to ensure that ticket number does not begin at 0
    puts "Ticket Number: #{tickets.index(ticket)+1} Subject: #{ticket.subject} From #{ticket.from}"
  end
  puts "Which ticket do you want to edit?"
  # Asks for user input
  ticket_selection = gets.chomp.to_i
  # Subtract 1 from ticket_selection, as to ensure that when parsed to the overwrite below it keeps the correct index value
  ticket_selection = ticket_selection - 1
  puts "What are we changing FROM to?"
  input = gets.chomp
  # Overwrites the from contents of the ticket with the input of the user
  tickets[ticket_selection].from = input
end

def main
  prompt = TTY::Prompt.new
  list_of_tickets = [Ticket.new('me', "help", "description", "Open", "Low")]
    loop do
      puts "Welcome to the main menu."
      selection = prompt.select("Choose an option:") do |menu|
        menu.choice 'Create a ticket'
        menu.choice 'Ticket dashboard'
        menu.choice 'Exit'
      end
      if selection == 'Create a ticket'
        #Assigns the return value of the ticket_creation method as new_ticket
        new_ticket = ticket_creation()
        #Adds/pushes the class instance new ticket to the array
        list_of_tickets.push new_ticket
        p list_of_tickets
      elsif selection == 'Ticket dashboard'   
        #Calls the ticket_dashboard method and parses the ticket array list_of_tickets as an argument
        ticket_dashboard(list_of_tickets)
      else
        return
      end
    end
end

helpdesk_start