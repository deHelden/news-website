ActiveAdmin.register Post do
  self.send(:include, Kaminari::ConfigurationMethods)

  def self.page(num = nil)
    limit(default_per_page).offset(default_per_page * ((num = num.to_i - 1) < 0 ? 0 : num)).extending do
      include Kaminari::ActiveRecordRelationMethods
      include Kaminari::PageScopeMethods
    end
  end

  scope :all
  scope :active
  scope :published
  scope :unpublished
  scope :archive
  permit_params :title, :description, :content, :published_date

  action_item :reject, only: :show do
    link_to 'Reject', reject_admin_post_path(post), method: :put if post.may_to_rejected?
  end
  action_item :activate, only: :show do
    link_to 'Activate', activate_admin_post_path(post), method: :put if post.may_to_active?
  end
  action_item :inactivate, only: :show do
    link_to 'Inactivate', inactivate_admin_post_path(post), method: :put if post.may_to_inactive?
  end
  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_post_path(post), method: :put if post.may_to_published?
  end
  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_post_path(post), method: :put if post.may_to_unpublished?
  end
  action_item :archive, only: :show do
    link_to 'Archive', archive_admin_post_path(post), method: :put if post.may_to_archive?
  end

  member_action :reject, method: :put do
    post = Post.find(params[:id])
    post.to_rejected!
    redirect_to admin_post_path(post)
  end
  member_action :activate, method: :put do
    post = Post.find(params[:id])
    post.to_active!
    redirect_to admin_post_path(post)
  end
  member_action :inactivate, method: :put do
    post = Post.find(params[:id])
    post.to_inactive!
    redirect_to admin_post_path(post)
  end
  member_action :publish, method: :put do
    post = Post.find(params[:id])
    post.to_published!
    redirect_to admin_post_path(post)
  end
  member_action :unpublish, method: :put do
    post = Post.find(params[:id])
    post.to_unpublished!
    redirect_to admin_post_path(post)
  end
  member_action :archive, method: :put do
    post = Post.find(params[:id])
    post.to_archive!
    redirect_to admin_post_path(post)
  end
end
