class ContestsController < ApplicationController
  # GET /contests
  def index
    @contests = Contest.all
  end

  # GET /contests/1
  def show
    @contest = Contest.find(params[:id])
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # GET /contests/1/edit
  def edit
    @contest = Contest.find(params[:id])
  end

  # POST /contests
  def create
    @contest = Contest.new(params[:contest])

    if @contest.save
      redirect_to @contest, notice: 'Contest was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /contests/1
  def update
    @contest = Contest.find(params[:id])

    if @contest.update_attributes(params[:contest])
      redirect_to @contest, notice: 'Contest was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /contests/1
  def destroy
    @contest = Contest.find(params[:id])
    @contest.destroy

    redirect_to contests_url
  end
end
