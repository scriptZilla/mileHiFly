class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :title, length: { minimum: 2 }
 
  validates :content, presence: true
  validates :content, length: { minimum: 10 } 
end
