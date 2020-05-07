class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, , :created_at, :updated_at, :tags

  def tags
    self.object.tags
  end
end
