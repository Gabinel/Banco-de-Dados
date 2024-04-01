CREATE TABLE patient (
	idPatient SERIAL PRIMARY KEY,
	patientName varchar(50) NOT NULL,
	birthday date,
	patientCondition varchar(100)
);

CREATE TABLE medic (
	idMedic SERIAL PRIMARY KEY,
	medicName varchar(50) NOT NULL,
	specialization varchar(25) NOT NULL
);

CREATE TABLE patient_medic (
	idRegister SERIAL PRIMARY KEY,
	idPatient int,
	CONSTRAINT fk_patient FOREIGN KEY (idPatient) REFERENCES patient (idPatient),
	idMedic int,
	CONSTRAINT fk_medic FOREIGN KEY (idMedic) REFERENCES medic (idMedic)
);