class Note < ApplicationRecord
    belongs_to :user

    has_many :note_tags
    has_many :tags, through: :note_tags

    def tags_attributes=(tags_attributes)
        tags_attributes.each do |tag_attributes|
            tags << Tag.find_or_create_by(name: tag_attributes.name)
        end
    end
end
