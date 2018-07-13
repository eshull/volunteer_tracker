class Project

  attr_accessor :title

  def initialize(params)
    @title = params.fetch(:title)
  end

end
