require 'rubygems'
require 'ruby-units'

multiplier = 5

ingredients = {
  'sorghum flour' => {amount: "2 oz", ratio: ['132 grams', '1 cup']},
  'corn flour' => {amount: "2 oz", ratio: ['114 grams', '1 cup']},
  'potato starch' => {amount: "2 oz", ratio: ['152 grams', '1 cup']},
  'sweet rice flour' => {amount: "3 oz", ratio: ['142 grams', '1 cup']},
  'xantham gum' => {amount: "1 teaspoon", ratio: ['7.39 grams', '1 teaspoon']},
  'guar gum' => {amount: "1 teaspoon", ratio: ['10 grams', '1 tablespoon']}, # bob's red mill nutritional info
  'salt' => {amount: ".5 teaspoon", ratio: ['6.082 gram', '1 teaspoon']},
  'salt' => {:amount => ".25 teaspoons", :ratio => [".66666667 oz", "1 tablespoon"] }
}

ingredients.each_pair do |ingredient, amount|
  amt = Unit.new(amount[:amount])
  weight_in_grams =
     if amt.compatible_with?('liters')
      liters_of_ingredient = amt >> 'liters'
      ratio = (Unit.new(amount[:ratio][0]) / Unit.new(amount[:ratio][1]).unit)
      (liters_of_ingredient * ratio * multiplier) >> 'grams'
    else
      amt * multiplier >> 'grams'
    end

  puts "#{weight_in_grams.to_s("%0.2f")} #{ingredient}"
end
