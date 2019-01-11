# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :string           not null
#  post_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
