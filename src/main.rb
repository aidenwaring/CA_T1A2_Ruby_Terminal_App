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
  for ticket in tickets
    puts "Index: #{tickets.index(ticket)} Subject: #{ticket.subject}"
  end
  puts "Which ticket do you want to edit?"
  ticket_selection = gets.chomp.to_i
  puts "What are we changing FROM to?"
  input = gets.chomp
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
        new_ticket = ticket_creation()
        list_of_tickets.push new_ticket
        p list_of_tickets
      elsif selection == 'Ticket dashboard'   
        ticket_dashboard(list_of_tickets)
      else
        return
      end
    end
end

helpdesk_start