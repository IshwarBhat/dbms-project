-- View
-- Which Drugs have been prescribed by Doctors?
CREATE VIEW vw_DoctorPrescriptionDrugs
  AS  
  SELECT FirstName, LastName, VisitID, Name as DrugName, Company as DrugCompany from Prescription
    JOIN Drug ON Prescription.DrugID = Drug.ID
    JOIN Visit ON Prescription.VisitID = Visit.ID
    JOIN Doctor ON Visit.DoctorID = Doctor.ID
;
GO
-- Common Table Expression (CTE)
-- Which Patients have the most number of visits?
WITH PatientVisits AS
(
  SELECT PatientID, COUNT(*) as NumberOfVisits, MAX(VisitDate) as LastVisitDate
  FROM Visit
  GROUP BY PatientID
)
SELECT FirstName, LastName, PhoneNumber, Email, NumberOfVisits, LastVisitDate
  FROM PatientVisits
  JOIN Patient ON PatientVisits.PatientID = Patient.ID
  ORDER BY NumberOfVisits DESC
;

-- Function
-- Caclulate Age, given Date Of Birth
GO
CREATE FUNCTION GetAgeFromDOB(@dob date) RETURNS INTEGER
AS
BEGIN
   DECLARE @age INTEGER

   set @age =
     CASE 
        WHEN MONTH(GETDATE()) > MONTH(@dob) OR
          MONTH(GETDATE()) = MONTH(@dob) AND DAY(GETDATE()) >= DAY(@dob)
        THEN DATEDIFF(year, @dob, GETDATE()) 
        ELSE DATEDIFF(year, @dob, GETDATE()) - 1 
     END
   RETURN @age
END;
GO

-- Get a list of Patients with their Age in years
-- by calling the GetAgeFromDOB Function
SELECT FirstName, LastName, Email, PhoneNumber, FORMAT(DateOfBirth, 'yyyy-MM-dd') as DateOfBirth,  
    [dbo].GetAgeFromDOB(DateOfBirth) as AgeInYears
FROM Patient;