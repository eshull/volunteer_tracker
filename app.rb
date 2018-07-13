require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')



get ('/') do

  erb(:index)
end

post ('/') do
  user_input = params.fetch("new_project")
  new_project = Project.new(user_input)
  new_project.save
  @projects = Projects.all
  erb(:index)
end
