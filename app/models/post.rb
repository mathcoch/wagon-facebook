class Post < ApplicationRecord
  belongs_to :user
  include AlgoliaSearch

  algoliasearch do
    attribute :id, :body, :score
    searchableAttributes ['body']
    customRanking ['desc(score)']
  end

end
