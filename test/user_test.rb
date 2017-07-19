require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require 'pry'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")
    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")
    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")
    assert_equal "Ali", ali.name
  end

  def test_it_starts_with_no_jokes
    sal = User.new("Sal")
    assert_instance_of Array, sal.jokes
    assert_equal [], sal.jokes
  end

  def test_user_can_learn_jokes
  sal = User.new("Sal")
  assert_equal [], sal.jokes
  joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
  sal.learn(joke)
  assert_equal 1, sal.jokes.count
  assert_instance_of Joke, sal.jokes[0]
  end

  def test_user_can_tell_jokes
    sal = User.new("Sal")
    ali = User.new("Ali")
    assert_equal 0, ali.jokes.count
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.tell(ali,joke)
    assert_equal 1, ali.jokes.count
    assert_instance_of Joke, ali.jokes[0]
  end

  def test_user_can_learn_more_than_1_joke
    ilana = User.new("Ilana")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana.learn(joke_1)
    assert_equal 1, ilana.jokes.count
    ilana.learn(joke_2)
    assert_equal 2, ilana.jokes.count
  end

  def test_user_can_perform_routine_for_person
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.perform_routine_for(josh)
    assert_equal 2, josh.jokes.count
  end

  def test_user_can_learn_routines
    casey = User.new("Casey")
    assert_equal 0, casey.jokes.count
    casey.learn_routine('./jokes.csv')
    assert_equal 100, casey.jokes.count
    assert_instance_of Joke, casey.jokes[0]
  end

end
