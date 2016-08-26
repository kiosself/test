current_path = File.dirname(__FILE__)

require current_path + '/result_reader.rb'

name = ARGV[0]
result = 0

if (Gem.win_platform? and ARGV[0])
  name = name.encode("UTF-8")
end

if name == nil
  name = "Таинственная Персона"
end

puts "Здравстуй, #{name}! Данный тест содержит возможность определить уровень коммуникабельности человека. " +
         "Отвечать на вопросы следует используя три варианта ответов – «да», «нет» и «не знаю (или хз)»."


questions = File.readlines(current_path + '/questions/questions.txt', :encoding => 'UTF-8')

for item in questions
  puts item
  user_answer = nil

  until (user_answer == "да" || user_answer == "нет" || user_answer == "не знаю" || user_answer == "хз")
    puts "введите 'да', 'нет' или «не знаю (или хз)» и нажмите Enter"
    user_answer = STDIN.gets.encode('UTF-8').chomp
  end

  if user_answer == "да"
    result += 2
  elsif user_answer == "нет"
    result
  else
    result += 1
  end
end


answer = ResultReader.new(result)

puts "Ваш результат - #{result}\n"
puts
puts answer.show_result.to_s