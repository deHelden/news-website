# == Schema Information
#
# Table name: posts
#
#  id             :bigint(8)        not null, primary key
#  title          :string           not null
#  content        :string           not null
#  description    :string           not null
#  published_date :datetime
#  status         :string           not null
#  importance     :boolean          default(FALSE), not null
#  rating         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :bigint(8)
#  user_id        :integer
#  visibility_id  :bigint(8)
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
