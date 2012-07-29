class Dictionary 
  include Mongoid::Document

  field :column, type: String
  field :conditional, type: String
  field :keypart, type: String
  field :alias, type: String
  field :datatype, type: String
  field :filltype, type: String
  field :sm, type: String
  field :default, type: String
  field :conversion, type: String
  field :validation, type: String
  field :options, type: String
  field :label, type: String
  field :display, type: String
  field :characteristics, type: String
end
