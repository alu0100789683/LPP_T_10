if __FILE__ == $0 then
    $: << "."
end

require './nodelist/list'
require './question/simpleChoice/base'
require './question/trueOrFalse/base'
require './question/questionFather/base'

class Examen
    attr_accessor :list , :node_i , :acierto , :fallo
    def initialize(list)
        @acierto = 0
        @fallo = 0
        @list = list
    end

    def next_question()
        if @node_i != nil then
            if @node_i.next != nil then
                @node_i = @node_i.next
            else
                return nil
            end
        else
            @node_i = @list.head
        end
        puts @node_i.value.to_s
        puts "-----v"
        return @node_i.value.to_s
    end
    def response_question(value)
        print "Respuesta: "
        if value == @node_i.value.right then
            puts "\n"
            puts "La pregunta es correcta"
            puts "\n"
            @acierto += 1
        else
            puts "\n"
            puts "La pregunta es incorrecta"
            puts "\n"
            @fallo += 1
        end
    end
    def show_stats
        puts "\n"
        puts "|---------------------------|"
        puts "|---     Estadisticas    ---|"
        puts "|---------------------------|"
        puts "|- Aciertos: #{@acierto} | Fallos: #{@fallo} -|"
        puts "|---------------------------|"
        puts "\n"
    end
end
if $0 == __FILE__ then

    p1 = SimpleChoice.new(:text => '1)2 + 2 = ',:right => '1',:distractor => [5,3,2], :dif =>1)
    p2 = SimpleChoice.new(:text => '2)5 + 2 = ',:right => '2',:distractor => [5,3,2], :dif =>1)
    p3 = SimpleChoice.new(:text => '3)2 * 2 = ',:right => '3',:distractor => [5,3,2], :dif =>1)

    list = Lista.new()
    list.add(p1,p2,p3)
    examen = Examen.new(list)

    examen.next_question
    STDOUT.flush
    value = gets.chomp
    examen.response_question(value)
    examen.next_question
    STDOUT.flush
    value = gets.chomp
    examen.response_question(value)
    examen.next_question
    STDOUT.flush
    value = gets.chomp
    examen.response_question(value)

    examen.show_stats

end