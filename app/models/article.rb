require 'elasticsearch/model'

class Article < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  settings analysis: {
      filter: {
          ngram_filter: { type: "nGram", min_gram: 2, max_gram: 12 }
      },
      analyzer: {
          index_ngram_analyzer: {
              type: 'custom',
              tokenizer: 'standard',
              filter: ['lowercase', 'ngram_filter']
          },
          search_ngram_analyzer: {
              type: 'custom',
              tokenizer: 'standard',
              filter: ['lowercase']
          }
      }
  } do
    mappings dynamic: 'false' do
      indexes :title, type: 'string', analyzer: 'index_ngram_analyzer', search_analyzer: 'search_ngram_analyzer'
      indexes :text, type: 'string'
    end
  end

  def to_indexed_json
    to_json #include: :authors
  end

end