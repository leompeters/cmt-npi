# frozen_string_literal: true

module NpisHelper
  def list_data(data = [])
    tag.ul raw(data.map { |d| tag.li(d) }.join)
  end
end
