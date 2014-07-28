require 'rspec'
require 'to_do'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new 'scrub the zebra'
    expect(test_task).to be_an_instance_of Task
  end

  it 'lets you read the description out' do
    test_task = Task.new 'scrub the zebra'
    expect(test_task.description).to eq 'scrub the zebra'
  end

  it 'lets you read if the task is done' do
    test_task = Task.new 'a new task'
    expect(test_task.done).to eq false
  end

  it 'lets you add a due date to your task' do
    test_task = Task.new 'a new task'
    test_task.due_date = '5 days'
    expect(test_task.due_date).to eq '5 days'
  end

  it 'lets you add a priority for tasks' do
    test_task = Task.new 'a new task'
    test_task.priority = 1
    expect(test_task.priority).to eq 1
  end

  it 'lets you mark the task as done' do
    test_task = Task.new 'a new task'
    test_task.mark_done
    expect(test_task.done).to eq true
  end

  it 'lets you edit a tasks description' do
    test_task = Task.new 'a new task'
    test_task.edit_description 'wash the zebra'
    expect(test_task.description).to eq 'wash the zebra'
  end
end

describe List do
  it 'is initialized with a name' do
    new_list = List.new 'Chores'
    expect(new_list).to be_an_instance_of List
  end

  it 'lets you read the list name' do
    new_list = List.new 'Chores'
    expect(new_list.name).to eq 'Chores'
  end

  it 'lets you access all of the lists you created' do
    new_list = List.new 'Chores'
    expect(new_list.tasks).to eq []
  end

  it 'lets you add a new task to the current list' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the garbage')
    expect(new_list.tasks.length).to eq 1
  end

  it 'lets you read the task description' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the garbage')
    new_list.add_task('eat the dishes')
    expect(new_list.tasks.at(0).description).to eq 'wash the garbage'
  end

  it 'lets you sort the tasks by name' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the garbage')
    new_list.add_task('eat the dishes')
    new_list.add_task('apples')
    new_list.sort_by_name
    expect(new_list.tasks.at(0).description).to eq 'apples'
    expect(new_list.tasks.at(1).description).to eq 'eat the dishes'
    expect(new_list.tasks.at(2).description).to eq 'wash the garbage'
  end

  it 'lets you sort the tasks by priority' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the garbage')
    new_list.add_task('eat the dishes')
    new_list.add_task('apples')
    new_list.tasks.at(0).priority = 1
    new_list.tasks.at(1).priority = 3
    new_list.tasks.at(2).priority = 2
    new_list.sort_by_priority
    expect(new_list.tasks.at(0).priority).to eq 3
    expect(new_list.tasks.at(1).priority).to eq 2
    expect(new_list.tasks.at(2).priority).to eq 1
  end

  it 'lets you sort the tasks by due date' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the garbage')
    new_list.add_task('eat the dishes')
    new_list.add_task('apples')
    new_list.tasks.at(0).due_date = '3 days'
    new_list.tasks.at(1).due_date = '1 day'
    new_list.tasks.at(2).due_date = '5 days'
    new_list.sort_by_due_date
    expect(new_list.tasks.at(0).due_date).to eq '5 days'
    expect(new_list.tasks.at(1).due_date).to eq '3 days'
    expect(new_list.tasks.at(2).due_date).to eq '1 day'
  end

  it 'lists all the tasks marked done' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the garbage')
    new_list.add_task('eat the dishes')
    new_list.add_task('apples')
    new_list.tasks.at(0).mark_done
    new_list.tasks.at(2).mark_done
    new_list.show_done_tasks
    p new_list.done_tasks.inspect
    expect(new_list.done_tasks.length).to eq 2
  end

  it 'lets you delete tasks' do
    new_list = List.new 'Jobs'
    new_list.add_task('wash the zebra')
    new_list.add_task('eat the dishes')
    new_list.delete_task('wash the zebra')
    expect(new_list.tasks.at(0).description).to eq 'eat the dishes'
  end
end
