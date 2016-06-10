module PdaHelper

	class Pda < Nfa::NfaHelper

		def initialize(params={})
			super(params)
			@alphabet << '&' unless !@alphabet || @alphabet.include?('&')
			@stack = []
		end

		def accepts?(input)
			resp = feed(input)
			resp[:accept]
		end

    # Determines the transition states, if any, from a given 
    # beginning state and input symbol pair.
    #
    # @param [String] state state label for beginning state.
    # @param [String] symbol input symbol.
    # @return [Array] Array of destination transition states.
    def transition(state, symbol, stackTop=nil)
      dests = []

      if has_transition?(state, symbol)
        actions = @transitions[state][symbol]
        stackTop ||= @stack.last
        able = true
        @stack.push actions['push'] if actions['push']
        if actions['pop']
          able = false unless stackTop == actions['pop']
          @stack.pop if able
        end
        if able
          dests << actions['to']

          if has_transition?(actions['to'], '&')
            actions = @transitions[actions['to']]['&']
            able = true
            @stack.push actions['push'] if actions['push']
            if actions['pop']
              able = false unless @stack.last == actions['pop']
              @stack.pop if able
            end
            if able
              dests << actions['to']
            end
          end
          dests
        else
          return dests
        end
      else
        return []
      end
    end

    def pop?(symbol)
      @stack.last == symbol
    end

    # Determines whether or not any transition states exist
    # given a beginning state and input symbol pair.
    #
    # @param (see #transition)
    # @return [Boolean] Whether or not a transition exists.
    def has_transition?(state, symbol)
      return false unless @transitions.has_key? state
      if @transitions[state].has_key? symbol
        actions = @transitions[state][symbol]
        return false if actions['pop'] && @stack.last != actions['pop']
        return true
      else
        return false
      end
    end

    # Determines if a given state is an accept state.
    #
    # @param [String] state the state label to check.
    # @return [Boolean] whether or not the state is an accept state.
    def accept_state?(state)
      @accept.include? state
    end

    def includes_accept_state?(states)
      states.each { |s| return true if accept_state? s }
      return false
    end

	end

end
