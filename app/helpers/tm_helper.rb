module TmHelper
    class TM < Parent::Parent
        def initialize(elements={})

        end
    end

    class TMTape
      attr_accessor :storage

      def initialize(input=nil)
        if input
          @storage = []
          @storage << '@' unless input[0] == '@'
          @storgae += input.split('')
          @storage << '@' unless input[-1] == '@'
          @head = 1
        end
      end

      def delta(read, write, move)
        if read == @storage[@head]
          @storage[@head] = write
          case move
          when 'R'
            @storage << '@' if @storage[@head +1]
            @head += 1
          when 'L'
            @storage.unshift('@') if @head == 0
            @head -= 1
          end
          return true
        else
          return false
        end
      end

      def response
        @storage.join.sub(/^@*/, '').sub(/@*$/, '')
      end
      
    end
