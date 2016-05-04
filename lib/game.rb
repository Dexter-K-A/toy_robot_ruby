module ToyRobot

	class Game

		def initialize(argv)
			@display = HighLine.new
			@robot = Robot.new
			@running = true
			@commands = ['place', 'move', 'left', 'right', 'report', 'end']
		end

		def run
			while @running

				@command = @display.ask "Command: "

				if @command.include? 'place'
					@robot.place @command.delete 'place '
					@display.say @display.color('IGNORED! invalid params or robot is off table', :red) unless @robot.placed?

				elsif !@commands.include? @command
					@display.say @display.color 'Command Does not exist [place, move, left, right, report, end] only!', :red

				else

					if @command == 'end'
						@running = false
					elsif @command == 'report' && @robot.report != false
						x, y, dir = @robot.report
						@display.say @display.color "Position: #{x}, #{y}, #{dir}\n", :green
					elsif @robot.send @command
						@display.say @display.color 'Done!', :green
					else
						@display.say @display.color 'IGNORED! I cannot do that!', :red
					end

				end

			end
		end

	end

end