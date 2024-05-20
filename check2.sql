CREATE TABLE Gymnasiums (
    GymID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Address VARCHAR(255),
    TelephoneNumber VARCHAR(15)
);
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    GymID INT,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    Address VARCHAR(255),
    DateOfBirth DATE,
    Gender CHAR(1),
    FOREIGN KEY (GymID) REFERENCES Gymnasiums(GymID)
);
CREATE TABLE Sessions (
    SessionID INT PRIMARY KEY AUTO_INCREMENT,
    GymID INT,
    SportType VARCHAR(100),
    Schedule DATETIME,
    MaxCapacity INT DEFAULT 20,
    FOREIGN KEY (GymID) REFERENCES Gymnasiums(GymID)
);
CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY AUTO_INCREMENT,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    Age INT,
    Specialty VARCHAR(100)
);
CREATE TABLE SessionMembers (
    SessionID INT,
    MemberID INT,
    PRIMARY KEY (SessionID, MemberID),
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
CREATE TABLE SessionCoaches (
    SessionID INT,
    CoachID INT,
    PRIMARY KEY (SessionID, CoachID),
    FOREIGN KEY (SessionID) REFERENCES Sessions(SessionID),
    FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID)
);
