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

SELECT * FROM projects
SELECT * FROM workers
SELECT * FROM workers_projects

------------------------------------EX A----------------------------------------
     -- Listar todos os funcionários associados a um projeto específico. --

SELECT workerName, projectName FROM workers INNER JOIN workers_projects USING (idWorker)
INNER JOIN projects USING (idProject) WHERE projectName = 'Retrofit FMS'

------------------------------------EX B----------------------------------------
-- Encontrar todos os projetos em que um funcionário específico está envolvido. --

SELECT workerName, projectName FROM workers INNER JOIN workers_projects USING (idWorker)
INNER JOIN projects USING (idProject) WHERE workerName = 'Wagner'

------------------------------------EX C----------------------------------------
		   -- Calcular a média de funcionários por projeto. --
	
SELECT * (COUNT idWorker FROM (SELECT workerName, projectName FROM workers INNER JOIN workers_projects USING (idWorker)
INNER JOIN projects USING (idProject) WHERE idProject = counter));