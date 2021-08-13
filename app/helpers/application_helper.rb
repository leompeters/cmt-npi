# frozen_string_literal: true

module ApplicationHelper
  # Render JavaScripts assets.
  def content_for_scripts(asset, options = { 'data-turbolinks-track': 'reload' })
    content_for(:scripts) { javascript_include_tag asset, options }
  end
end
