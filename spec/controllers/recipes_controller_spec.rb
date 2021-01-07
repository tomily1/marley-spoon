# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:recipe_object) { recipe }
  let(:mock_client) { double('marley_spoon') }
  let(:contentful_response) do
    OpenStruct.new(
      items: [
        OpenStruct.new(
          id: '1234',
          fields: recipe_object
        ),
        OpenStruct.new(
          id: '5678',
          fields: recipe_object
        )
      ]
    )
  end

  before do
    allow(MarleySpoonApi).to receive(:client).and_return(mock_client)
    allow(mock_client).to receive(:entries).and_return(contentful_response)
  end

  describe '#index' do
    it 'responds with 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#show' do
    it 'responds with 200 when recipe is found' do
      get :show, params: { id: '1234' }
      expect(response.status).to eq(200)
    end

    it 'responds with 200 when recipe is not found' do
      get :show, params: { id: '1234a' }
      expect(response.status).to eq(404)
    end
  end
end
