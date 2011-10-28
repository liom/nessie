class Record < ActiveRecord::Base
  set_inheritance_column "sti_type"
  
  ALLOWED_TYPES = %w(SOA A AAAA NS CNAME MX SRV TXT AFSDB CERT DNSKEY DS HINFO KEY LOC NAPTR NSEC PTR RP RRSIG SPF SSHFP)

  validates :type, :presence => true, :inclusion => { :in => ALLOWED_TYPES }
  
  belongs_to :domain
  
  after_initialize do 
    write_attribute :type, default_type
  end

  def default_type
    nil
  end
  
end

