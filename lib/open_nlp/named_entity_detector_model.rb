module OpenNLP
  class NamedEntityDetector
    class Model
      attr_reader :j_token_name_finder_model

      def initialize(model)
        case model
        when String
          fis = java.io.FileInputStream.new(model)
          @j_token_name_finder_model = Java::opennlp.tools.namefind.TokenNameFinderModel.new(fis)
        when java.io.FileInputStream
          @j_token_name_finder_model = Java::opennlp.tools.namefind.TokenNameFinderModel.new(model)
        else
          raise ArgumentError, "Model must be either a string or a java.io.FileInputStream"
        end
      end
    end
  end
end
