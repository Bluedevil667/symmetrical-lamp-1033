require 'rails_helper'

RSpec.describe 'Customer Show Page', type: :feature do
  let!(:supermarket_1) { Supermarket.create(name: "King Soopers", location: "Denver") }
  let!(:customer_1) { Customer.create(name: "John") }
  let!(:item_1) { Item.create(name: "Milk", price: 2.99, supermarket_id: 1) }
  let!(:item_2) { Item.create(name: "Eggs", price: 1.99, supermarket_id: 1) }
  let!(:item_3) { Item.create(name: "Bread", price: 3.99, supermarket_id: 1) }
  let!(:customer_item_1) { CustomerItem.create(customer_id: customer_1.id, item_id: item_1.id) }
  let!(:customer_item_2) { CustomerItem.create(customer_id: customer_1.id, item_id: item_2.id) }
  let!(:customer_item_3) { CustomerItem.create(customer_id: customer_1.id, item_id: item_3.id) }
  
  describe 'When I visit a customer show page' do
    it 'I see all of that customers information' do
      visit "/customers/#{customer_1.id}"
      expect(page).to have_content(customer_1.name)
    end

    it 'I see items that customer has purchased' do
      visit "/customers/#{customer_1.id}"
      require "pry"; binding.pry
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_3.name)
    end
  end
end
