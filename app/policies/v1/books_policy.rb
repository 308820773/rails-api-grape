module V1
  class BooksPolicy < ApplicationPolicy
    def post_books?
      true
    end

    def put_books_id?
      true
    end

    def delete_books_id?
      true
    end

    def post_books_id_tags?
      true
    end

    def delete_books_id_tags?
      true
    end
  end
end
