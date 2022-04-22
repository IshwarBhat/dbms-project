ALTER TABLE MedicalHistory
  DROP CONSTRAINT FK_MedicalHistory_Patient;

ALTER TABLE Visit
  DROP CONSTRAINT FK_Visit_Patient,
    FK_Visit_Doctor,
    FK_Visit_Room;

ALTER TABLE Prescription
  DROP CONSTRAINT FK_Prescription_Visit,
    FK_Prescription_Drug;

-- Drop depending objects first
DROP VIEW vw_DoctorPrescriptionDrugs;
DROP FUNCTION GetAgeFromDOB;

-- Drop users
DROP USER IF EXISTS ddladmin;  

-- Finally Drop the Tables
-- WARNING: THIS CANNOT BE UNDONE!
DROP TABLE Patient;
DROP TABLE Doctor;
DROP TABLE MedicalHistory;
DROP TABLE Room;
DROP TABLE Drug;
DROP TABLE Visit;
DROP TABLE Prescription;
