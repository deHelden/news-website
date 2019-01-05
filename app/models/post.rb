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

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :visibility
  belongs_to :category
  has_many :comments, dependent: :destroy
  is_impressionable
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :visibility_id, presence: true
end
