# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/npis', type: :request do
  # Npi. As you add validations to Npi, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Npi.create! valid_attributes
      get npis_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      npi = Npi.create! valid_attributes
      get npi_url(npi)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_npi_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      npi = Npi.create! valid_attributes
      get edit_npi_url(npi)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Npi' do
        expect do
          post npis_url, params: { npi: valid_attributes }
        end.to change(Npi, :count).by(1)
      end

      it 'redirects to the created npi' do
        post npis_url, params: { npi: valid_attributes }
        expect(response).to redirect_to(npi_url(Npi.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Npi' do
        expect do
          post npis_url, params: { npi: invalid_attributes }
        end.to change(Npi, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post npis_url, params: { npi: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested npi' do
        npi = Npi.create! valid_attributes
        patch npi_url(npi), params: { npi: new_attributes }
        npi.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the npi' do
        npi = Npi.create! valid_attributes
        patch npi_url(npi), params: { npi: new_attributes }
        npi.reload
        expect(response).to redirect_to(npi_url(npi))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        npi = Npi.create! valid_attributes
        patch npi_url(npi), params: { npi: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested npi' do
      npi = Npi.create! valid_attributes
      expect do
        delete npi_url(npi)
      end.to change(Npi, :count).by(-1)
    end

    it 'redirects to the npis list' do
      npi = Npi.create! valid_attributes
      delete npi_url(npi)
      expect(response).to redirect_to(npis_url)
    end
  end
end
