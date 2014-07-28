class Task

  attr_accessor :description, :done, :due_date, :priority

  def initialize description
    @description = description
    @done = false
    @due_date = '5 days'
    @priority = 1
  end
end

class List

  attr_accessor :name, :tasks

  def initialize name
    @name = name
    @tasks = []
  end

  def add_task description
    @tasks << Task.new(description)
  end

  def sort_by_name
    @tasks.sort! {|a,b| a.description <=> b.description}
  end
end
