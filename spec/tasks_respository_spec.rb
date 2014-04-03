require 'tasks_repository'

describe TasksRepository do

  before do
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    db.create_table! :tasks do
      primary_key :id
      String :description
      Boolean :completed, default: false
    end
  end

  it "will create a database and table, add a task and show all tasks" do
    repository = TasksRepository.new
    repository.create(id: 1, description: "Something", completed: false)
    tasks = repository.all
    expect(tasks).to eq ([{:id => 1, :description => "Something", :completed => false}])
  end
end