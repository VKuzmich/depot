# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:valid_product) {
    { title: 'phoneseev',
      description: 'very good one',
      image_url: '3f.jpg',
      price: 24
    }}

  let(:not_valid_product) {
    { title: 'fist',
      description: '',
      image_url: '3f.jpeg',
      price: 24
    }}

  describe 'POST create ' do
    context 'with valid data' do
      before do
        post :create, params: { product: valid_product }
      end
      it 'creates product' do
        expect(Product.count).to eq(1)
      end
      it 'redirects to the created product' do
        expect(response).to redirect_to(Product.last)
      end
    end
  end 
  #
  context 'with no valid data' do
    before do
      post :create, params: { product: not_valid_product }
    end
    it 'does not save the new product' do
      expect{
        post :create, params: { product: not_valid_product }
      }.to_not change(Product, :count)
    end

    it 're-renders the new method' do
      post :create, params: { product: not_valid_product }
      response.should render_template :new
    end
  end
end
