class Volunteer

  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(params)
    @name = params.fetch(:name)
    @project_id = params.fetch(:project_id)
    @id = params.fetch(:id)
  end

  def ==(volunteer)
    self.name().==(volunteer.name()).&(self.id().==(volunteer.id()))
  end
end
