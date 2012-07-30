class Poll < ActiveRecord::Base
    attr_accessible :name, :edit_link
  
    validates :name, :uniqueness => true, :length => { :minimum => 3 }

    before_save :add_edit_link
  
    def add_edit_link
        self.edit_link = random_url if self.edit_link.nil?
    end
  
    def random_url
        chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
        (1..8).collect{|a| chars[rand(chars.size)] }.join
    end
  
end
