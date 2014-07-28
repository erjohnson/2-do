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
    expect(test_task.done).to eq(false)
  end

  it 'lets you add a due date to your task' do
    test_task = Task.new 'a new task'
    test_task.due_date = '5 days'
    expect(test_task.due_date).to eq '5 days'
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
    p new_list.tasks.inspect
    expect(new_list.tasks.at(0).description).to eq 'wash the garbage'
  end
end
