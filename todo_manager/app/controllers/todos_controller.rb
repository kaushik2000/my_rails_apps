class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = current_user.todos.find(id)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = Prawn::Document.new
        pdf.text "Hello World!!"
        send_data pdf.render, disposition: "inline"
      end
    end
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    if new_todo.valid?
      new_todo.save!
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
    end
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    current_user.todos.update(id, completed: completed)
    #render plain: "Updated the todo status to #{completed} \n#{Todo.find(id).to_pleasant_string}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
