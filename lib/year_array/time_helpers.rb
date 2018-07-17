module YearArray
  module TimeHelpers
    module ClassMethods
      def hours_in_year(year, zone: "Rome")
        hours_in_interval(:year, year, 1, 1, zone)
      end

      def hours_in_month(year, month, zone: "Rome")
        hours_in_interval(:month, year, month, 1, zone)
      end

      def hours_in_day(year, month, day, zone: "Rome")
        hours_in_interval(:day, year, month, day, zone)
      end

      def hours_between(t1, t2)
        ((t2-t1)/3600).to_i
      end

      private

      def hours_in_interval(interval, year, month=1, day=1, zone)
        Time.zone = zone
        t1 = Time.zone.parse("#{year}-#{month}-#{day}")
        t2 = t1+1.send(interval)
        hours_between(t1, t2)
      end
    end

    module InstanceMethods
      def same_year?(other)
        self.year==other.year
      end
    end



    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
