class Kid < ActiveRecord::Base
  has_many :purchases
  has_many :toys, through: :purchases

  def make_purchase toy, quantity
    Purchase.create(toy_id: toy.id, kid_id: self.id, quantity: quantity)
  end

  def all_purchase_info
    purchases.map {|pur| pur.info}
  end

  def throw_out this_toy
    thrown_toy = purchases.find_by(kid_id: self.id, toy_id: this_toy.id)
    new_quan = thrown_toy.quantity - 1
    thrown_toy.update(quantity: new_quan)
  end

  def throw_all_out this_toy
    purchases.find_by(kid_id: self.id, toy_id: this_toy.id).destroy
  end
end