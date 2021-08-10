# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'npis/show', type: :view do
  before(:each) do
    @npi = assign(:npi, Npi.create!(number: '', data: ''))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
