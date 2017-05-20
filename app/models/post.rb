class Post < ApplicationRecord
  belongs_to :user
  include AlgoliaSearch

  algoliasearch do
    attribute :id, :body, :score, :created_at
    attribute :username do
      user.username
    end
    searchableAttributes ['body', 'username']
    customRanking ['desc(score)']
  end

  def username_changed?
    user.username_changed?
  end
end
