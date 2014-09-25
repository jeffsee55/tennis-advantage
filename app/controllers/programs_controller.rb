class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  # GET /programs
  def index
    @programs = Program.all
    @program_categories = ProgramCategory.all
  end

  # GET /programs/1
  def show
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  def competitions
    @competitions = Program.where(:program_category_id => '2')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def program_params
      params.require(:program).permit(:name, :description, :program_category_id)
    end
end
