DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id serial4 PRIMARY KEY,
  merchant_id INT4 references merchants(id),
  tag_id INT4 references tags(id),
  cost INT4,
  transaction_date date,
  description VARCHAR(255)
);