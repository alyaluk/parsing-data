require 'csv'

class Person
  attr_reader :id, :first_name, :last_name, :email, :phone, :created_at
  def initialize(person = {})
    @id = person["id"]
    @first_name = person["first_name"]
    @last_name = person ["last_name"]
    @email = person["email"]
    @phone = person["phone"]
    @created_at = person["created_at"]
  end
end

class PersonParser
  attr_reader :file
  
  def initialize(file)
    @file = file
    @people = nil
    @array = []
  end
  
  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people
    
    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
    @array = CSV.read(@file)
    @people = []
    for x in (0..@array.length-2)
      @person = Hash.new
        for y in (0..@array[0].length-1)
            @person[@array[0][y]] = @array[x+1][y]
        end
      @people << @person
    end
  end
end

parser = PersonParser.new('people.csv')

puts "There are #{parser.people.size} people in the file '#{parser.file}'."
