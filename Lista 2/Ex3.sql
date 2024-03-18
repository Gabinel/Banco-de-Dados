CREATE TABLE Workers (
	-- SERIAL -> um tipo 'inteiro' de incremento automático
	idWorker SERIAL PRIMARY KEY,
	workerName varchar(100),
	admissionDate date
)

SELECT * FROM Workers

CREATE TABLE Projects (
	idProject SERIAL PRIMARY KEY,
	projectName varchar(100),
	description text,
	area varchar(50)
)

SELECT * FROM Projects

CREATE TABLE Workers_Projects (
	idWorker int,
	-- Sintaxe para declaração de FOREIGN KEYS (chaves estrangeiras)
	CONSTRAINT fkWorker FOREIGN KEY (idWorker) REFERENCES Workers (idWorker),
	idProject int,
	CONSTRAINT fkProject FOREIGN KEY (idProject) REFERENCES Projects (idProject)
)