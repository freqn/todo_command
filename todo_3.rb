require './lib/task'

@list = []

def main_menu
  puts "Type 'a' to add a task, 'l' to list tasks or 'c' to mark a task as complete."
  puts "Press 'x' to exit."
  main_choice = gets.chomp

  if  main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'c'
    complete_task
  elsif main_choice == 'x'
    puts "Goodbye!"
  else
    puts "Invalid selection. Try again"
  end
end

def add_task
  puts "\n"
  puts "Enter a new description"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task successfully created. Would you like to view your tasks? Y/N?"
  @view = gets.chomp.downcase
  if @view == 'y'
    list_tasks
  end
  puts "\n\n"
  main_menu
end

def list_tasks
  puts "These are your tasks: "
  @list.each do |task|
      puts task.description
  end
  puts "Add another task or close a task? Type 'a' to add, 'c' to close or 'm' for main_menu"
  @add_close = gets.chomp.downcase
  if @add_close == 'a'
    add_task
  elsif @add_close == 'c'
    close_task
  else
    main_menu
  end
end

def close_task
  @count = 0
  @list.each do |task|
      @count += 1
      puts " #{@count}) #{task.description}"
  end

  puts "You have #{@count} tasks. Which one would you like to close? Type the number"
  task_select = gets.chomp

  # rest of code will go here
  
  
end

def task_status(state)
  @state = state
end

# Help found at http://stackoverflow.com/questions/18900474/add-each-array-element-to-the-lines-of-a-file-in-ruby
=begin
def export
  file_name = 'todo.txt'
  File.open(file_name, 'w') do |f|
    count = 0
    @list.each do |task|
      count +=1
      f.puts "#{count}) #{task.description}"
    end
  end
end
=end

main_menu



