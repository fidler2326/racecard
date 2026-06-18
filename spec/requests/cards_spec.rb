require "rails_helper"

RSpec.describe "Cards", type: :request do
  describe "GET /cards" do
    it "returns a successful response" do
      Card.create!(name: "Test Card")

      get cards_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /cards/new" do
    it "returns a successful response" do
      get new_card_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /cards" do
    context "with valid parameters" do
      let(:valid_attributes) do
        {
          name: "Test Card"
        }
      end

      it "creates a new Card" do
        expect do
          post cards_path, params: { card: valid_attributes }
        end.to change(Card, :count).by(1)
      end

      it "redirects to the created card" do
        post cards_path, params: { card: valid_attributes }

        expect(response).to redirect_to(Card.last)
        expect(flash[:notice]).to eq("Card was successfully created.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        {
          name: nil
        }
      end

      it "does not create a new Card" do
        expect do
          post cards_path, params: { card: invalid_attributes }
        end.not_to change(Card, :count)
      end

      it "renders a response with unprocessable entity or ok status" do
        post cards_path, params: { card: invalid_attributes }

        expect(response).to have_http_status(:ok).or have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "GET /cards/:id" do
    it "returns a successful response" do
      card = Card.create!(name: "Test Card")

      get card_path(card)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /cards/:id/edit" do
    it "returns a successful response" do
      card = Card.create!(name: "Test Card")

      get edit_card_path(card)

      expect(response).to have_http_status(:ok)
    end
  end

  describe "PATCH /cards/:id" do
    let!(:card) { Card.create!(name: "Original Card") }

    context "with valid parameters" do
      let(:new_attributes) do
        {
          name: "Updated Card"
        }
      end

      it "updates the requested card" do
        patch card_path(card), params: { card: new_attributes }

        card.reload
        expect(card.name).to eq("Updated Card")
      end

      it "redirects to the card" do
        patch card_path(card), params: { card: new_attributes }

        expect(response).to redirect_to(card)
        expect(flash[:notice]).to eq("Card was successfully updated.")
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) do
        {
          name: nil
        }
      end

      it "does not update the requested card" do
        patch card_path(card), params: { card: invalid_attributes }

        card.reload
        expect(card.name).to eq("Original Card")
      end

      it "renders a response with unprocessable entity or ok status" do
        patch card_path(card), params: { card: invalid_attributes }

        expect(response).to have_http_status(:ok).or have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /cards/:id" do
    it "destroys the requested card" do
      card = Card.create!(name: "Test Card")

      expect do
        delete card_path(card)
      end.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card = Card.create!(name: "Test Card")

      delete card_path(card)

      expect(response).to redirect_to(cards_path)
      expect(flash[:notice]).to eq("Card was successfully deleted.")
    end
  end

  describe "JSON requests" do
    describe "POST /cards.json" do
      context "with valid parameters" do
        it "creates a new card and returns created status" do
          expect do
            post cards_path(format: :json), params: { card: { name: "JSON Card" } }
          end.to change(Card, :count).by(1)

          expect(response).to have_http_status(:created)
          expect(response.location).to eq(card_url(Card.last))
        end
      end

      context "with invalid parameters" do
        it "does not create a card and returns unprocessable entity status" do
          expect do
            post cards_path(format: :json), params: { card: { name: nil } }
          end.not_to change(Card, :count)

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    describe "PATCH /cards/:id.json" do
      let!(:card) { Card.create!(name: "Original Card") }

      context "with valid parameters" do
        it "updates the card and returns ok status" do
          patch card_path(card, format: :json), params: { card: { name: "Updated JSON Card" } }

          expect(response).to have_http_status(:ok)
          expect(card.reload.name).to eq("Updated JSON Card")
          expect(response.location).to eq(card_url(card))
        end
      end

      context "with invalid parameters" do
        it "does not update the card and returns unprocessable entity status" do
          patch card_path(card, format: :json), params: { card: { name: nil } }

          expect(response).to have_http_status(:unprocessable_entity)
          expect(card.reload.name).to eq("Original Card")
        end
      end
    end

    describe "DELETE /cards/:id.json" do
      it "destroys the card and returns no content status" do
        card = Card.create!(name: "JSON Card")

        expect do
          delete card_path(card, format: :json)
        end.to change(Card, :count).by(-1)

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end