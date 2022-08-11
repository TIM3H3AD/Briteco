require "test_helper"

class ItemTest < ActiveSupport::TestCase
  validates :name, presence: true
end
