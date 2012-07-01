class Record < ActiveRecord::Base
  belongs_to :domain, :touch => true

  ALLOWED_TYPES = %w(SOA A AAAA NS CNAME MX SRV TXT AFSDB CERT DNSKEY DS HINFO KEY LOC NAPTR NSEC PTR RP RRSIG SPF SSHFP)

  validates :type, :presence => true, :inclusion => { :in => ALLOWED_TYPES }
  validates :domain_id, :presence => true
  validates :name, :presence => true
  validates :ttl, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  
  before_validation :set_fqdn, :set_ttl
  
  scope :with_type, lambda {|type| where(:type => type)}
  
  def set_fqdn
    return if self.domain.blank?

    self.name ||= self.domain.name
    
    self.name.gsub!(/\.$/, '')
    self.name = "#{self.name}.#{self.domain.name}" unless self.name =~ /#{Regexp.escape(self.domain.name)}$/
  end
  
  def set_ttl
    self.ttl ||= domain.try(:ttl) || 86400 # default dns ttl value
  end
  
end

