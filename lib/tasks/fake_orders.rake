desc "Make Some Fake Orders"
task :fake_orders => :environment do

  puts "Runs an endless loop.  Control+C to stop."
  while true do
    Order.make_order
    time = (rand(5)+2).to_i
    sleep(time)
  end

end
