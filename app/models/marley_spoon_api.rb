class MarleySpoonApi
  def self.client
    @client
  end

  def self.configure(&block)
    @client ||= yield
  end
end
