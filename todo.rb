require './lib/task'

def main_menu
  puts "Type 'a' to add a task, 'l' to list tasks or 'c' clear your tasks."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  spacer

  if main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'c'
    clear_tasks
  elsif main_choice == 'x'
    puts "Goodbye!"
  else
    puts "Invalid selection. Try again"
  end
end

def add_task
  puts "Enter a new description"
  user_description = gets.chomp
  Task.new(user_description).save
  @list = Task.all
  puts "Task successfully created"
  spacer
  main_menu
end

def list_tasks
  if Task.amount >= 1
    puts "These are your tasks: "
    @list.each do |task|
      puts task.description
    end
  else
    puts "You have no tasks"
  end
  spacer
  main_menu
end

def clear_tasks
  @list.clear
  puts "Your tasks have been cleared"
  main_menu
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



