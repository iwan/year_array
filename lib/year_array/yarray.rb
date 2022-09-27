module YearArray
  class Yarray
    include TimeHelpers
    attr_reader :start_time, :arr

    def initialize(year, value: 0.0, arr: [], time_zone: "Rome")
      Time.use_zone time_zone do
        @start_time = Time.zone.parse("#{year}-01-01")
        nohiy = Yarray.hours_in_year(year, time_zone: time_zone)
        arr = [] if arr.nil?
        arr = arr.first(nohiy)
        @arr = arr + Arr.new(nohiy-arr.size, value)
      end
    end

    def size
      @arr.size
    end

    def year
      @start_time.year
    end

    def add(other)
      raise_error_on_misalignment other
      @arr.each_with_index{|v, i| @arr[i]=v+other.arr[i]}
      self
    end

    def subtract(other)
      raise_error_on_misalignment other
      @arr.each_with_index{|v, i| @arr[i]=v-other.arr[i]}
      self
    end

    def multiply(other)
      raise_error_on_misalignment other
      @arr.each_with_index{|v, i| @arr[i]=v*other.arr[i]}
      self
    end

    def divide(other)
      raise_error_on_misalignment other
      @arr.each_with_index{|v, i| @arr[i]=v/other.arr[i]}
      self
    end


    def +(other)
      raise_error_on_misalignment other
      a = Arr.new(size){ |i| arr[i]+other.arr[i] }
      Yarray.new(year, arr: a)
    end

    def -(other)
      raise_error_on_misalignment other
      a = Arr.new(size){ |i| arr[i]-other.arr[i] }
      Yarray.new(year, arr: a)
    end

    def *(other)
      raise_error_on_misalignment other
      a = Arr.new(size){ |i| arr[i]*other.arr[i] }
      Yarray.new(year, arr: a)
    end

    def /(other)
      raise_error_on_misalignment other
      a = Arr.new(size){ |i| arr[i]/other.arr[i] }
      Yarray.new(year, arr: a)
    end

    def self.min(ya1, ya2)
      ya1.raise_error_on_misalignment ya2
      a = Arr.new(ya1.size){ |i| ya1.arr[i]<ya2.arr[i] ? ya1.arr[i] : ya2.arr[i] }

      Yarray.new(ya1.year, arr: a)
    end

    def self.max(ya1, ya2)
      ya1.raise_error_on_misalignment ya2
      a = Arr.new(ya1.size){ |i| ya1.arr[i]>ya2.arr[i] ? ya1.arr[i] : ya2.arr[i] }
      Yarray.new(ya1.year, arr: a)
    end

    def any?(&block)
      @arr.any?{|v| yield(v)}
    end

    def any_positive?
      any?{|e| e>0.0}
    end

    def any_negative?
      any?{|e| e<0.0}
    end

    def raise_error_on_misalignment(other)
      raise MisalignmentError if !same_year?(other)
    end

    def to_s
      "start_time: #{start_time}, arr: [#{arr[0..6].join(', ')}, ..., #{arr.last}]"
    end
  end
end


# Note:
# it is faster 'a>b ? a : b' than '[a,b].max' when calculating max (and min)
# Try to run:
# t=Time.now; 10_000_000.times{ [rand, rand].max }; Time.now-t
# vs
# t=Time.now; 10_000_000.times{ (a=rand)>(b=rand) ? a : b }; Time.now-t
# the first take 4.0s, the second 1.3s
