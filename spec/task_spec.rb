require 'rspec'
require 'task'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new("build a fort")
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description' do
    test_task = Task.new("build a fort")
    test_task.description.should eq("build a fort")
  end
end