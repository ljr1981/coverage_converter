note
	description: "Converter"

class
	CONVERTER

feature

	convert_tool_to_coverage (a_results: STRING): STRING
		local
			l_list: LIST [STRING]
			l_class,
			l_feature: detachable STRING
		do
			create Result.make_empty
			l_list := a_results.split ('%N')
			⟳ ic:l_list ¦ ic.adjust ⟲ -- remove leading/trailing spaces/tabs
			-- "covers/{JSON_HANDLER}.default_create",
			⟳ ic:l_list ¦
				if ic.has_substring (" from ") then
					do_nothing
				elseif attached {STRING} ic.twin as al_line then
					al_line.to_upper
					if al_line.same_string (ic) then
						l_class := ic
						l_feature := Void
					elseif attached l_class then
						l_feature := ic
					end
				end
				if attached l_class and then attached l_feature then
					Result.append_string_general (coverage_template.twin)
					Result.replace_substring_all ("<<CLASS>>", l_class)
					Result.replace_substring_all ("<<FEATURE>>", l_feature)
					Result.append_character (',')
					Result.append_character ('%N')
				end
			⟲
			if Result.count > 0 then
				Result.remove_tail (2)
			end
		end

	coverage_template: STRING = "[
"covers/{<<CLASS>>}.<<FEATURE>>"
]"

end
