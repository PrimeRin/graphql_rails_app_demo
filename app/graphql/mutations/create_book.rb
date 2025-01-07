# app/graphql/mutations/create_book.rb
module Mutations
  class CreateBook < BaseMutation
    description "Creates a new book"

    field :book, Types::BookType, null: false

    argument :title, String, required: true
    argument :sl_no, Integer, required: true
    argument :publish_year, Integer, required: true
    argument :price, Float, required: true
    argument :author_id, ID, required: true

    def resolve(title:, sl_no:, publish_year:, price:, author_id:)
      author = Author.find_by(id: author_id)
      raise GraphQL::ExecutionError, "Author not found" unless author

      book = Book.create!(
        title: title,
        sl_no: sl_no,
        publish_year: publish_year,
        price: price,
        author: author
      )

      { book: book }
    rescue ActiveRecord::RecordInvalid => e
      raise GraphQL::ExecutionError, e.record.errors.full_messages.join(", ")
    end
  end
end
