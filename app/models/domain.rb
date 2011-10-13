class Domain < ActiveRecord::Base
  ALLOWED_TYPES = %w(MASTER SLAVE NATIVE)
  
  validates :name, :presence => true, :uniqueness => true
  validates :type, :presence => true, :inclusion => { :in => ALLOWED_TYPES }
end
