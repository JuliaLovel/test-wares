class SchemerScaffoldGenerator < Rails::Generators::Base
  def create_schemer_scaffold
    #Look through all of the schema records
    @schemas = Schema.all
    @schemas.each do |schema|
      
      #The Model
      @model = schema.collectionname.singularize.downcase
      @model_file = "app/models/#{@model}.rb"
      #If the Model file exists, add the column
      if File.exists?(@model_file)
        puts "Skipping #{@model_file} - model file already exists."
        #TODO: Check if this field exists, don't add it if it does.
        insert_into_file @model_file, :after => "class #{@model.constantize} \n  include Mongoid::Document \n" do 
          "  field :#{schema.column}, as: :#{schema.alias}, type: #{schema.datatype.capitalize} \n"
        end
      #If the model file doesn't exist, create it and add the column
      else
        puts "Creating #{@model_file}..."
        create_file @model_file, "class #{@model.constantize} \n  include Mongoid::Document \n
  field :#{schema.column}, as: :#{schema.alias}, type: #{schema.datatype.capitalize} \n
end"
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
                <th>#{schema.alias.constantize}</th> \n
              </tr> \n
            </table> \n
            <%= link_to 'New #{schema.alias.constantize}', new_#{schema.alias}_path %>
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