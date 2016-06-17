require 'json'
class PdaController < ApplicationController

	def index
        @pda = PdaHelper::DFA.new 
    end

    def compute
        hash = pda_params
        hash = JSON.parse(hash) if hash.is_a?(String)

        @pda = DfaHelper::DFA.new()     
        @pda.states = hash['states'].split(',')
        @pda.alphabet = hash['alphabet'].split(/\s*,\s*/)
        @pda.start = hash['start']
        @pda.accept = hash['accept'].split(/\s*,\s*/)
        @pda.transitions = ""
    end
    def consume
        hash = pda_params
        hash = JSON.parse(hash) if hash.is_a?(String)
        
        @pda = DfaHelper::DFA.new()
        @pda.states = hash['states'].split(' ')
        @pda.alphabet = hash['alphabet'].split(' ')
        @pda.start = hash['start']
        @pda.accept = hash['accept'].split(' ')
        @pda.transitions = ""
        @compute = @pda.consume(hash['input_string'])
    end

    private
        def pda_params
          params.permit(:states, :alphabet, :start, :accept, :transitions, :input_string)
        end
end
