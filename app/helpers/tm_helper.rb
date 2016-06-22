module TmHelper
	class TM < Parent::Parent
		attr_accessor :inputAlphabet, :tapeAlphabet, :tape, :reject

		def initialize(elements={})
			yaml = {}
			yaml = YAML::load_file(elements[:file]) if elements.has_key? :file
			super(elements)
			@inputAlphabet = elements[:inputAlphabet] || yaml['inputAlphabet']
			@tapeAlphabet = elements[:tapeAlphabet] || yaml['tapeAlphabet']
			@tape = TMTape.new
			@accept = false
			@reject = false
		end

		def feed(input) 
			@tape = TMTape.new(input)
			@accept = false
			@reject = false
			movements = []
			stateHead = @start.to_s
			movements.push({state: stateHead, via: "-"})
			input.each_char do |symbol|
				toState = transition(stateHead, symbol)
				movements.push({state: toState, via: symbol})
				if @accept || @reject
					break
				else
					stateHead = toState
				end
			end
		      
			resp = {
				input: input,
				movements: movements,
				accept: @accept,
				reject: @reject,
				head: stateHead,
				tape: @tape.storage,
				output: @tape.output
			}
			resp
		end

		def accepts?(input)
			resp = feed(input)
			resp[:accept]
		end

		def rejects?(input)
			resp = feed(input)
			resp[:reject]
		end

		def transition(state, symbol)
			actions = @transitions[state][symbol]
			@tape.transition(symbol, actions['write'], actions['move'])

			@accept = true if actions['to'] == 'ACCEPT'
			@reject = true if actions['to'] == 'REJECT'
			@head = actions['to']
		end

		def has_transition?(state, read)
			return false unless @transitions.include? state
			@transitions[state].has_key? read
		end
	end

	class TMTape
		attr_accessor :storage

		def initialize(elements=nil)
			if elements
				@storage = []
				@storage << '@' unless elements[0] == '@'
				@storage += elements.split('')
				@storage << '@' unless elements[-1] == '@'
				@head = 1
			end
		end

		def transition(read, write, move)
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

		def output
			@storage.join.sub(/^@*/, '').sub(/@*$/, '')
		end
	end
end

