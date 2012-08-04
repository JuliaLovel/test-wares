class Option
	include Mongoid::Document
	field :k1, as: :listname, type: string
	field :n01, as: :account, type: string
	field :n02, as: :description, type: text
	field :n03, as: :list, type: array

	field :n10, as: :xcol
	field :n11, as: :yrow
	field :n12, as: :width
	field :n13, as: :height
	field :n14, as: :align
	field :n15, as: :position
	field :n16, as: :selection
	field :n17, as: :buttons
	field :n18, as: :bk_color
	field :n19, as: :font
	field :n20, as: :col_head, type: array
	field :n21, as: :just_head, type: array
	field :n22, as: :just_data, type: array
	field :n23, as: :col_width, type: array
	field :n24, as: :conversion, type: array
	field :n25, as: :show, type: array
	field :n26, as: :return, type: array
	field :n27, as: :data_column, type: array
	field :n28, as: :data_table, type: array
	field :n29, as: :unprotect, type: array
	field :n30, as: :col1, type: array
	field :n31, as: :col2, type: array
	field :n32, as: :col3, type: array
	field :n33, as: :col4, type: array
	field :n34, as: :col5, type: array
	field :n35, as: :col6, type: array
	field :n36, as: :col7, type: array
	field :n37, as: :col8, type: array
	field :n38, as: :col9, type: array
	field :n39, as: :col10, type: array
end