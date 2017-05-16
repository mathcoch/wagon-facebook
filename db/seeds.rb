require 'json'


# batch_hash = JSON.parse(File.read('db/batch'))
# batch_hash.each do |key, value|
#   username = key
#   img_url = value['url']
#   profile = Profile.create(username: username, img_url: img_url)
# end

# post = Post.new(body: 'Al Pacino a un poster de Vincent Panis dans sa chambre', score: '8')
# post.user =
# Post.new(body: 'Alexis attendrait toujours son passage sur BFM', score: '7')
# Post.new(body: 'Achille ferait ses courses en ligne', score: '0')
# Post.new(body: '32 ans et s\'amuser à créer un site de ragots....', score: '0')

batch_hash = JSON.parse(File.read('db/batch_hash'))
batch_hash.each do |key, value|
  username = key
  profile = Profile.find_by_username(username)
  params = value
  profile.update(params)
end
