require "xumo/kmeans/version"

module Xumo
  class Kmeans
    class Node
      def initialize(args)
        case args
        when Hash
          from_hash(args)
        end
      end

      def from_hash(**args)
        args.each do |key, val|
          define_method("#{key}") { val }
        end
      end
    end

    def initialize
      @nodes = Array.new
    end

    def add(node)
      @nodes <<
        case node
        when Node
          node
        when Hash
          Node.new(node)
        when Array
          node.map do |n|
            add(n)
          end
        end
    end
  end
end
