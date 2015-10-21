require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe InstagramPostsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # InstagramPost. As you add validations to InstagramPost, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InstagramPostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "redirects to loading page if user is stale" do
      u = create( :ig_user )
      u.instagram.update_attribute( :accesstoken, ACCESS_TOKEN )
      login_with u
      VCR.use_cassette( 'instagram/user.wschenk' ) do
        get :index
      end

      expect( response ).to redirect_to( loading_crush_path )
    end

    it "redirects to show crush page when user is fresh" do
      u = create( :ig_user, last_synced: 1.hour.ago )
      u.instagram_user = create( :instagram_user )
      u.save
      login_with u
      get :index
      expect( flash[:notice] ).to eq( nil )
      expect( response ).to have_http_status(:success)
    end

    pending "it should only show the current_users posts"
  end

  describe "GET #show" do
    it "assigns the requested instagram_post as @instagram_post" do
      instagram_post = InstagramPost.create! valid_attributes
      get :show, {:id => instagram_post.to_param}, valid_session
      expect(assigns(:instagram_post)).to eq(instagram_post)
    end
  end
end
#   describe "GET #new" do
#     it "assigns a new instagram_post as @instagram_post" do
#       get :new, {}, valid_session
#       expect(assigns(:instagram_post)).to be_a_new(InstagramPost)
#     end
#   end

#   describe "GET #edit" do
#     it "assigns the requested instagram_post as @instagram_post" do
#       instagram_post = InstagramPost.create! valid_attributes
#       get :edit, {:id => instagram_post.to_param}, valid_session
#       expect(assigns(:instagram_post)).to eq(instagram_post)
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new InstagramPost" do
#         expect {
#           post :create, {:instagram_post => valid_attributes}, valid_session
#         }.to change(InstagramPost, :count).by(1)
#       end

#       it "assigns a newly created instagram_post as @instagram_post" do
#         post :create, {:instagram_post => valid_attributes}, valid_session
#         expect(assigns(:instagram_post)).to be_a(InstagramPost)
#         expect(assigns(:instagram_post)).to be_persisted
#       end

#       it "redirects to the created instagram_post" do
#         post :create, {:instagram_post => valid_attributes}, valid_session
#         expect(response).to redirect_to(InstagramPost.last)
#       end
#     end

#     context "with invalid params" do
#       it "assigns a newly created but unsaved instagram_post as @instagram_post" do
#         post :create, {:instagram_post => invalid_attributes}, valid_session
#         expect(assigns(:instagram_post)).to be_a_new(InstagramPost)
#       end

#       it "re-renders the 'new' template" do
#         post :create, {:instagram_post => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end

#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested instagram_post" do
#         instagram_post = InstagramPost.create! valid_attributes
#         put :update, {:id => instagram_post.to_param, :instagram_post => new_attributes}, valid_session
#         instagram_post.reload
#         skip("Add assertions for updated state")
#       end

#       it "assigns the requested instagram_post as @instagram_post" do
#         instagram_post = InstagramPost.create! valid_attributes
#         put :update, {:id => instagram_post.to_param, :instagram_post => valid_attributes}, valid_session
#         expect(assigns(:instagram_post)).to eq(instagram_post)
#       end

#       it "redirects to the instagram_post" do
#         instagram_post = InstagramPost.create! valid_attributes
#         put :update, {:id => instagram_post.to_param, :instagram_post => valid_attributes}, valid_session
#         expect(response).to redirect_to(instagram_post)
#       end
#     end

#     context "with invalid params" do
#       it "assigns the instagram_post as @instagram_post" do
#         instagram_post = InstagramPost.create! valid_attributes
#         put :update, {:id => instagram_post.to_param, :instagram_post => invalid_attributes}, valid_session
#         expect(assigns(:instagram_post)).to eq(instagram_post)
#       end

#       it "re-renders the 'edit' template" do
#         instagram_post = InstagramPost.create! valid_attributes
#         put :update, {:id => instagram_post.to_param, :instagram_post => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "destroys the requested instagram_post" do
#       instagram_post = InstagramPost.create! valid_attributes
#       expect {
#         delete :destroy, {:id => instagram_post.to_param}, valid_session
#       }.to change(InstagramPost, :count).by(-1)
#     end

#     it "redirects to the instagram_posts list" do
#       instagram_post = InstagramPost.create! valid_attributes
#       delete :destroy, {:id => instagram_post.to_param}, valid_session
#       expect(response).to redirect_to(instagram_posts_url)
#     end
#   end

# end
