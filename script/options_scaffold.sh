class Option
	include Mongoid::Document
	field :k1, as: :collection, type: string
	field :n01, as: :account, type: string
	field :n02, as: :Description, type: text
	field :n03, as: :List, type: array

	field :n10, as: :XCol
	field :n11, as: :YRow
	field :n12, as: :Width
	field :n13, as: :Height
	field :n14, as: :Align
	field :n15, as: :Position
	field :n16, as: :Selection
	field :n17, as: :Buttons
	field :n18, as: :BkColor
	field :n19, as: :Font
	field :n20, as: :Colhead, type: array
	field :n21, as: :Just_Head, type: array
	field :n22, as: :Just_Data, type: array
	field :n23, as: :Colwidth, type: array
	field :n24, as: :Conversion, type: array
	field :n25, as: :Show, type: array
	field :n26, as: :Return, type: array
	field :n27, as: :DataColumn, type: array
	field :n28, as: :DataTable, type: array
	field :n29, as: :Unprotect, type: array
	field :n30, as: :Col1, type: array
	field :n31, as: :Col2, type: array
	field :n32, as: :Col3, type: array
	field :n33, as: :Col4, type: array
	field :n34, as: :Col5, type: array
	field :n35, as: :Col6, type: array
	field :n36, as: :Col7, type: array
	field :n37, as: :Col8, type: array
	field :n38, as: :Col9, type: array
	field :n39, as: :Col10, type: array
end