class Post < ApplicationRecord
  validates :year, presence: true
  validates :content, presence: true
  has_rich_text :content
  before_save :set_reporter

  private def set_reporter
    self.reporter = "Anonymous" if self.reporter.nil? || self.reporter.empty?
  end
end
