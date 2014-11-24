# encoding UTF-8
require "question/questionFather/base"
	class TrueOrFalse < QuestionFather
		def initialize(args)
			super
		end
		def to_s
			"Responde \"true\" or \"false\" la siguiente pregunta #{@text} \n-True \n-False \n"
		end
	end
