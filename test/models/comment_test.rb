# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  commenter  :string           not null
#  body       :string           not null
#  post_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
