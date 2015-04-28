class Tamagotchi

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birth_date = Time.new()
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
end
