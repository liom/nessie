class RecordA < Record
  validates :content, :presence => true, :ip_address => {:v4 => true}
  
  attr_readonly :type
  def default_type
    'A'
  end
  
  def type=(x)
    "A"
  end
  
end
