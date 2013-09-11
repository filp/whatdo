module ApplicationHelper
  include UsersHelper

  # Wrapper around gravatar_image_tag with some more
  # sensible defaults for the application:
  def gravatar_for(user, options={})
    gravatar_image_tag(
      user.email, alt: user.name, class: "gravatar",
      gravatar: { size: options[:size] || 32, default: :identicon }
    )
  end
end
