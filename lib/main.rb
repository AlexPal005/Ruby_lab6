#lab 6 v11 = v1

class Passenger
  def initialize(count_things, weight)
    @count_things = count_things
    @weight = weight
  end
  def get_count_things
    return @count_things
  end
  def get_weight
    return @weight
  end

end

class Counter
  attr_reader :baggages

  def initialize
    @baggages = []
  end
  def create
    bag1 = Passenger.new(3, 5.0)
    bag2 = Passenger.new(4, 10.0)
    bag3 = Passenger.new(3, 5.4)
    bag4 = Passenger.new(6, 20.0)
    baggages.push(bag1)
    baggages.push(bag2)
    baggages.push(bag3)
    baggages.push(bag4)
    @arr_counts = []
    @arr_weights = []

    for i in @baggages
      @arr_counts.push(i.get_count_things)
      @arr_weights.push(i.get_weight)
    end

  end

  def first
    puts "FIRST TASK"
    av = mid_weight
    i = 1
    count = 0
    for el in @baggages
      if (el.get_weight / el.get_count_things - av).abs <= 0.3
        print "Number of baggage ", i , " count ", el.get_count_things, " weight ",el.get_weight,  "\n"
        count +=1
      end
      i+=1
    end
    if count == 0
      print "There is no such buggage in which this condition is fulfilled! \n"
      return -1
    end
    return i
  end

  def second
    puts "SECOND TASK"
    count_passenger_more_two = 0
    count_passenger_more_average = 0
    av = mid_count
    for el in @baggages
      if el.get_count_things > 2
        count_passenger_more_two+=1
      if el.get_count_things > av
        count_passenger_more_average+=1
      end
      end
    end
      print "The number of passengers who have count of things > 2:  ", count_passenger_more_two, "\n"
      print "The number of passengers who count of things > mid:  ", count_passenger_more_average, "\n"
    return count_passenger_more_two, count_passenger_more_average
  end

  def third
    puts "THIRD TASK"
    count = 0

    for i in 0..@arr_counts.size-1
      for j in (i+1)..@arr_counts.size-1
        if @arr_counts[i] == @arr_counts[j] && (@arr_weights[i]-@arr_weights[j]).abs <=0.5
          print "There are two passengers with the same amount of luggage and the difference is less than 0.5 kg\n"
          count +=1
        end
      end
    end

    if count == 0
      print "There are no two passengers with the same amount of luggage and the difference is less than 0.5 kg\n"
      return false
    else
      return true
    end
  end

  def fourth
    puts "FOURTH TASK"
    max_counts = @arr_counts[0]
    index_max_counts = 0
    for i in 0..@arr_counts.size-1
      if @arr_counts[i] > max_counts
        max_counts = @arr_counts[i]
        index_max_counts = i
      end
    end

    max_weight = @arr_weights[0]
    index_max_weight = 0
    for i in 0..@arr_weights.size-1
      if @arr_weights[i] > max_weight
        max_weight = @arr_weights[i]
        index_max_weight = i
      end
    end

    if index_max_counts == index_max_weight
      print "There is a passenger who has more things and more mass than everyone else\n"
      return true
    else
      print "There is no passenger who has more things and more mass than everyone else\n"
      return false
    end

  end

  def fifth
    puts "FIFTH TASK"
    count = 0
    for i in 0..@arr_counts.size-1
      if @arr_counts[i] == 1 && @arr_weights[i] <= 30
        print "There is a passenger who has 1 item and baggage weight less than 30 kg\n"
        count +=1
      end
    end
    if count == 0
      print "There is no passenger who has 1 item and baggage weight less than 30 kg\n"
      return false
    else
      return true
    end

  end


  def mid_weight
    average = 0.0
    @baggages.each { |bag| average += bag.get_weight }
    average /= @baggages.size
    return average
  end

  def mid_count
    count = 0.0
    @baggages.each { |bag| count += bag.get_count_things }
    count /= @baggages.size
    return count
  end
  def start
    self.create
    self.first
    self.second
    self.third
    self.fourth
    self.fifth
  end

end
counter = Counter.new
counter.start