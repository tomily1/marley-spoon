# frozen_string_literal: true

class Entry
  def entries(content_type:)
    MarleySpoonApi.client.entries(content_type: content_type)
  end
end
