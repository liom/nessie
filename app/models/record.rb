class Record < ActiveRecord::Base
  set_inheritance_column "sti_type"
  
  ALLOWED_TYPES = %w(SOA A AAAA NS CNAME MX SRV TXT AFSDB CERT DNSKEY DS HINFO KEY LOC NAPTR NSEC PTR RP RRSIG SPF SSHFP)

  validates :type, :presence => true, :inclusion => { :in => ALLOWED_TYPES }
  validates :domain_id, :presence => true
  validates :name, :presence => true
  validates :ttl, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  
  belongs_to :domain, :touch => true
  before_validation :set_fqdn, :set_ttl
  

  @type = nil
  # This mess prevents any modifications of field `type` in any ancestor.
  def self.inherited(chld)
    chld.class_eval do
      attr_readonly :type
    
      after_initialize do 
        write_attribute :type, self.class.type
      end

      def type
        self.class.type
      end
      
      def self.type
        @type
      end
    end 
  end  
  
  
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

