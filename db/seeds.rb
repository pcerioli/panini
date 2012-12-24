# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#Truncating table (optional)
#NOTE: Heroku doesn't run this truncate command - Not sure why
#Anyway for emergencies, recreate the db schema by running this:
#$ heroku run db:schema:dump
#$ heroku run db:schema:load
#$ heroku run db:seed
#There must be a better way...! but right now I am in a hurry
ActiveRecord::Base.connection.execute("TRUNCATE sandwiches")

#Importing sanwiches
puts "Importing Sandwiches"

open(File.join(Rails.root, 'db/import/sandwiches.tsv')) do |sandwiches|
  sandwiches.read.each_line do |line|
    #remove comments and empty lines if any
    line = line.strip
    if !line.empty? && line.index('#') != 0
      id, name, description, image, created_at, updated_at, category = line.split(/\t/)
      #puts "image = #{image}"
      Sandwich.create(name: name, description: description, image: open("public/uploads/sandwich/image/#{id}/#{image}"), category: category)
    end
  end
end
