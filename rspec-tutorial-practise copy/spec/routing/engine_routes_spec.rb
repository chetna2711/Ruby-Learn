require "rails_helper"

# A very simple Rails engine
module MyEngine
  class Engine < ::Rails::Engine
    isolate_namespace MyEngine
  end

  Engine.routes.draw do
    resources :students, :only => [:index]
  end

  class StudentsController < ::ActionController::Base
    def index
    end
  end
end

RSpec.describe MyEngine::StudentsController, type: :routing do
  routes { MyEngine::Engine.routes }

  it "routes to the list of all widgets" do
    expect(:get => students_path).
      to route_to(:controller => "my_engine/students", :action => "index")
  end
end