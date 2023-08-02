class MessageB < Message 
  validates :text, format: { without: /好き/, message: "お相手がいるユーザーです！" }
end
