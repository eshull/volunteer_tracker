class Volunteer

  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(params)
    params = default.merge(params)
    @name = params.fetch(:name)
    @project_id = params.fetch(:project_id)
    @id = params.fetch(:id)
  end

  def default
    {:id=>0,:name => "none", :title => "none", :project_id => 0}
  end
  def self.all
      returned_volunteers = DB.exec("SELECT * FROM volunteers;")
      volunteers = []
      returned_volunteers.each() do |volunteer|
        name = volunteer.fetch("name")
        # volunteers = volunteer.fetch("volunteers")
        id = volunteer.fetch("id").to_i()
        volunteers.push(Volunteer.new({:name => name, :id => id}))
      end
      volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(volunteer)
    self.name().==(volunteer.name()).&(self.id().==(volunteer.id()))
  end
end
