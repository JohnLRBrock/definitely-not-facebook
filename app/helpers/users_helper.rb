module UsersHelper
  def user_attribute(user, attribute)
    user_attribute = user.send(attribute)
    return '' if user_attribute.blank?
    # replace camel case with spaces
    attribute = attribute.to_s.gsub(/_/, ' ').capitalize
    "<p><strong>#{attribute}:</strong> #{user_attribute}</p>".html_safe
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
