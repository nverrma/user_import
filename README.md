# README

This is a sample application for importing Users by uploading a CSV file.
Each user must have a name and a strong password.
We show either success or an error message in response to each row in the CSV.

### Requirements
* Ruby version -  ruby-2.7.1
* Rails version - 6.1.4.1
* Database - PostgreSQL

Steps to run the application -
1) Clone the repo
   `git clone https://github.com/nverrma/user_import.git`


2) Move into the directory

   `cd import_users`

3) Run bundle

   `bundle install`

4) Set up database

   `rails db:create && rails db:migrate`

5) Run the server

   `rails s`

6) Check functionality

   Open the browser and go to `http://localhost:3000`

   Upload a CSV file ([sample file](spec/fixtures/files/import_users.csv))
