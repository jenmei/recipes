require 'rubygems'
require 'bundler/setup'
require 'ruby-units'

multiplier = 2

# adapted from http://www.chinasichuanfood.com/sesame-balls-jian-dui/
# and http://www.justonecookbook.com/pressure-cooker-anko-red-bean-paste/

ingredients = {
  "small portion glutinous rice flour" => {:amount => "2 tablespoons", :ratio => ["40g", ".25 cup"]},
  "entire glutinous rice flour" => {:amount => "1.5 cups", :ratio => ["40g", ".25 cup"]},
  "water for small portion" => {:amount => "10 ml", :ratio => ["1g", "1ml"]},
  "water for whole" => {:amount => "100 ml", :ratio => ["1g", "1ml"]},
  "baking powder" => {:amount => ".5 tablespoon", :ratio => [".5 oz", "1 tablespoon"]}
# ,
#   "maple syrup equiv to #{sugar} g sugar" => {:amount => "1.18 g", :ratio => ["312 g", "1 cups" ] },
}

def convert_to_grams(amount, multiplier)
  liters_of_ingredient = amount[:amount].unit >> "liters"
  ratio = (amount[:ratio][0].unit / amount[:ratio][1].unit)
  weight_in_grams = (liters_of_ingredient * ratio * multiplier) >> "grams"
end

ingredients.each_pair do |ingredient, amount|
  weight_in_grams = convert_to_grams(amount, multiplier)
  #puts weight_in_grams.methods.sort
  puts "#{weight_in_grams.to_s("%0.2f")} #{ingredient}"
end


# according to google "maple syrup water content", it's
# 32.4 g per 100 g. Recipe calls for

sugar = 80.0 * multiplier
water_percent_maple_syrup = 32.4
sugar_ratio_maple_syrup = (100.0 - water_percent_maple_syrup) / 100.0
maple_syrup = sugar / sugar_ratio_maple_syrup
water_content_of_maple_syrup = maple_syrup - sugar

puts "maple_syrup: #{maple_syrup} g"
puts "water in maple syrup: #{water_content_of_maple_syrup} g"
# ingredients["maple syrup equiv to #{sugar} g sugar"] - sugar
