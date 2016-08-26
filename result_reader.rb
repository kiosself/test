class ResultReader
  @@current_path = File.dirname(__FILE__)

  def initialize result
    @result = result
  end

  def show_result
    if @result >= 30
      read_file "30_32"
    elsif @result >= 25
      read_file "25_29"
    elsif @result >= 19
      read_file "19_24"
    elsif @result >= 14
      read_file "14_18"
    elsif @result >= 9
      read_file "9_13"
    elsif @result >= 4
      read_file "4_8"
    else
      read_file "0_3"
    end
  end

  def read_file(x)
    File.read(@@current_path + "/results/#{x}.txt" , :encoding => 'UTF-8').to_s
  end
end
