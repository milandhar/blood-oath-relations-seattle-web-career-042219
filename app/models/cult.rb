require 'date'
require 'pry'

class Cult
  attr_accessor :name, :location, :founding_year, :slogan

  @@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(name)
    BloodOath.new(Date.today.to_s, self, name)
  end

  def cult_population
    BloodOath.all.select do |oath|
      oath.cult == self
    end.count
  end

  def self.find_by_name(name)
    BloodOath.all.find do |oath|
      oath.follower.name == name
      #binding.pry
    end.cult
  end

  def self.find_by_location(location)
    Cult.all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year(year)
    Cult.all.select do |cult|
      cult.founding_year == year
    end
  end

end
