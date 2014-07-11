class User < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  attr_accessible :intro, :name

  settings index: { number_of_shards: 3 } do
    mappings do
      indexes :name,  type: 'string', index: "not_analyzed"
      indexes :intro, type: 'string', analyzer: 'ik'
    end
 end
end
