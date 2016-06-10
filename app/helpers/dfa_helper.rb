module DfaHelper
	class dfa < Parent::Parent
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




	end #fin class
end #fin module