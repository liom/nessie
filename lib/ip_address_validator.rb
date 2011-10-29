class IpAddressValidator < ActiveModel::EachValidator

  CHECKS = [:v4, :v6]
  
  def check_validity!
    keys = options.keys & CHECKS
    if keys.length == 2
      raise ArgumentError, "Either :v4 or :v6 must be supplied (but not both)"
    end
    
    if keys.empty?
      raise ArgumentError, 'Class unspecified. Specify the :v4 or :v6.'
    end
  end
  
  def validate_each(record, attribute, value)
    return if value.nil?
    
    addr = IPAddress(value) rescue nil
    record_error(record, attribute) and return if addr.blank?
    
    if options[:v4]
      record_error(record, attribute) and return unless addr.ipv4?
    end
      
    if options[:v6]
      record_error(record, attribute) and return unless addr.ipv6?
    end
  end
  
  protected
  
  def record_error(record, attribute)
    record.errors.add attribute, :invalid
  end
end