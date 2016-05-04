module ToyRobot

	class Robot
		
		def initialize()
			@_x         = nil
			@_y         = nil
			@_dir       = nil
			@placed     = false
			@directions = ['north', 'south', 'east', 'west']
		end

		def placed?
			return @placed
		end

		def place(params)
			split_params = params.split ','

			return false unless pos_ok? split_params[0].to_i
			@_x = split_params[0].to_i
			return false unless pos_ok? split_params[1].to_i
			@_y = split_params[1].to_i
			return false unless dir_ok? split_params[2]
			@_dir = split_params[2].to_sym

			@placed = true
			return true
		end

		def move
			return false unless can_move?
			return false unless @placed

			case @_dir
			when :north
				@_x -= 1
			when :south
				@_x += 1
			when :east
				@_y += 1
			when :west
				@_y -= 1
			end
			return true
		end

		def left
			return false unless @placed

			case @_dir
			when :north
				@_dir = :west
			when :south
				@_dir = :east
			when :east
				@_dir = :north
			when :west
				@_dir = :south
			end
			return true
		end

		def right
			return false unless @placed

			case @_dir
			when :north
				@_dir = :east
			when :south
				@_dir = :west
			when :east
				@_dir = :south
			when :west
				@_dir = :north
			end
			return true
		end

		def report
			return false unless @placed

			return @_x, @_y, @_dir
		end

		private 

			def pos_ok?(pos)
				return false unless pos >= 0 && pos <= 5
				return true
			end

			def dir_ok?(dir)
				return false unless @directions.include? dir
				return true
			end

			def can_move?
				case @_dir
				when :north
					return false if (@_x - 1) < 0
				when :south
					return false if (@_x + 1) > 5
				when :east
					return false if (@_y + 1) > 5
				when :west
					return false if (@_y - 1) < 0
				end
				return true
			end

	end

end