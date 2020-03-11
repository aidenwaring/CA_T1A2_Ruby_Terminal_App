class Ticket_Admin
  attr_reader :from, :subject, :description
  attr_writer
  def initialize(from, subject, description, status, priority)
    @from = from
    @subject = subject
    @description = description
    @status = status
    @priority = priority
  end
end

# This is the structure for the ticket. Will now need to ask for each of these from user input
# ticketcreate = Ticket_Admin.new('Aiden Waring', 'Help Me', 'My computer is broken.', 'Open', 'High')

def ticket_creation
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

  subject = Ticket_Admin.new(from, subject, description, status, priority)
  p subject
end

ticket_creation