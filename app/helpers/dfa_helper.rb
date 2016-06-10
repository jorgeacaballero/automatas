module DfaHelper
	class dfa < Parent::Parent
		def check?
      # @todo Check that each state is connected.
      #   Iterate through each states to verify the graph
      #   is not disjoint.
      		@transitions.each do |key, val|
        	@alphabet.each do |a| 
          return false unless @transitions[key].has_key? a.to_s
        end
      end
      return true
    end #fin class
end #fin module


#linea de prueba para el ssh
