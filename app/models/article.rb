class Article < ApplicationRecord
    validates :title, presence :true
    validates :body, presence :true, length:{minimun: 10}
end
