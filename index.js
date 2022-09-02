const express = require("express");
const bodyParser = require("body-parser");

const database = require("./queries");

const PORT = 99;

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.send({ masage: "Hello World" });
});

// Authors API
app.post("/api/authors", database.createAuthor);
app.get("/api/authors", database.getAuthorsList);
app.get("/api/authors/:authorid", database.getAuthorById);
app.put("/api/authors/:authorid", database.updateAuthor)
app.delete("/api/authors/:authorid", database.deleteAuthorById)

// Book API
app.post("/api/books", database.createBook);
app.get("/api/books", database.getBooksList);
app.get("/api/books/:bookid", database.getBookById);
app.put("/api/books/:bookid", database.updateBook);
app.delete("/api/books/:bookid", database.deleteBookById)

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
