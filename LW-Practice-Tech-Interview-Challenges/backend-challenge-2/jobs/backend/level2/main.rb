require 'json'
require 'date'

input_file = File.read('data/input.json')

input_json = JSON.parse(input_file)

# reservation_prices = []

input_json["reservations"].each do |reservation|
  reservation_date = DateTime.parse(reservation["reserved_at"])
  teetime_date = DateTime.parse(input_json["tee_times"][0]["starts_at"])
  if (teetime_date - reservation_date).to_i >= 7
    total = ((input_json["tee_times"][0]["price_per_golfer"] * reservation["number_of_golfers"]) * 0.8)
  elsif (teetime_date - reservation_date).to_i >= 2
    total = ((input_json["tee_times"][0]["price_per_golfer"] * reservation["number_of_golfers"]) * 0.9)
  elsif (teetime_date - reservation_date).to_i <= 0
    total = ((input_json["tee_times"][0]["price_per_golfer"] * reservation["number_of_golfers"]) * 1.05)
  end
p total
end



# File.write('output.json', JSON.pretty_generate(reservation_prices))

# -------

# # Level 2

# # To maximize its occupancy and revenue, the club can choose to decrease or increase the price of a tee-time when golfers book well in advance or at the last minute.

# # Thanks to the dynamic pricing engine, the club decides to create the following rules:

# # - Price per golfer decreases by **20%** when booking **7 days** before the tee-time
# # - Price per golfer decreases by **10%** when booking **2 days** before the tee-time
# # - Price per golfer increases by **5%** when booking the **same day** as the tee-time

# # Again, calculate the price of each reservation by taking into account those rules.

# # {
# #   "tee_times": [
# #     {
# #       "id": 1,
# #       "starts_at": "2019-07-16 06:00:00 -0500",
# #       "price_per_golfer": 20
# #     }
# #   ],
# #   "reservations": [
# #     {
# #       "id": 1,
# #       "tee_time_id": 1,
# #       "number_of_golfers": 2,
# #       "reserved_at": "2019-07-09 10:45:14 +0100"
# #     },
# #     {
# #       "id": 2,
# #       "tee_time_id": 1,
# #       "number_of_golfers": 2,
# #       "reserved_at": "2019-07-15 22:04:01 -0800"
# #     }
# #   ]
# # }
