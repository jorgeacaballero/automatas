module DfaHelper
	class DFA < Parent::Parent
		def check?
			@transitions.each do |key, val|
				@alphabet.each do |a| 
					return false unless @transitions[key].has_key? a.to_s
				end
			end
            resp = {
                check: true,
                states: @states,
                alphabet: @alphabet,
                start: @start,
                accept_state: @accept,
                transitions: @transitions
            }
            resp
		end

		def consume(input)
			head = @start.to_s
            movements = []
			input.each_char { 
                |symbol| head = @transitions[head][symbol]
                movements.push(head)
            }
			accept = is_accept_state? head
			resp = {
				input: input,
				accept: accept,
				head: head,
                movements: movements,
                states: @states,
                alphabet: @alphabet,
                start: @start,
                accept_state: @accept,
                transitions: @transitions
			}
			resp
		end

		def accepts?(input)
			resp = feed(input)
			resp[:accept]
		end

		def is_accept_state?(state)
			@accept.include? state.to_s
		end
	end
end
