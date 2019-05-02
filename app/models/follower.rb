require 'date'

class Follower
  attr_accessor :name, :age, :life_motto

  @@all = []

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all

  end

  def cults
    BloodOath.all.map do |oath|
      if oath.follower == self
        oath.cult
      end
    end.compact
  end

  def join_cult(cult)
    BloodOath.new(Date.today.to_s, cult, self)
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age.to_i >= age.to_i

    end

  end
end
