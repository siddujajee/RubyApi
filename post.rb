require "httparty"
url="https://jsonplaceholder.typicode.com/posts"
posts=HTTParty.get(url)
if posts.code.to_i==200
    data=JSON.parse(posts.body)
else
    puts "#{posts.code}-#{posts.message}"
end
data.each_with_index do |p, index|   
File.open("post#{index + 1}.txt", "w+"){|f| f.write(p)}
puts "file#{index+1} created successfully" 
end
