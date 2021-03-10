note
	description: "Main Window"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			create_interface_objects,
			initialize,
			make_with_title
		end

create
	make_with_title

feature {NONE} -- Initialization

	create_interface_objects
			--<Precursor>
		do
			create main_box
			create text_field
			create convert_btn.make_with_text ("Convert")
			Precursor
		end

	initialize
			--<Precursor>
		do
			Precursor
			extend (main_box)
			main_box.extend (text_field)
			main_box.extend (convert_btn)
			main_box.disable_item_expand (convert_btn)
			main_box.set_padding (3)
			main_box.set_border_width (3)
			convert_btn.select_actions.extend (agent on_convert)
		end

	make_with_title (a_title: READABLE_STRING_GENERAL)
			--<Precursor>
		do
			Precursor (a_title)
			set_size (800, 600)
		end

feature {NONE} -- Implementation

	on_convert
			--
		local
			l_conv: CONVERTER
		do
			create l_conv
			text_field.set_text (l_conv.convert_tool_to_coverage (text_field.text))
		end

	main_box: EV_VERTICAL_BOX

	text_field: EV_TEXT

	convert_btn: EV_BUTTON

end
