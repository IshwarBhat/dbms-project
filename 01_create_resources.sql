-- Entities
CREATE TABLE Patient (
  ID int PRIMARY KEY IDENTITY (1, 1),
  FirstName varchar(255) NOT NULL,
  LastName varchar(255),
  Email varchar(255),
  PhoneNumber varchar(25),
  DateOfBirth date,
  Sex varchar(25),
  SSN varchar(11),
  Street varchar(255),
  State varchar(5),
  ZipCode varchar(10)
);

CREATE TABLE Doctor (
  ID int PRIMARY KEY IDENTITY (1, 1),
  FirstName varchar(255) NOT NULL,
  LastName varchar(255),
  Email varchar(255),
  PhoneNumber varchar(25)
);

CREATE TABLE MedicalHistory (
  ID int PRIMARY KEY IDENTITY (1, 1),
  PatientID int,
  Medications varchar(255),
  Diseases varchar(255),
  Allergies varchar(255),
  FamilyHistory varchar(255)
);

CREATE TABLE Room (
  ID int PRIMARY KEY IDENTITY (1, 1),
  Number int NOT NULL,
  Floor int NOT NULL,
  Type varchar(255),
  Occupied bit NOT NULL
);

CREATE TABLE Drug (
  ID int PRIMARY KEY IDENTITY (1, 1),
  Name varchar(255) NOT NULL,
  Company varchar(255),
  UnitCost money
);

CREATE TABLE Visit (
  ID int PRIMARY KEY IDENTITY (1, 1),
  PatientID int NOT NULL,
  DoctorID int NOT NULL,
  RoomID int,
  VisitDate date,
  VisitTime time,
  PatientWeight float,
  PatientSymptoms varchar(255),
  Notes varchar(255)
);

CREATE TABLE Prescription (
  ID int PRIMARY KEY IDENTITY (1, 1),
  DrugID int NOT NULL,
  VisitID int NOT NULL,
  Quantity float,
  Dosage varchar(255)
);

-- Foreign Keys

-- Medical History of a Patient
ALTER TABLE MedicalHistory ADD
  CONSTRAINT FK_MedicalHistory_Patient FOREIGN KEY (PatientID)
    REFERENCES Patient (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

-- A Visit happens between a Patient and a Doctor in a Room
ALTER TABLE Visit ADD
  CONSTRAINT FK_Visit_Patient FOREIGN KEY (PatientID)
    REFERENCES Patient (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Visit_Doctor FOREIGN KEY (DoctorID)
    REFERENCES Doctor (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Visit_Room FOREIGN KEY (RoomID)
    REFERENCES Room (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;

-- A Prescription lists a Drug and happens during a Visit
ALTER TABLE Prescription ADD
  CONSTRAINT FK_Prescription_Visit FOREIGN KEY (VisitID)
    REFERENCES Visit (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Prescription_Drug FOREIGN KEY (DrugID)
    REFERENCES Drug (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
