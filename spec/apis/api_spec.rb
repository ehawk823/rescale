require 'rails_helper'


require 'pry'
describe "TasksController" , :type => :api do
  describe 'GET on /' do
    it 'should return the expected json' do
      # binding.pry
      get '/', {"image_dimensions" => [400,200],"bounding_box" => [200,200]}
      # visit '/', {"image_dimensions" => [400,200],"bounding_box" => [200,200]}
      expect(JSON.parse(last_response.body)).to eq({"image_dimensions" => [200,100],"bounding_box" => [200,200]})
    end

    it 'should return the expected json' do
      # binding.pry
      get '/', {"image_dimensions" => [1256,1200, 600, 800, 200, 200, 400, 200, 800,1256],"bounding_box" => [200,200]}
      # visit '/', {"image_dimensions" => [400,200],"bounding_box" => [200,200]}
      expect(JSON.parse(last_response.body)).to eq({"image_dimensions" => [200, 191, 150, 200, 200, 200, 200, 100, 127, 200],"bounding_box" => [200,200]})
    end

    it 'should return the expected json' do
      # binding.pry
      get '/', {"image_dimensions" => [400,200],"bounding_box" => [150,150]}
      # visit '/', {"image_dimensions" => [400,200],"bounding_box" => [200,200]}
      expect(JSON.parse(last_response.body)).to eq({"image_dimensions" => [150,75],"bounding_box" => [150,150]})
    end

    it 'should return the expected json' do
      # binding.pry
      get '/', {"image_dimensions" => [300, 150],"bounding_box" => [600,600]}
      # visit '/', {"image_dimensions" => [400,200],"bounding_box" => [200,200]}
      expect(JSON.parse(last_response.body)).to eq({"image_dimensions" => [600,300],"bounding_box" => [600,600]})
    end
  end
end
