class Project

  attr_reader :id
  attr_accessor :title

  def initialize(params)
    @title = params.fetch(:title)
    @id = params.fetch(:id)
  end

  def self.all
    projects = []
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(project)
    self.title().==(project.title()).&(self.id().==(project.id()))
  end



end
