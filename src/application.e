note
	description: "test application root class"
	date: "$Date: 2019-09-11 18:27:54 +0000 (Wed, 11 Sep 2019) $"
	revision: "$Revision: 103504 $"

class
	APPLICATION

create
	make

feature  -- Initialization

	make
			-- Run application.
		do
			create application
			create main_window.make_with_title ("Converter")

			application.post_launch_actions.extend (agent main_window.show)
			main_window.close_request_actions.extend (agent application.destroy)

			application.launch
		end

feature {NONE} -- Implementation

	application: EV_APPLICATION

	main_window: MAIN_WINDOW

end
