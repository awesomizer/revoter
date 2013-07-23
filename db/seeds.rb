# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

puts 'STATE INFO'  # July, 1 2012 estimates from Census used in calculation.  Percent population out of population of 50 states, not including DC or US Territories.
state_stats = [
  ["AK", "Alaska", 731449, 0.23, 1.00],
  ["AL", "Alabama", 4822023, 1.54, 2.00],
  ["AR", "Arkasas", 2949131, 0.94, 1.00],
  ["AZ", "Arizona", 6553255, 2.09, 2.00],
  ["CA", "California", 38041430, 12.14, 9.00],
  ["CO", "Colorodo", 5187582, 1.66, 2.00],
  ["CT", "Connecticut", 3590347, 1.15, 1.00],
  ["DE", "Deleware", 917092, 0.29, 1.00],
  ["FL", "Florida", 19317568, 6.17, 5.00],
  ["GA", "Georgia", 9919945, 3.17, 3.00],
  ["HI", "Hawaii", 1392313, 0.44, 1.00],
  ["IA", "Iowa", 3074186, 1.00, 1.00],
  ["ID", "Idaho", 1595728, 0.51, 1.00],
  ["IL", "Illinois", 12875255, 4.11, 3.00],
  ["IN", "Indiana", 6537334, 2.09, 2.00],
  ["KS", "Kansas", 2885905, 0.92, 1.00],
  ["KY", "Kentucky", 4380415, 1.40, 1.00],
  ["LA", "Louisiana", 4601893, 1.47, 1.00],
  ["MA", "Massachusetts", 6646144, 2.12, 2.00],
  ["MD", "Maryland", 5884563, 1.88, 2.00],
  ["ME", "Maine", 1329192, 0.42, 1.00],
  ["MI", "Michigan", 9883360, 3.15, 3.00],
  ["MO", "Missouri", 6021988, 1.92, 2.00],
  ["MN", "Minnesota", 5379139, 1.72, 2.00],
  ["MS", "Mississippi", 2984926, 0.95, 1.00],
  ["MT", "Montana", 1005141, 0.32, 1.00],
  ["NC", "North Carolina", 9752073, 3.11, 3.00],
  ["ND", "North Dakota", 699628, 0.22, 1.00],
  ["NE", "Nebraska", 1855525, 0.59, 1.00],
  ["NH", "New Hampshire", 1320718, 0.42, 1.00],
  ["NJ", "New Jersey", 8864590, 2.83, 3.00],
  ["NM", "New Mexico", 2085538, 0.67, 1.00],
  ["NV", "Nevada", 2758931, 0.88, 1.00],
  ["NY", "New York", 19570261, 6.25, 5.00],
  ["OH", "Ohio", 11544225, 3.68, 3.00],
  ["OK", "Oklahoma", 3814820, 1.22, 1.00],
  ["OR", "Oregon", 3899353, 1.24, 1.00],
  ["PA", "Pennsylvania", 12763536, 4.07, 3.00],
  ["RI", "Rhode Island", 1050292, 0.34, 1.00],
  ["SC", "South Carolina", 4723723, 1.51, 2.00],
  ["SD", "South Dakota", 833354, 0.27, 1.00],
  ["TN", "Tennessee", 6456243, 2.06, 2.00],
  ["TX", "Texas", 26059203, 8.32, 7.00],
  ["UT", "Utah", 2855287, 0.91, 1.00],
  ["VA", "Virginia", 8185867, 2.61, 3.00],
  ["VT", "Vermont", 626011, 0.20, 1.00],
  ["WA", "Washington", 6897012, 2.20, 2.00],
  ["WI", "Wisconsin", 5726398, 1.83, 2.00],
  ["WV", "West Virginia", 1855413, 0.59, 1.00],
  ["WY", "Wyoming", 576412, 0.18, 1.00] 
]

state_stats.each do |code, name, population, pop_percent, one_vote_weight|
  State.create(code: code, name: name, population: population, pop_percent: pop_percent, one_vote_weight: one_vote_weight)
end