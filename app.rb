require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require "pg"

DB = PG.connect({:dbname => 'volunteer_tracker'})


get ('/') do
  @projects = Project.all
  erb(:index)
end

post ('/') do
  project_name = params.fetch("new_project")
  new_project = Project.new({:title => project_name, :id => nil})
  new_project.save
  @projects = Project.all
  erb(:index)
end

get ('/project/:id') do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

post ('/project/:id') do
  @project = Project.find(params.fetch("id").to_i)
  # @project = Project.find(params.fetch("id").to_i())
  project_id = params.fetch("id").to_i
  volunteer_name = params.fetch("new_volunteer")
  new_volunteer = Volunteer.new({:name => volunteer_name, :project_id => project_id})
  new_volunteer.save
  @volunteers = Volunteer.all
  erb(:project)
end

patch ('/project/:id/edit') do
  new_title = params.fetch("edit_project")
  new_project = Project.new({:title => new_title, :id => @project})
  new_project.save
  @project = new_project
  erb(:project_edit)
end

get ("/project/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

delete ("/project/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end

get ("/volunteer/:id") do
    @volunteer = Volunteer.find(params.fetch("id").to_i())
  erb(:volunteer)
end

patch ('/volunteer/:id') do
  volunteer_id = Volunteer.find(params.fetch("id").to_i())
  new_name = params.fetch("edit_volunteer")
  binding.pry
  new_volunteer = Volunteer.new({:name => new_name, :id => volunteer_id})
  new_volunteer.save
  @volunteer = new_volunteer
  erb(:volunteer)
end
