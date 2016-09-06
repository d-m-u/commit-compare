require 'date'
require 'open-uri'

def commits

  yourStartDate = Date.new(2016,6,3)
  hisStartDate = Date.new(2008,3,8)

# try file open
  file = try.open("https://github.com/d-m-u")
  yourContributions = (File.foreach(file).grep /contributions/).to_s.gsub(/[^0-9 ]/i, '').to_i
  file.close
  daysSinceYourStart = (Date.today - yourStartDate).to_i

  file2 = open("https://github.com/kbrock")
  hisContributions = (File.foreach(file2).grep /contributions/).to_s.gsub(/[^0-9 ]/i, '').to_i
  file2.close
  daysSinceHisStart = (Date.today - hisStartDate).to_i

  goalPerDay = (hisContributions.to_f/365).ceil
  yearlyContributionsNeeded = hisContributions - yourContributions
  totalPerDay = yearlyContributionsNeeded/(365-(daysSinceYourStart))

  #if behind
  red = (goalPerDay* daysSinceYourStart) - (yourContributions)
  daysLeftInYear = Date.new(2016,12,31) - Date.today
  contribsLeft = (goalPerDay* daysSinceYourStart) - (yourContributions)
  howManyEachDay = (contribsLeft/daysLeftInYear).to_f.ceil

  puts "user    | active days   | contributions | average "
  puts "--------------------------------------------------"
  puts "d-m-u   | #{daysSinceYourStart}            | #{yourContributions}           | #{yourContributions.to_f/365}"
  puts "        | #{daysSinceHisStart}          | #{hisContributions}          | #{(hisContributions.to_f/365)}"
  puts "--------------------------------------------------"
  puts "        | #{daysSinceHisStart/daysSinceYourStart}            | #{(hisContributions) / (yourContributions)}            | #{(hisContributions.to_f/365)/(yourContributions.to_f/365)}"

  puts ""
  puts "#{goalPerDay} commits per day needed (sans current contribs, avec: #{totalPerDay.to_f.ceil})."
  puts ""
  puts "#{(Date.today - Date.new(2016,5,25)).to_i } days have passed since date of hire."
  puts ""
  if (goalPerDay > yourContributions/daysSinceYourStart)
    puts "ATTENTION: currently down by #{red} contributions (#{howManyEachDay} per day.)"
  else
    puts "congrats! you've an extra #{(yourContributions/daysSinceYourStart) - goalPerDay} commits"
  end

    rescue
end


commits
