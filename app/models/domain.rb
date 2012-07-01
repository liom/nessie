class Domain < ActiveRecord::Base
  self.inheritance_column = :_type_disabled

  ALLOWED_TYPES = %w(MASTER SLAVE NATIVE)
  
  validates :name, :presence => true, :uniqueness => true
  validates :type, :presence => true, :inclusion => { :in => ALLOWED_TYPES }
  
  has_many :records, :dependent => :destroy
end
