drop table if exists commentpost;
drop table if exists likepost;
drop table if exists likecomment;
drop table if exists commentsdata;
drop table if exists postdata;
drop table if exists groupmembers;
drop table if exists pagemembers;
drop table if exists grouppage;
drop table if exists groupdata;
drop table if exists pagedata;
drop table if exists salesdata;
drop table if exists advertisementdata;
drop table if exists employeedata;
drop table if exists messagesdata;
drop table if exists userdata;

CREATE TABLE UserData (
    UserID INTEGER,
    Rating INTEGER,
    ZipCode INTEGER,
    UPassword VARCHAR(20),
    AccountNumber INTEGER,
    LastName VARCHAR(20),
    FirstName VARCHAR(20),
    Address VARCHAR(50),
    City VARCHAR(20),
    State VARCHAR(20),
    CreditCardNumber INTEGER,
    EmailAddress VARCHAR(50),
    AccountCreationDate DATE NOT NULL,
    Preferences VARCHAR(1000),
    PRIMARY KEY (UserID),
    UNIQUE (AccountNumber)
);

CREATE TABLE MessagesData (
    MessageID INTEGER,
    Sender INTEGER,
    Receiver INTEGER,
    Content VARCHAR(1000),
    DateCreated DATE,
    SubjectLine VARCHAR(60),
    PRIMARY KEY (MessageID),
    FOREIGN KEY (Sender)
        REFERENCES UserData (UserID),
    FOREIGN KEY (Receiver)
        REFERENCES UserData (UserID)
);

CREATE TABLE PageData (
    PageID INTEGER,
    PostCount INTEGER,
    OwnerID INTEGER,
    PageName VARCHAR(30),
    PRIMARY KEY (PageID),
    FOREIGN KEY (OwnerID)
        REFERENCES UserData (UserID)
);

CREATE TABLE PostData (
    PostID INTEGER,
    DateTimeCreated DATETIME NOT NULL,
    CommentCount INTEGER,
    Content VARCHAR(1000),
    PRIMARY KEY (PostID)
);

CREATE TABLE LikePost (
    AccountNumber INTEGER,
    PostID INTEGER,
    PRIMARY KEY (AccountNumber , PostID),
    FOREIGN KEY (AccountNumber)
        REFERENCES UserData (UserID),
    FOREIGN KEY (PostID)
        REFERENCES PostData (PostID)
);

CREATE TABLE CommentsData (
    CommentID INTEGER,
    DateTimeCreated DATETIME,
    Content VARCHAR(1000),
    Author INTEGER,
    PRIMARY KEY (CommentID),
    FOREIGN KEY (Author)
        REFERENCES UserData (UserID)
);

CREATE TABLE LikeComment (
    CommentID INTEGER,
    AccountNumber INTEGER,
    PRIMARY KEY (CommentID , AccountNumber),
    FOREIGN KEY (CommentID)
        REFERENCES CommentsData (CommentID),
    FOREIGN KEY (AccountNumber)
        REFERENCES UserData (UserID)
);

CREATE TABLE CommentPost (
    CommentID INTEGER,
    PostID INTEGER,
    PRIMARY KEY (CommentID , PostID),
    FOREIGN KEY (CommentID)
        REFERENCES CommentsData (CommentID),
    FOREIGN KEY (PostID)
        REFERENCES PostData (PostID)
);

CREATE TABLE GroupData (
    GroupID INTEGER,
    GroupType CHAR(15),
    OwnerID INTEGER,
    GroupName VARCHAR(30),
    PRIMARY KEY (GroupID),
    FOREIGN KEY (OwnerID)
        REFERENCES UserData (UserID)
);

CREATE TABLE GroupMembers (
    GroupID INTEGER,
    AccountNumber INTEGER,
    PRIMARY KEY (GroupID , AccountNumber),
    FOREIGN KEY (GroupID)
        REFERENCES GroupData (GroupID),
    FOREIGN KEY (AccountNumber)
        REFERENCES UserData (UserID)
);

CREATE TABLE GroupPage (
    GroupId INTEGER,
    PageID INTEGER,
    DateTimeCreated DATETIME,
    PRIMARY KEY (GroupID , PageID),
    FOREIGN KEY (GroupID)
        REFERENCES GroupData (GroupID),
    FOREIGN KEY (PageID)
        REFERENCES PageData (PageID)
);

CREATE TABLE EmployeeData (
    SSN INTEGER,
    EmployeeID INTEGER,
    ZipCode INTEGER,
    State VARCHAR(20),
    City VARCHAR(20),
    Address VARCHAR(50),
    LastName VARCHAR(20),
    FirstName VARCHAR(20),
    StartDate DATE NOT NULL,
    Telephone INTEGER,
    HourlyRate DOUBLE,
    AuthenicationLevel CHAR(1), #M for manager, C for customer representative
    PRIMARY KEY (EmployeeID),
    UNIQUE (SSN)
);

CREATE TABLE AdvertisementData (
    AdvertisementID INTEGER,
    EmployeeID INTEGER,
    AdvertisementType CHAR(20),
    Company VARCHAR(20),
    DateCreated DATE,
    Content VARCHAR(1000),
    ItemName VARCHAR(20),
    NumberOfUnits INTEGER,
    UnitPrice DOUBLE,
    PRIMARY KEY (AdvertisementID),
    FOREIGN KEY (EmployeeID)
        REFERENCES EmployeeData (EmployeeID)
);

CREATE TABLE SalesData (
    TransactionID INTEGER,
    AdvertisementID INTEGER,
    AccountNumber INTEGER,
    DateTimeCreated DATETIME,
    NumberOfUnits INTEGER,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (AdvertisementID)
        REFERENCES AdvertisementData (AdvertisementID),
    FOREIGN KEY (AccountNumber)
        REFERENCES UserData (UserID)
);