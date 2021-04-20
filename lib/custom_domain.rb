class CustomDomain 
  def self.matches?(request) 
    request.subdomain.present? && matching_school?(request) 
  end 
  
  def self.matching_school?(request) 
    School.where(:custom_domain => request.host).any? 
  end
end