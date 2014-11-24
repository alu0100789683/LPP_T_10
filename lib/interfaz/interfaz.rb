if __FILE__ == $0 then
    $: << "."
end
require './nodelist/list'
require './exam/examen'
require './question/simpleChoice/base'
require './question/trueOrFalse/base'
require './question/questionFather/base'

class Interfaz
    attr_accessor :list
    def initialize(list)
        if list != nil then
            @list = list
        else
            @list = Lista.new()
        end
    end
    def generate_q
        q1 = SimpleChoice.new(:text => '2 + 2 = ',:right => '4',:distractor => [5,3,2], :dif =>1)
        q2 = SimpleChoice.new(:text => '2 * 2 = ',:right => '4',:distractor => [5,3,2], :dif =>2)
        q3 = SimpleChoice.new(:text => '3 + 2 = ',:right => '5',:distractor => [6,3,2], :dif =>3)
        q4 = SimpleChoice.new(:text => '2 - 1 = ',:right => '1',:distractor => [0,3,2], :dif =>4)
        q5 = SimpleChoice.new(:text => '2 - 2 = ',:right => '0',:distractor => [4,3,2], :dif =>5)
        q6 = TrueOrFalse.new(:text => '2 + 2 = 4',:right => 'true', :dif =>6)
        q7 = TrueOrFalse.new(:text => '2 * 2 = 4',:right => 'true', :dif =>7)
        q8 = TrueOrFalse.new(:text => '3 + 2 = 6',:right => 'false', :dif =>8)
        q9 = TrueOrFalse.new(:text => '2 - 2 = 1',:right => 'false', :dif =>9)
        q10 = TrueOrFalse.new(:text => '2 - 1 = 1',:right => 'true', :dif =>10)
        @list.add(q1,q2,q3,q4,q5,q6,q7,q8,q9,q10)

    end
    def run
        if @list.head == nil then
            generate_q
        end
        examen = Examen.new(@list)
        while examen.next_question != nil do
            STDOUT.flush
            value = gets.chomp
            examen.response_question(value)
        end
        examen.show_stats
    end
end
if __FILE__ == $0 then
    interfaz = Interfaz.new(nil)
    interfaz.run
end