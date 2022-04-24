ALTER TABLE MedicalHistory
  DROP CONSTRAINT IF EXISTS FK_MedicalHistory_Patient;

ALTER TABLE Visit
  DROP CONSTRAINT IF EXISTS FK_Visit_Patient,
    FK_Visit_Doctor,
    FK_Visit_Room;

ALTER TABLE Prescription
  DROP CONSTRAINT IF EXISTS FK_Prescription_Visit,
    FK_Prescription_Drug;

-- Drop depending objects first
DROP VIEW IF EXISTS vw_DoctorPrescriptionDrugs;
DROP FUNCTION IF EXISTS GetAgeFromDOB;

-- Drop users
DROP USER IF EXISTS ddladmin;  

-- Finally Drop the Tables
-- WARNING: THIS CANNOT BE UNDONE!
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;
DROP TABLE IF EXISTS MedicalHistory;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Drug;
DROP TABLE IF EXISTS Visit;
DROP TABLE IF EXISTS Prescription;
