class SchemasController < ApplicationController
  # GET /schemas
  # GET /schemas.json
  def index
    @schemas = Schema.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schemas }
    end
  end

  # GET /schemas/1
  # GET /schemas/1.json
  def show
    @schema = Schema.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schema }
    end
  end

  # GET /schemas/new
  # GET /schemas/new.json
  def new
    @schema = Schema.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schema }
    end
  end

  # GET /schemas/1/edit
  def edit
    @schema = Schema.find(params[:id])
  end

  # POST /schemas
  # POST /schemas.json
  def create
    @schema = Schema.new(params[:schema])

    respond_to do |format|
      if @schema.save
        format.html { redirect_to @schema, notice: 'Schema was successfully created.' }
        format.json { render json: @schema, status: :created, location: @schema }
      else
        format.html { render action: "new" }
        format.json { render json: @schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schemas/1
  # PUT /schemas/1.json
  def update
    @schema = Schema.find(params[:id])

    respond_to do |format|
      if @schema.update_attributes(params[:schema])
        format.html { redirect_to @schema, notice: 'Schema was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schema.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemas/1
  # DELETE /schemas/1.json
  def destroy
    @schema = Schema.find(params[:id])
    @schema.destroy

    respond_to do |format|
      format.html { redirect_to schemas_url }
      format.json { head :no_content }
    end
  end
end
