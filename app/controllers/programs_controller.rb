class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  before_action :set_inquiry, only: [:index, :show, :edit]


  # GET /programs
  def index
    @programs = Program.all
    @program_categories = ProgramCategory.all
    @post = Post.where(page: "Programs").last
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

    def set_inquiry
      @inquiry = Inquiry.new
    end

    # Only allow a trusted parameter "white list" through.
    def program_params
      params.require(:program).permit(:name, :description, :program_category_id)
    end
end
