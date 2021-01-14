require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user = User.create(email: 'poulpo@todoulpe.com', password: '123456')
  @task = Task.create!(title: "Coding a todo app", priority: "hardcore", deadline: Time.now, status: false, user_id: User.last.id)
  @comment = Comment.create(details: "I should add more tentacles")
end
