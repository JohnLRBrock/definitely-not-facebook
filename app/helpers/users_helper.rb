module UsersHelper
  def user_attribute(user, attribute)
    user_attribute = user.send(attribute)
    return '' if user_attribute.blank?
    # replace camel case with spaces
    attribute = attribute.to_s.gsub(/_/, ' ').capitalize
    "<p><strong>#{attribute}:</strong> #{user_attribute}</p>".html_safe
  end
end
