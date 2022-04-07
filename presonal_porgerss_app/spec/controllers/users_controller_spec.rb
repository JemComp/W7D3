require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe "GET #index" do
        it "render the users index" do 
            allow(subject).to receive(:require_logged_in).and_return(true)
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #new" do
        it "bring up the form to make new user" do
            allow(subject).to receive(:require_logged_in).and_return(true)
        get :new
        expect(response).to render_template(:new)
        end
    end

end
