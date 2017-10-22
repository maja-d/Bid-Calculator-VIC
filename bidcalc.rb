puts "Welcome to the Victorian millenial first home buyer's bidding calculator!"
puts "Here are the rulez. Enter your amounts in numbers. No dollar $igns. If it's a yes/no question, give a yes/no answer. Gottit?"
puts "Are you ready to bid?! "
ready = gets.chomp.downcase

if ready == "yes"
  puts "Welcome to the Wild West, jerks aplenty! Good luck!"

  print "How much money have you saved? "
  savings = gets.chomp.to_f.round(2)
  if savings >= 100000
    puts "Great work! "
  else
    puts "Looks like you've been frivolous with your smashed avocado budget, kiddo. Back to work! "
  end

  print "How much is your conveyancer? "
  conveyancing = gets.chomp.to_f
  if conveyancing > 1000
    puts "Such a rip-off!"
  else
    puts "That's not so bad. "
  end

  print "Will you have a mortgage? "
  mortgage_reg = gets.chomp.downcase
  if mortgage_reg == "no"
    puts "Well la-di-da... Why are you even using this free calculator, ya rich jerk!"
    reg_cost = 0
  elsif mortgage_reg == "yes"
    reg_cost = 114.90
  end
  print "Does the vendor have a mortgage? I'll default to 'yes' unless you tell me otherwise. "
  mortgage_discharge = gets.chomp.downcase
  if mortgage_discharge == "no"
    discharge_cost = 0
  else discharge_cost = 114.90
  end
  print "How much are the disbursements? You've thought of the disbursements, haven't you? Won't somebody please think of the disbursements! "
  disbursements = gets.chomp.to_f
  print "I'd recommend a just-in-case buffer. Enter an amount for miscellaneous costs. Just in case. Just. In. Case. "
  buffer = gets.chomp.to_f
  print "How much money are you planning to bid? "
  x = gets.chomp.to_f
  if x >= 750000
    puts "Ambitous bid!"
  end
  puts "OK, now we're ready to calculate!"

  fixed_costs = conveyancing + reg_cost + discharge_cost + disbursements + buffer

  if x <= 600000
    duty = 0
  elsif x > 600000 && x <= 750000
    duty = (x - 600000) / 150000 * (2870 + (x - 130000) * 0.06)
  elsif x > 750000 && x <= 960000
    duty = 2870 + ((x - 130000) * 0.06)
  else
    duty = x * 0.055
  end

  land_transfer = 94.6 + (x / 1000) * 2.34
  if land_transfer >= 3604.6
    land_transfer = 3604.6
  end

  variable_costs = duty + land_transfer

  total = (savings - fixed_costs - variable_costs).round(2)

  puts "You have $#{savings.round(2)} in the bank."
  puts "Your fixed costs are $#{(conveyancing + reg_cost + discharge_cost + disbursements + buffer).round(2)}."
  puts "If you want to bid $#{x.round(2)}, your stamp duty will cost about $#{duty.round(2)}, and land transfer costs will be around $#{land_transfer.round(2)}."

  if total >= x * 0.2
    puts "Congratulations, you have enough to bid $#{x.round(2)}! Let's celebrate with a round of soy lattes!"
  else puts """ The baby boomers have won! You don't have enough to bid. You would need $#{(x * 0.2).round(2)} for a 20% deposit.\nYou only have $#{total.round(2)}. You need to save another $#{((x * 0.2) - total).round(2)} to make your bid.\nThanks a lot, John Howard. Let's commiserate with a trip to Bali."""
  end

else
  puts "Well, what are you doing using a bidding calculator?! Seeya!"
end
