CREATE TABLE students (
	idStudent SERIAL PRIMARY KEY,
	studentName varchar(100) NOT NULL,
	birthday date NOT NULL,
	age int 
);

CREATE TABLE students_classes (
	idRegister SERIAL PRIMARY KEY,
	idStudent int,
	CONSTRAINT fk_student FOREIGN KEY (idStudent) REFERENCES students (idStudent),
	idClass int,
	CONSTRAINT fk_class FOREIGN KEY (idClass) REFERENCES classes (idClass)
);

CREATE TABLE classes (
	idClass SERIAL PRIMARY KEY,
	idCourse int,
	CONSTRAINT fk_course FOREIGN KEY (idCourse) REFERENCES courses (idCourse),
	teacher varchar(100) NOT NULL
);

CREATE TABLE courses (
	idCourse SERIAL PRIMARY KEY,
	subject varchar(50)
);

SELECT * FROM classes
SELECT * FROM courses
SELECT * FROM students
SELECT * FROM students_classes

------------------------------------EX A----------------------------------------
	  -- Listar todos os alunos matriculados em uma turma específica. --

SELECT studentName, idClass FROM students INNER JOIN students_classes USING (idStudent)
INNER JOIN classes USING (idClass) WHERE idClass = 23

------------------------------------EX B----------------------------------------



------------------------------------EX C----------------------------------------
			   -- Contar o número de alunos em cada turma. --

	-- COUNT(nomeDaColuna) -> Conta a qtd de itens numa coluna
	-- Nesse caso, conta a quantidade de estudantes (idStudent) presentes 
	-- no INNER JOIN com uma turma específica (FROM(INNER JOIN))

SELECT COUNT (idStudent) FROM (SELECT idStudent, idClass FROM students INNER JOIN students_classes USING (idStudent)
INNER JOIN classes USING (idClass) WHERE idClass = 23)
