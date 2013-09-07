module ApplicationHelper
  def gravatar_for(email, options={})
    email_hash = Digest::MD5.hexdigest(email)
    image_url  = "http://www.gravatar.com/avatar/#{email_hash}"

    if options[:size]
      image_url << "?s=#{options[:size]}"
    end

    render partial: "shared/gravatar", locals: {
      additional_classes: options[:class],
      image_url: image_url
    }
  end
end
