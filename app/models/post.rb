class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates :content, length: {minimum: 100}

    
end
