class Task

  attr_accessor :description, :done

  def initialize description
    @description = description
    @done = false
  end

  def task
    { description: @description }
  end
end

class List
  def initialize name
    @name = name
    @tasks = []
  end
  def add_task

  end
end
