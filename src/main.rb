require "tty-prompt"
require "colorize"
require "artii"

class Ticket
  attr_reader :from, :subject, :description
  attr_writer
  def initialize(from, subject, description, status, priority)
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

def helpdesk_start
  a = Artii::Base.new 'AIDOS IT HELPDESK'
  puts a.asciify('Aidos IT Helpdesk').colorize(:blue)
  puts "What would you like to do? (options: [a]dmin, [g]uest)"
  login_selection = gets.chomp.downcase
  case login_selection
  when 'a'
    admin_login_method
  when 'g'
    puts "Guest login successful."
  end
end

def admin_login_method
  prompt = TTY::Prompt.new

  password = "aiden123"
  passwordfailcount = 0
  #puts "Welcome to the helpdesk app. \nWhat is your password?"
  #prompt.mask("Welcome to the helpdesk app. \n What is your password?")
  puts "Welcome to the helpdesk app."
  #prompt.mask("What is your password?")
  #inputpassword = gets.chomp
  if prompt.mask("Please enter your password:") != password
    puts "Incorrect password."
  return
  else
    main
  end
end

def ticket_creation
  system("clear")
  puts "Please enter the following to create a new support ticket."
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
  return Ticket.new(from, subject, description, status, priority)
end

def main
  prompt = TTY::Prompt.new
  list_of_tickets = []
    loop do
      puts "What would you like to do? (Options: Create, View, Exit)"
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
          puts "Here's the dashboard!"
      else
        return
      end
    end
end

helpdesk_start