require 'date'

class Event
	attr_reader :name, :description, :date

	def initialize(name,description,date)
		@name = name
		@description = description
		@date = date
	end

	def name=(new_name)
		@name = new_name
	end

	def description=(new_description)
		@description = new_description
	end

	def date=(new_date)
		@date = new_date
	end

	def to_s
		puts "Event Name: #{@name}, Description: #{@description}, Date: #{@date}"
	end
end

