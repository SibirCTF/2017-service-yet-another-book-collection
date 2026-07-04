# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def upload(name)
  File.open(Rails.root + "db/#{name}.jpg")
end

def create_book(jpg, category, user, title, author, desc)
  Book.create(book_cover: upload(jpg), category_id: Category.find_by(name: category).id, user_id: user, title: title, author: author, desc: desc)
end
Category.delete_all
User.delete_all
Book.delete_all
list = %w[Android Assembler C++ C# Database Java JavaScript Rust Other PHP Python Ruby Go Swift]
list.each { |item| Category.create!(name: item) }

User.create(name: FFaker::Name.name, email: FFaker::Internet.email, password: FFaker::Internet.password, has_priveleges: true)
user_id = User.first.id
create_book('java', 'Java', user_id, 'Java 9 Cookbook', 'Mohamed Sanaulla, Nick Samoylov', 'This cookbook offers a range of software development examples in simple and straightforward Java 9 code, providing step-by-step resources and time-saving methods to help you solve data problems efficiently.')
create_book('android', 'Android', user_id, 'Head First Android Development: A Brain-Friendly Guide, 2nd Edition', 'Dawn Griffiths, David Griffiths', 'If you have an idea for a killer Android app, this fully revised and updated edition will help you build your first working application in a jiffy.')
create_book('rust', 'Rust', user_id, 'Programming Rust: Fast, Safe Systems Development', 'Jason Orendorff, Jim Blandy', 'This practical book introduces systems programmers to Rust, the new and cutting-edge language that’s still in the experimental/lab stage.')
create_book('c++', 'C++', user_id, 'C++17 STL Cookbook', 'Jacek Galowicz', 'Over 90 recipes that leverage the powerful features of the Standard Library in C++17.')
create_book('ruby', 'Ruby', user_id, 'Agile Web Development with Rails 5', 'Sam Ruby', 'Ruby on Rails helps you produce high-quality, beautiful-looking web applications quickly. You concentrate on creating the application, and Rails takes care of the details.')
create_book('python', 'Python', user_id, 'Thoughtful Machine Learning with Python: A Test-Driven Approach', 'Matthew Kirk', ' With Early Release ebooks, you get books in their earliest form—the author’s raw and unedited content as he or she writes—so you can take advantage of these technologies long before the official release of these titles.')
create_book('javascript', 'JavaScript', user_id, 'JavaScript-mancy: Object-Oriented Programming', 'Jaime González García, Artur Mizera', 'Mastering the Arcane Art of Summoning Objects in JavaScript Imagine imagine you lived in a world were you could use JavaScript to change the universe around you, to tamper with the threads that compose reality as you know it and do anything that you can imagine.')
create_book('php', 'PHP', user_id, 'Laravel: Up and Running: A Framework for Building Modern PHP Apps', 'Matt Stauffer', 'What sets Laravel apart from other PHP web frameworks? Speed and simplicity, for starters. This rapid application development framework and its vast ecosystem of tools let you quickly build new sites and applications with clean, readable code.')
