module OpenNLP
  class POSTagger
    class Model
      attr_reader :j_pos_model

      def initialize(model)
        case model
        when java.io.FileInputStream
          @j_pos_model = Java::opennlp.tools.postag.POSModel.new(model)
        when String
          model_file = java.io.FileInputStream.new(model)
          @j_pos_model = Java::opennlp.tools.postag.POSModel.new(model_file)
        else
          raise ArgumentError, "Model must be either a string or a java.io.FileInputStream"
        end
      end
    end
  end
end
