class Vocab < ActiveRecord::Base
  
  named_scope  :find_previous, lambda { |id|
    { :conditions => [ "id < :id", { :id => id } ] }
  }
  
  named_scope  :find_subsequent, lambda { |id|
    { :conditions => [ "id > :id", { :id => id } ] }
  }

  def print_pronunciation
    self.pronunciation.gsub /([A-Z])/, "<sup>\\1</sup>" 
  end
end
