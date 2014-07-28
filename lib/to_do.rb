class Task

  attr_accessor :description, :done, :due_date, :priority

  def initialize description
    @description = description
    @done = false
    @due_date = '5 days'
    @priority = 1
  end

  def mark_done
    @done = true
  end

  def edit_description new_description
    @description = new_description
  end
end

class List

  attr_accessor :name, :tasks, :done_tasks

  def initialize name
    @name = name
    @tasks = []
    @done_tasks = []
  end

  def add_task description
    @tasks << Task.new(description)
  end

  def sort_by_name
    @tasks.sort! { |a, b| a.description <=> b.description }
  end

  def sort_by_priority
    @tasks.sort! { |a, b| a.priority <=> b.priority }
    @tasks.reverse!
  end

  def sort_by_due_date
    @tasks.sort! { |a, b| a.due_date <=> b.due_date }
    @tasks.reverse!
  end

  def show_done_tasks
    @tasks.each do |task|
      if task.done == true
        @done_tasks << task
      end
    end
  end

  def delete_task description
    @tasks.delete_if {|task| task.description == description }
  end
end
