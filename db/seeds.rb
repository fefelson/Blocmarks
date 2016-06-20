

# Create users
20.times do |i|
  user = User.new(
    name: Faker::Superhero.name,
    email: Faker::Internet.email,
    password: 'password'
  )
  user.skip_confirmation!
  user.save!
end

unless User.find_by(email: 'edwrdwalsh@gmail.com')
  user = User.new(
    name: "FEFelson",
    email: 'edwrdwalsh@gmail.com',
    password: 'password'
  )
  user.skip_confirmation!
  user.save!
end

users = User.all
puts "#{users.count} users created."

# Create topics
15.times do |i|
  topic = Topic.new(
    title: "#" + Faker::Superhero.power,
    user: users.sample
  )
  topic.save!
end

topics = Topic.all
puts "#{topics.count} topics created."

# Create bookmarks
60.times do |i|
  bookmark = Bookmark.new(
    url: Faker::Internet.url,
    topic: topics.sample,
    user: users.sample
  )
  bookmark.save!
end

bookmarks = Bookmark.all
puts "#{bookmarks.count} bookmarks created."

puts "Seed finished"
