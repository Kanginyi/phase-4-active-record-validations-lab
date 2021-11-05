class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

    validate :more_clickbait

    def more_clickbait
        unless title.to_s.match?(/(Won't Believe|Secret|Top \d+|Guess)/i)
            errors.add :title, "clickb8"
        end
    end
end

