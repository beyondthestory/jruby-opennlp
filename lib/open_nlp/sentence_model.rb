module OpenNLP
  class SentenceDetector
    class Model
      attr_reader :j_sentence_model

      def initialize(model)
        case model
        when java.io.FileInputStream
          @j_sentence_model = Java::opennlp.tools.sentdetect.SentenceModel.new(model)
        when String
          file_input_stream = java.io.FileInputStream.new(model)
          @j_sentence_model = Java::opennlp.tools.sentdetect.SentenceModel.new(file_input_stream)
        else
          raise ArgumentError, "model must be either a string or a java.io.FileInputStream"
        end
      end
    end
  end
end
