### Demo GraphQL Ruby API Project

This project demonstrates how to set up a GraphQL API using Ruby on Rails, allowing clients to perform CRUD (Create, Read, Update, Delete) operations on Book records.

#### Prerequisites
Ensure you have the following installed:

- Ruby: Version 2.3.0 or higher.
- Rails: Version 5.2 or higher.
- Bundler: For managing Ruby gems.

#### Installation
1. Clone the Repository:

```
 git clone ....
```

#### Graphql Installation


#### Graphql CRUD Demo
1. Generate graphql book object - queries
```
rails generate graphql:object book
```

2. Generate graphql book object - mutations
```
rails generate graphql:mutation CreateBook
```

#### Queries
1. Query to fetch books with authors 
```
query{
  books{
    id, 
    title
    author{
      id
      name
    }
  }
}
```

#### Mutations
1. Create Book mutation
```
mutation{
  createBook(
    input:{
      title: "Test book",
      slNo: 1230,
      publishYear: 2023,
      price: 2023,
      authorId: 3
    }
  ){book{id, title}}
}
```

2. Update Book mutation
```
mutation{
  updateBook(
    input:{
      id: 2
      title:"New "
    }
  ){book{id title}}
}
```

3. Delete Book mutation
```
mutation{
  deleteBook(
    input: {
      id: 2
    }
  ){id}
}
```
