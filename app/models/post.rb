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

class Post < ApplicationRecord
  include Elasticsearch::Model
  include AASM
  searchkick word_middle: %i[title description content]
  has_attached_file :image, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
  belongs_to :user
  belongs_to :visibility
  belongs_to :category
  has_many :comments, dependent: :destroy
  is_impressionable counter_cache: true
  validates :title, presence: true,
                    length: { minimum: 5 }

  scope :active, -> { where(status: 'active') }
  scope :published, -> { where(status: 'published') }
  scope :unpublished, -> { where(status: 'unpublished') }
  scope :archive, -> { where(status: 'archived') }
  aasm column: 'status' do
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
        self.published_date = DateTime.now
        save
      end
      transitions from: [:active], to: :published
    end
    event :to_unpublished do
      transitions from: [:published], to: :active
    end
    event :to_archive do
      transitions from: %i[published active inactive], to: :archived
    end
  end

  def search_data
    {
      title: title,
      description: description,
      content: content,
      status: status
    }
  end
  # Custom callbacks for elastic
  after_commit on: [:create] do
    __elasticsearch__.index_document
  end
  after_commit on: [:update] do
    __elasticsearch__.index_document
  end
  after_commit on: [:destroy] do
    __elasticsearch__.delete_document ignore: 404
  end
end
