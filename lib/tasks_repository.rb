require 'sequel'

class TasksRepository
  def create(attributes)
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = db[:tasks]
    tasks.insert(attributes)
  end

  def all
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = db[:tasks]
    tasks.to_a
  end

end