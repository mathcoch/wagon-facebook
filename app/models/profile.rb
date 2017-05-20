class Profile < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :username, :bio, :phone, :email, :score, :linkedin, :img_url
    searchableAttributes ['username', 'bio', 'phone', 'email']
    customRanking ['desc(score)']
  end
end
