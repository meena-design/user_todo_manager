class TodosController < ApplicationController

  #skip_before_action :verify_authenticity_token

  def index
    #render plain: "Hello, this is /todos!"
    #render plain: "Hello to Rails! #{DateTime.now.to_s(:short)}"
    #render plain: Todo.all.to_a
    #render plain:Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end
  def show
    id = params[:id]
    todo = Todo.find(id)
    #render plain: todo.to_pleasant_string
    render "todo"
    # render todo show s a single todo from todo.html.erb
    # even in this page also we see header and footer
  end
  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_to_do =  Todo.create!(todo_text: todo_text,
      due_date: due_date,
      completed: false)
    #response_text="Hey , Your new todo is Created with the id #{new_to_do.id}"
    #render plain:response_text
    redirect_to todos_path

  end
  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    #render plain:"Updated to do completed status #{completed}"
    redirect_to todos_path
  end
  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end

end
