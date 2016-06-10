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


		      resp = {
		        input: input,
		        accept: accept,
		        heads: heads
		      }
	    end


	end
end
