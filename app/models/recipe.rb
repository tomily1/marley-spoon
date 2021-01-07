class Recipe
  attr_reader :id, :title, :calories, :description, :chef, :photo, :tags

  @@cache ||= {}

  def initialize(id, fields)
    create(id, fields)
  end

  def self.all(page: '0')
    items(page).map { |item| new(item.id, item.fields) }
  end

  def self.items(page)
    @@cache[page] ||= entries(content_type: 'recipe').items
  end

  def self.entries(content_type:)
    MarleySpoonApi.client.entries(content_type: content_type)
  end

  def self.find_by_id(id)
    all if @@cache.empty?
    @@cache[id]
  end

  private

  def create(id, fields)
    @id = id
    @title =  fields[:title]
    @calories = fields[:calories]
    @description = fields[:description]

    associate_records_for(fields)
    
    @@cache[id] = self

    self
  end

  def associate_records_for(fields)
    @chef = Chef.new(fields[:chef]) if fields[:chef]
    @photo = Photo.new(fields[:photo]) if fields[:photo]

    @tags = if fields[:tags].present?
              fields[:tags].map{ |tag| Tag.new(tag) } 
            else
              []
            end
  end
end
