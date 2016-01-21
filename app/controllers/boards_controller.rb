class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :sort_content, only: [:index]

  # GET /boards
  # GET /boards.json



  def index
    @boards = Board.all


    @posts = Post.all
    @links = Link.all
    @videos = Video.all


   
    puts @sorted_content

    #@boards.each do |board|
     # @posts = Post.where(board_id: board.id).order("created_at DESC")
     # @links = Link.where(board_id: board.id).order("created_at DESC")
     # @videos = Video.where(board_id: board.id).order("created_at DESC")
    #end
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    

    def sort_content
      posts = Post.all
      links = Link.all
      videos = Video.all

      @content = posts + links + videos
      @sorted_content = @content.sort_by{ |obj| obj.created_at }.reverse!
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:title)
    end
end








