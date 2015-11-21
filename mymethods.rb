module Enumerable
  def my_each 
    i = 0 
    while i < self.size
      yield(self[i]) if block_given?
      i+=1
    end
    self
  end
  
  def my_each_with_index
    i = 0
    index = 0
    while i < self.size
      yield(self[i], index)
      i+=1
      index +=1
    end
    self
  end
  
  def my_select
    selected = []
    self.my_each do |each|
      if yield(each) #if the condition of the yield is true
        selected << each
      end
    end
    selected
  end
  
  def my_all?
    if block_given? 
      my_each { |x| return false unless yield(x) }
    end
    return true
  end
  
  def my_any?
    if block_given?
      self.my_each do |x| 
        if yield(x)
          return true
        else
          return false
        end
      end
    end
  end
  
  def my_none?
    self.my_each { |x| return false if yield(x) } 
    true
  end
  
  def my_count
    count = 0
    self.my_each do |x|
      if block_given?
       count += yield(x) ? 1 : 0
      end
    end
    count
  end
  

end






