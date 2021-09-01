class Toy < ActiveRecord::Base
  has_many :purchases
  has_many :kids, through: :purchases

  def self.most_expensive
    all.maximum(:price)
  end

  def self.most_popular
    all.max_by {|toy| toy.purchases.count}
  end

  def kids_names
    kids.map {|kid| kid.name}
  end
end