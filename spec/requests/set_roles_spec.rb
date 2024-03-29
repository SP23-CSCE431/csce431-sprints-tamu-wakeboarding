# require 'rails_helper'

# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to test the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator. If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails. There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.

# RSpec.describe "/set_roles", type: :request do

#   # This should return the minimal set of attributes required to create a valid
#   # SetRole. As you add validations to SetRole, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }

#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }

#   describe "GET /index" do
#     it "renders a successful response" do
#       SetRole.create! valid_attributes
#       get set_roles_url
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /show" do
#     it "renders a successful response" do
#       set_role = SetRole.create! valid_attributes
#       get set_role_url(set_role)
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /new" do
#     it "renders a successful response" do
#       get new_set_role_url
#       expect(response).to be_successful
#     end
#   end

#   describe "GET /edit" do
#     it "renders a successful response" do
#       set_role = SetRole.create! valid_attributes
#       get edit_set_role_url(set_role)
#       expect(response).to be_successful
#     end
#   end

#   describe "POST /create" do
#     context "with valid parameters" do
#       it "creates a new SetRole" do
#         expect {
#           post set_roles_url, params: { set_role: valid_attributes }
#         }.to change(SetRole, :count).by(1)
#       end

#       it "redirects to the created set_role" do
#         post set_roles_url, params: { set_role: valid_attributes }
#         expect(response).to redirect_to(set_role_url(SetRole.last))
#       end
#     end

#     context "with invalid parameters" do
#       it "does not create a new SetRole" do
#         expect {
#           post set_roles_url, params: { set_role: invalid_attributes }
#         }.to change(SetRole, :count).by(0)
#       end

#       it "renders a response with 422 status (i.e. to display the 'new' template)" do
#         post set_roles_url, params: { set_role: invalid_attributes }
#         expect(response).to have_http_status(:unprocessable_entity)
#       end

#     end
#   end

#   describe "PATCH /update" do
#     context "with valid parameters" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested set_role" do
#         set_role = SetRole.create! valid_attributes
#         patch set_role_url(set_role), params: { set_role: new_attributes }
#         set_role.reload
#         skip("Add assertions for updated state")
#       end

#       it "redirects to the set_role" do
#         set_role = SetRole.create! valid_attributes
#         patch set_role_url(set_role), params: { set_role: new_attributes }
#         set_role.reload
#         expect(response).to redirect_to(set_role_url(set_role))
#       end
#     end

#     context "with invalid parameters" do

#       it "renders a response with 422 status (i.e. to display the 'edit' template)" do
#         set_role = SetRole.create! valid_attributes
#         patch set_role_url(set_role), params: { set_role: invalid_attributes }
#         expect(response).to have_http_status(:unprocessable_entity)
#       end

#     end
#   end

#   describe "DELETE /destroy" do
#     it "destroys the requested set_role" do
#       set_role = SetRole.create! valid_attributes
#       expect {
#         delete set_role_url(set_role)
#       }.to change(SetRole, :count).by(-1)
#     end

#     it "redirects to the set_roles list" do
#       set_role = SetRole.create! valid_attributes
#       delete set_role_url(set_role)
#       expect(response).to redirect_to(set_roles_url)
#     end
#   end
# end
