class Project

  attr_reader :id
  attr_accessor :title

  def initialize(params)
    @title = params.fetch(:title)
    @id = params.fetch(:id)
  end

end
