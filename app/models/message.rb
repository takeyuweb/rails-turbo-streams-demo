class Message < ApplicationRecord
  validates :body, presence: true
  # To broadcast in a model callback, write the following
  # after_create_commit -> { broadcast_prepend_to("messages_channel", partial: "messages/message") }  # Specify a partial template
  # after_create_commit -> { broadcast_prepend_later_to("messages_channel") } # Broadcast asynchronously using ActiveJob.
  # after_create_commit -> { broadcast_prepend_to("messages_channel") }
end
