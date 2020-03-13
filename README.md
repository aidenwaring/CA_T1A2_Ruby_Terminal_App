# Aiden Waring - CAB012027
# T1A2 - Ruby Terminal App

---

## R3 - Referenced Materials

Industry standard ticket format and procedure can be read here:
[https://www.cherwell.com/library/blog/itil-service-desk-responsibilities/](https://www.cherwell.com/library/blog/itil-service-desk-responsibilities/)

## R4 - Source Control Repository

My GitHub repository for the project can be found at the link below:
[https://github.com/aidenwaring/helpdesk_terminal](https://github.com/aidenwaring/helpdesk_terminal)

## R5 - Software Development Plan

### Purpose

The vision of this terminal application was to reproduce the behaviour and methodology found in helpdesk software used in service delivery work environments. 

At a high level, the application intends on functioning as a I.T support ticket helpdesk system, based off my own previous experience in I.T support. 

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

## R6 - Feature Details

The program features the following features:

1. Administrator login
  - The user is prompted for an administrator password (detailed in section R10) to authenticate access to the ticket helpdesk. The system fails on an incorrect entry and uses a Ruby loop to try for correct selection three times before program exit. 
2. Ticket creation
  - The user is able to create a new support ticket to be viewed in a dashboard. This method utilises a Ruby class, several connecting method parsing variables and results to generate an array result.
3. Ticket editing
- The user is able to edit existing tickets to overwrite the ticket attributes with new data. Exception handling is implemented to ensure validity of data, where the user is unable to initiate the ticket edit method if there are no existing tickets.
4. Ticket deletion
- The user is able to delete existing tickets to remove the ticket element from the array of total tickets. Exception handling is implemented to ensure validity of data, where the user is unable to initiate the ticket delete method if there are no existing tickets.

Develop a list of features that will be included in the application. It must include:
- at least THREE features
- describe each feature

Note: Ensure that your features above allow you to demonstrate your understanding of the following language elements and concepts:
- use of variables and the concept of variable scope
- loops and conditional control structures
- error handling

## R7 - Outline

Develop an outline of the user interaction and experience for the application.
Your outline must include:
- how the user will find out how to interact with / use each feature
- how the user will interact with / use each feature
- how errors will be handled by the application and displayed to the user

Consult with your educator to check your features are sufficient . 	300 words (approx. 100 words per feature)

## R8 - Application Flow Diagram

Develop a diagram which describes the control flow of your application. Your diagram must:
- show the workflow/logic and/or integration of the features in your application for each feature.
- utilise a recognised format or set of conventions for a control flow diagram, such as UML.

Provide link to the image, stored in the docs folder, hyperlinked

## R9 - Implementation Plan (Trello)

Develop an implementation plan which:
- outlines how each feature will be implemented and a checklist of tasks for each feature
- prioritise the implementation of different features, or checklist items within a feature
- provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

Utilise a suitable project management platform to track this implementation plan

Your checklists for each feature should have at least 5 items.

## R10 - User Documentation

Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

You must include:
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements

## R11, R12 - Terminal Application and Code Overview in Slide Deck

Slide deck attached here.

1. gg
1. gg
1. hh

* hj
* ghj
* hj

thus
is
a 
sentence
<br>
jjj
[link](https://google.com)       
[link](fff.png)       
![link](fff.png)       

``` ruby
puts hello
```

``` bash
cd dev && echo hello
```
type a sent

> asdfghjkdfgh efghwert erftghfg ubhhuhb bbuyu uhbhu 
> omin

nnvhj

# Terminal application
​
## Released march 10
​
### due march 12 @9PM
​
#### 130.5 points
​
##### 71% final mark for foundation programming
45% final mark for programming 1
​*This* is an **important** sentence!

***Another*** one.
---
​
- design, implement and test a terminal application and throughout the process demonstrate that you are able to use a range of developer tools
- The mandatory requirements/constraints for your application are
- utilise arguments that can be provided in the terminal when running the application
​
**Consult with educator on the application you intend to makr before completing substantial work on the software development plan or implementing the application itself.**
with/use each feature
- how errors will be handled by the application and displayed to the user
​
- command line arguments
- importing a ruby gem
  - && using functions from ruby gem
​
---
​
##### GLOSSARY
​
- describe:
  - mean to provide detail
- identify:
  - means make a statement or name something
- explain:
  - provide detailed reasons/information relating to why or how something 
  

  ### Instructions for install
  
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/aidenwaring/helpdesk_terminal/master/src/methods/shell.sh)"