require 'spec_helper'

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

describe InquiriesController do

  # This should return the minimal set of attributes required to create a valid
  # Inquiry. As you add validations to Inquiry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "subject" => "MyText" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InquiriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all inquiries as @inquiries" do
      inquiry = Inquiry.create! valid_attributes
      get :index, {}, valid_session
      assigns(:inquiries).should eq([inquiry])
    end
  end

  describe "GET show" do
    it "assigns the requested inquiry as @inquiry" do
      inquiry = Inquiry.create! valid_attributes
      get :show, {:id => inquiry.to_param}, valid_session
      assigns(:inquiry).should eq(inquiry)
    end
  end

  describe "GET new" do
    it "assigns a new inquiry as @inquiry" do
      get :new, {}, valid_session
      assigns(:inquiry).should be_a_new(Inquiry)
    end
  end

  describe "GET edit" do
    it "assigns the requested inquiry as @inquiry" do
      inquiry = Inquiry.create! valid_attributes
      get :edit, {:id => inquiry.to_param}, valid_session
      assigns(:inquiry).should eq(inquiry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Inquiry" do
        expect {
          post :create, {:inquiry => valid_attributes}, valid_session
        }.to change(Inquiry, :count).by(1)
      end

      it "assigns a newly created inquiry as @inquiry" do
        post :create, {:inquiry => valid_attributes}, valid_session
        assigns(:inquiry).should be_a(Inquiry)
        assigns(:inquiry).should be_persisted
      end

      it "redirects to the created inquiry" do
        post :create, {:inquiry => valid_attributes}, valid_session
        response.should redirect_to(Inquiry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inquiry as @inquiry" do
        # Trigger the behavior that occurs when invalid params are submitted
        Inquiry.any_instance.stub(:save).and_return(false)
        post :create, {:inquiry => { "subject" => "invalid value" }}, valid_session
        assigns(:inquiry).should be_a_new(Inquiry)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Inquiry.any_instance.stub(:save).and_return(false)
        post :create, {:inquiry => { "subject" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inquiry" do
        inquiry = Inquiry.create! valid_attributes
        # Assuming there are no other inquiries in the database, this
        # specifies that the Inquiry created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Inquiry.any_instance.should_receive(:update).with({ "subject" => "MyText" })
        put :update, {:id => inquiry.to_param, :inquiry => { "subject" => "MyText" }}, valid_session
      end

      it "assigns the requested inquiry as @inquiry" do
        inquiry = Inquiry.create! valid_attributes
        put :update, {:id => inquiry.to_param, :inquiry => valid_attributes}, valid_session
        assigns(:inquiry).should eq(inquiry)
      end

      it "redirects to the inquiry" do
        inquiry = Inquiry.create! valid_attributes
        put :update, {:id => inquiry.to_param, :inquiry => valid_attributes}, valid_session
        response.should redirect_to(inquiry)
      end
    end

    describe "with invalid params" do
      it "assigns the inquiry as @inquiry" do
        inquiry = Inquiry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Inquiry.any_instance.stub(:save).and_return(false)
        put :update, {:id => inquiry.to_param, :inquiry => { "subject" => "invalid value" }}, valid_session
        assigns(:inquiry).should eq(inquiry)
      end

      it "re-renders the 'edit' template" do
        inquiry = Inquiry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Inquiry.any_instance.stub(:save).and_return(false)
        put :update, {:id => inquiry.to_param, :inquiry => { "subject" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inquiry" do
      inquiry = Inquiry.create! valid_attributes
      expect {
        delete :destroy, {:id => inquiry.to_param}, valid_session
      }.to change(Inquiry, :count).by(-1)
    end

    it "redirects to the inquiries list" do
      inquiry = Inquiry.create! valid_attributes
      delete :destroy, {:id => inquiry.to_param}, valid_session
      response.should redirect_to(inquiries_url)
    end
  end

end
