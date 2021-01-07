# frozen_string_literal: true

class Tag
  attr_reader :id, :name, :raw

  def initialize(raw)
    @id = raw.id
    @name = raw.fields[:name]
    @raw = raw
  end
end
