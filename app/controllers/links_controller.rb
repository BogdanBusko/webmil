class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]


  # GET /links
  def index
    @links = Link.where(user_id: current_user.id)
  end

  # GET /links/1
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  def create
    @link = Link.new(link_params)

    @link.format_tag(params[:link][:tags])

    if @link.save
      redirect_to root_url, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /links/1
  def update
    @link.format_tag(params[:link][:tags])


    if @link.update(link_params)
      redirect_to root_url, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy

    redirect_to links_url
  end

  # GET /links/sport
  def by_tag
    @links = Link.where(tags: params[:tag], user_id: current_user.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def link_params
    params.require(:link).permit(:url, :description).merge(user_id: current_user.id)
  end
end
