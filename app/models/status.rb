class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'single' },
    { id: 3, name: 'dating' },
    { id: 4, name: 'merried' }
  ]
  include ActiveHash::Associations
  has_many :users
end
