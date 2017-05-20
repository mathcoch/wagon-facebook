Algolia.init :application_id => "LZEMPFONKV", :api_key => "d273e7cc48a855feae0750a9fac8db9a"
def load_data_from_database
  records = Profile.all.map { |pr| {username: pr.username, bio: pr.bio, img_url: pr.img_url, phone: pr.phone, email: pr.email, linkedin: pr.linkedin, score: pr.score} }
end
index = Algolia::Index.new("Profile")
load_data_from_database.each_slice(1000) do |batch|
  index.add_objects(batch)
end
