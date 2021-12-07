json.extract! vistor_review, :id, :reservation_id, :body, :score, :created_at,
              :updated_at
json.url vistor_review_url(vistor_review, format: :json)
