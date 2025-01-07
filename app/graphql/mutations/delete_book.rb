# app/graphql/mutations/delete_book.rb
module Mutations
  class DeleteBook < BaseMutation
    description "Deletes a book"

    field :id, ID, null: true

    argument :id, ID, required: true

    def resolve(id:)
      book = Book.find_by(id: id)
      raise GraphQL::ExecutionError, "Book not found" unless book

      book.destroy
      { id: id }
    rescue ActiveRecord::RecordNotFound
      raise GraphQL::ExecutionError, "Book not found"
    end
  end
end
