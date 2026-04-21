json.extract! machine_log, :id, :level, :module, :raw_data, :fb_translation, :human_perspective, :created_at, :updated_at
json.url machine_log_url(machine_log, format: :json)
