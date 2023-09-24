# frozen_string_literal: true
class ArrayCollectionIterator
  def initialize(array)
    @array = array
    @counter = 0
  end

  def has_next
    @counter < @array.length
  end

  def get_next
    if has_next
      element = @array[@counter]
      @counter += 1
      return element
    end
    "Array does not have any more elements"
  end
end
