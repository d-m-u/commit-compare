require 'date'
require 'open-uri'
def commits

puts "Enter your github username: "
you = gets.chomp
puts "Enter someone else's github username: "
them = gets.chomp

  file = open("https://github.com/" + you)
  yourContributions = (File.foreach(file).grep /contributions/).to_s.gsub(/[^0-9 ]/i, '').to_i
  file.close
  
  #CHANGEME: your start date here
  # your start
  daysSinceYourStart = (Date.today - Date.new(2016,6,3)).to_i
  # Date.new(2016,6,3)).to_i

  file2 = open("https://github.com/" + them)
  theirContributions = (File.foreach(file2).grep /contributions/).to_s.gsub(/[^0-9 ]/i, '').to_i
  file2.close

  goal = (theirContributions.to_f/365).ceil

  puts "user  	| active days 	| contributions | average | average by workdays "
  puts "------------------------------------------------------------------------"
  puts "#{you}	|#{yourContributions} 		|#{yourContributions.to_f/365} 		|#{yourContributions.to_f/241}"
  puts "#{them}	|#{theirContributions} 		 |#{(theirContributions.to_f/365)} 	  |#{(theirContributions.to_f/241)}"

  puts ""
  puts "You need to be doing a total of #{goal} commits per day to stay even"
  if theirContributions > (yourContributions.to_f/365).ceil
    puts "oh no, you're down by #{theirContributions - yourContributions}"
  else
    puts "and you're good by  #{theirContributions - yourContributions}"
  end
end

commits
