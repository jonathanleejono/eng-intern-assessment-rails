class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def self.search(text)
    if text.present?
      where("title LIKE ? OR content LIKE ? OR date LIKE ? OR author LIKE ?",
      "%#{sanitize_sql_like(text)}%",
      "%#{sanitize_sql_like(text)}%",
      "%#{sanitize_sql_like(text)}%",
      "%#{sanitize_sql_like(text)}%")
    else
      all
    end
  end
end
