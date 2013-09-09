module UnsafeMarkdownPresenter
  extend self

  def to_html(markdown)
    Kramdown::Document.new(markdown, markdown_options).to_html
  end

protected
  def markdown_options
    { auto_ids: true, auto_id_prefix: "idea-", enable_coderay: true,
      header_offset: 1 }
  end
end