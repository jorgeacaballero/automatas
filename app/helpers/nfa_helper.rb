module NfaHelper
	class Nfa < Parent::Parent
		def consume(input)
			heads = [@start]


			if has_transition?(@start, '&')
			transition(@start, '&').each { |h| heads << h } 
			end
			input.each_char do |symbol|
			newHeads, eTrans = [], []
			heads.each do |head|
				if has_transition?(head, symbol)
					transition(head, symbol).each { |t| newHeads << t }
				end
			end
			newHeads.each do |head|
				if has_transition?(head, '&')
					transition(head, '&').each { |t| eTrans << t }
				end
			end
			eTrans.each { |t| newHeads << t }		        
			heads = newHeads
			break if heads.empty?
			end


			accept = false
			heads.each { |head| accept = true if accept_state? head }

			resp = {
			input: input,
			accept: accept,
			heads: heads
			}
		end


		def accepts?(input)
			resp = consume(input)
			resp[:accept]
		end

		def transition(state, symbol)
			dests = @transitions[state][symbol]
			dests = [dests] unless dests.kind_of? Array
			dests
		end
		
		def has_transition?(state, symbol)
			return false unless @transitions.include? state
			@transitions[state].has_key? symbol
		end

		def accept_state?(state)
			@accept.include? state
		end

	end
end
