class Project

  attr_reader :id
  attr_accessor :title

  def initialize(params)
    @title = params.fetch(:title)
    @id = params.fetch(:id)
  end

  def self.all
      returned_projects = DB.exec("SELECT * FROM projects;")
      projects = []
      returned_projects.each() do |project|
        title = project.fetch("title")
        # volunteers = project.fetch("volunteers")
        id = project.fetch("id").to_i()
        projects.push(Project.new({:title => title, :id => id}))
      end
      projects
  end

  def self.find(id)
     found_project = nil
     Project.all().each() do |project|
       if project.id().==(id)
         found_project = project
       end
   end
 found_project
end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(project)
    self.title().==(project.title()).&(self.id().==(project.id()))
  end



end
