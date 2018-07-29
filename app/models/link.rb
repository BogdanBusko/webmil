class Link
  include Mongoid::Document

  field :url, type: String
  field :tags, type: String
  field :description, type: String

  validates :url, presence: true

  before_save :format_tag

  def format_tag
    self.tags = self.tags.downcase.gsub!(/[.,#]/, ' ')
  end

  def get_tag
    self.tags.split(' ')
  end
end
