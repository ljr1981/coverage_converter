note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	CONVERTER_TEST_SET

inherit
	TEST_SET_SUPPORT

feature -- Test routines

	covert_tests
			-- New test routine
		note
			testing:
				"covers/{CONVERTER}.convert_tool_to_coverage",
				"covers/{CONVERTER}.default_create",
				"covers/{STRING_8}.twin",
				"execution/isolated"
		local
			l_converter: CONVERTER
			l_test: STRING
		do
			create l_converter
			l_test := l_converter.convert_tool_to_coverage (coverages.twin)
			assert_strings_equal ("converted", converted, l_test)
		end

feature {NONE} -- Support

	converted: STRING = "[
"covers/{ARRAYED_LIST}.count",
"covers/{JSON_SERIALIZATION}.from_json_string",
"covers/{JSON_SERIALIZATION}.has_deserialization_error",
"covers/{JSON_SERIALIZATION}.to_json",
"covers/{JSON_TEST_SET}.assert_integers_equal",
"covers/{JSON_TEST_SET}.assert_strings_equal",
"covers/{JSON_TEST_SET}.Empty_task_list_json",
"covers/{JSON_TEST_SET}.Json_string_with_task_list",
"covers/{JSON_VALUE}.representation",
"covers/{TK_BIZ}.default_create",
"covers/{TK_BIZ}.Json_converter",
"covers/{TK_TASK}.make",
"covers/{TK_TASK_LIST}.add_task",
"covers/{TK_TASK_LIST}.default_create",
"covers/{TK_TASK_LIST}.items",
"covers/{TK_TASK_LIST}.set_name",
"covers/{TK_TASK_LIST}.set_task"
]"

	coverages: STRING = "[
json_serialization_tests from JSON_TEST_SET
	ARRAYED_LIST
		count
	JSON_SERIALIZATION
		from_json_string
		has_deserialization_error
		to_json
	JSON_TEST_SET
		assert_integers_equal
		assert_strings_equal
		Empty_task_list_json
		Json_string_with_task_list
	JSON_VALUE
		representation
	TK_BIZ
		default_create
		Json_converter
	TK_TASK
		make
	TK_TASK_LIST
		add_task
		default_create
		items
		set_name
		set_task
]"

end


