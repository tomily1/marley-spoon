# frozen_string_literal: true

module RecipeHelper
  def recipe
    {
      title: 'foo bar',
      calories: '23',
      description: 'foo bar',
      chef: chef,
      photo: photo,
      tags: [
        tag
      ]
    }
  end

  def chef
    OpenStruct.new(
      id: SecureRandom.uuid,
      fields: { name: 'Foo Chef' }
    )
  end

  def photo
    OpenStruct.new(
      id: SecureRandom.uuid,
      url: 'http://foo.bar'
    )
  end

  def tag
    OpenStruct.new(
      id: SecureRandom.uuid,
      fields: { name: "Foo Tag #{rand(100)}" }
    )
  end

  def contentful_response
    OpenStruct.new(
      id: SecureRandom.uuid,
      fields: recipe
    )
  end
end
