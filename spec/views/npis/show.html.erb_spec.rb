# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'npis/show', type: :view do
  before(:each) do
    @npi = assign(:npi, create(:npi, data: ''))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(@npi.number.to_s)
    expect(rendered).to match(//)
  end
end
