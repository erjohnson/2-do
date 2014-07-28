class Task

  attr_accessor :description, :done, :due_date

  def initialize description
    @description = description
    @done = false
    @due_date = '5 days'
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
end
