class Post < ApplicationRecord
  belongs_to :page
  validates :content, presence: true
  has_rich_text :content
  before_save :set_reporter
  after_create_commit :notify_to_slack

  private

  def set_reporter
    self.reporter = "Anonymous" if self.reporter.nil? || self.reporter.empty?
  end

  def notify_to_slack
    SlackNotifierJob.perform_later(self)
    end
end
