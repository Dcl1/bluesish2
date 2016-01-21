VideoInfo.provider_api_keys = { youtube: 'AIzaSyAdoZSg-_HK4ZWzg487jFBZ__gvpuU_L5k', vimeo: '963948cf67b44888a16404c0085dbf2f'}

class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :set_board

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @iframe = @video.iFrame_Source.html_safe
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    @video.board_id = @board.id

    urlVideo = VideoInfo.new(@video.source)


    @video.iFrame_Source = urlVideo.embed_code
    @video.title = urlVideo.title
    @video.date = urlVideo.date
    @video.provider = urlVideo.provider
    @video.description = urlVideo.description
    @video.smaller_thumbnail = urlVideo.thumbnail_small
    @video.larger_thumbnail = urlVideo.thumbnail_large


    respond_to do |format|
      if @video.save
        format.html { redirect_to board_video_path(@board, @video), notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to board_video_path(@board, @video), notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_board
      @board = Board.find(params[:board_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :source, :board_id, :iFrame_Source, :type)
    end
end


















