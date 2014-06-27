Elasticsearch::Model.client = Elasticsearch::Client.new host: "localhost:9200", log: true, logger: Rails.logger
