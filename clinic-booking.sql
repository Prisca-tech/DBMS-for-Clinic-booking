-- Create database
CREATE DATABASE ClinicDB;
USE ClinicDB;

-- Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(100)
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20) NOT NULL
);

-- Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20) NOT NULL
);

-- Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Treatments table
CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY AUTO_INCREMENT,
    TreatmentName VARCHAR(100) NOT NULL,
    TreatmentDescription TEXT,
    Cost DECIMAL(10, 2) NOT NULL
);

-- Appointment_Treatments
CREATE TABLE Appointment_Treatments (
    AppointmentID INT,
    TreatmentID INT,
    Dosage VARCHAR(50),
    Quantity INT,    
    PRIMARY KEY (AppointmentID, TreatmentID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);

