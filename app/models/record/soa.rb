class Record::SOA < Record
  @type = 'SOA'

  validates :content, :presence => true
  
  SOA_FIELDS = [:primary_ns, :hostmaster, :serial, :slave_refresh, :slave_retry, :transfer_expire, :default_ttl]

  virtual_attribute :primary_ns,  :type => :string
  virtual_attribute :hostmaster,  :type => :string
  
  virtual_attribute :serial,          :type => :integer
  virtual_attribute :slave_refresh,   :type => :integer
  virtual_attribute :slave_retry,     :type => :integer
  virtual_attribute :transfer_expire, :type => :integer
  virtual_attribute :default_ttl,     :type => :integer
  
  after_initialize  :initialize_soa_container
  before_validation :build_content
  
  validates_numericality_of :serial, :slave_refresh, :slave_retry, :transfer_expire, :default_ttl, :allow_blank => true, :greater_than_or_equal_to => 0
  
  validates :serial, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
  
  validates :hostmaster, :presence => true, :format => { :with => /\A[a-zA-Z0-9\-\.]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,6}\z/ }
  validates :primary_ns, :presence => true, :format => { :with => /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z0-9\-]{2,6}?$/i }

  def initialize_soa_container
    unless content.blank?
      content.split(" ").each_with_index do |value, i|
        send "#{SOA_FIELDS[i]}=", value 
      end
    end
  end
  
  def set_defaults
    self.primary_ns       = (domain.records.with_type('NS').first.name) rescue ""
    self.hostmaster       = ("hostmaster@#{domain.name}") rescue ""
    self.serial           = (domain.updated_at.to_i) rescue Time.now.utc.to_i
    self.slave_refresh    = 10800
    self.slave_retry      = 3600
    self.transfer_expire  = 604800
    self.default_ttl      = (domain.ttl) rescue 3600
  end
  
  def build_content
    self.content = SOA_FIELDS.map do |field|
      send(field).to_s
    end.join(" ")
  end
  
end
