class Scheme
  include Mongoid::Document
  include Mongoid::Paperclip
  require 'json'
  
  has_mongoid_attached_file :json_scaffold
  
  #after_create :parse_json_scaffold
  
  field :n01, as: :dataset, type: String
  field :n02, as: :column, type: String
  field :n03, as: :conditional, type: String
  field :n04, as: :keypart, type: String
  field :n05, as: :alias, type: String
  field :n06, as: :datatype, type: String
  field :n07, as: :filltype, type: String
  field :n08, as: :sm, type: String
  field :n09, as: :default, type: String
  field :n10, as: :conversion, type: String
  field :n11, as: :validation, type: String
  field :n12, as: :options, type: String
  field :n13, as: :label, type: String
  field :n14, as: :display, type: String
  field :n15, as: :characteristics, type: String
  field :n16, as: :from_file, type: Boolean
  
  def parse_json_scaffold
    if self.from_file == true
      @file = File.read(self.json_scaffold.path)
      @json_scaffold = JSON.load(@file)
      puts @json_scaffold.inspect
    end
  end
end
