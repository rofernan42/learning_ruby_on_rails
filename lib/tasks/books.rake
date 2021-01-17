namespace :books do
  desc "Populate the slug for each book without a slug"
  task populate_slug: :environment do
    Rails.logger.info("Populate starts")
    Book.where(slug: nil).find_each do |book|
      Rails.logger.info("Populating the slug for book #{book.id}")
      book.save! # !: fait planter la tache s'il y a une erreur
    end
    Rails.logger.info("Populate done")
  end

end
