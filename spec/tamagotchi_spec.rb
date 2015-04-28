require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name, food levels, sleep levels and activity levels of tamagotchi") do
      test_pet = Tamagotchi.new("big dragon")
      expect(test_pet.name()).to(eq("big dragon"))
      expect(test_pet.food_level()).to(eq(10))
      expect(test_pet.sleep_level()).to(eq(10))
      expect(test_pet.activity_level()).to(eq(10))
    end

    it("sets the birth date to the current time") do
      test_pet = Tamagotchi.new("big dragon")
      current_time = Time.new()
      expect(test_pet.birth_date()).to(eq("#{current_time.min()}:#{current_time.sec()}"))
    end

  end

  describe("#age") do
    it("calculates the age of the tamagotchi") do
      test_pet = Tamagotchi.new("big dragon")
      sleep(3)
      expect(test_pet.age()).to(eq("00:03"))
    end
  end
end
