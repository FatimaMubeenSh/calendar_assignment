require_relative 'calendar.rb'
require_relative 'user_io_handler.rb'
require 'date'

class Driver
	include UserIO

	def create_calendar?(e_year)
		if(e_year < 2019)
			puts "year has already passed. Please try again with valid year (i.e. year >= 2019)"
			return false
		end
		else
		Calendar.new(e_year)
	end

	def calendar_action(action_code, calendar)
		case action_code
		when 1	#add event
			puts "Case 1 "
			e_date = self.set_event_date(calendar.year)
			e_name = self.set_event_name
			while(calendar.has_event?(e_name))
				puts "Puts Event with same name exists already. Try again with a different name"
				e_name= self.set_event_name
			end
			e_desc = self.set_event_desc
			puts "****** Adding the event : #{e_name} ******"
			calendar.add_event(e_name,e_desc,e_date)
		when 2	#remove event
			puts "Case 2"
			e_name = self.set_event_name
			if (calendar.has_event?(e_name))
				puts "****** Removing the event : #{e_name} ******"
				calendar.remove_event(e_name)
			else
				puts "Event doesn't exist"
				calendar
			end
		when 3	#edit event
			puts "Case 3"
			e_name = self.set_event_name
			if (calendar.has_event?(e_name))
				current_event = calendar.get_event(e_name)
				update_choice = self.set_update_choice
				case update_choice 
				when 1 # edit name
					new_name = self.set_event_name
					puts "****** Event name updated from : #{current_e_name} to #{new_name} ****** "
					calendar.edit_event(e_name,new_name,current_event.description,current_event.date)
				when 2 # edit desc
					new_desc = self.set_event_desc
					puts "****** Event description updated from : #{current_event.description} to #{new_desc} ****** "
					calendar.edit_event(e_name,current_event.name,new_desc,current_event.date)
				when 3 # edit date
					new_date = self.set_event_date(calendar.year)
					puts "****** Event date updated from : #{current_event.date} to #{new_date} ****** "
					calendar.edit_event(e_name,current_event.name,current_event.description,new_date)
				when 4 # exit
					puts "Update Exit Successfully"
				else
					puts "Invalid choice"
				end
			else
				puts "Event doesn't exist"
				calendar
			end
		when 4	#specific date event 
			puts "Case 4"
			e_date = self.set_event_date(calendar.year)
			spec_event = calendar.event_at(e_date)
			puts "****** Viewing the event(s) at : #{e_date} ******"
			puts "There are #{spec_event.count} events"
			calendar.view_events(spec_event)
		when 5	#specific month event calendar view
			puts "Case 5"
			e_month = self.set_month
			puts "****** Viewing Event(s) of Month : #{e_month} ******"
			calendar.print_monthlyView(e_month)
		when 6	#specific month event details
			puts "Case 6"
			e_month = self.set_month           
			e = calendar.event_in_month(e_month)
			puts "****** Viewing Event(s) of Month : #{e_month} ******"
			puts "There are #{e.count} events"
			calendar.view_events(e)
		when 7  #returns 7, code to exit program
			7
		else 
			puts "Invalid action, Try again"
		end
	end
end

# Execution
d = Driver.new
d.display_welcome

# Get year from user and create calendar for it
y = d.set_year
calendar1 = d.create_calendar?(y)

# if calendar is not created try again untill its created
while !calendar1
	y = d.set_year
	calendar1 = d.create_calendar?(y)
end

# Display menu to user and take user choice
user_choice = d.set_user_choice

# When user enters 7 the program execution stops, otherwise menu is displayed for getting next choice of user 
while(user_choice != 7)
	d.calendar_action(user_choice,calendar1)
	user_choice = d.set_user_choice
end






