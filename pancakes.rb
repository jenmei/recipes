require 'rubygems'
require 'ruby-units'

multiplier = 2

# ratio of liters of ingredient to grams

# ingredients = {
#   "buckwheat flour" => {:amount => ".5 cups", :ratio => 507.21},
#   "quinoa flour" => {:amount => ".25 cups", :ratio => },
#   "corn flour" => {:amount => ".25 cups", :ratio => },
#   "tapioca flour" => {:amount => "2 tablespoons", :ratio => },
#   "ground flax seeds" => {:amount => "1 tablespoon", :ratio => },
#   "baking powder" => {:amount => "1 tablespoon", :ratio => },
#   "cinnamon" => {:amount => ".25 teaspoons", :ratio => },
#   "salt" => {:amount => ".25 teaspoons", :ratio => },
#   "almond milk" => {:amount => ".5 cups", :ratio => },
#   "water" => {:amount => ".5 cups", :ratio => },
#   "maple syrup" => {:amount => "2 tablespoons", :ratio => },
#   "canola oil" => {:amount => "2 tablespoons", :ratio => },
#   "vanilla" => ".5 teaspoons"
# }


ingredients = {
  "buckwheat flour" => {:amount => ".5 cups", :ratio => ["4.25 oz", "1 cup"]},
  "quinoa flour" => {:amount => ".25 cups", :ratio => ["3.875 oz", "1 cup"]},
  "corn flour" => {:amount => ".25 cups", :ratio => ["634.01 grams", "1 liter"]},
  "tapioca flour" => {:amount => "2 tablespoons", :ratio => ["4 oz", "1 cup"]},
  "ground flax seeds" => {:amount => "1 tablespoon", :ratio => ["1.25 oz", ".25 cups"] },
  "baking powder" => {:amount => "1 tablespoon", :ratio => [".5 oz", "1 tablespoon"]},
  "cinnamon" => {:amount => ".25 teaspoons", :ratio => [".25 oz", "1 tablespoon"] },
  "salt" => {:amount => ".25 teaspoons", :ratio => [".66666667 oz", "1 tablespoon"] },
  "almond milk" => {:amount => ".5 cups", :ratio => ["1 kg", "1 liter"] },
  "water" => {:amount => ".5 cups", :ratio => ["1 kg", "1 liter"]},
  "maple syrup" => {:amount => "2 tablespoons", :ratio => ["312 g", "1 cups" ] },
  "canola oil" => {:amount => "2 tablespoons", :ratio => ["928.00 grams", "1 liter"] },
  "vanilla" => {:amount => ".5 teaspoons", :ratio => ["879.164588 g", '1 liter']}
}

ingredients.each_pair do |ingredient, amount|
  liters_of_ingredient = amount[:amount].unit >> "liters"
  ratio = (amount[:ratio][0].unit / amount[:ratio][1].unit)
  weight_in_grams = (liters_of_ingredient * ratio * multiplier) >> "grams"
  #puts weight_in_grams.methods.sort
  puts "#{weight_in_grams.to_s("%0.2f")} #{ingredient}"
end


# 1/2 cup buckwheat flour
# 1/4 cup quinoa flour
# 1/4 cup corn flour (not cornmeal; corn flour is finer)
# 2 tablespoons tapioca flour (cornstarch or arrowroot would be okay, too)
# 1 tablespoon ground flax seeds (or flax meal)
# 1 tablespoon baking powder
# 1/4 teaspoon cinnamon
# 1/4 teaspoon salt
# 1/2 cup soy milk (or other nondairy milk)
# 1/2 cup water
# 2 tablespoons pure maple syrup
# 2 tablespoons canola oil
# 1/2 teaspoon pure vanilla extrac
