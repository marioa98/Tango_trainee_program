require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333 #Inserts and element into the array at last position
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20] #If the begin index exists and the stop index is out of range, just gonna access from beginnign to the last elemen
    assert_equal [], array[4,0]
    assert_equal [], array[4,100] # If the begin index doesn't exist, is an empty sub array
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class #n..m is a Range class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1,2,3,4,5], (1..5).to_a # to_a method converts element into an array. Double dot include the last number
    assert_equal [1,2,3,4], (1...5).to_a # Triple dots not includes the last number
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last) # At one element in the last position (push method)

    assert_equal [1,2,:last], array

    # popped_value stores the element popped in the array
    popped_value = array.pop # pop method drops the last element from array
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first) #unshift method adds a new element at the beggining of the array

    assert_equal [:first, 1, 2], array

    shifted_value = array.shift # shift method returns the first element of the array or nil if is empty
    assert_equal :first, shifted_value
    assert_equal [1,2], array
  end

end
