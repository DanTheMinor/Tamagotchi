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

  describe("#update_pet") do
    it("changes various attributes of a tamagotchi based on time passing") do
      test_pet = Tamagotchi.new("big dragon")
      sleep(5)
      test_pet.update_pet()
      expect(test_pet.age()).to(eq("00:05"))
      expect(test_pet.food_level()).to(eq(9.5))
    end
  end

  describe("#feed_pet") do
      it("feeds the pet one food") do
        test_pet = Tamagotchi.new("big dragon")
        sleep(10)
        test_pet.update_pet()
        test_pet.feed_pet()
        expect(test_pet.food_level()).to(eq(10))
      end
      it("does not feed a pet with at least 10 food") do
        test_pet = Tamagotchi.new("big dragon")
        test_pet.feed_pet()
        expect(test_pet.food_level()).to(eq(10))
      end
  end
end
