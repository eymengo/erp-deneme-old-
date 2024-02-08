-- Departmanlar tablosu
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100),
    ManagerID INT,
    Location VARCHAR(255),
    Budget DECIMAL(15, 2)
);

-- Çalışanlar tablosu
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female'),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    DepartmentID INT,
    JobTitle VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(15, 2),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Projeler tablosu
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY AUTO_INCREMENT,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(15, 2),
    DepartmentID INT,
    ManagerID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- Görevler tablosu
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY AUTO_INCREMENT,
    TaskName VARCHAR(100),
    Description TEXT,
    StartDate DATE,
    DueDate DATE,
    Priority ENUM('Low', 'Medium', 'High'),
    Status ENUM('Open', 'In Progress', 'Completed'),
    ProjectID INT,
    AssignedTo INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (AssignedTo) REFERENCES Employees(EmployeeID)
);

-- İzinler tablosu
CREATE TABLE LeaveRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    LeaveType ENUM('Annual', 'Sick', 'Maternity', 'Paternity'),
    StartDate DATE,
    EndDate DATE,
    Status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
