require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "book_updated" do
    let(:book) { FactoryBot.create(:book) }
    let(:mail) { AdminMailer.with(book: book).book_updated }
    let(:name) { "mailer" }

    it "renders the headers" do
      expect(mail.subject).to eq("Book updated")
      expect(mail.to).to eq(["romain@booksodb.org"])
      expect(mail.from).to eq(["contact@booksodb.org"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hello")
    end

    it "includes a link to the book" do
      expect(mail.body.encoded).to match(book_url(book.slug))
    end
  end
end
