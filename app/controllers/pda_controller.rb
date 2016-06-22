require 'json'
class PdaController < ApplicationController

	def index
        @pda = PdaHelper::PDA.new
    end

    def compute
        hash = pda_params
        hash = JSON.parse(hash) if hash.is_a?(String)

        # Accepts balanced parentheses only. (((()))) Accept  ((()) Reject
        #
        # '@' to represent delta
        # '&' to represent ε-transitions

        @pda = PdaHelper::PDA.new
        @pda.states = hash['states'].split(',') # ["S", "A", "B", "ha"]
        @pda.alphabet = hash['alphabet'].split(/\s*,\s*/) # ["(", ")", "&"]
        @pda.start = hash['start'] # "S"
        @pda.accept = hash['accept'].split(/\s*,\s*/) # "ha"
        @pda.stack_user = hash['stack_user'].split(/\s*,\s*/)
        @pda.transitions = {"S" => {
                              "&"=> {
                                "to"=>"A",
                                "push"=>"@"
                               }
                            },
                            "A" => {
                              "(" => {
                                "to"=>"A",
                                "push"=>"x"
                               },
                               ")" => {
                                "to"=>"B",
                                "pop"=>"x"
                               }
                            },
                            "B" => {
                              "(" => {
                                "to"=>"A", # |x| x['to'] => "A"
                                "push"=>"x"
                              },
                              ")" => {
                                "to"=>"B",
                                "pop"=>"x"
                              },
                              "&" => {
                                "to"=>"ha",
                                "pop"=>"@"
                              }
                            }
                        }



        nodes = []
        edges = []

        @pda.states.each do |s|
            n = { data: { id: s }}
            nodes.push(n)
        end

        i = 1
        @pda.transitions.each do |keyt, valt|
          valt.each do |key, val|
            e = { data: {
              id: i.to_s,
              source: keyt,
              target: val['to'],
              label: "#{key}, #{val['pop'] ? val['pop'] : '&'} -> #{val['push'] ? val['push'] : '&'}"}
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
        hash = pda_params
        hash = JSON.parse(hash) if hash.is_a?(String)

        @pda = PdaHelper::PDA.new
        @pda.states = hash['states'].split(' ')
        @pda.alphabet = hash['alphabet'].split(' ')
        @pda.start = hash['start']
        @pda.accept = hash['accept'].split(' ')
        @pda.stack_user = hash['stack_user'].split(' ')
        @pda.transitions = {"S"=>{"&"=>{"to"=>"A", "push"=>"@"}},
                            "A"=>{"("=>{"to"=>"A", "push"=>"x"}, ")"=>{"to"=>"B", "pop"=>"x"}},
                            "B"=>{"("=>{"to"=>"A", "push"=>"x"}, ")"=>{"to"=>"B", "pop"=>"x"},
                            "&"=>{"to"=>"ha", "pop"=>"@"}}
                        }
        @compute = @pda.consume(hash['input_string'])

        nodes = []
        edges = []

        @pda.states.each do |s|
            n = { data: { id: s }}
            nodes.push(n)
        end

        i = 1
        @pda.transitions.each do |keyt, valt|
          valt.each do |key, val|
            e = { data: {
              id: i.to_s,
              source: keyt,
              target: val['to'],
              label: "#{key}, #{val['pop'] ? val['pop'] : '&'} -> #{val['push'] ? val['push'] : '&'}"}
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

    private
        def pda_params
          params.permit(:states, :alphabet, :start, :accept, :transitions, :input_string, :stack_user)
        end
end
