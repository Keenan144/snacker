
User.create(handle: "imabigcordealia", password: "hello", name: "Cordelia Peters")
User.create(handle: "yandrew", password: "12345", name: "Andrew Yan")


@counter = 3

3.times do |tweet|
  @counter += 1
  Tweet.create(content: "Who runs the world!", user_id: @counter)
end

