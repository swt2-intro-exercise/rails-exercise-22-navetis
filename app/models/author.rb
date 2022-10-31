class Author < ApplicationRecord
    def name
        first_name + " " + last_name
    end

    validates :last_name, presence: true
    validate :homepage_starts_with_http

    private
    def homepage_starts_with_http
      errors.add(homepage, "doesn't start with http") unless homepage.start_with?("http")
    end
  end
