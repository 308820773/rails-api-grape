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
  end
end
