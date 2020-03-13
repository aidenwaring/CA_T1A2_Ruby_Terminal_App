# Aiden Waring - CAB012027
# T1A2 - Ruby Terminal App

---

## Referenced Materials

Industry standard ticket format and procedure can be read here:
[https://www.cherwell.com/library/blog/itil-service-desk-responsibilities/](https://www.cherwell.com/library/blog/itil-service-desk-responsibilities/)

## Source Control Repository

My GitHub repository for the project can be found at the link below:
[https://github.com/aidenwaring/helpdesk_terminal](https://github.com/aidenwaring/helpdesk_terminal)

## Software Development Plan

### Purpose

The vision of this terminal application was to reproduce the behaviour and methodology found in helpdesk software used in service delivery work environments. 

At a high level, the application intends on functioning as a IT support ticket helpdesk system, based off my own previous experience in IT support. 

My prior experience with service desk management platforms has been that extra functionality such as multiple users and customization are all functions that are often restricted to users who pay an extra fee, oftentimes on top of the reoccuring fee for the base product. I identified this restriction as an interesting problem to solve. Developing my own service desk program has allowed me to overcome the restrictions found in other products that are not flexible and who's requirements don't grow with the customer. I have chosen to develop an open source alternative to ticketing software in an effort to resolve these issues. 

Presenting OpenDesk - an open source Ruby terminal application for helpdesk service delivery management.

The target audience for the program are service desk support technicians who need to create and track support tickets, and have them organised in a clean and responsive manner via the convenience of a command line interface.

### Scope

The initial scope of the terminal helpdesk application was for the application to provide the following core features:
- Create Tickets
- Edit Tickets
- Delete Tickets

I am confident that I was able to deliver each of these primary features, though many others that I had originally intended to complete did not make the cut.

During the development of the application, it was apparent that the initial scope of the project was far exceeding the deliverables for the given time frame.

As this was my first experience developing a terminal application, it was difficult for me to gauge how quickly I was able to complete certain tasks I had set. I am however pleased with what I have produced within only two weeks of Ruby learning content and three days to complete the assesssment.

## Feature Details & Outline

The program features the following features:

- Administrator login
  - The user is prompted for an administrator password (detailed in section R10) to authenticate access to the ticket helpdesk. The system fails on an incorrect entry and uses a Ruby loop to try for correct selection three times before program exit. 
  - The user will discover how to interact with this feature by reading the onscreen prompt for password input. Typing any key will enter a hidden character, implemented using a TTY-Prompt option for masking user input. User will interact with this feature via key input. Incorrect entry of the password three times will remove the user from the retry loop, present an error message and exit the program. As all key input is valid, exception is handled by making each password attempt a legal action and providing the option to try again up to three times.
- Ticket creation
  - The user is able to create a new support ticket to be viewed in a dashboard. This method utilises a Ruby class, several connecting method parsing variables and results to generate an array result.
  - The user will interact with the ticket creation method by reading the onscreen instructions once the option for ticket creation is entered. Ticket creation involves the user being directed to input any valid string entry for the From, Subject and Description fields, as often these contain many data types in the workplace. Menu options are presented for Status and Priority. The user is directed to select one of these options via the use of a menu selection, similar to how the user had chosen to start the ticket creation method from the main menu. On screen instruction remains the same. 
- Ticket editing
  - The user is able to edit existing tickets to overwrite the ticket attributes with new data. Exception handling is implemented to ensure validity of data, where the user is unable to initiate the ticket edit method if there are no existing tickets.
  - The user is able to interact with the ticket edit function similarly to the create ticket method, as onscreen prompt, direction and user input methods remain the same. Error handling and data validity is ensured by utilising several conditional statements to ensure that the ticket listing is not empty before trying to edit a ticket in the empty list. Users are prompted to select a ticket by returning the number via the menu prompt and selecting which ticket attribute they'd like to change, with user input also managed in the same fashion.
- Ticket deletion
  - The user is able to delete existing tickets to remove the ticket element from the array of total tickets. Exception handling is implemented to ensure validity of data, where the user is unable to initiate the ticket delete method if there are no existing tickets.
  - User discovery of interaction, user interaction and error handling are handled identically to the ticket editing method, where the program will consider if the ticket listing is empty before proceeding with the deletion of at item.

## Application Flow Diagram

Please find a link to my application flow diagram:
[Application Flow Diagram](/docs/appflow.png)

## Implementation Plan (Trello)

Please find a link to my project implementation plan, documented in Trello, below:
[https://trello.com/b/xCMvg97e/terminal-app](https://trello.com/b/xCMvg97e/terminal-app)

If the link provided is inaccessible, please click the link below instead:
[Trello Screenshot](/docs/trelloboard.png)

## User Documentation

### Instructions for install

Ensure that you have installed the latest version of Ruby on your computer, following the instructions at the link below:
[https://www.ruby-lang.org/en/documentation/installation/](https://www.ruby-lang.org/en/documentation/installation/)

If you are using a Mac, to run the application, simply enter the below line into your terminal.

``` bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/aidenwaring/helpdesk_terminal/master/src/shell.sh)" 
```

Otherwise, follow the below steps:

1. Download the application files through the Github link source provided earlier, posted below for convenience:
[https://github.com/aidenwaring/helpdesk_terminal](https://github.com/aidenwaring/helpdesk_terminal)

2. Open your terminal and navigate to the directory helpdesk_terminal that the files were cloned to
3. Run the command below command in your terminal
``` bash 
bundle install
``` 

4. Navigate to the src subfolder, then run the below command in your terminal 
``` bash 
ruby main.rb
```

Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

## Terminal Application and Code Overview in Slide Deck

Please find the slide deck featured in the presentation at the link below:

[aidenwaring_slidedeck](/ppt/aidenwaring_slidedeck.pdf)    