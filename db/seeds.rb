# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

batch_hash = JSON.parse(File.read('db/batch'))
batch_hash.each do |key, value|
  username = key
  img_url = value['url']
  profile = Profile.create(username: username, img_url: img_url)
end
