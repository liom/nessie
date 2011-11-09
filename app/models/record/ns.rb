class Record::NS < Record
  validates :content, :presence => true, :format => { :with => /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z0-9\-]{2,5}?$/i }

  @type = 'NS'
  
end
