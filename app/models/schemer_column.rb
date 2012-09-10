class SchemerColumn
  include Mongoid::Document
 
  embedded_in :scheme
  
  field :k01, as: :dataset, type: String
  field :k02, as: :colname, type: String
  field :k03, as: :conditional, type: String #A state of the view (if a field is selected, etc.)
  field :k04, as: :formname, type: String    #A particular view file
  field :n04, as: :keypart, type: String
  field :n05, as: :colalias, type: String
  field :n06, as: :datatype, type: String
  field :n07, as: :filltype, type: String
  field :n08, as: :sm, type: String
  field :n09, as: :defaultval, type: String
  field :n10, as: :conversion, type: String
  field :n11, as: :validation, type: String
  field :n12, as: :options, type: String
  field :n13, as: :label, type: String
  field :n14, as: :displaytype, type: String
  field :n15, as: :characteristics, type: String
  field :n16, as: :justlen, type: String
  
end
