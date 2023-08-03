module UsersHelper
  def get_random_user(users)
    return nil if users.empty?
    random_index = rand(users.length)
    return  random_index
  end
end
