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
  end

end
