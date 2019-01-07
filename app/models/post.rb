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
  include AASM
  belongs_to :user
  belongs_to :visibility
  belongs_to :category
  has_many :comments, dependent: :destroy
  is_impressionable
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :visibility_id, presence: true

  scope :active, ->{where(status: "active")}
  scope :published, ->{where(status: "published")}
  scope :unpublished, ->{where(status: "unpublished")}
  scope :archive, ->{where(status: "archived")}
   aasm :column => 'status' do
    state :inactive, initial: true
    state :active
    state :rejected
    state :published
    state :archived

    event :to_active do
      transitions from: [:inactive], to: :active
    end
    event :to_rejected do
      transitions from: [:inactive], to: :rejected
    end
    event :to_inactive do
      transitions from: [:active], to: :inactive
    end
    event :to_published do
      after do
        self.published_date  = DateTime.now
        self.save
      end
      transitions from: [:active], to: :published
    end
    event :to_unpublished do
      transitions from: [:published], to: :active
    end
    event :to_archive do
      transitions from: [:published, :active, :inactive], to: :archived
    end
  end
end
