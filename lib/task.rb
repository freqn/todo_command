class Task
  attr_accessor :status, :count

  def initialize(description, status='open', count=0)
    @description = description
    @status = status
    @count = count
  end

  def description
    @description
  end

end