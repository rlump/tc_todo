class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]


  # GET /todos
  # GET /todos.json
  def index
    @todos = []
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      if @user
        if (params[:completed])
          @todos = @user.todos.completed(params[:completed] == "true" ? true : false)
        else
          @todos = @user.todos
        end
      end
    else
      if (params[:completed])
        @todos = Todo.completed(params[:completed] == "true" ? true : false)
      else
        @todos = Todo.all
      end
    end
    respond_to do |format|
        format.html
        format.json  { render json: @todos }
    end
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = params[:user_id]

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render json: @todo }

      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: 'Todo was successfully updated.' }
        format.json { render json: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:desc, :due_date, :completed, :user_id)
    end
end
