require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SessionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #home'
    it "returns a success response" do
      get :home, params: {}, session: valid_session
      expect(response).to be_successful
  end
end
