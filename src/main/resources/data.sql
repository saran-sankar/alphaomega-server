DELETE FROM book;
ALTER TABLE book AUTO_INCREMENT = 1001;

DELETE FROM category;
ALTER TABLE category AUTO_INCREMENT = 1001;

INSERT INTO `category` (`name`) VALUES ('Classics'),('Fantasy'),('Mystery'),('Non-Fiction');

select * from category;

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Divine Comedy', 'Dante Alighieri', '', 699, 0, TRUE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Confessions', 'Saint Augustine', '', 799, 0, FALSE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Paradise Lost', 'John Milton', '', 599, 0, TRUE, FALSE, 1001);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Hamlet', 'William Shakespeare', '', 499, 0, TRUE, FALSE, 1001);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Lion, the Witch and the Wardrobe', 'C.S. Lewis', '', 699, 0, TRUE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Fellowship of the Ring', 'J.R.R. Tolkien', '', 799, 0, FALSE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Two Towers', 'J.R.R. Tolkien', '', 599, 0, TRUE, FALSE, 1002);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Return of the King', 'J.R.R. Tolkien', '', 499, 0, TRUE, FALSE, 1002);

INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Father Dowling Mysteries', 'Ralph McInerny', '', 699, 0, TRUE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('A Willing Murder', 'Jude Deveraux', '', 799, 0, FALSE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Shadow of the Bear', 'Regina Doman', '', 599, 0, TRUE, FALSE, 1003);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Murder in the Sacristy', 'Amelia McHaney', '', 499, 0, TRUE, FALSE, 1003);


INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The City of God', 'Dante Alighieri', '', 699, 0, TRUE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('The Catechism of the Catholic Church', 'Vatican', '', 799, 0, FALSE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ('Jesus of Nazareth', 'Pope Benedict XVI', '', 599, 0, TRUE, FALSE, 1004);
INSERT INTO `book` (title, author, description, price, rating, is_public, is_featured, category_id) VALUES ("The Lamb's Supper", 'Scott Hahn', '', 499, 0, TRUE, FALSE, 1004);

select * from book;