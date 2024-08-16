namespace :import do
  desc "Import Technicians, Locations, and Work Orders from CSV"
  task load_csv: :environment do
    require 'csv'

    # paths to csv files
    technicians_csv = Rails.root.join('app', 'assets', 'csv', 'technicians.csv')
    locations_csv = Rails.root.join('app', 'assets', 'csv', 'locations.csv')
    work_orders_csv = Rails.root.join('app', 'assets', 'csv', 'work_orders.csv')

    # Import technicians
    puts "Importing Technicians..."
    CSV.foreach(technicians_csv, headers: true) do |row|
      Technician.find_or_create_by!(id: row['id'], name: row['name'])
    end

    # Import locations
    puts "Importing Locations..."
    CSV.foreach(locations_csv, headers: true) do |row|
      Location.find_or_create_by!(id: row['id'], name: row['name'], city: row['city'])
    end

    # Import work orders
    puts "Importing Work Orders..."
    CSV.foreach(work_orders_csv, headers: true) do |row|
      technician = Technician.find_by(id: row['technician_id'])
      location = Location.find_by(id: row['location_id'])
      start_time = DateTime.parse(row['time'])
      duration = row['duration'].to_i
      price = row['price'].to_f

      WorkOrder.create!(
        id: row['id'],
        technician: technician,
        location: location,
        start_time: start_time,
        duration: duration,
        price: price
      )
    end

    puts "Import completed!"
  end
end
