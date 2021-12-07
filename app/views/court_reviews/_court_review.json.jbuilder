json.extract! court_review, :id, :reservation_id, :body, :score, :created_at, :updated_at
json.url court_review_url(court_review, format: :json)
