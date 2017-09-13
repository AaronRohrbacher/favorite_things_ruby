require('rspec')
require('favorite_things_ruby')
require('pry')

describe("Item") do
  before() do
    Item.clear()
  end

  describe("attr_accessor") do
    it("will change the name of an item using the name accesor")do
      item = Item.new("tacos", 3)
      item.name = "burrito"
      expect(item.name).to(eq("burrito"))
    end
  end

  describe("attr_reader") do
    it("will read the id of an item") do
      item = Item.new("tacos", 3)
      expect(item.id).to(eq(1))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an item to the list of items") do
      item = Item.new("tacos", 3)
      item.save()
      expect(Item.all()).to(eq([item]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("tacos", 3)
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new item is added") do
      item = Item.new("tacos", 3)
      item.save()
      item2 = Item.new("pizza", 3)
      item2.save()
      expect(item.id()).to(eq(1))
      expect(item2.id()).to(eq(2))
    end
  end
  describe(".find") do
    it("finds an item based on its id") do
      item1 = Item.new("tacos", 3)
      item1.save()
      item2 = Item.new("pizza", 3)
      item2.save()
      expect(Item.find(1)).to(eq(item1))
      expect(Item.find(2)).to(eq(item2))
    end
  end
  describe(".sort") do
    it("will sort all name's by user-inputted rank") do
      item1 = Item.new("tacos", 3)
      item1.save()
      item2 = Item.new("burritos", 2)
      item2.save()
      expect(Item.sort[0].name).to(eq("burritos"))
      expect(Item.sort[1].name).to(eq("tacos"))
    end
  end
end
