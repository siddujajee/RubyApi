require "httparty"
url="https://jsonplaceholder.typicode.com/posts?per_page=10&page=1"
posts=HTTParty.get(url)
if posts.code.to_i==200
    data=JSON.parse(posts.body)
else
    puts "#{posts.code}-#{posts.message}"
end
data.first(10).each_with_index do |p, index|   
File.open("post#{index + 1}.txt", "w+"){|f| f.write(p)}
puts "file#{index+1} created successfully" 
end