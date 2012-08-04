class SchemerScaffoldGenerator < Rails::Generators::Base
  def create_schemer_scaffold
    #Look through all of the dictionary records
    @dictionaries = Dictionary.all
    @dictionaries.each do |dictionary|
      #Add or update this column in the model
      @model = dictionary.collectionname.singularize.downcase
      @model_file = "app/models/#{@model}.rb"
      if File.exists?(@model_file)
        puts "Skipping #{@model_file} - model file already exists."
        #TODO: Check if this field exists, don't add it if it does.
        insert_into_file @model_file, :after => "class #{@model.capitalize} \n  include Mongoid::Document \n" do 
          "  field :#{dictionary.column}, as: :#{dictionary.alias}, type: #{dictionary.datatype.capitalize} \n"
        end
      else
        puts "Creating #{@model_file}..."
        create_file "app/models/#{@model}.rb", "class #{@model.capitalize} \n  include Mongoid::Document \n
  field :#{dictionary.column}, as: :#{dictionary.alias}, type: #{dictionary.datatype.capitalize} \n
end"
      end
    end
  end
end