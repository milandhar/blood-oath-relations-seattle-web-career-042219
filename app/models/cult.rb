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

  def average_age
    total_age = 0.0
    total_members = 0.0

    BloodOath.all.each do |oath|
      if oath.cult == self
        total_age += oath.follower.age.to_f
        total_members += 1.0
      end
    end

    total_age/total_members

  end

  def my_followers_mottos
    BloodOath.all.map do |oath|
      if oath.cult == self
        puts oath.follower.life_motto
      end
    end.compact
  end

  def self.least_popular

    Cult.all.sort_by do |cult|
      cult.cult_population
    end.first
  end

  def self.most_common_location

    Cult.all.each_with_object(Hash.new(0))

    end

  end
