class Link
  include Mongoid::Document

  belongs_to :user

  field :url, type: String
  field :tags, type: String
  field :description, type: String

  validates :url, presence: true

  before_create :format_tags

  def format_tags
    array = Array.new
    self.tags.downcase.gsub(/[a-z0-9]+/).each { |word| array << word }
    self.tags = array.join(',')
  end
end
