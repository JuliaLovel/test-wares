class Address 
  include Mongoid::Document 

  field :n10, as: :cod, type: Boolean 

end