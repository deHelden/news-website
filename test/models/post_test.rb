# == Schema Information
#
# Table name: posts
#
#  id                 :bigint(8)        not null, primary key
#  title              :string           not null
#  content            :string           not null
#  description        :string           not null
#  published_date     :datetime
#  status             :string           not null
#  importance         :boolean          default(FALSE), not null
#  rating             :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :bigint(8)
#  user_id            :integer
#  visibility_id      :bigint(8)
#  impressions_count  :integer          default(0)
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
