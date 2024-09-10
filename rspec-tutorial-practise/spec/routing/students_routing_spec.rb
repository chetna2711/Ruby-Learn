require 'rails_helper'

RSpec.describe   StudentsController, type: :routing do

  describe 'route_to matcher' do
         #Passing route spec with shortcut syntax
  it "routes /students to the student controller" do
    expect(get("/main/students")).to route_to("students#index")
  end

  # Passing route spec with verbose syntax
  it "routes /students to the students controller" do
    expect(:get => "/main/students").
      to route_to(:controller => "students", :action => "index")
  end

  #Route spec for a route that doesn’t exist (fails)
  it "routes /students/foo to the /foo action" do
    expect(get("/students/foo")).to route_to("students#foo")
  end

  #Route spec for a namespaced route with shortcut specifier
  it "routes /main/students to the main/students controller" do
    expect(get("/main/students")).
      to route_to("students#index")
  end

  #Route spec for a namespaced route with verbose specifier
  it "routes /main/students to the students controller" do
    expect(get("/main/students")).
      to route_to(:controller => "students", :action => "index")
  end

  end

  describe 'be_routable matcher' do
    #Specify routeable route should not be routable (fails)
    it "does not route to stuents" do
      expect(:get => "/main/students").not_to be_routable
    end

    # Specify non-routeable route should not be routable (passes)
    it "does not route to main/students/foo/bar" do
      expect(:get => "/main/students/foo/bar").not_to be_routable
    end

    #Specify routeable route should be routable (passes)
    it "routes to /main/students" do
      expect(:get => "/main/students").to be_routable
    end

    #Specify non-routeable route should be routable (fails)
    it "routes to /main/students/foo/bar" do
      expect(:get => "/main/students/foo/bar").to be_routable
    end

    
  end

  describe 'Using named routes' do
    #Access named route
    it "routes a named route" do
      expect(:get => new_student_path).to route_to(:controller => "students", :action => "new")
    end
  end

  describe 'Using engine routes' do
      #This example show in engine_routes_spec.rb file
  end 

  describe 'More example of routing specs' do
    # Tests that GET /students routes to the index action
  it 'routes GET /main/students to students#index' do
  expect(get: '/main/students').to route_to(controller: 'students', action: 'index')
end

# Tests that GET /students/:id routes to the show action
it 'routes GET /main/students/:id to students#show' do
  expect(get: '/main/students/1').to route_to(controller: 'students', action: 'show', id: '1')
end

# Tests that POST /students routes to the create action
it 'routes POST /main/students to students#create' do
  expect(post: '/main/students').to route_to(controller: 'students', action: 'create')
end

# Tests that PUT /students/:id routes to the update action
it 'routes PUT /main/students/:id to students#update' do
  expect(put: '/main/students/1').to route_to(controller: 'students', action: 'update', id: '1')
end

# Tests that DELETE /students/:id routes to the destroy action
it 'routes DELETE /main/students/:id to students#destroy' do
  expect(delete: '/main/students/1').to route_to(controller: 'students', action: 'destroy', id: '1')
end

# Tests that GET /students/new routes to the new action
it 'routes GET /main/students/new to students#new' do
  expect(get: '/main/students/new').to route_to(controller: 'students', action: 'new')
end

# Tests that GET /main/students/:id/edit routes to the edit action
it 'routes GET /main/students/1/edit to students#edit' do
  expect(get: '/main/students/1/edit').to route_to(controller: 'students', action: 'edit', id: '1')
end

# Checks if a route is routable
  it 'should be routable for GET /main/students' do
    expect(get: '/main/students').to be_routable
  end

# Checks if a non-existent route is not routable
  it 'should not be routable for GET /students' do
    expect(get: '/students').not_to be_routable
  end

  # Tests the named route helper for the index action
  it 'routes students_path to students#index' do
    expect(get: students_path).to route_to('students#index')
  end

  # Tests the named route helper for the show action
  it 'routes student_path(:id) to students#show' do
    expect(get: student_path(1)).to route_to('students#show', id: '1')
  end
  end


 

end

