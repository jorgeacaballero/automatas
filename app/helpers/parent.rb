module Parent
	class Parent
		attr_accessor :states, :alphabet, :start, :accept, :transitions
		def initialize(elements={})
			yaml = {}
			yaml = YAML::load_file(elements[:file]) if elements.has_key? :file
			@states = yaml['states'] || elements[:states]
			@alphabet = yaml['alphabet'] || elements[:alphabet]
			@start = yaml['start'] || elements[:start]
			@accept = yaml['accept'] || elements[:accept]
			@transitions = yaml['transitions'] || elements[:transitions]
			@transitions = Hash.keys_to_strings(@transitions)
		end
	end

	class Hash
		def self.keys_to_strings(element)
			return element unless element.kind_of? Hash
			element = element.inject({}){|h,(k,v)| h[k.to_s] = Hash.keys_to_strings(v); h}
			return element
		end
	end
end
