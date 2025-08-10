SHOW DATABASES;
USE arjit;


CREATE TABLE Employee_Master (
    EmployeeID VARCHAR(20),
    ReportingTo VARCHAR(20),
    EmailID NVARCHAR(255)
);

INSERT INTO Employee_Master (EmployeeID, ReportingTo, EmailID) VALUES
('H1', NULL, 'john.doe@example.com'),
('H2', NULL, 'jane.smith@example.com'),
('H3', 'John Smith H1', 'alice.jones@example.com'),
('H4', 'Jane Doe H1', 'bob.white@example.com'),
('H5', 'John Smith H3', 'charlie.brown@example.com'),
('H6', 'Jane Doe H3', 'david.green@example.com'),
('H7', 'John Smith H4', 'emily.gray@example.com'),
('H8', 'Jane Doe H4', 'frank.wilson@example.com'),
('H9', 'John Smith H5', 'george.harris@example.com'),
('H10', 'Jane Doe H5', 'hannah.taylor@example.com'),
('H11', 'John Smith H6', 'irene.martin@example.com'),
('H12', 'Jane Doe H6', 'jack.roberts@example.com'),
('H13', 'John Smith H7', 'kate.evans@example.com'),
('H14', 'Jane Doe H7', 'laura.hall@example.com'),
('H15', 'John Smith H8', 'mike.anderson@example.com'),
('H16', 'Jane Doe H8', 'natalie.clark@example.com'),
('H17', 'John Smith H9', 'oliver.davis@example.com'),
('H18', 'Jane Doe H9', 'peter.edwards@example.com'),
('H19', 'John Smith H10', 'quinn.fisher@example.com'),
('H20', 'Jane Doe H10', 'rachel.garcia@example.com'),
('H21', 'John Smith H11', 'sarah.hernandez@example.com'),
('H22', 'Jane Doe H11', 'thomas.lee@example.com'),
('H23', 'John Smith H12', 'ursula.lopez@example.com'),
('H24', 'Jane Doe H12', 'victor.martinez@example.com'),
('H25', 'John Smith H13', 'william.nguyen@example.com'),
('H26', 'Jane Doe H13', 'xavier.ortiz@example.com'),
('H27', 'John Smith H14', 'yvonne.perez@example.com'),
('H28', 'Jane Doe H14', 'zoe.quinn@example.com'),
('H29', 'John Smith H15', 'adam.robinson@example.com'),
('H30', 'Jane Doe H15', 'barbara.smith@example.com');





CREATE TABLE Employee_Hierarchy (
    EmployeeID VARCHAR(20),
    ReportingTo VARCHAR(255),
    EmailID NVARCHAR(255),
    Level INT,
    FirstName NVARCHAR(255),
    LastName NVARCHAR(255)
);

drop table Employee_Hierarchy;






DELIMITER //

CREATE FUNCTION ExtractFirstName (Email NVARCHAR(255))
RETURNS NVARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN SUBSTRING(Email, 1, LOCATE('.', Email) - 1);
END //

CREATE FUNCTION ExtractLastName (Email NVARCHAR(255))
RETURNS NVARCHAR(255)
DETERMINISTIC
BEGIN
    RETURN SUBSTRING(
        Email, 
        LOCATE('.', Email) + 1, 
        LOCATE('@', Email) - LOCATE('.', Email) - 1
    );
END //

DELIMITER ;





DELIMITER //

CREATE PROCEDURE SP_Hierarchy()
BEGIN
    -- Truncate the Employee_Hierarchy table to start fresh
    TRUNCATE TABLE Employee_Hierarchy;

    -- Insert root level employees (those who do not report to anyone)
    INSERT INTO Employee_Hierarchy (EmployeeID, ReportingTo, EmailID, Level, FirstName, LastName)
    SELECT 
        EmployeeID,
        ReportingTo,
        EmailID,
        1 AS Level,
        ExtractFirstName(EmailID),
        ExtractLastName(EmailID)
    FROM 
        Employee_Master
    WHERE 
        ReportingTo IS NULL;

    -- Recursive CTE to generate hierarchy
    WITH RECURSIVE HierarchyCTE AS (
        SELECT 
            EmployeeID,
            ReportingTo,
            EmailID,
            1 AS Level,
            ExtractFirstName(EmailID) AS FirstName,
            ExtractLastName(EmailID) AS LastName
        FROM 
            Employee_Hierarchy
        
        UNION ALL
        
        SELECT 
            em.EmployeeID,
            em.ReportingTo,
            em.EmailID,
            h.Level + 1,
            ExtractFirstName(em.EmailID),
            ExtractLastName(em.EmailID)
        FROM 
            Employee_Master em
        INNER JOIN 
            HierarchyCTE h ON em.ReportingTo = h.EmployeeID
    )
    
    -- Insert the remaining hierarchy
    INSERT INTO Employee_Hierarchy (EmployeeID, ReportingTo, EmailID, Level, FirstName, LastName)
    SELECT 
        EmployeeID,
        ReportingTo,
        EmailID,
        Level,
        FirstName,
        LastName
    FROM 
        HierarchyCTE;
END //

DELIMITER ;



CALL SP_Hierarchy();



