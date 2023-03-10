json.extract! project, :id, :name, :status, :created_at, :updated_at
json.url admin_project_url(project, format: :json)
