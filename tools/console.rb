require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console



  p_u = Cult.new("Bun Pee Ew", "Seattle", "2019", "What's that smell?")

  kom_cult = Cult.new("Kombucha", "Seattle", "2019", "This tastes weird")

  soccer = Cult.new("Soccer Goalz", "Italy", "2015", "GOALLL")

  dang = Follower.new("Dang", "25", "Do Not Disturb")

  danny = Follower.new("Danny", "27", "I love soccer")

  milan = Follower.new("Milan", "25", "I'm Hungry")

  BloodOath.new("2019-04-28", p_u, dang)

  BloodOath.new("2018-05-05", soccer, danny)

  BloodOath.new("2018-01-05", soccer, milan)

  BloodOath.new("2018-01-05", soccer, dang)

  binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
