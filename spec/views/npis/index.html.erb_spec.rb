# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'npis/index', type: :view do
  before(:each) do
    assign(:npis, create_list(:npi, 2))
  end

  it 'renders a list of npis' do
    render
    assert_select 'tr>td', text: ''.to_s, count: 0
    assert_select 'tr>td', text: ''.to_s, count: 0
  end
end
