module DfaHelper
	class DFA < Parent::Parent
		def check?
			@transitions.each do |key, val|
				@alphabet.each do |a| 
					return false unless @transitions[key].has_key? a.to_s
				end
			end
		return true
		end

		def consume(input)
			head = @start.to_s
			input.each_char { |symbol| head = @transitions[head][symbol] }
			accept = is_accept_state? head
			resp = {
				input: input,
				accept: accept,
				head: head 
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