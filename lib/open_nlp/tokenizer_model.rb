module OpenNLP
  module Tokenizer
    class Model
      attr_reader :j_tokenizer_model

      def initialize(model)
        case model
        when java.io.FileInputStream
          @j_tokenizer_model = Java::opennlp.tools.tokenize.TokenizerModel.new(model)
        when String
          model_file = java.io.FileInputStream.new(model)
          @j_tokenizer_model = Java::opennlp.tools.tokenize.TokenizerModel.new(model_file)
        else
          raise ArgumentError, "Model must be either a string or a java.io.FileInputStream"
        end
      end
    end
  end
end
