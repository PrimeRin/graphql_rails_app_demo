# app/graphql/mutations/update_book.rb
module Mutations
  class UpdateBook < BaseMutation
    description "Updates an existing book"

    field :book, Types::BookType, null: false

    argument :id, ID, required: true
    argument :title, String, required: false
    argument :sl_no, Integer, required: false
    argument :publish_year, Integer, required: false
    argument :price, Float, required: false
    argument :author_id, ID, required: false

    def resolve(id:, title: nil, sl_no: nil, publish_year: nil, price: nil, author_id: nil)
      book = Book.find_by(id: id)
      raise GraphQL::ExecutionError, "Book not found" unless book

      if title
        book.title = title
      end
      if sl_no
        book.sl_no = sl_no
      end
      if publish_year
        book.publish_year = publish_year
      end
      if price
        book.price = price
      end
      if author_id
        author = Author.find_by(id: author_id)
        raise GraphQL::ExecutionError, "Author not found" unless author
        book.author = author
      end

      if book.save
        { book: book }
      else
        raise GraphQL::ExecutionError, book.errors.full_messages.join(", ")
      end
    end
  end
end
