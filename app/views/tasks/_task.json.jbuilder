json.extract! task, :id, :title, :priority, :deadline, :status
json.url task_url(task, format: :json)