require 'date'

module UserIO
	def display_welcome
		puts "****** Welcome to the Calendar & Event Management System ******"
	end

	def set_year
		print "Please enter the year of calendar: "
		c_year = gets.chomp.to_i
	end

	def set_user_choice
		puts "\nPlease select an option to proceed with calendar \n
		 Enter 1: To add an event
		 Enter 2: To remove an event
		 Enter 3: To edit an event
		 Enter 4: To view event at specific date
		 Enter 5: To view events in a specific month in calendar view
		 Enter 6: To view details of all events in a specific month
		 Enter 7: To Exit \n"
		user_input = gets.chomp.to_i
		while ! ((1..7) === user_input)
			puts "Invalid Choice. Try again with valid option."
			user_input = gets.chomp.to_i
		end
		user_input
	end

	def set_update_choice
		puts "Please select an option to edit the event \n
		 Enter 1: To edit event name \n
		 Enter 2: To edit event description \n
		 Enter 3: To edit event date \n
		 Enter 4: To Exit "
		user_input = gets.chomp.to_i
		while ! ((1..4) === user_input)
			puts "Invalid Choice. Try again with valid option."
			user_input = gets.chomp.to_i
		end
		user_input
	end

	def set_event_date(e_year = Date.today.year)
		puts "Enter the month no. (1-12): "
		m= gets.chomp.to_i
		puts "Enter the day (1-31): "
		d= gets.chomp.to_i
		
		#keep asking user to enter correct date if it is not valid
		while !Date.valid_date?(e_year, m, d)
			puts "The date you entered is invalid. Please try again with valid values."
			puts "Enter the month no. (1-12): "
			m= gets.chomp.to_i
			puts "Enter the day (1-31): "
			d= gets.chomp.to_i
		end
		Date.new(e_year, m, d)
	end

	def set_month
		puts "Enter the month no. (1-12): "
		m = gets.chomp.to_i
		while ! ((1..12) === m)
			puts "Invalid Choice. Try again with valid month no."
			puts "Enter the month no. (1-12): "
			m = gets.chomp.to_i
		end
		m
	end

	def is_valid_date?(e_date)
		Date.valid_date? e_date
	end

	def set_event_name
		puts "Enter the event name: "
		e_name = gets.chomp
	end

	def set_event_desc
		puts "Enter the event description: "
		e_desc = gets.chomp
	end
end