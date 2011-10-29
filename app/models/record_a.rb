class RecordA < Record
  validates :content, :presence => true, :ip_address => {:v4 => true}
  @type = 'A'
  
end
