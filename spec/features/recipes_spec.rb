# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Recipe') do
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

  context 'recipes page' do
    before { visit recipes_path }
    it 'should display the 2 recipes available' do
      expect(find_all(:css, '.card').count).to eq 2
    end

    it 'should redirect to recipe path on click' do
      click_link(href: '/recipes/1234')
      expect(current_path).to eq(recipe_path('1234'))
    end
  end

  context 'recipe page' do
    before do
      visit recipe_path('1234')
    end

    it 'should display the title of recipe' do
      expect(page.body).to have_content 'foo bar'
    end

    it 'should display the chef for the recipe' do
      expect(page.body).to have_content 'Foo Chef'
    end
  end
end
