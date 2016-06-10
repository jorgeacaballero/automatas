module TmHelper
	class TM < Parent::Parent
		def initialize(elements={})
			yaml = {}
			yaml = YAML::load_file(elements[:file]) if elements.has_key? :file
			super(elements)
			@inputAlphabet = elements[:inputAlphabet] || yaml['inputAlphabet']
			@tapeAlphabet = elements[:tapeAlphabet] || yaml['tapeAlphabet']
			@tape = Tape.new
			@accept = false
			@reject = false
		end
	end

	class TMTape
		attr_accessor :storage

		def initialize(input=nil)
			if input
				@storage = []
				@storage << '@' unless input[0] == '@'
				@storgae += input.split('')
				@storage << '@' unless input[-1] == '@'
				@head = 1
			end
		end

		def delta(read, write, move)
			if read == @storage[@head]
				@storage[@head] = write
				case move
				when 'R'
					@storage << '@' if @storage[@head +1]
					@head += 1
				when 'L'
					@storage.unshift('@') if @head == 0
					@head -= 1
				end
				return true
			else
				return false
			end
		end

		def response
			@storage.join.sub(/^@*/, '').sub(/@*$/, '')
		end
	end
end

