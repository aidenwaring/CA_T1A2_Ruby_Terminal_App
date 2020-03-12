require "tty-prompt"
require "colorize"
require "artii"

def helpdesk_start
    prompt = TTY::Prompt.new
    a = Artii::Base.new 'AIDOS IT HELPDESK'
    puts a.asciify('Aidos IT Helpdesk').colorize(:blue)
    puts "Welcome to the AIDOS IT Helpdesk.:"
    mode = prompt.select("Select a login option:") do |menu|
      menu.choice 'Admin', 1
      menu.choice 'Guest', 2
    end
    if mode == 1
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
    if prompt.mask("Please enter your password:") != password
      puts "Incorrect password."
    return
    else
      main
    end
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
    prompt = TTY::Prompt.new
    # For loop to perform an action on each individual ticket in the tickets array (list_of_tickets argument)
    for ticket in tickets
      # Prints the index of each individual ticket in the tickets array | Prints the subject of each individual ticket
      # Add +1 to the index, as to ensure that ticket number does not begin at 0
      puts "Ticket Number: #{tickets.index(ticket)+1} From: #{ticket.from} Subject: #{ticket.subject} Description: #{ticket.description} Status: #{ticket.status} Priority: #{ticket.priority}"
    end
    puts "What would you like to do?"
    selection = prompt.select("Choose an option:") do |menu|
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
  
  def ticket_delete(tickets)
    prompt = TTY::Prompt.new
    puts "Which ticket would you like to delete?"
    delete_selection = prompt.select("Choose a ticket to delete:") do |menu| 
      for ticket in tickets
        menu.choice (tickets.index(ticket) + 1)
      end
    end
    tickets.delete_at(delete_selection.to_i - 1)
  end
  
  def ticket_edit(tickets)
    prompt = TTY::Prompt.new
    # Asks for user input
    edit_selection = prompt.select("Choose a ticket from the list to edit:") do |menu|
    for ticket in tickets
      menu.choice (tickets.index(ticket) + 1)
    end
  end
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
    list_of_tickets = []
    loop do
        puts "Welcome to the main menu."
        selection = prompt.select("Choose an option:") do |menu|
          menu.choice 'Create a ticket'
          menu.choice 'Ticket dashboard'
          menu.choice 'Exit'
        end
      if selection == 'Create a ticket'        #Assigns the return value of the ticket_creation method as new_ticket
        new_ticket = ticket_creation()
        #Adds/pushes the class instance new ticket to the array
        list_of_tickets.push new_ticket
        # p list_of_tickets
      elsif selection == 'Ticket dashboard'   
        #Calls the ticket_dashboard method and parses the ticket array list_of_tickets as an argument
        list_of_tickets = ticket_dashboard(list_of_tickets)
      else
        return
      end
    end
  end