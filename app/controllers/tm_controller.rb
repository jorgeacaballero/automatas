class TmController < ApplicationController
	def index
        @tm = TmHelper::TM.new 
    end

    def compute
        hash = tm_params
        hash = JSON.parse(hash) if hash.is_a?(String)

        @tm = TmHelper::TM.new()     
        @tm.states = hash['states'].split(',')
        @tm.alphabet = hash['alphabet'].split(/\s*,\s*/)
        @tm.start = hash['start']
        @tm.transitions = {"A"=>{"0"=>{"to"=>"A", "write"=>0, "move"=>"R"}, "1"=>{"to"=>"B", "write"=>1, "move"=>"R"}}, "B"=>{"1"=>{"to"=>"B", "write"=>1, "move"=>"R"}, "0"=>{"to"=>"C", "write"=>0, "move"=>"R"}}, "C"=>{"1"=>{"to"=>"ACCEPT", "write"=>1, "move"=>"R"}, "0"=>{"to"=>"A", "write"=>0, "move"=>"R"}}}
        @tm.inputAlphabet = hash['inputAlphabet'].split(',')
        @tm.tapeAlphabet = hash['tapeAlphabet'].split(',')


        nodes = []
        edges = []

        @tm.states.each do |s|
            n = { data: { id: s }}
            nodes.push(n)
        end

        i = 1
        @tm.transitions.each do |keyt, valt|
          valt.each do |key, val|
            e = { data: {
              id: i.to_s,
              source: keyt,
              target: val['to'],
              label: "#{key} -> #{val['write'] ? val['write'] : '&'}, #{val['move']}"}
            }
            edges.push(e)
            i = i+1
          end
        end

        @bringElements = {
          nodes: nodes,
          edges: edges
        }.to_json.html_safe


    end

    def consume
        hash = tm_params
        hash = JSON.parse(hash) if hash.is_a?(String)
        
        @tm = TmHelper::TM.new()
        @tm.states = hash['states'].split(' ')
        @tm.alphabet = hash['alphabet'].split(' ')
        @tm.start = hash['start']
        @tm.transitions = {"A"=>{"0"=>{"to"=>"A", "write"=>0, "move"=>"R"}, "1"=>{"to"=>"B", "write"=>1, "move"=>"R"}}, "B"=>{"1"=>{"to"=>"B", "write"=>1, "move"=>"R"}, "0"=>{"to"=>"C", "write"=>0, "move"=>"R"}}, "C"=>{"1"=>{"to"=>"ACCEPT", "write"=>1, "move"=>"R"}, "0"=>{"to"=>"A", "write"=>0, "move"=>"R"}}}
        @tm.inputAlphabet = hash['inputAlphabet'].split(' ')
        @tm.tapeAlphabet = hash['tapeAlphabet'].split(' ')

        @compute = @tm.consume(hash['input_string'])

    end

    private
        def tm_params
          params.permit(:states, :alphabet, :start, :transitions, :input_string, :inputAlphabet, :tapeAlphabet)
        end
end