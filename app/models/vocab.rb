class Vocab < ActiveRecord::Base
  
  named_scope  :find_previous, lambda { |id|
    { :conditions => [ "id < :id and done = :done", { :id => id, :done => false } ] }
  }
  
  named_scope  :find_subsequent, lambda { |id|
    { :conditions => [ "id > :id and done = :done", { :id => id, :done => false } ] }
  }

  def print_pronunciation
    self.pronunciation.gsub /([A-Z])/, "<sup>\\1</sup>" 
  end
end