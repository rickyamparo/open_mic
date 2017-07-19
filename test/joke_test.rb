require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_joke_has_id
    j = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    assert_equal 1, j.id
  end

  def test_joke_has_question
    j = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    assert_equal "Why did the strawberry cross the road?", j.question
  end

  def test_joke_has_answer
    j = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    assert_equal "Because his mother was in a jam.", j.answer
  end

end
