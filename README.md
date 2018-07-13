# Project Volunteer Coordinator

#### Epicodus Ruby: 07/13/2018

#### By Eric Shull

## Description

A site that organizes projects by coordinating volunteers

## Link to Heroku Site




## Setup/Contribution Requirements

* Clone the repo
* Make a new branch
* Commit and push your changes
* Create a PR
### Database Setup
* First run this code in the terminal to create a new database from the file in repo: <br> createdb [volunteer_tracker]

* Then run this code to establish the database from the file into the created one: <br> psql [volunteer_tracker] < database_backup.sql
* Then run this code in the terminal to create a test database from the one created: <br> createdb -T [volunteer_tracker] [volunteer_tracker_test]



## Technologies Used

* Ruby 2.4.1
* rspec
* Sinatra
* Capybara

## Specs/Steps
* As an employee, I want to view, add, update and delete projects.
* As an employee, I want to view and add volunteers.
* As an employee, I want to add volunteers to a project.

## License

This software is licensed under the MIT license.

Copyright (c) 2018 **Eric Shull**
