require 'rails_helper'

RSpec.describe Comment, type: :model do
  # @user = User.new
  # @task = Task.create!(title: "Coding a todo app", priority: "hardcore", deadline: Time.now, status: false, user_id: User.last.id)
  @comment = Comment.create(details: "I should add more tentacles")
end

 # CRUD test
describe Comment, "#create" do
  it 'checks that a comment can be created' do
    comment = Comment.create(details: "Such a good idea!", task_id: Task.last.id)
    expect(comment).to be_valid
  end
end

describe Comment, "#show" do
  it 'checks that a comment can be read' do
    comment = Comment.create(details: "I should add more tentacles", task_id: Task.last.id)
    expect(Comment.find_by_details("I should add more tentacles")).to eq(comment)
  end
end

describe Comment, "#update" do
  it 'checks that a comment can be updated' do
    comment = Comment.create(details: "I should add more tentacles", task_id: Task.last.id)
    comment.update(:details => "I should add more tentacles and more colors")
    expect(Comment.find_by_details("I should add more tentacles and more colors")).to eq(comment)
  end
end

describe Comment, "#destroy" do
  it 'checks that a comment can be destroyed' do
    comment = Comment.create(details: "I should add more tentacles and more colors", task_id: Task.last.id)
    comment.destroy
    expect(Comment.find_by(details: "I should add more tentacles and more colors")).to be_nil
  end
end

# Active Record
describe Comment, "#details" do
  it "checks that comment details are not too long" do
    comment = Comment.new(details: "azertyuiopoiuytrezazertyuioppoiuytrezertyuioppoiuytrezertyuio")
    expect(comment.details.length).to be < 100
  end
end