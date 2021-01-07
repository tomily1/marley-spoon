# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe do
  let(:recipe_object) { recipe }
  let(:mock_client) { double('marley_spoon') }
  let(:subject) { described_class.new(SecureRandom.uuid, recipe_object) }
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

  describe 'initialize' do
    it 'should create a recipe object' do
      expect(subject).to be_kind_of(Recipe)
    end

    it 'should have an id attribute' do
      expect(subject.id).to be_truthy
    end

    it 'should have a title attribute' do
      expect(subject.title).to be_truthy
    end

    it 'should have calories attribute' do
      expect(subject.calories).to be_truthy
    end

    it 'should have description attribute' do
      expect(subject.description).to be_truthy
    end
  end

  describe 'associations' do
    it 'can have a chef association' do
      expect(subject.chef.to_json).to eq(
        Chef.new(recipe_object[:chef]).to_json
      )
    end

    it 'can have a photo association' do
      expect(subject.photo.to_json).to eq(
        Photo.new(recipe_object[:photo]).to_json
      )
    end

    it 'can have a tag association' do
      expect(subject.tags.first).to be_kind_of(Tag)
    end

    it 'can have multiple tags association' do
      expect(subject.tags).to be_kind_of(Array)
    end
  end

  describe '#items' do
    let(:items) { Recipe.items('0') }

    it 'fetches all recipe items from contentful' do
      expect(items).to eq contentful_response.items
    end
  end

  describe '#all' do
    let(:recipe_items) { Recipe.all }

    it 'initializes all recipe items from contentful' do
      expect(recipe_items.count).to eq 2
      expect(recipe_items.first).to be_kind_of Recipe
    end

    it 'ensures all association is done' do
      recipe = recipe_items.first
      expect(recipe.chef).to be_kind_of Chef
      expect(recipe.photo).to be_kind_of Photo
      expect(recipe.tags.first).to be_kind_of Tag
    end
  end
end
