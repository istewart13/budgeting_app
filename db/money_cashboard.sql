DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CASCADE ON DELETE

CREATE TABLE merchants (
  id serial4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE tags (
  id serial4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE transactions(
  id serial4 PRIMARY KEY,
  merchant_id INT4 references merchants(id) ON DELETE CASCADE,
  tag_id INT4 references tags(id) ON DELETE CASCADE,
  value NUMERIC(10,2) NOT NULL,
  transaction_date date NOT NULL,
  description VARCHAR(255)
);