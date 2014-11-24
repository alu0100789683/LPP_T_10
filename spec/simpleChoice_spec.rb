# encoding: UTF-8
require './lib/question/simpleChoice'
require './lib/question/trueOrFalse'

  class TrueOrFalse
    describe TrueOrFalse do
      before :each do
        @ptf = TrueOrFalse.new({:text=>'2+2=4',:right=>'true'})
      end
      context "Question True/false" do
        it "tiene los valores esperados"do
          expect(@ptf.text) == '2 + 2 ='
          expect(@ptf.right) == 'true'
        end
	it "To String"do
	  expect(@ptf.to_s) == 'Responde "true" or "false" la siguiente pregunta 2+2=4 
-True 
-False 
'
	end
      end
    end
  end
  class SimpleChoice
    describe  SimpleChoice do
      before :each do
        @sc = SimpleChoice.new(:text => '2 + 2 =',
                                       :right => 4,
                                       :distractor => [9,3,1])
    #Preguntas para el test de la practica 06
        @p1 = SimpleChoice.new(:text =>"¿Cual es la salida del siguiente codigo Ruby ? \n class Xyz \n    def pots \n     @nice\n   end\n   end\n", :right => 'nil' ,:distractor => ['#<Xyz: 0xa000208>','0','Nunguna de las anteriores'], :dif => 1 )
        @p2 = SimpleChoice.new(:text => "La siguiente definici´on de un hash en Ruby es v´alida:

hash_raro = {

[1, 2, 3] => Object.new(),

Hash.new => :toto

}", :right => 'falso', :distractor => 'Cierto', :dif => 2)

        @p3 = SimpleChoice.new(:text =>" ¿Cu´al es la salida del siguiente c´odigo Ruby?

class Array

def say_hi

\"HEY!\"

end

end

p [1, \"bob\"].say_hi", :right =>'"HEY!"', :distractor => ['1','bob','Nunguna de las anteriores'], :dif =>3 )
        @p4 = SimpleChoice.new(:text => "¿Cu´al es el tipo del objeto en el siguiente c´odigo Ruby?

class Objeto

end
", :right =>'Un objeto', :distractor => ['Una instancia de una clase', 'Una constante', 'Ninguna de las anteriores'] ,:dif=>4)
        @p5 = SimpleChoice.new(:text => " Es apropiado que una clase Tablero herede de una clase Juego.
", :right => 'Cierto', :distractor => 'Falso',:dif=>5)


      end
      context "Creando una pregunta" do
        it "Se crea correctamente" do
          expect(@sc.text) == '2 + 2 ='
          expect(@sc.right) == 4
          expect(@sc.distractor) == [9,3,1]
        end
	it "to String" do 
	  expect(@sc.to_s) == '- Elige la pregunta correcta de la siguiente pregunta 2 + 2 = ?
9
4
3
1
'
	end
        it "Pregunta 1" do
          expect(@p1.right) == 'nil'
        end
        it "Pregunta 2" do
          expect(@p2.right) == 'falso'
        end
        it "Pregunta 3"do
          expect(@p3.right) == '"HEY!"'
        end
        it "Pregunta 4"do
          expect(@p4.right) == 'Un objeto'
        end
        it "Pregunta 5"do
          expect(@p5.right) == 'Cierto'
        end
      end
      context "Comparable" do
	it "Es comparable" do 
		expect(@p5.is_a? Comparable) == true
	end
	it "Comparacion" do
		expect(@p5<=>@p5) == 0
	end
      end

    end
  end
