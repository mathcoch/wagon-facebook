class Post < ApplicationRecord
  belongs_to :user
  include AlgoliaSearch

  algoliasearch do
    attribute :id, :body, :score
    attribute :created_at do
      created_at.strftime('%A, %d %b %Y %l:%M %p')
    end
    attribute :username do
      user.username
    end
    attribute :img_url do
      user.profile.img_url
    end
    searchableAttributes ['body', 'username']
    customRanking ['desc(score)']
  end

  def created_at_changed?
    created_at_changed?
  end

  def username_changed?
    user.username_changed?
  end

  def img_url_changed?
    user.profile.img_url_changed?
  end
end
