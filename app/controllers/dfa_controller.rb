require 'json'

class DfaController < ApplicationController
    def index
        @dfa = DfaHelper::DFA.new 
    end

    def compute
        hash = dfa_params
        hash = JSON.parse(hash) if hash.is_a?(String)

        @dfa = DfaHelper::DFA.new()     
        @dfa.states = hash['states'].split(',')
        @dfa.alphabet = hash['alphabet'].split(/\s*,\s*/)
        @dfa.start = hash['start']
        @dfa.accept = hash['accept'].split(/\s*,\s*/)
        @dfa.transitions = {"q1"=>{"0"=>"q2", "1"=>"q1"}, "q2"=>{"0"=>"q3", "1"=>"q1"}, "q3"=>{"0"=>"q3", "1"=>"q4"}, "q4"=>{"0"=>"q4", "1"=>"q4"}}
    end

    private
        def dfa_params
          params.permit(:states, :alphabet, :start, :accept, :transitions)
        end
end
