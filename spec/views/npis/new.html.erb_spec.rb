# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'npis/new', type: :view do
  before(:each) do
    assign(:npi, Npi.new(number: '', data: ''))
  end

  it 'renders new npi form' do
    render

    assert_select 'form[action=?][method=?]', npis_path, 'post' do
      assert_select 'input[name=?]', 'npi[number]'

      assert_select 'input[name=?]', 'npi[data]'
    end
  end
end
