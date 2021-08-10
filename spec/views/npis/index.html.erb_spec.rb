# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'npis/index', type: :view do
  before(:each) do
    assign(:npis, [Npi.create!(number: '', data: ''), Npi.create!(number: '', data: '')])
  end

  it 'renders a list of npis' do
    render
    assert_select 'tr>td', text: ''.to_s, count: 2
    assert_select 'tr>td', text: ''.to_s, count: 2
  end
end
