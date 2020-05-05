class Note < ApplicationRecord
    belongs_to :user

    has_many :note_tags
    has_many :tags, through: :note_tags

    def tagNames=(tag_names)
        names = tag_names.split(', ')
        new_tags = names.map do |name|
            Tag.find_or_create_by(name: name)
        end
        self.tags = new_tags
    end
end
