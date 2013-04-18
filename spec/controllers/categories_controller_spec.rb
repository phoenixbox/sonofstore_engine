# require 'spec_helper'

# describe CategoriesController do

#   describe "GET index" do
#     it "renders the index template" do

#       visit "/categories"
#       response.should be_success
#     end
#   end

#   describe "GET 'show'" do
#     let(:category){Category.create name: "category"}

#     it "assigns the requested category to category" do
#       visit "/categories/show/#{category.id}"
#       response.should be_success
#     end

#     it "renders the show template" do
#       visit "/categories/show/#{category.id}"
#       expect(response).to be_success
#     end

#     it "renders the show template" do
#       visit "/categories/show/#{nil}"
#       expect(response).to be_success
#     end

#   end
# end
