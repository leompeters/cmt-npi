# frozen_string_literal: true

module NpisHelper
  def list_data(data, ul_class = nil)
    tag.ul(safe_join(data.map { |d| tag.li(d) }), class: ul_class)
  end

  def list_taxonomies(taxonomies)
    taxonomies.map do |taxonomy|
      code, desc, primary, state, license =
        taxonomy.values_at('code', 'desc', 'primary', 'state', 'license')
      lis = []
      span_primary = primary ? '<span class="badge rounded-pill bg-dark">primary</span>'.html_safe : ''
      span_code = build_span(code, 'code', 'top')
      lis.push build_li([span_primary, ' ', span_code])

      span_desc = build_span(desc, 'description', 'bottom')
      span_license = build_span(license, 'license', 'bottom')
      span_state = build_span(state, 'state', 'bottom')
      lis.push build_li([span_desc, ' (', span_license, ', ', span_state, ')'])

      tag.ul(safe_join(lis), class: 'list-unstyled')
    end
  end
end
