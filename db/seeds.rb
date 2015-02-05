@counter = 1

5.times do |tweet|
  @counter += 1
  Tweet.create(content: "Happy Thursday!", user_id: @counter)
end
