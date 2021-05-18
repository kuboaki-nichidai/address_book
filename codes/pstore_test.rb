# frozen_string_literal: true

require 'pstore' # <1>

juice = 'orange juice'
fruits = ['apple', 'banana', 'cherry', 'fig', 'grape']

db = PStore.new('fruitdb') # <2>

db.transaction do # <3>
  db['drink'] = juice
  db['fruits'] = fruits
end # <4>

db.transaction(true) do # <5>
  puts "drink: #{db['drink']}"
  puts "fruits: #{db['fruits'].join(', ')}"
end
