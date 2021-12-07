json.extract! reservation, :id, :start_time, :end_time, :court_id, :vistor_id,
              :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
