# encoding: UTF-8
require "question/questionFather/base"
  class SimpleChoice < QuestionFather
    attr_accessor :text, :distractor, :right
    def initialize(args)
        super
    end

    def to_s
	  options = @distractor+[@right]
	  options = options.shuffle
	  puts "- Elige la pregunta correcta de la siguiente pregunta #{@text} ?"
	  options.each {|o|}
	  	
	  
    end
  end


