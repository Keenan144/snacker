
User.create(handle: "imabigcordealia", password: "hello", name: "Cordelia Peters")
User.create(handle: "yandrew", password: "12345", name: "Andrew Yan")


@counter = 1

5.times do |tweet|
  @counter += 1
  Tweet.create(content: "Happy Thursday!", user_id: @counter)
end

