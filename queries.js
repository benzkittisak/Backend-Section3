const Pool = require("pg").Pool;

const con = new Pool({
  user: "postgres",
  host: "localhost",
  database: "MombieStreetAssign",
  password: "admin",
  port: 3306,
});

// Author API
const createAuthor = (req, res) => {
  const {
    first_name,
    family_name,
    date_of_birth,
    date_of_death,
    name,
    lifespan,
    url,
  } = req.body;

  con.query(
    "INSERT INTO library.author ( first_name, family_name, date_of_birth, date_of_death, name, lifespan, url) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING * ",
    [
      first_name,
      family_name,
      date_of_birth,
      date_of_death,
      name,
      lifespan,
      url,
    ],
    (error, result) => {
      if (error) {
        throw error;
      }
      res.status(201).send(`Author added with ID: ${result.rows[0].author_id}`);
    }
  );
};

const getAuthorsList = (req, res) => {
  con.query("SELECT * FROM library.author", (error, result) => {
    if (error) {
      throw error;
    }
    res.status(200).json(result.rows);
  });
};

const getAuthorById = (req, res) => {
  const author_id = req.params.authorid;
  con.query(
    "SELECT * FROM library.author WHERE author_id = $1",
    [author_id],
    (error, result) => {
      if (error) {
        throw error;
      }

      res.status(200).json(result.rows);
    }
  );
};

const updateAuthor = (req, res) => {
  const author_id = req.params.authorid;
  const {
    first_name,
    family_name,
    date_of_birth,
    date_of_death,
    name,
    lifespan,
    url,
  } = req.body;

  con.query(
    "UPDATE library.author SET first_name = $1, family_name = $2 , date_of_birth = $3, date_of_death = $4 , name = $5, lifespan = $6, url = $7 WHERE author_id = $8",
    [
      first_name,
      family_name,
      date_of_birth,
      date_of_death,
      name,
      lifespan,
      url,
      author_id,
    ],
    (err, result) => {
      if (err) {
        throw err;
      }
      res
        .status(200)
        .send(`Author updated successfully with ID : ${author_id}`);
    }
  );
};

const deleteAuthorById = (req, res) => {
  const author_id = req.params.authorid;

  con.query(
    "DELETE FROM library.author WHERE author_id = $1",
    [author_id],
    (err, result) => {
      if (err) {
        throw err;
      }
      res.status(200).send(`Delete author successfully with ID : ${author_id}`);
    }
  );
};

// Book API
const createBook = (req, res) => {
  const { title, author_id, summary, ISBN, url } = req.body;
  con.query(
    'INSERT INTO library.book ( title,author_id,summary,"ISBN", url) VALUES ($1, $2, $3, $4, $5) RETURNING * ',
    [title, author_id, summary, ISBN, url],
    (error, result) => {
      if (error) {
        throw error;
      }
      res.status(201).send(`Book added with ID: ${result.rows[0].book_id}`);
    }
  );
};

const getBooksList = (req, res) => {
  con.query("SELECT * FROM library.book", (error, result) => {
    if (error) {
      throw error;
    }
    res.status(200).json(result.rows);
  });
};

const getBookById = (req, res) => {
  const book_id = req.params.bookid;
  con.query(
    "SELECT * FROM library.book WHERE book_id = $1",
    [book_id],
    (error, result) => {
      if (error) {
        throw error;
      }

      res.status(200).json(result.rows);
    }
  );
};

const updateBook = (req, res) => {
  const book_id = req.params.bookid;
  const { title, author_id, summary, ISBN, url } = req.body;

  con.query(
    'UPDATE library.book SET title = $1, author_id = $2 , summary = $3, "ISBN" = $4 , url = $5 WHERE book_id = $6',
    [title,author_id , summary, ISBN, url , book_id],
    (err, result) => {
      if (err) {
        throw err;
      }
      res
        .status(200)
        .send(`Book updated successfully with ID : ${author_id}`);
    }
  );
};

const deleteBookById = (req, res) => {
  const book_id = req.params.bookid;

  con.query(
    "DELETE FROM library.book WHERE book_id = $1",
    [book_id],
    (err, result) => {
      if (err) {
        throw err;
      }
      res.status(200).send(`Delete book successfully with ID : ${book_id}`);
    }
  );
};

module.exports = {
  createAuthor,
  getAuthorsList,
  getAuthorById,
  updateAuthor,
  deleteAuthorById,

  createBook,
  getBooksList,
  getBookById,
  updateBook,
  deleteBookById
};
