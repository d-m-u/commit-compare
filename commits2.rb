require 'date'
require 'open-uri'
def commits

puts "Enter your github username: "
you = gets.chomp
#you = you.chomp
puts "Enter someone else's github username: "
them = gets.chomp

  file = open("https://github.com/" + you)
  yourContributions = (File.foreach(file).grep /contributions/).to_s.gsub(/[^0-9 ]/i, '').to_i
  file.close
  daysSinceYourStart = (Date.today - Date.new(2016,6,3)).to_i

  file2 = open("https://github.com/" + them)
  theirContributions = (File.foreach(file2).grep /contributions/).to_s.gsub(/[^0-9 ]/i, '').to_i
  file2.close
  daysSinceHisStart = (Date.today - Date.new(2008,3,8)).to_i

  goal = (theirContributions.to_f/365).ceil

  puts "user  	| active days 	| contributions | average "
  puts "--------------------------------------------------"
  puts "#{you}	| #{daysSinceYourStart} 		|#{yourContributions} 		|#{yourContributions.to_f/365}"
  puts "#{them}	| #{daysSinceHisStart} 		|#{theirContributions} 		|#{(theirContributions.to_f/365)}"

  puts ""
  puts "You need to be doing a total of #{goal} commits per day to stay even"
  if goal > (yourContributions/daysSinceYourStart)
    puts "oh no, you're down by #{(goal* daysSinceYourStart) - (yourContributions)}"
  else
    puts "and you're good"
  end
end