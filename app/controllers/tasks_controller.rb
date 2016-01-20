require 'pry'
class TasksController < ApplicationController

# Parses the json and creates a new Task, calling the resize function and rendering the output as json

  def create
    @image_dimensions = params[:image_dimensions]
    @bounding_box = params[:bounding_box]
    task = Task.new(@image_dimensions, @bounding_box)
    final_array = task.resize
    result = {image_dimensions: final_array,bounding_box: @bounding_box.map(&:to_i)}
    render json: result
  end


end
