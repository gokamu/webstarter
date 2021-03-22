class Domain
  def self.matches?(request)
    request.domain.present? && request.domain != "hekanidomain.co.zw"
  end
end