# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create Users
user1 = User.find_or_create_by!(email: "alice@example.com") do |u|
  u.name = "Alice"
end

user2 = User.find_or_create_by!(email: "bob@example.com") do |u|
  u.name = "Bob"
end

user3 = User.find_or_create_by!(email: "carol@example.com") do |u|
  u.name = "Carol"
end

# Create Posts (User 1:M Post)
post1 = Post.find_or_create_by!(title: "First Post") do |p|
  p.content = "This is Alice's first post."
  p.user = user1
  p.creator = user1
end

post2 = Post.find_or_create_by!(title: "Second Post") do |p|
  p.content = "This is Bob's first post."
  p.user = user2
  p.creator = user2
end

post3 = Post.find_or_create_by!(title: "Third Post") do |p|
  p.content = "This is Alice's second post."
  p.user = user1
  p.creator = user1
end

# Create Post Editors (Post M:M Editor/User)
PostEditor.find_or_create_by!(post: post1, user: user2)
PostEditor.find_or_create_by!(post: post1, user: user3)
PostEditor.find_or_create_by!(post: post2, user: user1)
PostEditor.find_or_create_by!(post: post3, user: user3)

puts "Seeded #{User.count} users, #{Post.count} posts, and #{PostEditor.count} editor relationships."
