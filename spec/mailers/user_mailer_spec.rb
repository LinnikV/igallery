# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'category_subscribe' do
    let(:mail) { UserMailer.category_subscribe }

    it 'renders the headers' do
      expect(mail.subject).to eq('Category subscribe')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end

  describe 'photo_create' do
    let(:mail) { UserMailer.photo_create }

    it 'renders the headers' do
      expect(mail.subject).to eq('Photo create')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
