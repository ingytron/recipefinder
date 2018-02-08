class Recipe < ApplicationRecord
  include HTTParty

  default_options.update(verify: false)
  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json

  def self.for term
    get("/search", query: {q: term})["recipes"]
  end

end
