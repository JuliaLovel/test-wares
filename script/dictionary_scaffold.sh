#! /bin/bash
# Create dictionaries migration and scaffold 

cd ~/Projects/test-wares
rails g scaffold dictionary \
collection:string \
column:string \
conditional:string \
keypart: \
alias: \
datatype: \
filltype: \
sm: \
default: \
conversion: \
validation: \
options: \
label: \
display: \
characteristics:
rake db:migrate

 
class Dictionary
	include Mongoid::Document
	field :k1, as: :collection, type: String
	field :k2, as: :column, type: String
	field :k3, as: :conditional, type: String, default: -> "^"
	field :n01, as: :keypart
	field :n02, as: :alias
	field :n03, as: :datatype
	field :n04, as: :filltype
	field :n05, as: :sm
	field :n06, as: :default
	field :n08, as: :conversion
	field :n09, as: :validation
	field :n10, as: :options
	field :n11, as: :label
	field :n12, as: :display
	field :n13, as: :characteristics
end
