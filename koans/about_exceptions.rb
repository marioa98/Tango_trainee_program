require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutExceptions < Neo::Koan

  class MySpecialError < RuntimeError
  end

  # Exception in Ruby not only catch the specific error defined, but also any exception
  # below it. It's a hierarchical tree wich store the level of the Exception class.
  # For more information: https://www.honeybadger.io/blog/understanding-the-ruby-exception-hierarchy/
  def test_exceptions_inherit_from_Exception
    assert_equal RuntimeError, MySpecialError.ancestors[1] # First level Exception (Specific One)
    assert_equal StandardError, MySpecialError.ancestors[2] # Secon level Exception (Catch any Exception type in the RunTimeError level)
    assert_equal Exception, MySpecialError.ancestors[3] # Third level Exception. (Catch everything, is the top)
    assert_equal Object, MySpecialError.ancestors[4] # Because is beyond the position, is just an Object, Exception Object
  end

  # More information about handling errors: http://rubylearning.com/satishtalim/ruby_exceptions.html

  # The rescue clause is a clause which executes some code if the process fail or get a bug.
  def test_rescue_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = :exception_handled
    end

    assert_equal :exception_handled, result

    assert_equal true, ex.is_a?(StandardError), "Should be a Standard Error"
    assert_equal true, ex.is_a?(RuntimeError),  "Should be a Runtime Error"

    assert RuntimeError.ancestors.include?(StandardError),
      "RuntimeError is a subclass of StandardError"

    assert_equal "Oops", ex.message # Is the message executed in fail clause
  end

  def test_raising_a_particular_error
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = :exception_handled
    end

    assert_equal :exception_handled, result
    assert_equal "My Message", ex.message
  end

  def test_ensure_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    assert_equal :always_run, result
  end

  # Sometimes, we must know about the unknown
  def test_asserting_an_error_is_raised
    # A do-end is a block, a topic to explore more later
    assert_raise(Exception) do
      raise MySpecialError.new("New instances can be raised directly.")
    end
  end

end
