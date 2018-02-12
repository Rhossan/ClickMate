drop table if exists commentpost;
drop table if exists postpage;
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
    DateCreated DATETIME,
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
    PageID INTEGER,
    OwnerID INTEGER,
    DateTimeCreated DATETIME NOT NULL,
    CommentCount INTEGER,
    Content VARCHAR(1000),
    PRIMARY KEY (PostID),
    FOREIGN KEY (PageID)
        REFERENCES PageData (PageID)
        ON DELETE CASCADE
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
    LikedCount INTEGER,
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
    Telephone BIGINT,
    HourlyRate DOUBLE,
    AuthenicationLevel CHAR(1),
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
    ItemName VARCHAR(50),
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

INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES (2233, '1234', NULL, 10000, 2133, 'TTTT', 'AAAA', '123 ST, 2 AVENAGE', 'SB', 'NY', '123456789', '123@GMAIL.COM', '2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1001, 'pass2', NULL, 11377, 2134, 'Banks', 'Elizabeth', '124 ST, 1 AVE', 'Astoria', 'New York', '123456788','lizbanks@yahoo.com','2016-12-01', NULL); 
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1002, 'pass3', NULL, 11377, 2135, 'Banks', 'Gabriel', '124 ST, 1 AVE', 'Astoria', 'New York', '233457835','gabebanks@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1003, 'pass4', NULL, 11377, 2136, 'Banks', 'Renton', '124 ST, 1 AVE', 'Astoria', 'New York', '562478945','Rentonbanks@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1004, 'pass5', NULL, 11377, 2137, 'Banks', 'Kyle', '124 ST, 1 AVE', 'Astoria', 'New York', '532467844','kylebanks@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1005, 'pass6', NULL, 11377, 2138, 'Banks', 'Jeremy', '124 ST, 1 AVE', 'Astoria', 'New York', '435678076','Jeremybanks@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1006, 'pass1', NULL, 11377, 2139, 'Banks', 'Rick', '124 ST, 1 AVE', 'Astoria', 'New York', '765436786','rickbanks@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1007, 'gds112', NULL, 10027, 2140, 'Schmidt', 'Dario', '126 ST, 3 AVE', 'Manhattan', 'New York', '345724789','darioschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1008, 'gfsds', NULL, 10027, 2141, 'Schmidt', 'Ed', '126 ST, 3 AVE', 'Manhattan', 'New York', '768953567','Edschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1009, 'gsdfgr', NULL, 10027, 2142, 'Schmidt', 'Al', '126 ST, 3 AVE', 'Manhattan', 'New York', '862417890','Alschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1010, '42wtt4', NULL, 10027, 2143, 'Schmidt', 'Mike', '126 ST, 3 AVE', 'Manhattan', 'New York', '095634712','mikeschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1011, 'thy535', NULL, 10027, 2144, 'Schmidt', 'Matt', '126 ST, 3 AVE', 'Manhattan', 'New York', '534267894','mattschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1012, 'y5rttr', NULL, 10027, 2145, 'Schmidt', 'Chris', '126 ST, 3 AVE', 'Manhattan', 'New York', '513568346','chrisschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1013, 'y53ry5r', NULL, 10027, 2146, 'Schmidt', 'Christine', '126 ST, 3 AVE', 'Manhattan', 'New York', '984532678','christineschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1014, 'sfgha', NULL, 10027, 2147, 'Schmidt', 'Christine', '126 ST, 3 AVE', 'Manhattan', 'New York', '984532678','christineschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1015, 'sfgha', NULL, 10027, 2148, 'Schmidt', 'Kylie', '126 ST, 3 AVE', 'Manhattan', 'New York', '984532678','kylieschmidt@yahoo.com','2016-12-01', NULL);
INSERT INTO UserData(UserId, UPassword, Rating, ZipCode, AccountNumber, LastName, FirstName, Address, City, State, CreditCardNumber, EmailAddress, AccountCreationDate, Preferences)
VALUES(1016, 'sfgha133', NULL, 10027, 2149, 'Schmidt', 'Kyrie', '126 ST, 3 AVE', 'Manhattan', 'New York', '235753468','kyrieschmidt@yahoo.com','2016-12-01', NULL);

INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1002, 1004, 1005, 'WHERE R U?', '2016-12-21T20:25:10', 'WTFF!');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1003, 1005, 1004, 'I AM HERE WHERE R U?', '2016-12-21T20:25:30', 'WTFF!');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1004, 1004, 1005, 'I will wait outside the movie theater', '2016-12-21T20:25:40', 'WTFF!');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1005, 1004, 1005, 'nvm I see you', '2016-12-21T20:25:45', 'WTFF!');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1006, 1005, 1004, 'Did you get the parsing working for the hw?', '2016-12-23T5:30:30', '320 hw');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1007, 1005, 1004, 'my arrays dont fill in the values correctly', '2016-12-23T5:30:50', '320 hw');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1008, 1004, 1005, 'Did you try strtok?', '2016-12-23T5:31:20', '320 hw');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1009, 1004, 1005, 'nope, ok it works like charm', '2016-12-23T6:0:10', '320 hw');
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1010, 1005, 1004, 'I asked karen out', '2016-12-24T12:25:10', NULL);
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1011, 1005, 1004, 'She told me to go jump off a cliff', '2016-12-24T12:25:11', NULL);
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1012, 1004, 1005, 'Oh that reminds me, I asked your sister to a date.', '2016-12-24T12:40:10', NULL);
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1013, 1004, 1005, 'We are going out tomorrow night. Any advice?', '2016-12-24T12:40:11', NULL);
INSERT INTO MessagesData( MessageId, Sender, Receiver, Content, DateCreated, SubjectLine) 
VALUES (1014, 1005, 1004, 'I hate you', '2016-12-24T12:45:0', NULL);

INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(345267845,111,11790,'New York','Stony Brook', '32 ST, 10 AVE', 'Ali','Mohammad','2016-12-01',3479217900, 21.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(456346985,112,11790,'New York','Stony Brook', '35 ST, 10 AVE', 'Halpert','Jim','2016-03-01',347856456, 23.00, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(753287956,113,11790,'New York','Stony Brook', '37 ST, 10 AVE', 'Beesly','Pam','2016-09-01',347542456, 21.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(935726806,114,11790,'New York','Stony Brook', '39 ST, 10 AVE', 'Schrute','Dwight','2016-11-01',718543567, 21.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(240156845,115,11790,'New York','Stony Brook', '41 ST, 10 AVE', 'Malone','Kevin','2016-10-01',718642356, 21.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(096462678,116,11790,'New York','Stony Brook', '11 ST, 08 AVE', 'Martin','Angela','2016-12-01',718986452, 24.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(986463569,117,11790,'New York','Stony Brook', '35 ST, 08 AVE', 'Vance','Phyllus','2016-12-01',718563456, 21.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(436857357,118,11790,'New York','Stony Brook', '40 ST, 08 AVE', 'Bratton','Creed','2016-11-01',718764764, 22.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(086456786,119,11790,'New York','Stony Brook', '50 ST, 08 AVE', 'Ryan','Howard','2016-11-01',718234654, 21.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(764368964,120,11790,'New York','Stony Brook', '60 ST, 08 AVE', 'Kelly','Kapoor','2016-12-01',718675888, 28.50, 'C');
INSERT INTO EmployeeData(SSN, EmployeeID, ZipCode, State, City, Address, LastName, FirstName, StartDate, Telephone, HourlyRate, AuthenicationLevel)
VALUES(935165890,121,11790,'New York','Stony Brook', '32 ST, 10 AVE', 'Scott','Michael','2016-01-01',9175554455, 31.50, 'M');

INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1002, 114, 'Electronics', 'Microsoft', '2016-11-02', 'Laptop', 'Asus laptop', 1000, 599.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1003, 114, 'Entertainment', 'Rockstar', '2016-11-03', 'Video Game', 'GTA V', 1000, 59.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1004, 114, 'Entertainment', 'Bethesda', '2016-11-04', 'Video Game', 'Skyrim', 1000, 59.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1005, 114, 'Entertainment', 'Ubisoft', '2016-11-10', 'Video Game', 'Assassins Creed', 1000, 59.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1090, 117, 'Toys/Personal', 'Playboy', '2016-12-25', 'Adult Toy', 'Big Black ****', 1000, 49.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1091, 115, 'Drugs', 'Playboy', '2016-10-29', 'Male Enhancement', 'Extenzee', 1000, 49.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1092, 115, 'Dating', 'Subscription', '2016-10-05', 'Dating website', 'Tinder', NULL, 09.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (1093, 115, 'Adult', 'Pornhub', '2016-11-01', 'Adult Streaming', 'Pornhub', NULL, NULL);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (2010, 111, 'Electronics', 'Cell Phone', '2016-12-05', 'Cell Phone', 'IPhone 7', 1000, 799.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (2011, 111, 'Electronics', 'Vizio', '2016-12-05', 'Vizio TV', 'Vizio TCL 50', 500, 999.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (3001, 112, 'Website', 'Amazon', '2016-05-01', 'Video Streaming', 'Amazon Prime', NULL, 09.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (3002, 112, 'Website', 'Netflix', '2016-05-01', 'Video streaming', 'Netflix', NULL, 10.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (3003, 112, 'Website', 'Hulu', '2016-05-01', 'Video streaming', 'Hulu', NULL, 09.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (7001, 113, 'Electronics', 'Nikon', '2016-10-01', 'Camera', 'COOLPIX L830 16 MP 30x', 750, 399.99);
INSERT INTO sys.advertisementdata(AdvertisementID, EmployeeID, AdvertisementType, Company, DateCreated, Content, ItemName, NumberOfUnits, UnitPrice)
VALUES (5001, 113, 'Food', 'EdibleArrangements', '2016-11-01', 'Sweets', 'Chocolate bouquet', 1000, 29.99);

INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (1, 0, 1001);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (1, 'SBCS', 1001, 'THIS IS A TEST');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (1, 1, '2016-11-7');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (2, 0, 1002);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (2, 'BDSM', 1002, 'MYLITTLEPONY');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (2, 2, '2016-11-7');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (3, 0, 1004);
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (4, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (3, 'Dating', 1003, 'MidgetsR_us');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (3, 4, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (5, 0, 1001);
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (6, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (5, 'Dating', 1003, 'FreaksAndGeeks');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (5, 6, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (7, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (6, 'Dating', 1003, 'Tinder2.0');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (6, 7, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (8, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (7, 'Adult Cartoons', 1003, 'Tentacles');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (7, 8, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (9, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (8, 'Comedy', 1003, 'Seinfeld Pics');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (8, 9, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (10, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (9, 'Miscellaneous', 1003, 'Food Porn');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (9, 10, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (11, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (10, 'DarkWeb', 1003, 'Weed');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (10, 11, '2016-11-8');
INSERT INTO PageData(PageID, PostCount, OwnerID)
VALUES (12, 0, 1003);
INSERT INTO GroupData (GroupID, GroupType, OwnerID, GroupName)
VALUES (11, 'Porn', 1003, 'TotallyNormalStuff');
INSERT INTO GroupPage (GroupId, PageID, DateTimeCreated)
VALUES (11, 12, '2016-11-8');

INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (0, 8, 1001, '2016-12-24T12:40:11', 0, 'Swiggity Wiggly SomethingSomething');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (1, 8, 1002, '2016-12-24T12:42:11', 0, 'Swiggity Wiggly SomethingSomething');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (2, 8, 1003, '2016-12-24T12:50:11', 0, 'Swiggity Swagg SomethingSomething');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (3, 8, 1004, '2016-12-24T12:55:11', 0, 'Swiggity Swagg Im Something');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (4, 8, 1005, '2016-12-24T13:4:11', 0, 'Swiggity swiggity');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (5, 8, 1006, '2016-12-24T14:40:11', 0, 'Gitty Gitty');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (6, 8, 1007, '2016-12-24T14:45:11', 0, 'Goo');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (7, 8, 1008, '2016-12-24T14:46:11', 0, 'Its quagmire, quagmire');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (8, 8, 1009, '2016-12-24T14:48:11', 0, 'Gitty');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (9, 8, 1010, '2016-12-24T15:54:11', 0, 'gitty');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (10, 8, 1011, '2016-12-24T16:00:11', 0, 'gitty');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (11, 8, 1012, '2016-12-24T16:20:11', 0, 'gitty gitty');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (12, 8, 1013, '2016-12-24T16:24:11', 0, 'Guys stop spamming');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (13, 8, 1014, '2016-12-24T16:30:11', 0, 'NEVERRRRRRRRRRRRRR. Here I have power!!!');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;

INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1002,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1003,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1004,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1005,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1006,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1007,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1008,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1009,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1010,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1011,0);
INSERT INTO LikePost(AccountNumber, PostID)
VALUES (1012,0);

INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (2, 1003);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (2, 1004);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (2, 1006);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (2, 1010);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (3, 1009);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (3, 1002);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (3, 1007);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (3, 1011);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (5, 1004);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (5, 1008);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (5, 1009);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (5, 1014);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (6, 1009);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (6, 1012);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (6, 1013);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (6, 1014);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (7, 1009);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (7, 1012);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (8, 1013);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (8, 1014);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (9, 1013);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (9, 1010);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (10, 1005);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (10, 1009);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (10, 1001);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (10, 2233);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1001);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1002);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1004);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1005);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1006);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1007);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1008);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1009);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1010);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1011);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1012);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1013);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1014);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1015);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 1016);
INSERT INTO GroupMembers(GroupID, AccountNumber) 
VALUES (11, 2233);

INSERT INTO PostData(PostID, PageID, OwnerID, DateTimeCreated, CommentCount, Content)
VALUES (14, 8, 1001, '2016-12-24T12:40:11', 0, 'Swiggity');
UPDATE PageData 
SET 
    PostCount = (SELECT 
            COUNT(*)
        FROM
            PostData
        WHERE
            PageId = 8)
WHERE
    PageID = 8;
    
INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (1, '2016-11-11 11:11:11', 0, 'SHOW ME WHAT YOU GOT', 1010);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (1,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

    
INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (2, '2016-11-11 11:12:11', 0, 'ALLAH HU AKHBAR', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (2,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

    
INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (3, '2016-11-11 11:13:11', 0, 'HEY GUY', 1002);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (3,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (4, '2016-11-11 11:14:11', 0, 'DONT CALL ME GUY, BUDDY', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (4,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (5, '2016-11-11 11:15:11', 0, 'DONT CALL ME BUDDY, GUY', 1002);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (5,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (6, '2016-11-11 11:15:11', 0, 'I LIKE CHEESE', 1007);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (6,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (7, '2016-11-11 11:15:11', 0, 'HEY! WE DONT TAKE WELL TO YOUR KIND', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (7,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (8, '2016-11-11 11:15:11', 0, 'GUYS, THERE IS AN INTRUDER IN MY HOME', 1010);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (8,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (9, '2016-11-11 11:15:11', 0, 'HE HAS A GUN', 1010);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (9,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (10, '2016-11-11 11:15:11', 0, 'GG BRO GET REKT', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (10,14);

UPDATE PostData 
SET 
    CommentCount = CommentCount + 1
WHERE
    PostID = 14;

Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (1, 1090, 1001, '2016-12-26 11:10:11', 3);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (2, 1091, 1005, '2016-12-10 11:10:11', 5);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (3, 1004, 1009, '2016-12-01 11:10:11', 1);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (4, 1002, 1010, '2016-12-13 11:10:11', 7);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (5, 1092, 1008, '2016-12-11 11:10:11', NULL);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (6, 1090, 1007, '2016-12-27 11:10:11', 3);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (7, 1093, 1013, '2016-12-09 11:10:11', NULL);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (8, 5001, 2233, '2016-12-12 11:10:11', 2);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (9, 3001, 1001, '2016-12-11 11:10:11', 3);
Insert into SalesData(TransactionID, AdvertisementID, AccountNumber, DateTimeCreated, NumberOfUnits)
Values (10, 1090, 1015, '2016-12-29 11:10:11', 3);

	