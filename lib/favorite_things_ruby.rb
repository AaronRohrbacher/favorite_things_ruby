class Item
  @@list = []

  attr_reader :id, :rank
  attr_accessor :name

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@list.length + 1
  end


  def self.all()
    @@list
  end

  def save()
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def self.find_index(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end


  def self.sort()
    @@list.sort_by {|item| item.rank}
  end

  def self.validation(name, rank)
    name_to_check = name
    rank_to_check = rank.to_i
    return_value = true
    @@list.each do |item|
      if item.name == name_to_check || item.rank == rank_to_check
        return false
      end
    end
    return_value
  end
  # def update(id)
  #   if item.find
  # end
end
