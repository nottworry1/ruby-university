# frozen_string_literal: true
require './array_collection_iterator'
class ArrayCollection
  def initialize
    @array = []
  end

  def add_element(element)
    @array.push element
  end

  def get_iterator
    ArrayCollectionIterator.new(@array)
  end
end
