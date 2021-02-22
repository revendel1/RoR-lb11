require 'prime'

class MersenController < ApplicationController
  before_action :parse_params, only: :output

  def input; end

  def output
    if Mersen.exists?(input: @input_params_str)
      @way = "Данные извлечены из базы данных"
      @result = (Mersen.find_by(input: @input_params_str).output).split(']').map do |line|
        line.delete('[],').split
      end
    else
      @way = "Результаты были рассчитаны"
      @result = find_mersens(@input_params)
      Mersen.create(input: @input_params_str, output: @result.to_s).save
    end
  end

  def show_data
    result = Mersen.all.map { |element| [in: element.input, out: element.output] }
    
    respond_to do |format|
      format.html
      format.json { render xml: result.to_json }
      format.xml { render xml: result.to_xml }
    end
  end

  private

  def parse_params
    @input_params = params[:data].to_i
    @input_params_str = params[:data]
  end

  def mersen?(n)
    m=0
    if (n+1).to_s(2).count('1') == 1
      m=(n+1).to_s(2).count('0')
    end
    return m
  end

  def find_mersens(num)
    count=0
    arr=[]
    if !(num.is_a?(Integer))
      nil
    elsif num < 0 
      nil
    else
    1.upto(num) do |s|
      temp=mersen?(s)
      if Prime.prime?(s)==true and temp>0 and Prime.prime?(temp)==true
        arr.push([count+=1, s])
      end
    end
    end
    arr
  end
end
