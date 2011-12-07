class FindsController < ApplicationController
  # GET /finds
  # GET /finds.json
  def index
    @search = User.search do
      fulltext params[:search]
    end
    @finds = @search.results
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @finds }
    end
  end

  # GET /finds/1
  # GET /finds/1.json
  def show
    @find = Find.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @find }
    end
  end

  # GET /finds/new
  # GET /finds/new.json
  def new
    @find = Find.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @find }
    end
  end

  # GET /finds/1/edit
  def edit
    @find = Find.find(params[:id])
  end

  # POST /finds
  # POST /finds.json
  def create
    @find = Find.new(params[:find])

    respond_to do |format|
      if @find.save
        format.html { redirect_to @find, notice: 'Find was successfully created.' }
        format.json { render json: @find, status: :created, location: @find }
      else
        format.html { render action: "new" }
        format.json { render json: @find.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /finds/1
  # PUT /finds/1.json
  def update
    @find = Find.find(params[:id])

    respond_to do |format|
      if @find.update_attributes(params[:find])
        format.html { redirect_to @find, notice: 'Find was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @find.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finds/1
  # DELETE /finds/1.json
  def destroy
    @find = Find.find(params[:id])
    @find.destroy

    respond_to do |format|
      format.html { redirect_to finds_url }
      format.json { head :ok }
    end
  end
end
