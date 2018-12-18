require "xumo/kmeans/version"

module Xumo
  module Kmeans
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
  end
end
