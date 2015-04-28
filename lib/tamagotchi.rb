class Tamagotchi

  @@tamagotchis = []

  define_method(:initialize) do |name|
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birth_date = Time.new()
    @last_update = @birth_date
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
    age = current_time - @birth_date
  end

  define_method(:update_pet) do
    current_time = Time.new()
    time_elapsed = current_time - @last_update
    @last_update = current_time
    @food_level -= time_elapsed/10.0
  end

  define_method(:feed_pet) do |amount|
    if (@food_level + amount) > 10
      @food_level = 10
    else
      @food_level += amount
    end
  end

  define_method(:is_alive?) do
    enough_food = @food_level > 0
    young = age < 60
    enough_food && young
  end

  define_method(:take_food) do |amount|
    @food_level -= amount
  end

  define_singleton_method(:all) do
    @@tamagotchis
  end

  define_method(:save) do
    @@tamagotchis.push(self)
  end

  define_singleton_method(:clear) do
    @@tamagotchis = []
  end

  define_singleton_method(:delete) do |name|
    @@tamagotchis.each() do |tama|
      if tama.name() == name
        @@tamagotchis.delete(tama)
      end
    end
  end

end
