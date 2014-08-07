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
  puts "Enter a new description"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task successfully created"
  puts "\n\n"
  main_menu
end

def list_tasks
  puts "These are your tasks: "
  count = 0
  @list.each do |task|
    count +=1
    puts "#{count}) <@state> #{task.description}"
  end
  puts "\n\n"
  # export
  main_menu
end

def complete_task
  puts "Pick a task to delete"
  
end

def task_status(state)
  @state = state
end

# Help found at http://stackoverflow.com/questions/18900474/add-each-array-element-to-the-lines-of-a-file-in-ruby
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

main_menu



