require './lib/task'

@list = []

def main_menu
  puts "Press 'a' to add a task or 'l' to list your tasks."
  puts "Press 'x' to exit."
  main_choice = gets.chomp

  if  main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
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
    puts "#{count}) #{task.description}"
  end
  puts "\n\n"
  export
  main_menu
end

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



