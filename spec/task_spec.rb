require 'rspec'
require 'task'

describe Task do
  before do 
    Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new("build a fort")
    test_task.should be_an_instance_of Task
  end

  it 'lets you read the description' do
    test_task = Task.new("build a fort")
    test_task.description.should eq("build a fort")
  end

  describe ".all" do 
    it 'is empty at first' do 
      Task.all.should eq []
    end

    it 'is added to when save is called on an instance' do 
      test_task = Task.new('test the fort')
      test_task.save
      Task.all.should eq [test_task]
    end
  end

  describe ".clear" do 
    it 'empties out all of the saved tasks' do 
      Task.new('clean the fort').save
      Task.clear
      Task.all.should eq []

    end
  end
end