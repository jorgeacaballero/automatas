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

	end
end
