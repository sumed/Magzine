class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
    validates :title, presence: true,
                    length: { minimum: 3 }

end
