INSERT INTO `j3dk`.`user` (User_ID, Password, EMail, Is_Artist, First_Name, Last_Name)
VALUES ('user158', 'pass123', 'myname@email.com', 0, 'James', 'Smith'),
 ('kevin56', 'ilovemusic23', 'kevin@email.com', 0, 'Kevin', 'Black'),
 ('alexiscool', '1996sw', 'alex@email.com', 0, 'Alex', 'Hernandez'),
 ('mrmusicman', 'ilovemymom32', 'musicman@email.com', 0, 'Henry', 'Gray'),
 ('catlady123', 'garythecat1996', 'sharonn@email.com', 0, 'Sharon', 'White'),
('kendricklamar', 'heF12647gr', 'kendrick@email.com', 1, 'Kendrick', 'Lamar'),
('michaeljackson', 'jd34647r', 'jacksonfamily@email.com', 1, 'Michael', 'Jackson'),
('elvis', 'sm5ytbd', 'elvis@email.com', 1, 'Elvis', 'Presley'),
('arianagrande', 'ring56rr', 'arianag@email.com', 1, 'Ariana', 'Grande'),
('thebeatles', 'aje458dj', 'beatles@email.com', 1, 'The', 'Beatles'),
('britneyspears', 'sdjhn47tyfc', 'britney@email.com', 1, 'Britney', 'Spears'),
('thatoneguyofficial', 'erth46dd', 'guyguy@email.com', 1, 'Greg', 'Hart'),
('thecaseygrant1', 'smart34', 'caseygrant2@email.com', 1, 'Casey', 'Grant');

INSERT INTO `j3dk`.`Artist` (Artist_Name, Discription, Month_listeners, Verified, Followers, User_ID)
VALUES 
('Kendrick Lamar', 'Award-winning rapper and songwriter', 1400000, 1, 590000, 'kendricklamar'),
('Michael Jackson', 'King of Pop', 1200000, 1, 800000, 'michaeljackson'),
('Elvis Presley', 'Musician and actor Elvis Presley rose to fame in the mid-1950s', 870000, 1, 450000, 'elvis'),
('Ariana Grande', 'American pop singer and actress', 2800000, 1, 800000, 'arianagrande'),
('The Beatles', 'British rock group that came to personify the counterculture of the 1960s', 1400000, 1, 840000, 'thebeatles'),
('Britney Spears', 'American singer, songwriter', 1100000, 1, 960000, 'britneyspears'),
('That One Guy', 'Self-made artist who makes cool beats', 2000, 0, 140, 'thatoneguyofficial'),
('Casey Grant', 'Young pop artist from Kansas City', 16000, 0, 2000, 'thecaseygrant1');

INSERT INTO `j3dk`.`playlist` (Playlist_Name, Creater, Playlist_Len, Num_Songs)
VALUES 
 ('Favs', 'kevin56', NULL, 3),
 ('60s', 'mrmusicman', NULL, 2),
 ('Study Playlist', 'mrmusicman', NULL, 2);


INSERT INTO `j3dk`.`genres` (Genre_Name, Description)
VALUES ('Pop', 'Popular upbeat music'),
 ('Rock', 'Classic rock n roll'),
 ('Hip Hop', 'Stylized rhythmic music'),
 ('Country', 'Music from the folk style of the Southern U.S.');


INSERT INTO `j3dk`.`songs` (Song_Name, Artist, Song_Len, Genre, Num_Plays)
VALUES
 ('HUMBLE', 'Kendrick Lamar', '00:02:57', 'Hip Hop', 1200000),
 ('DNA', 'Kendrick Lamar', '00:03:05', 'Hip Hop', 1000000),
 ('ELEMENT', 'Kendrick Lamar', '00:03:28', 'Hip Hop', 900000),
 ('positions', 'Ariana Grande', '00:02:52', 'Pop', 1300000),
 ('7 rings', 'Ariana Grande', '00:02:58', 'Pop', 1700000),
('Here Comes The Sun', 'The Beatles', '00:03:05', 'Rock', 1600000),
('Come Together', 'The Beatles', '00:04:05', 'Rock', 1450000),
('Toxic', 'Britney Spears', '00:03:18', 'Pop', 1000000),
('Showdown', 'Britney Spears', '00:03:16', 'Pop', 800000),
('Blue Hawaii', 'Elvis Presley', '00:03:02', 'Rock', 920000);



INSERT INTO Albums (Album_Name, Artist, Release_Date, Num_Songs, Album_Len, Album_Cover, Discription)
VALUES 
 ('DAMN', 'Kendrick Lamar', '2017-06-05', 14, '00:55:00', NULL, 'Pulitzer Prize winning album'),
 ('Positions', 'Ariana Grande', '2020-03-17', 14, '00:41:14', NULL, 'Sixth studio album by Ariana Grande'),
 ('thank u, next', 'Ariana Grande', '2019-07-01', 12, '00:41:07', NULL, 'Fifth studio album by Ariana Grande'),
 ('Abbey Road', 'The Beatles', '1969-06-10', 13, '00:47:03', NULL, '11th studio album'),
 ('In The Zone', 'Britney Spears', '2003-08-05', 13, '00:49:45', NULL, '4th studio album'),
 ('Blue Hawaii', 'Elvis Presley', '1961-08-15', 14, '00:32:08', NULL, 'Soundtrack album for Blue Hawaii');

INSERT INTO Concerts (Concert_ID, Host, Location, Date, Time, Venue_Size, Tickets_Available, Tickets_Sold)
VALUES 
 (01, 'Kendrick Lamar', 'Kansas City', '2022-09-05', '00:08:00', 20000, 15236, 4764),
(02, 'Ariana Grande', 'Denver', '2023-07-21', '00:07:00', 18000, 18000, 0);


CALL Add_Song_to_Playlist ('positions', 'Favs', 'Ariana Grande');

CALL Add_Song_to_Playlist ('7 rings', 'Favs', 'Ariana Grande');

CALL Add_Song_to_Playlist ('HUMBLE', 'Favs', 'Kendrick Lamar');

CALL Add_Song_to_Playlist ('Here Comes The Sun', '60s', 'The Beatles');

CALL Add_Song_to_Playlist ('Blue Hawaii', '60s', 'Elvis Presley');


CALL Add_Song_to_Album ('DAMN', 'HUMBLE');

CALL Add_Song_to_Album ('DAMN', 'ELEMENT');

CALL Add_Song_to_Album ('DAMN', 'DNA');


CALL Add_Friend ('user158', 'kevin56');

CALL Add_Friend ('user158', 'catlady123');

CALL Add_Friend ('kevin56', 'user158');


CALL Follow_Artist ('Kendrick Lamar', 'user158');

CALL Follow_Artist ('Ariana Grande', 'user158');

CALL Follow_Artist ('The Beatles', 'mrmusicman');

CALL Follow_Artist ('Elvis Presley', 'mrmusicman');

CALL Follow_Artist ('Britney Spears', 'catlady123');