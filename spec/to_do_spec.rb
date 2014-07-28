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

  it 'creates a hash with contents inside' do
    test_task = Task.new 'scrub the zebra'
    expect(test_task.task).to eq({description: 'scrub the zebra'})
  end

  it 'lets you read if the task is done' do
    test_task = Task.new 'a new task'
    expect(test_task.done).to eq(false)
  end
end
