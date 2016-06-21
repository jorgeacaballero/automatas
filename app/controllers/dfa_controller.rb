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
        @dfa.transitions = {
          "q1" => {
            "0" => "q2",
            "1" => "q1"
          },
          "q2" => {
            "0" => "q3",
            "1" => "q1"
          },
          "q3" => {
            "0" => "q3",
            "1" => "q4"
          },
          "q4" => {
            "0" => "q4",
            "1" => "q4"
          }
      }

      nodes = []
      edges = []

      @dfa.states.each do |s|
        n = { data: { id: s } }
        nodes.push(n)
      end

      i = 1
      @dfa.transitions.each do |keyt, valt|
        valt.each do |key, val|
          n = { data: { id: i.to_s, source: keyt, target: val, label: key } }
          edges.push(n)
          i = i+1
        end
      end

      @churro = {
          nodes: nodes,
          edges: edges
        }.to_json.html_safe
    end

    def consume
        hash = dfa_params
        hash = JSON.parse(hash) if hash.is_a?(String)

        @dfa = DfaHelper::DFA.new()
        @dfa.states = hash['states'].split(' ')
        @dfa.alphabet = hash['alphabet'].split(' ')
        @dfa.start = hash['start']
        @dfa.accept = hash['accept'].split(' ')
        @dfa.transitions = {"q1"=>{"0"=>"q2", "1"=>"q1"}, "q2"=>{"0"=>"q3", "1"=>"q1"}, "q3"=>{"0"=>"q3", "1"=>"q4"}, "q4"=>{"0"=>"q4", "1"=>"q4"}}

        @compute = @dfa.consume(hash['input_string'])

    end

    private
        def dfa_params
          params.permit(:states, :alphabet, :start, :accept, :transitions, :input_string)
        end
end
