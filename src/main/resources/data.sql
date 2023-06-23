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

select * from book;