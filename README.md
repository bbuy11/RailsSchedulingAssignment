# README

This is a Scheduling Site for work orders created using Ruby on Rails created by Ben Baiel.

This version was created with Ruby version 3.3.4 and Rails version 7.2.0. It uses sqlite3 version 1.4.

Here is the documentation used in creating the base of this project:

* [Geeks for Geeks Tutorial](https://www.geeksforgeeks.org/ruby-on-rails-introduction/)
* [Ruby on Rails Guide](https://guides.rubyonrails.org/v5.0/getting_started.html)

There is a rake file to import the data from the csv files to the database called import.rake, found in app/lib/tasks. It can be run using "rake import:load_csv".


## How to run

The server runs on the default port for local host (3000).

To run, type the command "rails s" in the terminal to start the server and navigate to [http://localhost:3000](http://localhost:3000) in your browser.


## The Process

My experience using Ruby and Ruby on Rails is limited, so I relied heavily on online tutorials and my existing knowledge of software development to help me. My approach to this project was first to get the server to run, then get all of the csv file data into the database and then finally work on getting the data to display in the table. The last step of the process was to get the pop up to function and show the gaps in between work orders. The most difficult part of this project was figuring out how to get the AM and PM times to line up properly, as well as the blocks to display correctly. This mostly required a lot of trial and error, adjusting the values and approach to lining everything up, as well as the styling, until it fit. Some future improvements that could be made include fixing the minor issue where blocks overlap when scheduled at the same time, adding more error checking, and styling to make things look better.
