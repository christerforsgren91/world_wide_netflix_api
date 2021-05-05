RSpec.describe 'GET /api/movies', type: :request do
  let(:top_100_response) do
    file_fixture('top_movie_search_api_response.json').read
  end

  describe 'receives top 100 movies globally' do
    before do
      stub_request(:get, "https://unogsng.p.rapidapi.com/search?type=movie&orderby=rating")
      .to_return(status: 200, body: top_100_response)
      get '/api/movies'
    end

    it 'is expected to respond 200' do
      expect(response).to have_http_status 200
    end

    it 'filter top 10 movies globally' do
      expect(response_json["body"].count).to eq 10
    end
  end
end