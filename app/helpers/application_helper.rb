module ApplicationHelper
  include UsersHelper

  # Wrapper around gravatar_image_tag with some more
  # sensible defaults for the application:
  def gravatar_for(user, options={})
    default_class = "gravatar"

    unless options[:class].nil?
      default_class << " #{options[:class]}"
    end

    gravatar_image_tag(
      user.email, alt: user.name, class: default_class,
      gravatar: { size: options[:size] || 32, default: :identicon }
    )
  end
end
