require 'active_record'
class User < ActiveRecord::Base
  #self.abstract_class = true
  has_secure_password
  has_many :todos
  # the above clause means one user can have many todos
end
