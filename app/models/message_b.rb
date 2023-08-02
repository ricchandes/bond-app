class MessageB < Message 
  validates :text, format: { without: /すき/, message: "cannot contain (すき)" }
end
