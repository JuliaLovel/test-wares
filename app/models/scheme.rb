class Scheme
  include Mongoid::Document
  include Mongoid::Paperclip
  require 'json'
  
  embeds_many :schemer_columns
  accepts_nested_attributes_for :schemer_columns
  
  has_mongoid_attached_file :json_scaffold,  
    :path => ":rails_root/public/system/schemes/json_scaffolds/:id/:filename",
    :url => "system/schemes/json_scaffolds/:id/:filename"
  
  field :n01, as: :collectionname, type: String
  field :n02, as: :relationships, type: Array
  field :n03, as: :from_file, type: Boolean
  
end
