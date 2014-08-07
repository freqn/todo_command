require './lib/task'

@tasks = {}
@task_list = []
@task_items = []

def main_menu
  puts "Choose one of the following:"
  puts "'a' to add a task"
  puts "'l' to list your tasks"
  puts "'c' to mark a task as complete"
  @take_action = gets.chomp.to_s
  menu_selection
end

def menu_selection
  if @take_action == 'a'
    add
  elsif @take_action == 'l'
    list_tasks
  elsif @take_action == 'c'
    close_task
  end
end

def add
  puts "Type your task description"
  @task_description = gets.chomp.capitalize
  spacer
  @task_status = 'OPEN'
  spacer
  @task_item = Task.new(@task_description)
  @task_item.count += 1
  @task_list << @task_item
  @count = 0
  @task_list.each do | task |
    @count += 1
    @tasks[task.description] = @count
    @task_items << "#{@tasks[task.description]}) #{@tasks.key @count} |#{@task_status}|"
  end


  puts "Your task has been added"
  main_menu
end

def list_tasks
  puts "Displaying your current tasks:"
  @task_items.each do |item|
      puts "#{item} >> TYPE ITEM NUMBER TO CLOSE" if item.include? 'OPEN'
      @item_number = gets.chomp
      item.sub! 'OPEN','DONE' if item.include? @item_number
      puts item
  end
  spacer
  puts "Type 'c' to close a task"
  @status_check = gets.chomp.downcase
  if @status_check == 'c'
    close_task
  else
    main_menu
  end
end

def close_task
  puts "Type the task number you wish to close"
  @task_selection = gets.chomp.to_s
  @tasks.each do |key, val|
    puts val
  end

end

def spacer
  puts "\n"
end


main_menu



