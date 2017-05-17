require 'json'

batch_hash = JSON.parse(File.read('db/batch_hash'))
batch_hash.each do |key, value|
  username = key
  profile = Profile.find_by_username(username)
  params = value
  profile.update(params)
end
