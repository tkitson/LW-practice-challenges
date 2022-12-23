require 'json'

input_file = File.read('data/input.json')

# Parse the input JSON file into a Ruby object
input_json = JSON.parse(input_file)

# Write the input Ruby object to an output JSON file
# File.write('output.json', JSON.pretty_generate(input_json))


# p input_json["reservations"][0]["tee_time_id"]
reservation_prices = []

input_json["reservations"].each do |reservation|
  tee_time = reservation["tee_time_id"]
    single_price = input_json["tee_times"][tee_time - 1]["price_per_golfer"]
    total = (single_price * reservation["number_of_golfers"])
      reservation_prices << { "id": reservation["id"], "price": total }
    end

File.write('output.json', JSON.pretty_generate(reservation_prices))
