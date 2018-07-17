require 'memory_profiler'

RSpec.describe "Performance" do

  it "sum 'in place'" do
    t = Time.now
    report = MemoryProfiler.report do
      ya = Yarray.new(2018)
      1.upto(1000).each do |n|
        ya.add(Yarray.new(2018, value: n))
      end
      puts ya.to_s
    end
    puts Time.now-t
    report.pretty_print
  end

  it "result of sum in a new yarray" do
    t = Time.now
    report = MemoryProfiler.report do
      ya = Yarray.new(2018)
      1.upto(1000).each do |n|
        ya += Yarray.new(2018, value: n)
      end
      puts ya.to_s
    end
    puts Time.now-t
    report.pretty_print
  end
end
