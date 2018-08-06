class Link
  include Mongoid::Document

  belongs_to :user

  field :url, type: String
  field :tags, type: Array
  field :description, type: String

  validates :url, presence: true

  def format_tag(tags)
    self.tags = tags.split(/[,.]/).map{ |tag| tag.lstrip.rstrip }
  end
end
