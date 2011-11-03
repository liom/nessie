class Record < ActiveRecord::Base
  set_inheritance_column "sti_type"
  
  ALLOWED_TYPES = %w(SOA A AAAA NS CNAME MX SRV TXT AFSDB CERT DNSKEY DS HINFO KEY LOC NAPTR NSEC PTR RP RRSIG SPF SSHFP)

  validates :type, :presence => true, :inclusion => { :in => ALLOWED_TYPES }
  validates :domain_id, :presence => true
  
  belongs_to :domain
  

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
  
  
end

