class Record::AAAA < Record
  validates :content, :presence => true, :ip_address => {:v6 => true}
  @type = 'AAAA'
  
end
