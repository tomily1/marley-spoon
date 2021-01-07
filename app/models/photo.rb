# frozen_string_literal: true

class Photo
  attr_reader :id, :url, :raw

  def initialize(raw)
    @id = raw.id
    @raw = raw
    @url = raw.url
  end
end
