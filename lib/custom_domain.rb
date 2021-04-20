class CustomDomain 
  def self.matches? request
    matching_site?(request)
  end

  def self.matching_site? request
    # handle the case of the user's domain being either www. or a root domain with one query
    if request.subdomain == 'www'
      req = request.host[4..-1]
    else
      req = request.host
    end

    # first test if there exists a Site with a domain which matches the request,
    # if not, check the subdomain. If none are found, the the 'match' will not match anything
    School.where(:domain => req).any? || School.where(:slug => request.subdomain).any?
  end
end