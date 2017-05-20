class Post < ApplicationRecord
  belongs_to :user
  include AlgoliaSearch

  algoliasearch do
    attribute :id, :body, :score, :user.username
    searchableAttributes ['body', 'user.username']
    customRanking ['desc(score)']
  end

end
