class Tamagotchi

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birth_date = Time.new()
    @last_update = [@birth_date.min, @birth_date.sec]
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:birth_date) do
    "#{@birth_date.min}:#{@birth_date.sec}"
  end

  define_method(:age) do
    current_time = Time.new()
    age_min = current_time.min - @birth_date.min
    age_sec = current_time.sec - @birth_date.sec
    minutes = age_min < 10 ? "0#{age_min}" : "#{age_min}"
    seconds = age_sec < 10 ? "0#{age_sec}" : "#{age_sec}"
    statement = "#{minutes}:#{seconds}"
  end

  define_method(:update_pet) do
    current_time = Time.new()
    min_since_update = current_time.min - @last_update[0]
    sec_since_update = current_time.sec - @last_update[1]
    @last_update = [current_time.min, current_time.sec]
    @food_level = @food_level - ((min_since_update * 6) + (sec_since_update / 10.0))

  end

  define_method(:feed_pet) do
    if @food_level < 10
      @food_level += 1
    end
  end
end
