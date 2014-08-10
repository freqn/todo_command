require './lib/task'

def main_menu
  puts "Type 'a' to add a task, 'l' to list your tasks or 'r' to reset your tasks."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  spacer

  if main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'r'
    reset_tasks
  elsif main_choice == 'x'
    puts "Goodbye!"
    spacer
  else
    puts "Invalid selection. Try again"
    spacer
    main_menu
  end
end

def add_task
  puts "Enter a new description"
  user_description = gets.chomp.capitalize
  Task.new(user_description).save
  @list = Task.all
  puts "Task successfully created"
  spacer
  main_menu
end

def list_tasks
  if Task.amount >= 1
    puts "These are your open tasks: "
    count = 0
    @list.each do |task|
      count += 1
      puts "#{count}) #{task.description}"
    end
    puts "Would you like to close a task? Y or N"
    delete = gets.chomp.downcase
    delete == 'y' ? close_task : main_menu
  else
    puts "You have no open tasks"
    spacer
    main_menu
  end
end

def close_task
  spacer
  puts "Enter the task number"
  del_option = gets.chomp.to_i
  Task.delete(del_option - 1)
  spacer
  list_tasks
end

def reset_tasks
  if Task.amount >= 1
    @list.clear
    puts "Your tasks have been cleared"
  else
    puts "You have no tasks"
    spacer
    main_menu
  end
end

def task_status(state)
  @state = state
end

def spacer
  puts "\n"
end

=begin
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
=end

main_menu



