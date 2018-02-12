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
SET CommentCount = CommentCount+1
WHERE PostID = 14;

    
INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (2, '2016-11-11 11:12:11', 0, 'ALLAH HU AKHBAR', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (2,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

    
INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (3, '2016-11-11 11:13:11', 0, 'HEY GUY', 1002);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (3,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (4, '2016-11-11 11:14:11', 0, 'DONT CALL ME GUY, BUDDY', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (4,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (5, '2016-11-11 11:15:11', 0, 'DONT CALL ME BUDDY, GUY', 1002);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (5,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (6, '2016-11-11 11:15:11', 0, 'I LIKE CHEESE', 1007);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (6,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (7, '2016-11-11 11:15:11', 0, 'HEY! WE DONT TAKE WELL TO YOUR KIND', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (7,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (8, '2016-11-11 11:15:11', 0, 'GUYS, THERE IS AN INTRUDER IN MY HOME', 1010);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (8,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (9, '2016-11-11 11:15:11', 0, 'HE HAS A GUN', 1010);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (9,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;

INSERT INTO CommentsData(CommentID, DateTimeCreated, LikedCount, Content, Author)
VALUES (10, '2016-11-11 11:15:11', 0, 'GG BRO GET REKT', 1003);

INSERT INTO CommentPost (CommentID, PostID)
VALUES (10,14);

UPDATE PostData
SET CommentCount = CommentCount+1
WHERE PostID = 14;
