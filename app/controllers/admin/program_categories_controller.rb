class Admin::ProgramCategoriesController < ApplicationController
  before_action :set_program_category, only: [:show, :edit, :update, :destroy]
  skip_before_filter :set_inquiry

  load_and_authorize_resource
  layout "admin_layout"

  def index
    @program_categories = ProgramCategory.all
  end

  def show
  end

  def new
    @program_category = ProgramCategory.new
  end

  def edit
  end

  def create
    @program_category = ProgramCategory.new(program_category_params)

    if @program_category.save
      redirect_to admin_path, notice: 'Program Category was successfully created.'
    else
      render :new
    end
  end

  def update
    if @program_category.update(program_category_params)
      redirect_to admin_path, notice: 'Program Category was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @program_category.destroy
    redirect_to admin_path, notice: "Program Category was successfully destroyed."
  end

  private

    def set_program_category
      @program_category = ProgramCategory.find(params[:id])
    end

    def program_category_params
      params.require(:program_category).permit(:name, :description)
    end

end
