class SchemesController < ApplicationController

 require 'csv'
  
  def index
    @schemes = Scheme.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schemes }
    end
  end

  # GET /schemes/1
  # GET /schemes/1.json
  def show
    @scheme = Scheme.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scheme }
    end
  end

  # GET /schemes/new
  # GET /schemes/new.json
  def new
    @scheme = Scheme.new
    @scheme.schemer_columns.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scheme }
    end
  end

  # GET /schemes/1/edit
  def edit
    @scheme = Scheme.find(params[:id])
  end

  # POST /schemes
  # POST /schemes.json
  def create
    @scheme = Scheme.new(params[:scheme])

    respond_to do |format|
      if @scheme.save
        if @scheme.from_file == true
          #TODO: Get this working right depending on file extension
          if @scheme.json_scaffold.content_type == "application/octet-stream"
			@file = File.read(@scheme.json_scaffold.path)
			@json_scaffold = JSON.parse(@file)
			puts @json_scaffold.inspect
			@scheme.collectionname = @json_scaffold["collectionname"]
			@json_scaffold["columns"].each do |col|
			  puts col.to_hash.with_indifferent_access
			  begin
			    @scheme.schemer_columns.create!(col.to_hash.symbolize_keys)
			  rescue Exception => e
				puts e.to_s
			  end
			end
			@scheme.save
		  elsif @scheme.json_scaffold.content_type == "text/csv"
		    @file = File.read(@scheme.json_scaffold.path)
		    begin
		      csv = CSV.parse(@file, :headers => true)
		    rescue Exception => e
		      puts e.to_s
		    end
		    unless csv.nil?
			  csv.each do |row|
			    row = row.to_hash.with_indifferent_access
			    @row_hash = row.to_hash.symbolize_keys
			    puts @row_hash
			    @scheme.collectionname = @row_hash["dataset"]
			    begin
				  @scheme.schemer_columns.create!(row.to_hash.symbolize_keys)
			    rescue Exception => e
				  puts e.to_s
			    end
			  end
		    end
		    @scheme.save
		  else
		  #TODO: Txt/CSV, XML
		  end
		end
        format.html { redirect_to @scheme, notice: 'Scheme was successfully created.' }
        format.json { render json: @scheme, status: :created, location: @scheme }
      else
        format.html { render action: "new" }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schemes/1
  # PUT /schemes/1.json
  def update
    @scheme = Scheme.find(params[:id])

    respond_to do |format|
      if @scheme.update_attributes(params[:scheme])
        format.html { redirect_to @scheme, notice: 'Scheme was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schemes/1
  # DELETE /schemes/1.json
  def destroy
    @scheme = Scheme.find(params[:id])
    @scheme.destroy

    respond_to do |format|
      format.html { redirect_to schemes_url }
      format.json { head :no_content }
    end
  end
end
