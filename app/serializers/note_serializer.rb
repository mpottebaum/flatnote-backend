class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tags

  def tags
    self.object.tags
  end
end
