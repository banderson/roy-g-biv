require 'rails_helper'

describe ColorsController, :type => :controller do
  let!(:queue) do
    Queues::InMemory.empty
    Queues::InMemory
  end

  after(:all) { InMemory.empty }

  describe '#INDEX' do
    it 'should render the index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'should return 200 ok' do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe '#CREATE' do
    it 'should add a color into the queue' do
      expect{post :create}.to change{queue.length}.by 1
    end

    it 'should return 200 ok' do
      post :create
      expect(response).to have_http_status :created
    end
  end

  describe '#GET' do
    it 'should remove the first color from the queue' do
      post :create
      expect{get :show}.to change{queue.length}.by(-1)
    end

    it 'should return default color if no colors left in the queue' do
      expect{get :show}.to change{queue.length}.by 0
      expect(response.body).to eq '{"r":0,"g":0,"b":0}'
    end

    it 'should return 200 ok' do
      expect(get :show).to have_http_status :ok
      post :create
      expect(get :show).to have_http_status :ok
    end
  end
end
