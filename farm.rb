puts "\e[H\e[2J"
class Field
  @@field = []
  @@total_food =0


  def initialize(field_type,field_size)
    @field_type = field_type
    @field_size = field_size
  end

  def field_type
    @field_type
  end

  def field_type=(field_type)
    @field_type = field_type
  end

  def field_size
    @field_size
  end

  def field_size=(field_size)
    @field_size = field_size
  end

 def self.main_menu
  while true
    display_options
    user_input = gets.chomp
    Field.call_options(user_input)
  end
 end

 def self.display_options
    puts "Options"
    puts ".........................."
    puts "field -> adds a new field"
    puts "harvest -> harvests crops and adds to total harvested"
    puts "status -> displays some information about the farm"
    puts "relax -> provides lovely descriptions of your fields"
    puts "exit -> exits the program"
    puts "........................."
 end

 def self.call_options(user_input)
   case user_input
   when "field" then Field.add_new_field
   when "harvest" then Field.harvest
   when "status" then Field.display_info
   when "relax" then Field.describe_field
   when "exit" then exit!
   end
 end

 def self.add_new_field
   puts "What kind of field is it: corn or wheat ?"
   user_choice = gets.chomp
   field_type = user_choice
   puts "How large is the field in hectares?"
   user_input_area = gets.to_i
   field_size = user_input_area

   new_field = Field.new(field_type,field_size)
   @@field << new_field

   if user_choice == "corn"
     total_food = user_input_area*20
     puts "Added a corn field of #{user_input_area} hectares !"
   elsif user_choice == "wheat"
     total_food = user_input_area*30
     puts "Added a wheat field of #{user_input_area} hectares !"
  end
 end

 def self.harvest
  if @@field.size == 0
    puts "The farm has 0 harvested food so far"
  else
    @@field.each do |field|

      if field.field_type == "corn"
          @@total_food += field.field_size*20
          puts "Harvesting #{field.field_size*20} food from #{field.field_size} hectares #{field.field_type} field"
      elsif field.field_type == "wheat"
             @@total_food += field.field_size*30
          puts "Harvesting #{field.field_size*30} food from #{field.field_size} hectares #{field.field_type} field"
     end
   end
     puts "The farm has #{@@total_food} harvested food so far"
 end

end

  def self.display_info
    if @@field.size == 0
      puts "The farm has 0 harvested food so far"
    else
      @@field.each do |field|
        if field.field_type == "corn"
            puts "#{field.field_type} field is #{field.field_size} hectares "
        elsif field.field_type == "wheat"
            puts "#{field.field_type} field is #{field.field_size} hectares "
       end
     end
       puts "The farm has #{@@total_food} harvested food so far"
    end
  end

  def self.describe_field
    @@field.each do |field|
      if field.field_type == "corn"
    puts " #{field.field_size}hectares of tall green stalks rustling in the breeze fill your horizon."
  elsif field.field_type == "wheat"
    puts "The sun hangs low, casting an orange glow on a sea of #{field.field_size} hectares of wheat."
  end
 end
 end

end

Field.main_menu
 Field.add_new_field
 Field.harvest
 Field.add_new_field
 Field.harvest
