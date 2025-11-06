require "uri"
require "net/http"
require "json"

class SlackNotifierJob < ApplicationJob
  queue_as :default

  def perform(post)
    webhook_url = Rails.application.credentials.slack[:webhook_url]
    if webhook_url.nil? && webhook_url.empty?
      return
    else
      webhook_url = URI.parse(webhook_url)
    end

    http = Net::HTTP.new(webhook_url.host, webhook_url.port)
    http.use_ssl = true

    headers = {
      "Content-Type" => "application/json"
    }

    param = {
      text: "*#{post.reporter}*:\n#{post.content.to_plain_text}"
    }

    http.post(webhook_url.path, param.to_json, headers)
  end
end
