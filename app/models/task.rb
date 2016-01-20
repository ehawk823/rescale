class Task < ActiveRecord::Base

  def initialize(image_dimensions, bounding_box)
    @image_dimensions = image_dimensions
    @bounding_box = bounding_box.map(&:to_i)
  end

  # Divides the initial array into pairs, calls the pairs_resize function
  # and then returns the completed array

  def resize
    pairs = @image_dimensions.each_slice(2).to_a
    new_array = pairs_resize(pairs)
    final_array = new_array.flatten
  end

  # Calls pair_resize on each pair within the initial array
  # feeding the pairs into a completed array once they have been resized

  def pairs_resize(pairs)
    new_array = []
    pairs.each do |pair|
      new_pair = pair_resize(pair)
      new_array << new_pair
    end
    new_array
  end

  # Resizes each pair according to the bounding_box dimensions
  # and returns the updated pair

  def pair_resize(pair)
    pair = pair.map(&:to_i)
    new_pair = []
    if pair[0] > pair[1]
      reference = pair[0]
      first = true
      ratio = @bounding_box[0]/reference.to_f
    else
      reference = pair[1]
      first = false
      ratio = @bounding_box[1]/reference.to_f
    end
    if first
      element = [(pair[1]*ratio).to_i, @bounding_box[1]].min
      new_pair << @bounding_box[0]
      new_pair << element
    else
      element = [(pair[0]*ratio).to_i, @bounding_box[0]].min
      new_pair << element
      new_pair << @bounding_box[1]
    end
    new_pair
  end

end
