
contents = [
'Lorem ipsum dolor sit amet.',
'Consectetur adipisicing elit, sed do eiusmod tempor incididunt.',
'Labore et dolore magna aliqua.',
'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
'Excepteur sint occaecat cupidatat non proident.'
]

puts "Deleting all users..."
User.delete_all

%w[ Tom Jack Kate Pete ].each_with_index do |name, i|
  User.create name: name, intro: contents[i]
end
