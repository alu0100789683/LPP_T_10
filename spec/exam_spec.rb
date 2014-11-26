# encoding: UTF-8
require './lib/exam/examen'

describe Examen do
	before :each do

        @p1 = SimpleChoice.new(:text => '1)2 + 2 = ',:right => '1',:distractor => [5,3,2], :dif =>1)
        @p2 = SimpleChoice.new(:text => '2)5 + 2 = ',:right => '2',:distractor => [5,3,2], :dif =>1)
        @p3 = SimpleChoice.new(:text => '3)2 * 2 = ',:right => '3',:distractor => [5,3,2], :dif =>1)

        @list = Lista.new()
        @list.add(@p1,@p2,@p3)
        @examen = Examen.new(@list)



	end
	describe "Se sigue el hilo de asignacion correctamente" do
        it "Se inicializa pregunta 1" do
            expect(@examen.next_question) == '1)2 + 2 = ';
        end
        it "Se responde pregunta 1" do
            expect(@examen.response_question(1)) == '1';
        end
        it "Se inicializa pregunta 2" do
            expect(@examen.next_question) == '2)5 + 2 = ';
        end
        it "Se responde pregunta 2" do
            expect(@examen.response_question(2)) == '2';
        end
        it "Se inicializa pregunta 3" do
            expect(@examen.next_question) == '3)2 * 2 = ';
        end
        it "Se responde pregunta 3" do
            expect(@examen.response_question(3)) == '2';
        end
    end
end
