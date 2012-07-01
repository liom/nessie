class NsRecord < ActiveRecord::Base
  belongs_to :domain

  validates :name, :presence => true, :format => { :with => /\A[a-z0-9]+(([\-\.]{1}[a-z0-9]+)*\.[a-z0-9\-]{2,6}?)?\z/i }
  validates :address, :presence => true, :format => { :with => /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z0-9\-]{2,6}?\.\z/i }

end
