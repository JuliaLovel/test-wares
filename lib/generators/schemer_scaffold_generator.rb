class SchemerScaffoldGenerator < Rails::Generators::Base
  def create_schemer_scaffold
    #Look through all of the scheme records
    @schemes = Scheme.all
    @schemes.each do |scheme|
      
      #The Model
      @model = scheme.collectionname.singularize.downcase
      @model_file = "app/models/#{@model}.rb"
      #If the Model file exists, add the column
      if File.exists?(@model_file)
        puts "Skipping #{@model_file} - model file already exists."
        #TODO: Check if this field exists, don't add it if it does.
        insert_into_file @model_file, :after => "class #{@model.constantize} \n  include Mongoid::Document \n" do 
          "  field :#{scheme.column}, as: :#{scheme.alias}, type: #{scheme.datatype.capitalize} \n"
        end
      #If the model file doesn't exist, create it and add the column
      else
        puts "Creating #{@model_file}..."
        create_file @model_file, "class #{@model.constantize} \n  include Mongoid::Document \n
  field :#{scheme.column}, as: :#{scheme.alias}, type: #{scheme.datatype.capitalize} \n
end"
      end
      
      #The Routes
      @routes_file = "config/routes.rb"
      @resources_name = scheme.collectionname.pluralize.downcase
      if File.exists?(@routes_file)
        insert_into_file @routes_file, :after => "Application.routes.draw do \n" do
          "  resources :#{@resources_name}"
        end
      end
      
      #The Views
      #Index View
      @index_view = "app/views/#{@model}/index.html.erb"
      if File.exists?(@index_view)
        puts "Skipping #{@index_view} - index view file already exists."
        #TODO: Check if this field exists, don't add it if it does.
        insert_into_file @index_view, :after => "<h1>Listing #{@model.constantize.pluralize}</h1> \n" do 
          "
            <table> \n
              <tr> \n  
                <th>#{scheme.alias.constantize}</th> \n
              </tr> \n
            </table> \n
            <%= link_to 'New #{scheme.alias.constantize}', new_#{scheme.alias}_path %>
          "
        end
      else
        puts "Creating #{@index_view}..."
        create_file @index_view, "<h1>Listing #{@model.constantize.pluralize}</h1> \n"
      end
      
      #Show View
    
	  #Form View
		
	  #New View
		
	  #Edit View
    end

  end
end