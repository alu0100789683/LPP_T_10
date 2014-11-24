# encoding: UTF-8
require './lib/nodelist/list'
require './lib/question/simpleChoice/base'

describe Lista do
	before :each do
		@listNum = Lista.new()
        @listNum.add(1,2,3)

		@listQuestion = Lista.new()

		#Preguntas para el test de la practica 06
		@p1 = SimpleChoice.new(:text =>"¿Cual es la salida del siguiente código Ruby ? \n class Xyz \n    def pots \n     @nice\n   end\n   end\n", :right => 'nil' ,:distractor => ['#<Xyz: 0xa000208>','0','Nunguna de las anteriores'], :dif => 2 )
		@p2 = SimpleChoice.new(:text => "La siguiente definici´on de un hash en Ruby es v´alida:hash_raro = {[1, 2, 3] => Object.new(),Hash.new => :toto}", :right => 'falso', :distractor => 'Cierto', :dif =>1)
		@p3 = SimpleChoice.new(:text =>"¿Cu´al es la salida del siguiente c´odigo Ruby?class Arraydef say_hi\"HEY!\"endendp [1, \"bob\"].say_hi", :right =>'"HEY!"', :distractor => ['1','bob','Nunguna de las anteriores'], :dif => 2 )
		@p4 = SimpleChoice.new(:text => "¿Cu´al es el tipo del objeto en el siguiente c´odigo Ruby?class Objetoend", :right =>'Un objeto', :distractor => ['Una instancia de una clase', 'Una constante', 'Ninguna de las anteriores'], :dif => 5 )
		@p5 = SimpleChoice.new(:text => "Es apropiado que una clase Tablero herede de una clase Juego.", :right => 'Cierto', :distractor => 'Falso', :dif => 3)

		@listQuestion.add(@p1,@p2,@p3,@p4,@p5)

	end
	describe "Imprimiendo lista" do
    		it "Se imprime correctamente" do
			expect(@listNum.to_a) == [1,2,3]
        	end
	end
=begin
	describe "Lista de preguntas" do
		it "La primera pregunta se almacena correctamente" do
			expect(@listQuestion.first.right) == 'nil'
		end
		it "La primera pregunta se almacena correctamente" do
			expect(@listQuestion.lastnext) == '#<struct Lista::Node value=#<Question::SimpleChoice:0x007f883506df28 @text="Es apropiado que una clase Tablero herede de una clase Juego.", @right="Cierto", @distractor="Falso">, next=nil>'
		end

		it "Listado de preguntas completo" do
			expect(@listQuestion.to_s) == '#<struct Lista::Node value=#<Question::SimpleChoice:0x007fb7ac8f2918 @text="¿Cual es la salida del siguiente código Ruby ? \n class Xyz \n    def pots \n     @nice\n   end\n   end\n", @right="nil", @distractor=["#<Xyz: 0xa000208>", "0", "Nunguna de las anteriores"]>, next=#<struct Lista::Node value=#<Question::SimpleChoice:0x007fb7ac8f2850 @text="La siguiente definici´on de un hash en Ruby es v´alida:hash_raro = {[1, 2, 3] => Object.new(),Hash.new => :toto}", @right="falso", @distractor="Cierto">, next=#<struct Lista::Node value=#<Question::SimpleChoice:0x007fb7ac8f2710 @text="¿Cu´al es la salida del siguiente c´odigo Ruby?class Arraydef say_hi\"HEY!\"endendp [1, \"bob\"].say_hi", @right="\"HEY!\"", @distractor=["1", "bob", "Nunguna de las anteriores"]>, next=#<struct Lista::Node value=#<Question::SimpleChoice:0x007fb7ac8f25d0 @text="¿Cu´al es el tipo del objeto en el siguiente c´odigo Ruby?class Objetoend", @right="Un objeto", @distractor=["Una instancia de una clase", "Una constante", "Ninguna de las anteriores"]>, next=#<struct Lista::Node value=#<Question::SimpleChoice:0x007fb7ac8f2508 @text="Es apropiado que una clase Tablero herede de una clase Juego.", @right="Cierto", @distractor="Falso">, next=nil>>>>>'
		end

	end
=end
	describe "Lista enumerable" do
		it "Enumerable en la jerarquia de herencia" do
			expect(@listQuestion.is_a? Enumerable) == 'true'
		end

		it "Se puede recorrer con each" do
			expect(@listQuestion.each { |o| o }) == '#<Question::SimpleChoice:0x007fd9f3129a10 @text="¿Cual es la salida del siguiente código Ruby ? \n class Xyz \n    def pots \n     @nice\n   end\n   end\n", @right="nil", @distractor=["#<Xyz: 0xa000208>", "0", "Nunguna de las anteriores"]>#<Question::SimpleChoice:0x007fd9f3129948 @text="La siguiente definici´on de un hash en Ruby es v´alida:hash_raro = {[1, 2, 3] => Object.new(),Hash.new => :toto}", @right="falso", @distractor="Cierto">#<Question::SimpleChoice:0x007fd9f3129808 @text="¿Cu´al es la salida del siguiente c´odigo Ruby?class Arraydef say_hi\"HEY!\"endendp [1, \"bob\"].say_hi", @right="\"HEY!\"", @distractor=["1", "bob", "Nunguna de las anteriores"]>#<Question::SimpleChoice:0x007fd9f31296c8 @text="¿Cu´al es el tipo del objeto en el siguiente c´odigo Ruby?class Objetoend", @right="Un objeto", @distractor=["Una instancia de una clase", "Una constante", "Ninguna de las anteriores"]>#<Question::SimpleChoice:0x007fd9f3129600 @text="Es apropiado que una clase Tablero herede de una clase Juego.", @right="Cierto", @distractor="Falso">'
		end
	end
end
