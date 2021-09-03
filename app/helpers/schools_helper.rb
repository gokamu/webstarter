module SchoolsHelper
  def replace_url(school)
    if school.domain.present?
      school = SecureRandom.hex(3)
    else
      school = school
    end
    return school
  end
end
