# encoding: UTF-8
	class QuestionFather
		include Comparable
		attr_accessor :text, :right, :distractor,:dif

		def initialize(args)
			@text = args[:text]
			@right = args[:right]
			@distractor = args[:distractor]
			@dif = args[:dif]
		end
		def <=>(other)
			self.dif <=> other.dif
		end
	end

