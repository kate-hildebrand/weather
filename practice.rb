# DON'T CHANGE THIS CODE
# ----------------------
require "net/http"
require "json"
url = "https://weatherdbi.herokuapp.com/data/weather/chicago"
uri = URI(url)
response = Net::HTTP.get(uri)
weather_data = JSON.parse(response)
# ----------------------

# EXERCISE
# Using the Ruby hash `weather_data` that includes weather forecast data for Chicago,
# write a weather summary out to the screen including the current conditions and upcoming forecast.
# Something like the output below.


# Sample output:
# In Chicago, IL it is currently 67 degrees and cloudy.
# The rest of today will be a high of 65 and scattered shows.
# The upcomming weather forecast is:
# Wednesday: a high of 65 and scattered showers.
# Thursday: a high of 67 and partly cloudy.
# Friday: a high of 59 and rain.
# Saturday: a high of 77 and cloudy.
# ...

# STEPS
# Look at the weather_data hash.
# Find the current data.
# Build a string with the text and dynamic data from the hash.
# "In #{...} it is currently #{...} degrees and #{...}"
# Find the array of forecast data.
# Read only the first element of that array to display the conditions for the rest of today.
# Use a loop to display the daily summary for the upcoming forecast.

# 1. inspect the weather_data hash
# puts weather_data

region = weather_data ["region"]
current_temp = weather_data ["currentConditions"]["temp"]["f"]
current_comment = weather_data ["currentConditions"]["comment"]

# pull day of week out of hash and put into an array to loop 
days = [weather_data ["next_days"][0]["day"],weather_data ["next_days"][1]["day"],weather_data ["next_days"][2]["day"],weather_data ["next_days"][3]["day"],weather_data ["next_days"][4]["day"],weather_data ["next_days"][5]["day"],weather_data ["next_days"][6]["day"]]
# for day in days
#         puts day
# end

# pull highs out of hash and put into an array to loop 
highs = [weather_data ["next_days"][0]["max_temp"]["f"],weather_data ["next_days"][1]["max_temp"]["f"],weather_data ["next_days"][2]["max_temp"]["f"],weather_data ["next_days"][3]["max_temp"]["f"],weather_data ["next_days"][4]["max_temp"]["f"],weather_data ["next_days"][5]["max_temp"]["f"],weather_data ["next_days"][6]["max_temp"]["f"]]
# loop the highs array
# for high in highs 
#     puts high
# end 

# pull comments out of hash and put into an array to loop 
comments = [weather_data ["next_days"][0]["comment"],weather_data ["next_days"][1]["comment"],weather_data ["next_days"][2]["comment"],weather_data ["next_days"][3]["comment"],weather_data ["next_days"][4]["comment"],weather_data ["next_days"][5]["comment"],weather_data ["next_days"][6]["comment"]]
#puts comments
# for comment in comments
#         puts comment
# end

# try to loop it together 
# for day in days 
#         for high in highs
#             for comment in comments
#             puts "#{day}: a high of #{high} and #{comment}"
#             end
#         end
#     end 
    
puts "In #{region}, it is currently #{current_temp} degrees and #{current_comment}(y)"
puts "The rest of #{days[0]} will be a high of #{highs[0]} and #{comments[0]}"
puts "#{days[1]}: high of #{highs[1]} and #{comments[1]}"
puts "#{days[2]}: high of #{highs[2]} and #{comments[2]}"
puts "#{days[3]}: high of #{highs[3]} and #{comments[3]}"
puts "#{days[4]}: high of #{highs[4]} and #{comments[4]}"
puts "#{days[5]}: high of #{highs[5]} and #{comments[5]}"
puts "#{days[6]}: high of #{highs[6]} and #{comments[6]}"

# CHALLENGE
# Can you display the weather forecast summary for a user-entered city?
# Use the following code at the very top of the file and then replace "chicago" in the api url with the user-entered city:
# puts "What city are you in?"
# city = gets.chomp
# puts city
# Note: what happens if the user-entered value is not a known city? You'll want to do some error handling.