require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    @user = User.create(email: 'poulpo@todoulpe.com', password: '123456')
    @task = Task.create!(title: "Coding a todo app", priority: "hardcore", deadline: Time.now, status: false, user_id: User.last.id)
  end


  # CRUD test
  describe Task, "#create" do
    it 'checks that a task can be created' do
      expect(@task).to be_valid
    end
  end

  describe Task, "#show" do
    it 'checks that a task can be read' do
      expect(Task.find_by_title("Coding a todo app")).to eq(@task)
    end
  end

  describe Task, "#update" do
    it 'checks that a task can be updated' do
      @task.update(:title => "Coding a todo app like a pro")
      expect(Task.find_by_title("Coding a todo app like a pro")).to eq(@task)
    end
  end

  describe Task, "#destroy" do
    it 'checks that a task can be destroyed' do
      @task.destroy
      expect(Task.find_by(title: "Coding a todo app like a pro")).to be_nil
    end
  end

  # Validation tests  
  describe Task, "#status?" do
    it "checks that status is true" do
      task = Task.new(status: true)
      expect(task.status).to be true
    end
  
    it "checks that status is false" do
      task = Task.new(status: false)
      expect(task).not_to be true
    end
  end

  describe Task, "#priority" do
    it "checks that task priority is chill" do
      task = Task.new(priority: PRIORITY[2])
      expect(task.priority).to be eq(@task)
    end
  end

  describe Task, "#deadline" do
    it "checks that task deadline is not passed" do
      task = Task.new(deadline: Date.tomorrow)
      expect(task.deadline).to be > Date.new
    end

    it "checks that task deadline is over" do
      task = Task.new(deadline: Date.yesterday)
      expect(task.deadline).to be > Date.new
    end
  end
end
