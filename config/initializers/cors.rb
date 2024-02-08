Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true

    # resource '/posts',
    #   headers: :any,
    #   methods: [:post, :get, :delete]
    
    # resource '/users',
    #   headers: :any,
    #   methods: [:post, :get, :delete] 

    # resource '/users/:username/posts',
    #   headers: :any,
    #   methods: [:get]
  end
end