# frozen_string_literal: true

module ApplicationHelper
  # Render JavaScripts assets.
  def content_for_scripts(asset, options = { 'data-turbolinks-track': 'reload' })
    content_for(:scripts) { javascript_include_tag asset, options }
  end

  def build_span(value, title, placement)
    tag.span value, title: title, data: { bs_toggle: 'tooltip', bs_placement: placement }
  end

  def build_li(*li_values)
    tag.li safe_join(li_values)
  end
end
