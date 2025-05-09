class Post < ApplicationRecord
  validates :year, presence: true
  has_rich_text :content
  before_save :set_reporter

  private def set_reporter
    self.reporter ||= "匿名"
  end
end
