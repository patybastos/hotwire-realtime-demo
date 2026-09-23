class Message < ApplicationRecord
  validates :username, :content, presence: true

  after_create_commit -> { broadcast_append_to "messages", target: "messages" }
end
