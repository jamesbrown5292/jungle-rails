# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   describe 'Validations' do

#     it "should instantiate successfully with all fields provided" do
#       @category = Category.new(:name => "test")
#       @product = Product.new(:name => "James", :price => 100, :quantity => 1, :category => @category)
#       @category.save
#       @product.save
#       expect(@product).to be
#     end
    

#     it "should fail when instantiated with no name" do
#       @category = Category.new(:name => "test")
#       @category.save
#       @product = Product.new(:name => nil, :price => 100, :quantity => 1, :category => @category)
#       @product.valid? 
#       expect(@product.errors.full_messages).to include("Name can't be blank")
#     end

#     it "should fail when instantiated with no price" do
#       @category = Category.new(:name => "test")
#       @category.save
#       @product = Product.new(:name => "name", :price => nil, :quantity => 1, :category => @category)
#       @product.valid? 
#       expect(@product.errors.full_messages).to include("Price can't be blank")
#     end

#     it "should fail when instantiated with no quantity" do
#       @category = Category.new(:name => "test")
#       @category.save
#       @product = Product.new(:name => "name", :price => 200, :quantity => nil, :category => @category)
#       @product.valid? 
#       expect(@product.errors.full_messages).to include("Quantity can't be blank")
#     end

#     it "should fail when instantiated with no category" do
#       @category = Category.new(:name => "test")
#       @category.save
#       @product = Product.new(:name => "name", :price => 200, :quantity => nil, :category => nil)
#       @product.valid? 
#       expect(@product.errors.full_messages).to include("Category can't be blank")
#     end

#   end
# end
