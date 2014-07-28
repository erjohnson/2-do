require './lib/to_do'

@list = []

def main_menu
  puts "Press 'a' to add a task or 'l' to list all of your tasks."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'x'
    puts "Good-bye!"
  else
    puts "Sorry, that wasn't a valid option."
    main_choice
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
  main_menu
end

def list_tasks
  puts "here are all of your tasks:"
  @list.each { |task| puts task.description }
  puts "\n\n"
  main_menu
end

main_menu
