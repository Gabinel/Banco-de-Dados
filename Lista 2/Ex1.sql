CREATE TABLE book (
idBook SERIAL PRIMARY KEY,
publisher varchar(50),
pubDate date,
isbn int,
title varchar(100)
);

CREATE TABLE writer (
idWriter SERIAL PRIMARY KEY,
writerName varchar(100),
cpf int
);

CREATE TABLE book_writer (
idPub SERIAL PRIMARY KEY,
idBook int,
CONSTRAINT fk_book FOREIGN KEY (idBook) REFERENCES book (idBook),
idWriter int,
CONSTRAINT fk_writer FOREIGN KEY (idWriter) REFERENCES writer (idWriter)
);

------------------------------------------------------------------------

INSERT INTO book (publisher,pubDate,isbn,title) VALUES
('leYa', '2015-09-15', '8544102921', 'As Crônicas de Gelo e Fogo'),
('HarperCollins', '2019-11-25', '8595086354', 'O Senhor dos Anéis'),
('HarperCollins', '2019-12-26', '8521098763', 'O Silmarillion'),
('Intrinseca', '2017-02-24', '8522988196', 'Mitologia Nórdica'),
('LTC', '2018-07-20', '8521635435', 'Um Curso de Cálculo');

INSERT INTO writer (writerName,cpf) VALUES
('George R. R. Martin', '199.653.782-90'),
('J. R. R. Tolkien', ''),
('Neil Gaiman', '342.199.878-62'),
('Hamilton Luíz Guidorizzi', '103.172.168.74');

INSERT INTO book_writer (idBook, idWriter) VALUES
(6, 1),
(7, 2),
(8, 2),
(9, 3),
(10, 4);

-------------------------------------------------------------------------

SELECT * FROM book
SELECT * FROM writer
SELECT * FROM book_writer

------------------------------------EX A----------------------------------------
                 -- Listar todos os livros e seus autores --

	-- Seleciona o nome do autor (da tabela WRITER) e o titulo do livro (da tabela BOOK)
	-- Porém, não há ligação entre eles, se não for pela tabela BOOK_WRITER (que recebe FK dos dois)
	
	-- Portanto, primeiro se faz o INNER JOIN da tabela WRITER com BOOK_WRITER, usando a FK comum entre eles
    -- SELECT writerName, title FROM writer INNER JOIN book_writer USING (idWriter) --

	-- Depois o mesmo processo é feito na tabela BOOK, que é também relacionada com a tabela BOOK_WRITER via FK
    -- INNER JOIN book USING (idBook) --
	
SELECT writerName, title FROM writer INNER JOIN book_writer USING (idWriter)
INNER JOIN book USING (idBook)

------------------------------------EX B----------------------------------------
       -- Encontrar todos os livros escritos por um autor específico. --

	-- Seleciona o nome do autor (da tabela WRITER) e o titulo do livro (da tabela BOOK)
	-- Porém, não há ligação entre eles, se não for pela tabela BOOK_WRITER (que recebe FK dos dois)
	
	-- Portanto, primeiro se faz o INNER JOIN da tabela WRITER com BOOK_WRITER, usando a FK comum entre eles
    -- SELECT writerName, title FROM writer INNER JOIN book_writer USING (idWriter) --

	-- Depois o mesmo processo é feito na tabela BOOK, que é também relacionada com a tabela BOOK_WRITER via FK
    -- INNER JOIN book USING (idBook) --
	
	-- Com todas 'interligadas', a seleção é feita onde o nome do autor é o nome desejado
    -- WHERE writerName = 'J. R. R. Tolkien'

	-- O nome do autor se relaciona com a PK idWriter, que se relaciona como FK com a tabela BOOK_WRITER
	-- A tabela BOOK_WRITER se relaciona com a FK idBook, chave primária da tabela BOOK
	-- Na tabela BOOK, enfim, o título do livro é selecionado de acordo com a PK do escritor relacionada
	-- com a PK do livro na tabela BOOK_WRITER

SELECT writerName, title FROM writer INNER JOIN book_writer USING (idWriter)
INNER JOIN book USING (idBook) WHERE writerName = 'J. R. R. Tolkien'

------------------------------------EX C----------------------------------------
     -- Encontrar todos os autores que escreveram um livro específico. --
	
SELECT writerName, title FROM writer INNER JOIN book_writer USING (idWriter)
INNER JOIN book USING (idBook) WHERE title = 'O Senhor dos Anéis'