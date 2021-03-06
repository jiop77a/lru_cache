require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    update_link!(key)
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    if @store.include?(link)
      @store.remove(link)
      @store.append(link, @prc.call(link))

      @store.get(link)
    else
      @store.append(link, @prc.call(link))
      @store.get(link)
    end
    # suggested helper method; move a link to the end of the list
  end

  def eject!
  end
end
