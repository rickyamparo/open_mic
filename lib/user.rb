require './lib/joke'
require 'csv'

class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(person, joke)
    person.learn(joke)
  end

  def perform_routine_for(person)
    jokes.each do |joke|
      tell(person,joke)
    end
  end

  def learn_routine(joke_table)
    # joke_library = CSV.read './jokes.csv'
    CSV.foreach(joke_table) do |row|
      @jokes << Joke.new(row)
    end
  end

end
