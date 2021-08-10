# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'npis/edit', type: :view do
  before(:each) do
    @npi = assign(:npi, create(:npi))
  end

  it 'renders the edit npi form' do
    render

    assert_select 'form[action=?][method=?]', npi_path(@npi), 'post' do
      assert_select 'input[name=?]', 'npi[number]'

      assert_select 'input[name=?]', 'npi[data]'
    end
  end
end
