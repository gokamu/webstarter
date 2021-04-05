class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != "www"
  end
  
  # def self.matching_school?(request) 
  #   School.where(:custom_domain => request.host).any?
  # end
end

class Domain
  def self.matches?(request)
    request.domain.present? && request.domain != "hekani.org.zw"
  end

  # def self.matching_school?(request) 
  #   School.where(:custom_domain => request.host).any?
  # end
end