class Joke

attr_reader :joke_hash, :id, :question, :answer

  def initialize(hash)
    @joke_hash = hash
  end

  def id
    @joke_hash[:id]
  end

  def question
    @joke_hash[:question]
  end

  def answer
    @joke_hash[:answer]
  end

end
