# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_book, mutation: Mutations::DeleteBook
    field :create_book, mutation: Mutations::CreateBook
    field :update_book, mutation: Mutations::UpdateBook
  end
end
