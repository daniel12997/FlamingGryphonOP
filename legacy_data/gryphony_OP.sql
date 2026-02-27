-- phpMyAdmin SQL Dump
-- version 2.9.1.1-Debian-13
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Apr 09, 2024 at 09:55 PM
-- Server version: 5.0.32
-- PHP Version: 5.2.0-8+etch16
-- 
-- Flaming Gryphon Order of Precedence
-- 
-- 
-- Database: `gryphony_OP`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `op_altnames`
-- 

CREATE TABLE `op_altnames` (
  `ID` int(11) NOT NULL auto_increment,
  `reckey` int(11) NOT NULL default '0',
  `altname` varchar(120) collate utf8_unicode_ci NOT NULL,
  `nickname` tinyint(1) NOT NULL default '0',
  `formername` tinyint(1) NOT NULL default '1',
  `registered` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=283 ;

-- 
-- Dumping data for table `op_altnames`
-- 

INSERT INTO `op_altnames` VALUES (145, 278, 'Alexandra dei Campagnella', 0, 1, 1);
INSERT INTO `op_altnames` VALUES (41, 521, 'Christiana of Unicorn', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (43, 466, 'Papasan', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (144, 278, 'Saidhbhín Anastasia Ní Dhuinn', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (46, 28, 'Anne Winterskye', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (47, 45, 'Arundel', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (197, 215, 'Kyrie of the March of the Unicorn', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (51, 122, 'Grizel', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (52, 54, 'Berach of Stonehelm', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (53, 113, 'Doc', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (253, 580, 'Kaitlin of Huntington', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (184, 488, 'Boris Collium', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (242, 500, 'Kyppyn', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (146, 49, 'Myles Blackwolf', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (147, 49, 'Avatar of Stonehelm', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (279, 338, 'Taffy', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (185, 452, 'College of Saint Joan', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (186, 368, 'Marche of Havenholde', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (187, 616, 'Marche of Hawkes Keye', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (255, 72, 'Cathryn of Chester', 0, 0, 1);
INSERT INTO `op_altnames` VALUES (190, 620, 'Marche of the Winged Hills', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (268, 334, 'William, Conor, and Farman', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (267, 334, 'Farman, William, and Conor', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (193, 136, 'Farnan Montagar', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (266, 382, 'Drea', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (199, 375, 'Juliana of St. Joan', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (265, 382, 'Drea di\\'' Pellegrini', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (213, 617, 'MacKennah of GryLion', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (241, 500, 'Kylfur Vinterson', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (243, 501, 'Signy Ór Vinterholt', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (230, 33, 'Bear', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (231, 577, 'Maghnus the Younger', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (280, 645, 'Alex Timson', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (235, 412, 'Morgaine of Flaming Gryphon', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (244, 558, 'Byron Sven''s son', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (256, 456, 'Oweyn Hudson', 0, 1, 1);
INSERT INTO `op_altnames` VALUES (257, 638, 'Ainfean of Unicorn', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (258, 639, 'Hergeirr of Unicorn', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (262, 266, 'Rees of Mercia', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (261, 266, 'Rees of Cambria', 0, 0, 0);
INSERT INTO `op_altnames` VALUES (263, 684, 'the Dredded', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (269, 633, 'Atsur Ukkonen', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (278, 338, 'Dafydd Wolfson', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (277, 338, 'Dafydd Wulfsson', 0, 1, 0);
INSERT INTO `op_altnames` VALUES (281, 693, 'Mako', 1, 0, 0);
INSERT INTO `op_altnames` VALUES (282, 693, '', 1, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_bestowals`
-- 

CREATE TABLE `op_bestowals` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `sortdate` date default NULL,
  `sequence` varchar(5) collate utf8_unicode_ci default NULL,
  `dispdate` varchar(13) collate utf8_unicode_ci default NULL,
  `event` varchar(50) collate utf8_unicode_ci default NULL,
  `reckey` int(11) unsigned NOT NULL,
  `honorkey` int(11) unsigned NOT NULL,
  `notes` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`ID`),
  KEY `event` (`event`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2100 ;

-- 
-- Dumping data for table `op_bestowals`
-- 

INSERT INTO `op_bestowals` VALUES (1, '1970-12-31', '', '?', NULL, 291, 175, '(1st Midrealm Court Baronage)');
INSERT INTO `op_bestowals` VALUES (2, '1971-02-20', '', NULL, NULL, 22, 171, '');
INSERT INTO `op_bestowals` VALUES (3, '1971-10-09', '', NULL, NULL, 291, 169, '(costuming)');
INSERT INTO `op_bestowals` VALUES (4, '1971-10-09', '', NULL, NULL, 22, 173, '');
INSERT INTO `op_bestowals` VALUES (5, '1972-01-06', '', NULL, NULL, 22, 186, '');
INSERT INTO `op_bestowals` VALUES (6, '1972-08-19', '', NULL, NULL, 310, 171, '(Atenveldt)');
INSERT INTO `op_bestowals` VALUES (7, '1972-10-28', '.01', NULL, NULL, 22, 167, '');
INSERT INTO `op_bestowals` VALUES (8, '1973-10-13', '.01', NULL, NULL, 22, 166, '');
INSERT INTO `op_bestowals` VALUES (9, '1974-03-30', '', NULL, NULL, 22, 184, '');
INSERT INTO `op_bestowals` VALUES (10, '1974-07-27', '', NULL, NULL, 22, 176, '');
INSERT INTO `op_bestowals` VALUES (11, '1974-10-05', '', NULL, NULL, 119, 187, '');
INSERT INTO `op_bestowals` VALUES (12, '1974-12-07', '', NULL, NULL, 64, 220, '');
INSERT INTO `op_bestowals` VALUES (13, '1975-07-19', '', NULL, NULL, 64, 221, '("A boar''s" head together with the name "Boarsbane")(Given by King Rolac)');
INSERT INTO `op_bestowals` VALUES (14, '1976-01-31', '', NULL, NULL, 64, 187, '');
INSERT INTO `op_bestowals` VALUES (15, '1976-07-10', '', NULL, NULL, 246, 187, '');
INSERT INTO `op_bestowals` VALUES (16, '1976-10-09', '', NULL, NULL, 22, 170, '');
INSERT INTO `op_bestowals` VALUES (17, '1976-11-13', '', NULL, NULL, 228, 187, '');
INSERT INTO `op_bestowals` VALUES (18, '1977-08-20', '', NULL, NULL, 220, 187, '');
INSERT INTO `op_bestowals` VALUES (19, '1977-10-02', '', NULL, NULL, 244, 187, '');
INSERT INTO `op_bestowals` VALUES (20, '1977-11-12', '', NULL, NULL, 28, 187, '');
INSERT INTO `op_bestowals` VALUES (21, '1977-11-12', '', NULL, NULL, 358, 187, '');
INSERT INTO `op_bestowals` VALUES (22, '1977-12-17', '', NULL, NULL, 119, 226, '');
INSERT INTO `op_bestowals` VALUES (23, '1977-12-17', '.01', NULL, NULL, 310, 167, '(Atenveldt)');
INSERT INTO `op_bestowals` VALUES (24, '1977-12-17', '.02', NULL, NULL, 119, 167, '');
INSERT INTO `op_bestowals` VALUES (25, '1978-01-14', '', NULL, NULL, 64, 176, '(resigned 5/25/80)');
INSERT INTO `op_bestowals` VALUES (26, '1978-01-14', '', NULL, NULL, 64, 173, '(resigned 5/25/80)');
INSERT INTO `op_bestowals` VALUES (27, '1978-05-20', '', NULL, NULL, 78, 187, '');
INSERT INTO `op_bestowals` VALUES (28, '1978-05-20', '', NULL, NULL, 78, 181, '');
INSERT INTO `op_bestowals` VALUES (29, '1978-07-22', '', NULL, NULL, 244, 173, '');
INSERT INTO `op_bestowals` VALUES (30, '1978-08-12', '', NULL, NULL, 64, 171, '(resigned 5/25/80)');
INSERT INTO `op_bestowals` VALUES (31, '1978-09-30', '', NULL, NULL, 150, 187, '');
INSERT INTO `op_bestowals` VALUES (32, '1979-01-06', '', NULL, NULL, 246, 178, '(embroidery)');
INSERT INTO `op_bestowals` VALUES (33, '1979-01-06', '', NULL, NULL, 85, 187, '');
INSERT INTO `op_bestowals` VALUES (34, '1979-01-16', '', NULL, NULL, 263, 187, '');
INSERT INTO `op_bestowals` VALUES (35, '1979-08-18', '', NULL, NULL, 263, 175, '');
INSERT INTO `op_bestowals` VALUES (36, '1979-08-18', '1', NULL, NULL, 28, 181, '');
INSERT INTO `op_bestowals` VALUES (37, '1979-08-18', '2', NULL, NULL, 220, 181, '');
INSERT INTO `op_bestowals` VALUES (38, '1979-09-29', '', NULL, NULL, 196, 187, '');
INSERT INTO `op_bestowals` VALUES (39, '1979-09-29', '1', NULL, NULL, 68, 187, '');
INSERT INTO `op_bestowals` VALUES (40, '1979-09-29', '2', NULL, NULL, 79, 187, '');
INSERT INTO `op_bestowals` VALUES (41, '1979-09-29', '3', NULL, NULL, 87, 187, '');
INSERT INTO `op_bestowals` VALUES (42, '1979-09-29', '4', NULL, NULL, 237, 187, '');
INSERT INTO `op_bestowals` VALUES (43, '1980-01-05', '', NULL, NULL, 55, 187, '');
INSERT INTO `op_bestowals` VALUES (44, '1980-01-05', '', NULL, NULL, 263, 190, '');
INSERT INTO `op_bestowals` VALUES (45, '1980-01-05', '', NULL, NULL, 22, 190, '');
INSERT INTO `op_bestowals` VALUES (46, '1980-01-05', '', NULL, NULL, 263, 191, '');
INSERT INTO `op_bestowals` VALUES (47, '1980-01-05', '', NULL, NULL, 79, 191, '');
INSERT INTO `op_bestowals` VALUES (48, '1980-01-05', '', NULL, NULL, 28, 190, '');
INSERT INTO `op_bestowals` VALUES (49, '1980-01-05', '', NULL, NULL, 68, 191, '');
INSERT INTO `op_bestowals` VALUES (50, '1980-01-05', '', NULL, NULL, 87, 191, '');
INSERT INTO `op_bestowals` VALUES (51, '1980-02-02', '', NULL, NULL, 263, 178, '');
INSERT INTO `op_bestowals` VALUES (52, '1980-02-16', '', NULL, NULL, 81, 191, '');
INSERT INTO `op_bestowals` VALUES (53, '1980-02-16', '', NULL, NULL, 22, 191, '');
INSERT INTO `op_bestowals` VALUES (54, '1980-04-25', '', NULL, NULL, 238, 187, '');
INSERT INTO `op_bestowals` VALUES (55, '1980-05-25', '', NULL, NULL, 22, 177, '(armoring)');
INSERT INTO `op_bestowals` VALUES (56, '1980-06-14', '', NULL, NULL, 231, 187, '');
INSERT INTO `op_bestowals` VALUES (57, '1980-06-14', '', NULL, NULL, 79, 190, '');
INSERT INTO `op_bestowals` VALUES (58, '1980-06-14', '', NULL, NULL, 231, 191, '');
INSERT INTO `op_bestowals` VALUES (59, '1980-06-14', '', NULL, NULL, 37, 187, '');
INSERT INTO `op_bestowals` VALUES (60, '1980-06-21', '', NULL, NULL, 118, 191, '');
INSERT INTO `op_bestowals` VALUES (61, '1980-06-30', '', '6/?/80', NULL, 167, 209, '');
INSERT INTO `op_bestowals` VALUES (62, '1980-07-12', '', NULL, NULL, 167, 187, '');
INSERT INTO `op_bestowals` VALUES (63, '1980-07-19', '1', NULL, NULL, 276, 187, '');
INSERT INTO `op_bestowals` VALUES (64, '1980-07-19', '2', NULL, NULL, 312, 187, '');
INSERT INTO `op_bestowals` VALUES (65, '1980-07-31', '1', '7/?/80', NULL, 6, 187, '');
INSERT INTO `op_bestowals` VALUES (66, '1980-07-31', '2', '7/?/80', NULL, 230, 187, '');
INSERT INTO `op_bestowals` VALUES (67, '1980-08-23', '', NULL, NULL, 87, 178, '');
INSERT INTO `op_bestowals` VALUES (68, '1980-08-31', '', '8/?/80', NULL, 119, 211, '');
INSERT INTO `op_bestowals` VALUES (69, '1980-09-06', '', NULL, NULL, 228, 178, '(illumination)');
INSERT INTO `op_bestowals` VALUES (70, '1980-09-06', '', NULL, NULL, 228, 187, '');
INSERT INTO `op_bestowals` VALUES (71, '1980-10-04', '', NULL, NULL, 314, 187, '');
INSERT INTO `op_bestowals` VALUES (72, '1980-11-29', '', NULL, NULL, 167, 178, '(embroidery)');
INSERT INTO `op_bestowals` VALUES (73, '1980-12-07', '', NULL, NULL, 119, 169, '(Atenveldt) (cal & illum)');
INSERT INTO `op_bestowals` VALUES (74, '1980-12-31', '', '?/80,?/81', NULL, 167, 205, '(twice awarded)');
INSERT INTO `op_bestowals` VALUES (75, '1981-01-10', '', NULL, NULL, 454, 187, '');
INSERT INTO `op_bestowals` VALUES (76, '1981-01-17', '', NULL, NULL, 229, 190, '');
INSERT INTO `op_bestowals` VALUES (77, '1981-01-31', '1', '1/?/81', NULL, 6, 206, '');
INSERT INTO `op_bestowals` VALUES (78, '1981-01-31', '2', '1/?/81', NULL, 230, 206, '');
INSERT INTO `op_bestowals` VALUES (79, '1981-03-07', '', NULL, NULL, 192, 187, '');
INSERT INTO `op_bestowals` VALUES (80, '1981-04-04', '', NULL, NULL, 150, 177, '');
INSERT INTO `op_bestowals` VALUES (81, '1981-04-04', '1', NULL, NULL, 156, 187, '');
INSERT INTO `op_bestowals` VALUES (82, '1981-04-04', '2', NULL, NULL, 293, 187, '');
INSERT INTO `op_bestowals` VALUES (83, '1981-04-04', '3', NULL, NULL, 305, 187, '');
INSERT INTO `op_bestowals` VALUES (84, '1981-04-11', '', NULL, NULL, 252, 222, '');
INSERT INTO `op_bestowals` VALUES (85, '1981-05-02', '', NULL, NULL, 220, 173, '');
INSERT INTO `op_bestowals` VALUES (86, '1981-06-18', '', NULL, NULL, 78, 178, '');
INSERT INTO `op_bestowals` VALUES (87, '1981-08-16', '.91', NULL, NULL, 220, 171, '');
INSERT INTO `op_bestowals` VALUES (88, '1981-09-19', '', NULL, NULL, 237, 191, '');
INSERT INTO `op_bestowals` VALUES (89, '1981-09-19', '', NULL, NULL, 196, 190, '');
INSERT INTO `op_bestowals` VALUES (90, '1981-09-19', '', NULL, NULL, 79, 222, '');
INSERT INTO `op_bestowals` VALUES (91, '1981-10-03', '.14', NULL, NULL, 485, 187, '');
INSERT INTO `op_bestowals` VALUES (92, '1981-10-31', '', '10/?/81', NULL, 310, 211, '');
INSERT INTO `op_bestowals` VALUES (93, '1981-12-31', '', '?/?/81', NULL, 310, 204, '');
INSERT INTO `op_bestowals` VALUES (94, '1982-01-09', '', NULL, NULL, 256, 191, '');
INSERT INTO `op_bestowals` VALUES (95, '1982-04-17', '', NULL, NULL, 252, 187, '');
INSERT INTO `op_bestowals` VALUES (96, '1982-04-17', '1', NULL, NULL, 71, 187, '');
INSERT INTO `op_bestowals` VALUES (97, '1982-04-17', '2', NULL, NULL, 185, 187, '');
INSERT INTO `op_bestowals` VALUES (98, '1982-04-17', '3', NULL, NULL, 199, 187, '');
INSERT INTO `op_bestowals` VALUES (99, '1982-04-30', '0', '4/?/82', NULL, 6, 171, '(East)');
INSERT INTO `op_bestowals` VALUES (100, '1982-05-08', '', NULL, NULL, 453, 187, '');
INSERT INTO `op_bestowals` VALUES (101, '1982-05-08', '', NULL, NULL, 228, 169, '(illumination)');
INSERT INTO `op_bestowals` VALUES (102, '1982-05-08', '', NULL, NULL, 106, 175, '');
INSERT INTO `op_bestowals` VALUES (103, '1982-05-08', '', NULL, NULL, 21, 187, '');
INSERT INTO `op_bestowals` VALUES (104, '1982-05-15', '', NULL, NULL, 270, 222, '');
INSERT INTO `op_bestowals` VALUES (105, '1982-06-26', '', NULL, NULL, 49, 187, '');
INSERT INTO `op_bestowals` VALUES (106, '1982-07-10', '', NULL, NULL, 15, 191, '');
INSERT INTO `op_bestowals` VALUES (107, '1982-07-10', '', NULL, NULL, 270, 191, '');
INSERT INTO `op_bestowals` VALUES (108, '1982-07-10', '', NULL, NULL, 276, 190, '');
INSERT INTO `op_bestowals` VALUES (109, '1982-07-10', '', NULL, NULL, 312, 190, '');
INSERT INTO `op_bestowals` VALUES (110, '1982-07-10', '1', NULL, NULL, 149, 187, '');
INSERT INTO `op_bestowals` VALUES (111, '1982-07-10', '2', NULL, NULL, 13, 187, '');
INSERT INTO `op_bestowals` VALUES (112, '1982-07-10', '3', NULL, NULL, 15, 187, '');
INSERT INTO `op_bestowals` VALUES (113, '1982-07-10', '4', NULL, NULL, 264, 187, '');
INSERT INTO `op_bestowals` VALUES (114, '1982-07-10', '5', NULL, NULL, 308, 187, '');
INSERT INTO `op_bestowals` VALUES (115, '1982-07-10', '6', NULL, NULL, 270, 187, '');
INSERT INTO `op_bestowals` VALUES (116, '1982-07-10', '7', NULL, NULL, 148, 187, '');
INSERT INTO `op_bestowals` VALUES (117, '1982-07-10', '8', NULL, NULL, 110, 187, '');
INSERT INTO `op_bestowals` VALUES (118, '1982-07-10', '9', NULL, NULL, 256, 187, '');
INSERT INTO `op_bestowals` VALUES (119, '1982-08-18', '', NULL, NULL, 291, 196, '');
INSERT INTO `op_bestowals` VALUES (120, '1982-08-21', '', NULL, NULL, 167, 169, '(embroidery)');
INSERT INTO `op_bestowals` VALUES (121, '1982-08-22', '', NULL, NULL, 47, 171, '(East)');
INSERT INTO `op_bestowals` VALUES (122, '1982-08-31', '', '8/?/82', NULL, 310, 195, '');
INSERT INTO `op_bestowals` VALUES (123, '1982-10-16', '', NULL, NULL, 454, 176, '');
INSERT INTO `op_bestowals` VALUES (124, '1982-10-16', '', NULL, NULL, 68, 177, '');
INSERT INTO `op_bestowals` VALUES (125, '1982-10-16', '', NULL, NULL, 290, 167, '');
INSERT INTO `op_bestowals` VALUES (126, '1982-10-16', '1', NULL, NULL, 150, 178, '');
INSERT INTO `op_bestowals` VALUES (127, '1982-10-16', '1', NULL, NULL, 290, 187, '');
INSERT INTO `op_bestowals` VALUES (128, '1982-10-16', '2', NULL, NULL, 319, 187, '');
INSERT INTO `op_bestowals` VALUES (129, '1982-10-16', '2', NULL, NULL, 264, 178, '(calligr. & illum.)');
INSERT INTO `op_bestowals` VALUES (130, '1982-10-16', '3', NULL, NULL, 55, 178, '');
INSERT INTO `op_bestowals` VALUES (131, '1982-12-31', '', '?/?/82', NULL, 167, 208, '');
INSERT INTO `op_bestowals` VALUES (132, '1983-01-15', '', NULL, NULL, 503, 187, '');
INSERT INTO `op_bestowals` VALUES (133, '1983-01-15', '', NULL, NULL, 502, 187, '');
INSERT INTO `op_bestowals` VALUES (134, '1983-02-12', '', NULL, NULL, 156, 181, '');
INSERT INTO `op_bestowals` VALUES (135, '1983-02-12', '', NULL, NULL, 178, 187, '');
INSERT INTO `op_bestowals` VALUES (136, '1983-02-12', '1', NULL, NULL, 49, 182, '(given as AQF)');
INSERT INTO `op_bestowals` VALUES (137, '1983-02-12', '2', NULL, NULL, 106, 182, '(given as AQF)');
INSERT INTO `op_bestowals` VALUES (138, '1983-04-16', '', NULL, NULL, 270, 177, '(armoring)');
INSERT INTO `op_bestowals` VALUES (139, '1983-04-16', '1', NULL, NULL, 152, 187, '');
INSERT INTO `op_bestowals` VALUES (140, '1983-04-16', '2', NULL, NULL, 240, 187, '');
INSERT INTO `op_bestowals` VALUES (141, '1983-04-30', '', NULL, NULL, 116, 187, '');
INSERT INTO `op_bestowals` VALUES (142, '1983-05-07', '1', NULL, NULL, 239, 187, '');
INSERT INTO `op_bestowals` VALUES (143, '1983-05-07', '2', NULL, NULL, 241, 187, '');
INSERT INTO `op_bestowals` VALUES (144, '1983-05-07', '3', NULL, NULL, 262, 187, '');
INSERT INTO `op_bestowals` VALUES (145, '1983-05-07', '4', NULL, NULL, 242, 187, '');
INSERT INTO `op_bestowals` VALUES (146, '1983-05-07', '5', NULL, NULL, 294, 187, '');
INSERT INTO `op_bestowals` VALUES (147, '1983-05-14', '', NULL, NULL, 264, 191, '');
INSERT INTO `op_bestowals` VALUES (148, '1983-05-14', '', NULL, NULL, 40, 222, '');
INSERT INTO `op_bestowals` VALUES (149, '1983-05-14', '', NULL, NULL, 318, 191, '');
INSERT INTO `op_bestowals` VALUES (150, '1983-05-14', '', NULL, NULL, 37, 190, '');
INSERT INTO `op_bestowals` VALUES (151, '1983-05-14', '', NULL, NULL, 156, 190, '');
INSERT INTO `op_bestowals` VALUES (152, '1983-05-14', '', NULL, NULL, 116, 191, '');
INSERT INTO `op_bestowals` VALUES (153, '1983-05-14', '', NULL, NULL, 243, 191, '');
INSERT INTO `op_bestowals` VALUES (154, '1983-05-14', '', NULL, NULL, 49, 191, '');
INSERT INTO `op_bestowals` VALUES (155, '1983-05-14', '', NULL, NULL, 185, 190, '');
INSERT INTO `op_bestowals` VALUES (156, '1983-05-14', '', NULL, NULL, 55, 191, '');
INSERT INTO `op_bestowals` VALUES (157, '1983-05-14', '', NULL, NULL, 306, 191, '');
INSERT INTO `op_bestowals` VALUES (158, '1983-08-20', '.91', NULL, NULL, 290, 226, '');
INSERT INTO `op_bestowals` VALUES (159, '1983-09-10', '', NULL, NULL, 502, 181, '');
INSERT INTO `op_bestowals` VALUES (160, '1983-09-10', '', NULL, NULL, 503, 181, '');
INSERT INTO `op_bestowals` VALUES (161, '1983-10-08', '', NULL, NULL, 49, 222, '');
INSERT INTO `op_bestowals` VALUES (162, '1983-12-10', '1', NULL, NULL, 174, 187, '');
INSERT INTO `op_bestowals` VALUES (163, '1983-12-10', '2', NULL, NULL, 40, 187, '');
INSERT INTO `op_bestowals` VALUES (164, '1984-01-28', '', NULL, NULL, 142, 187, '');
INSERT INTO `op_bestowals` VALUES (165, '1984-02-29', '', '2/?/84', NULL, 131, 187, '');
INSERT INTO `op_bestowals` VALUES (166, '1984-03-21', '2', NULL, NULL, 160, 187, '');
INSERT INTO `op_bestowals` VALUES (167, '1984-03-31', '', NULL, NULL, 276, 181, '');
INSERT INTO `op_bestowals` VALUES (168, '1984-03-31', '', NULL, NULL, 256, 177, '');
INSERT INTO `op_bestowals` VALUES (169, '1984-03-31', '', NULL, NULL, 68, 190, '');
INSERT INTO `op_bestowals` VALUES (170, '1984-03-31', '1', NULL, NULL, 12, 187, '');
INSERT INTO `op_bestowals` VALUES (171, '1984-03-31', '3', NULL, NULL, 176, 187, '');
INSERT INTO `op_bestowals` VALUES (172, '1984-03-31', '4', NULL, NULL, 224, 187, '');
INSERT INTO `op_bestowals` VALUES (173, '1984-06-16', '', NULL, NULL, 54, 222, '');
INSERT INTO `op_bestowals` VALUES (174, '1984-07-14', '', NULL, NULL, 110, 181, '');
INSERT INTO `op_bestowals` VALUES (175, '1984-10-20', '', NULL, NULL, 241, 222, '');
INSERT INTO `op_bestowals` VALUES (176, '1984-11-17', '1', NULL, NULL, 7, 187, '');
INSERT INTO `op_bestowals` VALUES (177, '1984-11-17', '2', NULL, NULL, 251, 187, '');
INSERT INTO `op_bestowals` VALUES (178, '1985-02-28', '', '2/?/85', NULL, 119, 210, '');
INSERT INTO `op_bestowals` VALUES (179, '1985-03-02', '1', NULL, NULL, 189, 187, '');
INSERT INTO `op_bestowals` VALUES (180, '1985-03-02', '2', NULL, NULL, 304, 187, '');
INSERT INTO `op_bestowals` VALUES (181, '1985-04-30', '', '4/?/85', NULL, 31, 187, '');
INSERT INTO `op_bestowals` VALUES (182, '1985-06-01', '', NULL, NULL, 230, 169, '(East)');
INSERT INTO `op_bestowals` VALUES (183, '1985-09-28', '', NULL, NULL, 178, 190, '');
INSERT INTO `op_bestowals` VALUES (184, '1985-10-12', '', NULL, NULL, 216, 187, '');
INSERT INTO `op_bestowals` VALUES (185, '1986-01-31', '', '1/?/86', NULL, 141, 187, '');
INSERT INTO `op_bestowals` VALUES (186, '1986-02-02', '', NULL, NULL, 239, 190, '');
INSERT INTO `op_bestowals` VALUES (187, '1986-02-02', '', NULL, NULL, 92, 190, '');
INSERT INTO `op_bestowals` VALUES (188, '1986-02-02', '', NULL, NULL, 224, 191, '');
INSERT INTO `op_bestowals` VALUES (189, '1986-02-02', '', NULL, NULL, 54, 222, '');
INSERT INTO `op_bestowals` VALUES (190, '1986-03-15', '1', NULL, NULL, 23, 187, '');
INSERT INTO `op_bestowals` VALUES (191, '1986-03-15', '2', NULL, NULL, 236, 187, '');
INSERT INTO `op_bestowals` VALUES (192, '1986-03-15', '3', NULL, NULL, 320, 187, '');
INSERT INTO `op_bestowals` VALUES (193, '1986-03-15', '4', NULL, NULL, 54, 187, '');
INSERT INTO `op_bestowals` VALUES (194, '1986-03-15', '5', NULL, NULL, 194, 187, '');
INSERT INTO `op_bestowals` VALUES (195, '1986-03-15', '6', NULL, NULL, 117, 187, '');
INSERT INTO `op_bestowals` VALUES (196, '1986-05-24', '', NULL, NULL, 267, 187, '(Calontir)');
INSERT INTO `op_bestowals` VALUES (197, '1986-06-21', '', NULL, NULL, 216, 191, '');
INSERT INTO `op_bestowals` VALUES (198, '1986-07-19', '1', NULL, NULL, 128, 187, '');
INSERT INTO `op_bestowals` VALUES (199, '1986-07-19', '2', NULL, NULL, 136, 187, '');
INSERT INTO `op_bestowals` VALUES (200, '1986-07-19', '3', NULL, NULL, 211, 187, '');
INSERT INTO `op_bestowals` VALUES (201, '1986-07-26', '', NULL, NULL, 502, 171, '');
INSERT INTO `op_bestowals` VALUES (202, '1986-09-27', '', NULL, NULL, 262, 190, '');
INSERT INTO `op_bestowals` VALUES (203, '1986-09-27', '', NULL, NULL, 252, 190, '');
INSERT INTO `op_bestowals` VALUES (204, '1986-09-27', '', NULL, NULL, 49, 181, '');
INSERT INTO `op_bestowals` VALUES (205, '1986-11-01', '', NULL, NULL, 216, 190, '');
INSERT INTO `op_bestowals` VALUES (206, '1986-11-01', '', NULL, NULL, 160, 190, '');
INSERT INTO `op_bestowals` VALUES (207, '1986-11-01', '9', NULL, NULL, 252, 222, '');
INSERT INTO `op_bestowals` VALUES (208, '1986-12-06', '', NULL, NULL, 45, 187, '');
INSERT INTO `op_bestowals` VALUES (209, '1986-12-31', '', '?/?/86', NULL, 31, 219, '');
INSERT INTO `op_bestowals` VALUES (210, '1987-01-12', '', NULL, NULL, 54, 190, '');
INSERT INTO `op_bestowals` VALUES (211, '1987-01-12', '', NULL, NULL, 264, 190, '');
INSERT INTO `op_bestowals` VALUES (212, '1987-01-12', '', NULL, NULL, 15, 190, '');
INSERT INTO `op_bestowals` VALUES (213, '1987-03-07', '', NULL, NULL, 54, 174, 'Resigned on 2004-04-17');
INSERT INTO `op_bestowals` VALUES (214, '1987-03-07', '', NULL, NULL, 198, 191, '');
INSERT INTO `op_bestowals` VALUES (215, '1987-03-07', '', NULL, NULL, 267, 190, '');
INSERT INTO `op_bestowals` VALUES (216, '1987-03-07', '', NULL, NULL, 301, 191, '');
INSERT INTO `op_bestowals` VALUES (217, '1987-03-07', '1', NULL, NULL, 220, 175, '');
INSERT INTO `op_bestowals` VALUES (218, '1987-03-07', '1', NULL, NULL, 144, 187, '');
INSERT INTO `op_bestowals` VALUES (219, '1987-03-07', '2', NULL, NULL, 227, 187, '');
INSERT INTO `op_bestowals` VALUES (220, '1987-03-07', '2', NULL, NULL, 110, 175, '');
INSERT INTO `op_bestowals` VALUES (221, '1987-06-06', '', NULL, NULL, 13, 190, '');
INSERT INTO `op_bestowals` VALUES (222, '1987-06-06', '', NULL, NULL, 242, 190, '');
INSERT INTO `op_bestowals` VALUES (223, '1987-06-06', '', NULL, NULL, 45, 190, '');
INSERT INTO `op_bestowals` VALUES (224, '1987-06-06', '', NULL, NULL, 129, 190, '');
INSERT INTO `op_bestowals` VALUES (225, '1987-06-27', '.04', NULL, NULL, 266, 187, '');
INSERT INTO `op_bestowals` VALUES (226, '1987-06-27', '.06', NULL, NULL, 317, 187, '');
INSERT INTO `op_bestowals` VALUES (227, '1987-06-27', '.07', NULL, NULL, 72, 187, '');
INSERT INTO `op_bestowals` VALUES (228, '1987-06-27', '.12', NULL, NULL, 301, 187, '');
INSERT INTO `op_bestowals` VALUES (229, '1987-07-25', '.10', NULL, NULL, 116, 177, '(metalworking)');
INSERT INTO `op_bestowals` VALUES (230, '1987-08-13', '', NULL, NULL, 242, 183, '(one of the principal members)');
INSERT INTO `op_bestowals` VALUES (231, '1987-08-13', '', NULL, NULL, 310, 181, '');
INSERT INTO `op_bestowals` VALUES (232, '1987-08-13', '1', NULL, NULL, 42, 187, '');
INSERT INTO `op_bestowals` VALUES (233, '1987-08-13', '2', NULL, NULL, 129, 187, '');
INSERT INTO `op_bestowals` VALUES (234, '1987-08-15', '', NULL, NULL, 89, 171, '');
INSERT INTO `op_bestowals` VALUES (235, '1987-09-18', '', NULL, NULL, 45, 177, '(brewing)');
INSERT INTO `op_bestowals` VALUES (236, '1987-09-19', '', NULL, NULL, 264, 182, '(given as AQF)');
INSERT INTO `op_bestowals` VALUES (237, '1987-09-19', '', NULL, NULL, 224, 174, 'Resigned 2004-04-17');
INSERT INTO `op_bestowals` VALUES (238, '1987-09-19', '', NULL, NULL, 53, 180, '');
INSERT INTO `op_bestowals` VALUES (239, '1987-09-19', '1', NULL, NULL, 15, 181, '');
INSERT INTO `op_bestowals` VALUES (240, '1987-09-19', '1', NULL, NULL, 174, 178, '');
INSERT INTO `op_bestowals` VALUES (241, '1987-09-19', '1', NULL, NULL, 24, 187, '');
INSERT INTO `op_bestowals` VALUES (242, '1987-09-19', '10', NULL, NULL, 5, 187, '');
INSERT INTO `op_bestowals` VALUES (243, '1987-09-19', '2', NULL, NULL, 239, 181, '');
INSERT INTO `op_bestowals` VALUES (244, '1987-09-19', '2', NULL, NULL, 13, 178, '(illumination)');
INSERT INTO `op_bestowals` VALUES (245, '1987-09-19', '2', NULL, NULL, 250, 187, '');
INSERT INTO `op_bestowals` VALUES (246, '1987-09-19', '3', NULL, NULL, 300, 187, '');
INSERT INTO `op_bestowals` VALUES (247, '1987-09-19', '4', NULL, NULL, 268, 187, '');
INSERT INTO `op_bestowals` VALUES (248, '1987-09-19', '5', NULL, NULL, 213, 187, '');
INSERT INTO `op_bestowals` VALUES (249, '1987-09-19', '6', NULL, NULL, 207, 187, '');
INSERT INTO `op_bestowals` VALUES (250, '1987-09-19', '7', NULL, NULL, 283, 187, '');
INSERT INTO `op_bestowals` VALUES (251, '1987-09-19', '8', NULL, NULL, 35, 187, '');
INSERT INTO `op_bestowals` VALUES (252, '1987-09-19', '9', NULL, NULL, 212, 187, '');
INSERT INTO `op_bestowals` VALUES (253, '1987-09-27', '', NULL, NULL, 357, 187, '');
INSERT INTO `op_bestowals` VALUES (254, '1987-09-27', '', NULL, NULL, 270, 181, '');
INSERT INTO `op_bestowals` VALUES (255, '1987-09-27', '1', NULL, NULL, 145, 187, '');
INSERT INTO `op_bestowals` VALUES (256, '1987-09-27', '2', NULL, NULL, 198, 187, '');
INSERT INTO `op_bestowals` VALUES (257, '1987-09-27', '3', NULL, NULL, 233, 187, '');
INSERT INTO `op_bestowals` VALUES (258, '1987-09-27', '4', NULL, NULL, 254, 187, '');
INSERT INTO `op_bestowals` VALUES (259, '1987-09-27', '5', NULL, NULL, 265, 187, '');
INSERT INTO `op_bestowals` VALUES (260, '1987-10-03', 'a04', NULL, NULL, 123, 187, '');
INSERT INTO `op_bestowals` VALUES (261, '1987-10-03', 'a09', NULL, NULL, 51, 187, '');
INSERT INTO `op_bestowals` VALUES (262, '1987-10-03', 'a16', NULL, NULL, 304, 181, '');
INSERT INTO `op_bestowals` VALUES (263, '1987-10-03', 'a21', NULL, NULL, 79, 177, '(woodworking)');
INSERT INTO `op_bestowals` VALUES (264, '1987-10-22', '', NULL, NULL, 265, 190, '');
INSERT INTO `op_bestowals` VALUES (265, '1987-10-22', '', NULL, NULL, 310, 190, '');
INSERT INTO `op_bestowals` VALUES (266, '1987-10-22', '', NULL, NULL, 262, 191, '');
INSERT INTO `op_bestowals` VALUES (267, '1987-10-31', '', NULL, NULL, 374, 187, '(Outlands)');
INSERT INTO `op_bestowals` VALUES (268, '1987-11-21', '10', NULL, NULL, 13, 222, '');
INSERT INTO `op_bestowals` VALUES (269, '1987-12-31', '0', '?/?/87,?/?/89', NULL, 90, 204, '(awarded twice)');
INSERT INTO `op_bestowals` VALUES (270, '1987-12-31', '0', '?/?/87', NULL, 90, 187, '(conveyed by AST, Ansteorra)');
INSERT INTO `op_bestowals` VALUES (271, '1988-01-20', '', NULL, NULL, 51, 190, '');
INSERT INTO `op_bestowals` VALUES (272, '1988-01-20', '', NULL, NULL, 283, 190, '');
INSERT INTO `op_bestowals` VALUES (273, '1988-01-20', '', NULL, NULL, 42, 190, '');
INSERT INTO `op_bestowals` VALUES (274, '1988-01-23', '', NULL, NULL, 301, 178, '(illumination)');
INSERT INTO `op_bestowals` VALUES (275, '1988-01-23', '', NULL, NULL, 193, 187, '');
INSERT INTO `op_bestowals` VALUES (276, '1988-02-20', '', NULL, NULL, 98, 187, '');
INSERT INTO `op_bestowals` VALUES (277, '1988-03-19', '', NULL, NULL, 92, 177, '');
INSERT INTO `op_bestowals` VALUES (278, '1988-03-19', '', NULL, NULL, 202, 187, '');
INSERT INTO `op_bestowals` VALUES (279, '1988-03-19', '1', NULL, NULL, 45, 181, '');
INSERT INTO `op_bestowals` VALUES (280, '1988-03-19', '1', NULL, NULL, 104, 187, '');
INSERT INTO `op_bestowals` VALUES (281, '1988-03-19', '2', NULL, NULL, 129, 181, '');
INSERT INTO `op_bestowals` VALUES (282, '1988-03-19', '2', NULL, NULL, 170, 187, '');
INSERT INTO `op_bestowals` VALUES (283, '1988-03-19', '3', NULL, NULL, 264, 181, '');
INSERT INTO `op_bestowals` VALUES (284, '1988-03-19', '3', NULL, NULL, 191, 187, '');
INSERT INTO `op_bestowals` VALUES (285, '1988-03-19', '4', NULL, NULL, 317, 187, '');
INSERT INTO `op_bestowals` VALUES (286, '1988-05-07', 'b03', NULL, NULL, 258, 187, '');
INSERT INTO `op_bestowals` VALUES (287, '1988-05-07', 'b08', NULL, NULL, 72, 178, '(costuming)');
INSERT INTO `op_bestowals` VALUES (288, '1988-05-28', '', NULL, NULL, 256, 181, '');
INSERT INTO `op_bestowals` VALUES (289, '1988-05-28', '', NULL, NULL, 316, 187, '');
INSERT INTO `op_bestowals` VALUES (290, '1988-06-04', '', NULL, NULL, 13, 192, '(Gold Company)');
INSERT INTO `op_bestowals` VALUES (291, '1988-06-04', '', NULL, NULL, 224, 190, '');
INSERT INTO `op_bestowals` VALUES (292, '1988-06-04', '', NULL, NULL, 54, 191, '');
INSERT INTO `op_bestowals` VALUES (293, '1988-06-04', '', NULL, NULL, 119, 191, '');
INSERT INTO `op_bestowals` VALUES (294, '1988-06-04', '', NULL, NULL, 98, 190, '');
INSERT INTO `op_bestowals` VALUES (295, '1988-06-04', '', NULL, NULL, 217, 223, '');
INSERT INTO `op_bestowals` VALUES (296, '1988-06-04', '', NULL, NULL, 116, 192, '(Gold Company)');
INSERT INTO `op_bestowals` VALUES (297, '1988-06-04', '', NULL, NULL, 252, 192, '(Gold Company)');
INSERT INTO `op_bestowals` VALUES (298, '1988-06-04', '', NULL, NULL, 40, 192, '(Gold Company)');
INSERT INTO `op_bestowals` VALUES (299, '1988-06-04', '', NULL, NULL, 158, 190, '');
INSERT INTO `op_bestowals` VALUES (300, '1988-06-04', '', NULL, NULL, 149, 192, '(Gold Company)');
INSERT INTO `op_bestowals` VALUES (301, '1988-06-04', 'a01', NULL, NULL, 113, 187, '');
INSERT INTO `op_bestowals` VALUES (302, '1988-06-04', 'a02', NULL, NULL, 124, 187, '');
INSERT INTO `op_bestowals` VALUES (303, '1988-06-04', 'a04', NULL, NULL, 127, 187, '');
INSERT INTO `op_bestowals` VALUES (304, '1988-06-04', 'a05', NULL, NULL, 218, 187, '');
INSERT INTO `op_bestowals` VALUES (305, '1988-06-04', 'a07', NULL, NULL, 216, 181, '');
INSERT INTO `op_bestowals` VALUES (306, '1988-06-04', 'a08', NULL, NULL, 42, 181, '');
INSERT INTO `op_bestowals` VALUES (307, '1988-06-04', 'a09', NULL, NULL, 283, 181, '');
INSERT INTO `op_bestowals` VALUES (308, '1988-06-04', 'a10', NULL, NULL, 158, 187, '');
INSERT INTO `op_bestowals` VALUES (309, '1988-06-04', 'a11', NULL, NULL, 307, 187, '');
INSERT INTO `op_bestowals` VALUES (310, '1988-06-04', 'a12', NULL, NULL, 316, 187, '');
INSERT INTO `op_bestowals` VALUES (311, '1988-06-04', 'a13', NULL, NULL, 161, 187, '');
INSERT INTO `op_bestowals` VALUES (312, '1988-07-02', '', NULL, NULL, 54, 178, '(callig. & illum.)');
INSERT INTO `op_bestowals` VALUES (313, '1988-07-02', '', NULL, NULL, 224, 178, '(callig. & illumin.)');
INSERT INTO `op_bestowals` VALUES (314, '1988-07-02', '1', NULL, NULL, 137, 187, '');
INSERT INTO `op_bestowals` VALUES (315, '1988-07-02', '2', NULL, NULL, 232, 187, '');
INSERT INTO `op_bestowals` VALUES (316, '1988-07-02', '3', NULL, NULL, 315, 187, '');
INSERT INTO `op_bestowals` VALUES (317, '1988-07-16', '', NULL, NULL, 304, 178, '`');
INSERT INTO `op_bestowals` VALUES (318, '1988-07-16', '', NULL, NULL, 134, 187, '');
INSERT INTO `op_bestowals` VALUES (319, '1988-09-17', '', NULL, NULL, 503, 167, '(Calontir)');
INSERT INTO `op_bestowals` VALUES (320, '1988-09-17', '', NULL, NULL, 502, 167, '(Calontir)');
INSERT INTO `op_bestowals` VALUES (321, '1988-10-08', 'a06', NULL, NULL, 10, 187, '');
INSERT INTO `op_bestowals` VALUES (322, '1988-10-08', 'a07', NULL, NULL, 107, 187, '');
INSERT INTO `op_bestowals` VALUES (323, '1988-10-08', 'a08', NULL, NULL, 271, 187, '');
INSERT INTO `op_bestowals` VALUES (324, '1988-10-08', 'a30', NULL, NULL, 262, 178, '(textiles)');
INSERT INTO `op_bestowals` VALUES (325, '1988-10-08', 'a34', NULL, NULL, 72, 181, '');
INSERT INTO `op_bestowals` VALUES (326, '1988-10-08', 'b23', NULL, NULL, 264, 169, '(Eastern dance)');
INSERT INTO `op_bestowals` VALUES (327, '1988-10-22', '', NULL, NULL, 304, 190, '');
INSERT INTO `op_bestowals` VALUES (328, '1988-10-22', '', NULL, NULL, 227, 190, '');
INSERT INTO `op_bestowals` VALUES (329, '1988-10-22', '', NULL, NULL, 136, 191, '');
INSERT INTO `op_bestowals` VALUES (330, '1988-10-22', '', NULL, NULL, 128, 190, '');
INSERT INTO `op_bestowals` VALUES (331, '1988-10-22', '', NULL, NULL, 88, 222, '');
INSERT INTO `op_bestowals` VALUES (332, '1988-10-22', '', NULL, NULL, 209, 190, '');
INSERT INTO `op_bestowals` VALUES (333, '1988-12-17', '.15', NULL, NULL, 68, 181, '');
INSERT INTO `op_bestowals` VALUES (334, '1988-12-17', '.20', NULL, NULL, 15, 178, '(dance)');
INSERT INTO `op_bestowals` VALUES (335, '1989-01-21', '', NULL, NULL, 213, 191, '');
INSERT INTO `op_bestowals` VALUES (336, '1989-01-21', '', NULL, NULL, 72, 190, '');
INSERT INTO `op_bestowals` VALUES (337, '1989-01-21', '', NULL, NULL, 268, 191, '');
INSERT INTO `op_bestowals` VALUES (338, '1989-02-24', '.01', NULL, NULL, 261, 187, '');
INSERT INTO `op_bestowals` VALUES (339, '1989-03-04', '.01', NULL, NULL, 203, 188, '');
INSERT INTO `op_bestowals` VALUES (340, '1989-03-04', '.02', NULL, NULL, 52, 187, '');
INSERT INTO `op_bestowals` VALUES (341, '1989-03-04', '.03', NULL, NULL, 209, 187, '');
INSERT INTO `op_bestowals` VALUES (342, '1989-03-04', '.04', NULL, NULL, 115, 187, '');
INSERT INTO `op_bestowals` VALUES (343, '1989-03-04', '.05', NULL, NULL, 296, 187, '');
INSERT INTO `op_bestowals` VALUES (344, '1989-03-04', '.06', NULL, NULL, 299, 187, '');
INSERT INTO `op_bestowals` VALUES (345, '1989-03-04', '.07', NULL, NULL, 32, 187, '');
INSERT INTO `op_bestowals` VALUES (346, '1989-03-04', '.08', NULL, NULL, 66, 187, '');
INSERT INTO `op_bestowals` VALUES (347, '1989-03-04', '.09', NULL, NULL, 223, 187, '');
INSERT INTO `op_bestowals` VALUES (348, '1989-03-04', '.10', NULL, NULL, 119, 181, '');
INSERT INTO `op_bestowals` VALUES (349, '1989-03-04', '.11', NULL, NULL, 116, 181, '');
INSERT INTO `op_bestowals` VALUES (350, '1989-03-04', '.12', NULL, NULL, 192, 181, '');
INSERT INTO `op_bestowals` VALUES (351, '1989-03-04', '.13', NULL, NULL, 266, 177, '(brewing)');
INSERT INTO `op_bestowals` VALUES (352, '1989-04-08', '', NULL, NULL, 144, 190, '');
INSERT INTO `op_bestowals` VALUES (353, '1989-04-08', '', NULL, NULL, 254, 190, '');
INSERT INTO `op_bestowals` VALUES (354, '1989-04-08', '', NULL, NULL, 113, 190, '');
INSERT INTO `op_bestowals` VALUES (355, '1989-06-03', '', NULL, NULL, 24, 223, '');
INSERT INTO `op_bestowals` VALUES (356, '1989-06-04', '', NULL, NULL, 129, 192, '');
INSERT INTO `op_bestowals` VALUES (357, '1989-06-04', '', NULL, NULL, 52, 191, '');
INSERT INTO `op_bestowals` VALUES (358, '1989-06-04', '', NULL, NULL, 170, 192, '');
INSERT INTO `op_bestowals` VALUES (359, '1989-06-04', '', NULL, NULL, 315, 190, '');
INSERT INTO `op_bestowals` VALUES (360, '1989-06-07', '', NULL, NULL, 239, 274, '(Barony of Dragonspine) (Resigned 10/7/1989)');
INSERT INTO `op_bestowals` VALUES (361, '1989-06-07', '', NULL, NULL, 92, 274, '(Barony of Dragonspine) (Resigned 10/7/1989)');
INSERT INTO `op_bestowals` VALUES (362, '1989-06-30', '', '6/?/89', NULL, 56, 206, '');
INSERT INTO `op_bestowals` VALUES (363, '1989-08-17', '.11', NULL, NULL, 288, 180, '');
INSERT INTO `op_bestowals` VALUES (364, '1989-08-17', '.12', NULL, NULL, 256, 178, '');
INSERT INTO `op_bestowals` VALUES (365, '1989-08-31', '', '8/?/89', NULL, 131, 200, '');
INSERT INTO `op_bestowals` VALUES (366, '1989-09-16', '.01', NULL, NULL, 138, 187, '');
INSERT INTO `op_bestowals` VALUES (367, '1989-09-16', '.02', NULL, NULL, 177, 187, '');
INSERT INTO `op_bestowals` VALUES (368, '1989-09-16', '.03', NULL, NULL, 8, 187, '');
INSERT INTO `op_bestowals` VALUES (369, '1989-09-16', '.04', NULL, NULL, 88, 187, '');
INSERT INTO `op_bestowals` VALUES (370, '1989-09-16', '.05', NULL, NULL, 235, 187, '');
INSERT INTO `op_bestowals` VALUES (371, '1989-09-16', '.06', NULL, NULL, 181, 187, '');
INSERT INTO `op_bestowals` VALUES (372, '1989-09-16', '.07', NULL, NULL, 13, 181, '');
INSERT INTO `op_bestowals` VALUES (373, '1989-09-16', '.08', NULL, NULL, 37, 181, '');
INSERT INTO `op_bestowals` VALUES (374, '1989-10-07', '', NULL, NULL, 92, 173, '');
INSERT INTO `op_bestowals` VALUES (375, '1989-10-07', '', NULL, NULL, 239, 173, '');
INSERT INTO `op_bestowals` VALUES (376, '1989-10-14', '', NULL, NULL, 124, 190, '');
INSERT INTO `op_bestowals` VALUES (377, '1989-10-14', '', NULL, NULL, 137, 191, '');
INSERT INTO `op_bestowals` VALUES (378, '1989-10-14', '', NULL, NULL, 142, 191, '');
INSERT INTO `op_bestowals` VALUES (379, '1989-10-14', '', NULL, NULL, 64, 190, '');
INSERT INTO `op_bestowals` VALUES (380, '1989-10-14', '', NULL, NULL, 28, 191, '');
INSERT INTO `op_bestowals` VALUES (381, '1989-10-14', '', NULL, NULL, 206, 190, '');
INSERT INTO `op_bestowals` VALUES (382, '1989-10-14', '12', NULL, NULL, 216, 222, '');
INSERT INTO `op_bestowals` VALUES (383, '1990-01-06', '', NULL, NULL, 134, 168, '(Principality of Drachenwald, East)');
INSERT INTO `op_bestowals` VALUES (384, '1990-01-06', '', NULL, NULL, 47, 168, '(Principality of Drachenwald, East)');
INSERT INTO `op_bestowals` VALUES (385, '1990-01-16', '', NULL, NULL, 127, 190, '');
INSERT INTO `op_bestowals` VALUES (386, '1990-01-20', '', NULL, NULL, 215, 190, '');
INSERT INTO `op_bestowals` VALUES (387, '1990-01-20', 'a01', NULL, NULL, 197, 187, '');
INSERT INTO `op_bestowals` VALUES (388, '1990-01-20', 'a02', NULL, NULL, 105, 187, '');
INSERT INTO `op_bestowals` VALUES (389, '1990-01-20', 'a03', NULL, NULL, 154, 187, '');
INSERT INTO `op_bestowals` VALUES (390, '1990-01-20', 'a04', NULL, NULL, 262, 181, '');
INSERT INTO `op_bestowals` VALUES (391, '1990-01-20', 'a05', NULL, NULL, 64, 177, '(research)');
INSERT INTO `op_bestowals` VALUES (392, '1990-01-20', 'a06', NULL, NULL, 129, 176, '');
INSERT INTO `op_bestowals` VALUES (393, '1990-01-27', 'a18', NULL, NULL, 45, 183, '');
INSERT INTO `op_bestowals` VALUES (394, '1990-02-03', '.03', NULL, NULL, 98, 181, '');
INSERT INTO `op_bestowals` VALUES (395, '1990-03-17', '', NULL, NULL, 66, 191, '');
INSERT INTO `op_bestowals` VALUES (396, '1990-03-17', '', NULL, NULL, 24, 190, '');
INSERT INTO `op_bestowals` VALUES (397, '1990-03-17', '', NULL, NULL, 143, 190, '');
INSERT INTO `op_bestowals` VALUES (398, '1990-03-17', '.01', NULL, NULL, 264, 176, '');
INSERT INTO `op_bestowals` VALUES (399, '1990-04-14', 'a14', NULL, NULL, 313, 187, '');
INSERT INTO `op_bestowals` VALUES (400, '1990-04-21', 'a02', NULL, NULL, 187, 187, '');
INSERT INTO `op_bestowals` VALUES (401, '1990-04-21', 'a05', NULL, NULL, 206, 187, '');
INSERT INTO `op_bestowals` VALUES (402, '1990-04-21', 'a06', NULL, NULL, 126, 187, '');
INSERT INTO `op_bestowals` VALUES (403, '1990-04-21', 'a08', NULL, NULL, 215, 187, '');
INSERT INTO `op_bestowals` VALUES (404, '1990-04-21', 'a09', NULL, NULL, 151, 187, '');
INSERT INTO `op_bestowals` VALUES (405, '1990-04-21', 'a11', NULL, NULL, 143, 187, '');
INSERT INTO `op_bestowals` VALUES (406, '1990-04-21', 'a12', NULL, NULL, 142, 178, '(music)');
INSERT INTO `op_bestowals` VALUES (407, '1990-05-12', 'a11', NULL, NULL, 256, 176, '');
INSERT INTO `op_bestowals` VALUES (408, '1990-05-12', 'b10', NULL, NULL, 202, 178, '');
INSERT INTO `op_bestowals` VALUES (409, '1990-05-26', '.01', NULL, NULL, 354, 187, '');
INSERT INTO `op_bestowals` VALUES (410, '1990-05-26', '.02', NULL, NULL, 234, 187, '');
INSERT INTO `op_bestowals` VALUES (411, '1990-05-26', '.05', NULL, NULL, 50, 187, '');
INSERT INTO `op_bestowals` VALUES (412, '1990-05-26', '.06', NULL, NULL, 208, 187, '');
INSERT INTO `op_bestowals` VALUES (413, '1990-05-26', '.10', NULL, NULL, 64, 181, '');
INSERT INTO `op_bestowals` VALUES (414, '1990-05-26', '.11', NULL, NULL, 246, 181, '');
INSERT INTO `op_bestowals` VALUES (415, '1990-05-26', '.12', NULL, NULL, 209, 181, '');
INSERT INTO `op_bestowals` VALUES (416, '1990-05-26', '.16', NULL, NULL, 52, 177, '(stained glass)');
INSERT INTO `op_bestowals` VALUES (417, '1990-05-26', '.20', NULL, NULL, 116, 176, '');
INSERT INTO `op_bestowals` VALUES (418, '1990-05-26', '1', NULL, NULL, 33, 187, '');
INSERT INTO `op_bestowals` VALUES (419, '1990-06-23', 'a19', NULL, NULL, 160, 181, '');
INSERT INTO `op_bestowals` VALUES (420, '1990-06-25', '.22', NULL, NULL, 351, 187, '');
INSERT INTO `op_bestowals` VALUES (421, '1990-07-14', '', NULL, NULL, 315, 223, '');
INSERT INTO `op_bestowals` VALUES (422, '1990-07-15', '.03', NULL, NULL, 133, 187, '');
INSERT INTO `op_bestowals` VALUES (423, '1990-07-15', '.05', NULL, NULL, 82, 187, '');
INSERT INTO `op_bestowals` VALUES (424, '1990-07-15', '.06', NULL, NULL, 20, 187, '');
INSERT INTO `op_bestowals` VALUES (425, '1990-07-15', '.07', NULL, NULL, 225, 187, '');
INSERT INTO `op_bestowals` VALUES (426, '1990-07-15', '.08', NULL, NULL, 97, 187, '');
INSERT INTO `op_bestowals` VALUES (427, '1990-07-15', '.09', NULL, NULL, 60, 187, '');
INSERT INTO `op_bestowals` VALUES (428, '1990-07-15', '.10', NULL, NULL, 14, 187, '');
INSERT INTO `op_bestowals` VALUES (429, '1990-07-15', '.11', NULL, NULL, 235, 187, '');
INSERT INTO `op_bestowals` VALUES (430, '1990-07-15', '.12', NULL, NULL, 61, 187, '');
INSERT INTO `op_bestowals` VALUES (431, '1990-07-15', '.13', NULL, NULL, 128, 181, '');
INSERT INTO `op_bestowals` VALUES (432, '1990-07-15', '.15', NULL, NULL, 236, 181, '');
INSERT INTO `op_bestowals` VALUES (433, '1990-07-15', '.16', NULL, NULL, 317, 182, '');
INSERT INTO `op_bestowals` VALUES (434, '1990-07-15', '.17', NULL, NULL, 98, 181, '');
INSERT INTO `op_bestowals` VALUES (435, '1990-07-15', '.19', NULL, NULL, 10, 181, '');
INSERT INTO `op_bestowals` VALUES (436, '1990-07-15', '.20', NULL, NULL, 15, 181, '');
INSERT INTO `op_bestowals` VALUES (437, '1990-08-17', '.33', NULL, NULL, 131, 175, '');
INSERT INTO `op_bestowals` VALUES (438, '1990-09-15', '.03', NULL, NULL, 210, 187, '');
INSERT INTO `op_bestowals` VALUES (439, '1990-09-15', '.04', NULL, NULL, 38, 187, '');
INSERT INTO `op_bestowals` VALUES (440, '1990-09-15', '.12', NULL, NULL, 252, 184, '');
INSERT INTO `op_bestowals` VALUES (441, '1990-09-15', '.14', NULL, NULL, 256, 182, '');
INSERT INTO `op_bestowals` VALUES (442, '1990-09-15', '.22', NULL, NULL, 136, 181, '');
INSERT INTO `op_bestowals` VALUES (443, '1990-09-15', '.23', NULL, NULL, 28, 181, '');
INSERT INTO `op_bestowals` VALUES (444, '1990-09-15', '.24', NULL, NULL, 181, 181, '');
INSERT INTO `op_bestowals` VALUES (445, '1990-09-15', '.25', NULL, NULL, 137, 181, '');
INSERT INTO `op_bestowals` VALUES (446, '1990-10-16', '', NULL, NULL, 180, 187, '(Pricipality of Drachenwald, East)');
INSERT INTO `op_bestowals` VALUES (447, '1990-10-20', '', NULL, NULL, 96, 190, '');
INSERT INTO `op_bestowals` VALUES (448, '1990-10-20', '', NULL, NULL, 198, 190, '');
INSERT INTO `op_bestowals` VALUES (449, '1990-10-20', '', NULL, NULL, 311, 190, '');
INSERT INTO `op_bestowals` VALUES (450, '1990-10-20', '', NULL, NULL, 234, 190, '');
INSERT INTO `op_bestowals` VALUES (451, '1990-10-20', '', NULL, NULL, 38, 191, '');
INSERT INTO `op_bestowals` VALUES (452, '1990-10-20', '', NULL, NULL, 197, 191, '');
INSERT INTO `op_bestowals` VALUES (453, '1990-10-20', '', NULL, NULL, 317, 190, '');
INSERT INTO `op_bestowals` VALUES (454, '1990-10-20', '', NULL, NULL, 187, 190, '');
INSERT INTO `op_bestowals` VALUES (455, '1990-10-20', '', NULL, NULL, 66, 222, '');
INSERT INTO `op_bestowals` VALUES (456, '1990-12-31', '', '?/?/90', NULL, 394, 187, '');
INSERT INTO `op_bestowals` VALUES (457, '1990-12-31', '0', '?/?/90', NULL, 90, 201, '');
INSERT INTO `op_bestowals` VALUES (458, '1990-12-31', '0', '?/?/?90', NULL, 90, 173, '(conveyed by OIM, Ansteorra)');
INSERT INTO `op_bestowals` VALUES (459, '1990-12-31', '1', '?/?/90', NULL, 56, 187, '(Principality of Drachenwald) (East)');
INSERT INTO `op_bestowals` VALUES (460, '1990-12-31', '2', '?/?/90', NULL, 80, 187, '(East)');
INSERT INTO `op_bestowals` VALUES (461, '1990-12-31', '3', '?/?/90', NULL, 289, 187, '(Principality of Drachenwald) (East)');
INSERT INTO `op_bestowals` VALUES (462, '1991-01-05', '', NULL, NULL, 180, 207, '');
INSERT INTO `op_bestowals` VALUES (463, '1991-01-05', '', NULL, NULL, 184, 187, '(Principality of Drachenwald, East)');
INSERT INTO `op_bestowals` VALUES (464, '1991-01-19', '', NULL, NULL, 98, 192, '');
INSERT INTO `op_bestowals` VALUES (465, '1991-01-19', '', NULL, NULL, 33, 190, '');
INSERT INTO `op_bestowals` VALUES (466, '1991-01-19', '', NULL, NULL, 236, 190, '');
INSERT INTO `op_bestowals` VALUES (467, '1991-01-19', '', NULL, NULL, 301, 190, '');
INSERT INTO `op_bestowals` VALUES (468, '1991-01-19', '', NULL, NULL, 248, 190, '');
INSERT INTO `op_bestowals` VALUES (469, '1991-01-19', '', NULL, NULL, 315, 191, '');
INSERT INTO `op_bestowals` VALUES (470, '1991-01-19', '', NULL, NULL, 8, 191, '');
INSERT INTO `op_bestowals` VALUES (471, '1991-03-23', '', NULL, NULL, 114, 191, '');
INSERT INTO `op_bestowals` VALUES (472, '1991-03-23', '', NULL, NULL, 151, 190, '');
INSERT INTO `op_bestowals` VALUES (473, '1991-03-23', '', NULL, NULL, 246, 190, '');
INSERT INTO `op_bestowals` VALUES (474, '1991-03-23', '', NULL, NULL, 165, 191, '');
INSERT INTO `op_bestowals` VALUES (475, '1991-05-30', '', '?/?/91', NULL, 340, 230, '');
INSERT INTO `op_bestowals` VALUES (476, '1991-06-01', '', NULL, NULL, 235, 223, '');
INSERT INTO `op_bestowals` VALUES (477, '1991-06-01', 'a16', NULL, NULL, 23, 181, '');
INSERT INTO `op_bestowals` VALUES (478, '1991-06-22', 'a03', NULL, NULL, 219, 187, '');
INSERT INTO `op_bestowals` VALUES (479, '1991-06-22', 'a04', NULL, NULL, 122, 187, '');
INSERT INTO `op_bestowals` VALUES (480, '1991-06-22', 'a05', NULL, NULL, 179, 187, '');
INSERT INTO `op_bestowals` VALUES (481, '1991-06-22', 'a06', NULL, NULL, 165, 187, '');
INSERT INTO `op_bestowals` VALUES (482, '1991-06-22', 'a08', NULL, NULL, 356, 187, '');
INSERT INTO `op_bestowals` VALUES (483, '1991-06-22', 'a13', NULL, NULL, 124, 181, '');
INSERT INTO `op_bestowals` VALUES (484, '1991-06-29', '', NULL, NULL, 92, 169, '(Outlands) (cal. & illum.)');
INSERT INTO `op_bestowals` VALUES (485, '1991-07-04', '', NULL, NULL, 235, 192, '');
INSERT INTO `op_bestowals` VALUES (486, '1991-07-04', '', NULL, NULL, 122, 191, '');
INSERT INTO `op_bestowals` VALUES (487, '1991-07-04', '', NULL, NULL, 300, 192, '');
INSERT INTO `op_bestowals` VALUES (488, '1991-07-04', '', NULL, NULL, 33, 192, '');
INSERT INTO `op_bestowals` VALUES (489, '1991-07-13', 'a01', NULL, NULL, 283, 178, '(cooking)');
INSERT INTO `op_bestowals` VALUES (490, '1991-07-13', 'b01', NULL, NULL, 317, 221, '(In chief a wolf''s head erased argent) (Given by David and Tangwystl)');
INSERT INTO `op_bestowals` VALUES (491, '1991-07-13', 'b02', NULL, NULL, 96, 187, '');
INSERT INTO `op_bestowals` VALUES (492, '1991-07-13', 'b04', NULL, NULL, 311, 187, '');
INSERT INTO `op_bestowals` VALUES (493, '1991-07-13', 'b05', NULL, NULL, 70, 187, '');
INSERT INTO `op_bestowals` VALUES (494, '1991-07-13', 'b08', NULL, NULL, 83, 187, '');
INSERT INTO `op_bestowals` VALUES (495, '1991-07-13', 'b09', NULL, NULL, 248, 187, '');
INSERT INTO `op_bestowals` VALUES (496, '1991-07-13', 'b12', NULL, NULL, 315, 183, '');
INSERT INTO `op_bestowals` VALUES (497, '1991-07-13', 'b14', NULL, NULL, 8, 181, '');
INSERT INTO `op_bestowals` VALUES (498, '1991-07-13', 'b16', NULL, NULL, 158, 181, '');
INSERT INTO `op_bestowals` VALUES (499, '1991-07-13', 'b18', NULL, NULL, 198, 178, '(dance)');
INSERT INTO `op_bestowals` VALUES (500, '1991-07-13', 'b19', NULL, NULL, 54, 171, '');
INSERT INTO `op_bestowals` VALUES (501, '1991-07-27', '.08', NULL, NULL, 3, 187, '');
INSERT INTO `op_bestowals` VALUES (502, '1991-07-27', '.10', NULL, NULL, 285, 187, '');
INSERT INTO `op_bestowals` VALUES (503, '1991-07-27', '.12', NULL, NULL, 355, 187, '');
INSERT INTO `op_bestowals` VALUES (504, '1991-07-31', '', '?/?/91', NULL, 313, 239, '');
INSERT INTO `op_bestowals` VALUES (505, '1991-08-15', '.02', NULL, NULL, 114, 187, '');
INSERT INTO `op_bestowals` VALUES (506, '1991-08-15', '.03', NULL, NULL, 166, 187, '');
INSERT INTO `op_bestowals` VALUES (507, '1991-08-15', '.23', NULL, NULL, 98, 183, '');
INSERT INTO `op_bestowals` VALUES (508, '1991-08-15', '.26', NULL, NULL, 129, 183, '');
INSERT INTO `op_bestowals` VALUES (509, '1991-08-17', '', NULL, NULL, 276, 192, '');
INSERT INTO `op_bestowals` VALUES (510, '1991-09-07', 'a09', NULL, NULL, 216, 178, '(leatherwork)');
INSERT INTO `op_bestowals` VALUES (511, '1991-09-07', 'b05', NULL, NULL, 79, 181, '');
INSERT INTO `op_bestowals` VALUES (512, '1991-10-12', 'a03', NULL, NULL, 177, 181, '');
INSERT INTO `op_bestowals` VALUES (513, '1991-10-12', 'a08', NULL, NULL, 15, 169, '(textile arts)');
INSERT INTO `op_bestowals` VALUES (514, '1991-10-12', 'b10', NULL, NULL, 116, 175, '');
INSERT INTO `op_bestowals` VALUES (515, '1991-11-02', 'a05', NULL, NULL, 228, 181, '');
INSERT INTO `op_bestowals` VALUES (516, '1991-11-02', 'a06', NULL, NULL, 160, 178, '(cooking)');
INSERT INTO `op_bestowals` VALUES (517, '1991-11-02', 'a08', NULL, NULL, 28, 176, '');
INSERT INTO `op_bestowals` VALUES (518, '1991-11-09', '', NULL, NULL, 138, 190, '');
INSERT INTO `op_bestowals` VALUES (519, '1991-11-09', '', NULL, NULL, 124, 191, '');
INSERT INTO `op_bestowals` VALUES (520, '1991-11-09', '', NULL, NULL, 248, 222, '');
INSERT INTO `op_bestowals` VALUES (521, '1991-11-09', '', NULL, NULL, 235, 191, '');
INSERT INTO `op_bestowals` VALUES (522, '1991-12-31', '', '?/?/91', NULL, 394, 206, '');
INSERT INTO `op_bestowals` VALUES (523, '1991-12-31', '', '?/?/91', NULL, 394, 252, '');
INSERT INTO `op_bestowals` VALUES (524, '1992-01-18', '', NULL, NULL, 98, 191, '');
INSERT INTO `op_bestowals` VALUES (525, '1992-01-18', '', NULL, NULL, 75, 190, '');
INSERT INTO `op_bestowals` VALUES (526, '1992-01-18', '', NULL, NULL, 181, 191, '');
INSERT INTO `op_bestowals` VALUES (527, '1992-01-18', '', NULL, NULL, 313, 191, '');
INSERT INTO `op_bestowals` VALUES (528, '1992-01-18', '', NULL, NULL, 39, 191, '');
INSERT INTO `op_bestowals` VALUES (529, '1992-01-18', '', NULL, NULL, 214, 190, '');
INSERT INTO `op_bestowals` VALUES (530, '1992-01-18', '.17', NULL, NULL, 3, 177, '');
INSERT INTO `op_bestowals` VALUES (531, '1992-02-01', '', NULL, NULL, 239, 272, '');
INSERT INTO `op_bestowals` VALUES (532, '1992-02-02', '', NULL, NULL, 18, 187, '');
INSERT INTO `op_bestowals` VALUES (533, '1992-02-29', 'a19', NULL, NULL, 256, 173, '');
INSERT INTO `op_bestowals` VALUES (534, '1992-03-07', '', NULL, NULL, 92, 271, '');
INSERT INTO `op_bestowals` VALUES (535, '1992-03-28', '', NULL, NULL, 177, 190, '');
INSERT INTO `op_bestowals` VALUES (536, '1992-03-28', '', NULL, NULL, 154, 190, '');
INSERT INTO `op_bestowals` VALUES (537, '1992-03-28', '', NULL, NULL, 83, 190, '');
INSERT INTO `op_bestowals` VALUES (538, '1992-03-28', '', NULL, NULL, 187, 191, '');
INSERT INTO `op_bestowals` VALUES (539, '1992-03-28', '', NULL, NULL, 317, 191, '');
INSERT INTO `op_bestowals` VALUES (540, '1992-03-28', 'a01', NULL, NULL, 73, 187, '');
INSERT INTO `op_bestowals` VALUES (541, '1992-03-28', 'a02', NULL, NULL, 205, 187, '');
INSERT INTO `op_bestowals` VALUES (542, '1992-03-28', 'a03', NULL, NULL, 281, 187, '');
INSERT INTO `op_bestowals` VALUES (543, '1992-03-28', 'a10', NULL, NULL, 147, 187, '');
INSERT INTO `op_bestowals` VALUES (544, '1992-03-28', 'a11', NULL, NULL, 93, 187, '');
INSERT INTO `op_bestowals` VALUES (545, '1992-03-28', 'a12', NULL, NULL, 214, 187, '');
INSERT INTO `op_bestowals` VALUES (546, '1992-03-28', 'a13', NULL, NULL, 75, 187, '');
INSERT INTO `op_bestowals` VALUES (547, '1992-03-28', 'a14', NULL, NULL, 39, 187, '');
INSERT INTO `op_bestowals` VALUES (548, '1992-03-28', 'a15', NULL, NULL, 226, 187, '');
INSERT INTO `op_bestowals` VALUES (549, '1992-03-28', 'a17', NULL, NULL, 21, 181, '');
INSERT INTO `op_bestowals` VALUES (550, '1992-03-28', 'a19', NULL, NULL, 88, 181, '');
INSERT INTO `op_bestowals` VALUES (551, '1992-03-28', 'a20', NULL, NULL, 252, 182, '');
INSERT INTO `op_bestowals` VALUES (552, '1992-03-28', 'a21', NULL, NULL, 235, 177, '(leatherwork)');
INSERT INTO `op_bestowals` VALUES (553, '1992-03-28', 'a22', NULL, NULL, 213, 178, '(callig. & illumin.)');
INSERT INTO `op_bestowals` VALUES (554, '1992-03-28', 'a23', NULL, NULL, 238, 178, '(textile arts)');
INSERT INTO `op_bestowals` VALUES (555, '1992-03-28', 'a24', NULL, NULL, 124, 176, '');
INSERT INTO `op_bestowals` VALUES (556, '1992-03-28', 'b01', NULL, NULL, 175, 187, '');
INSERT INTO `op_bestowals` VALUES (557, '1992-03-28', 'b09', NULL, NULL, 279, 185, '');
INSERT INTO `op_bestowals` VALUES (558, '1992-05-09', 'a18', NULL, NULL, 45, 175, '');
INSERT INTO `op_bestowals` VALUES (559, '1992-05-16', 'a06', NULL, NULL, 138, 182, '');
INSERT INTO `op_bestowals` VALUES (560, '1992-05-16', 'a08', NULL, NULL, 18, 183, '');
INSERT INTO `op_bestowals` VALUES (561, '1992-05-16', 'b16', NULL, NULL, 200, 183, '');
INSERT INTO `op_bestowals` VALUES (562, '1992-05-30', '', NULL, NULL, 300, 190, '');
INSERT INTO `op_bestowals` VALUES (563, '1992-05-30', '', NULL, NULL, 98, 223, '');
INSERT INTO `op_bestowals` VALUES (564, '1992-05-30', '', NULL, NULL, 186, 190, '');
INSERT INTO `op_bestowals` VALUES (565, '1992-05-30', '', NULL, NULL, 258, 191, '');
INSERT INTO `op_bestowals` VALUES (566, '1992-05-30', '', NULL, NULL, 124, 192, '');
INSERT INTO `op_bestowals` VALUES (567, '1992-05-30', '', NULL, NULL, 138, 192, '');
INSERT INTO `op_bestowals` VALUES (568, '1992-06-06', '', NULL, NULL, 184, 206, '');
INSERT INTO `op_bestowals` VALUES (569, '1992-06-06', '', NULL, NULL, 337, 206, '');
INSERT INTO `op_bestowals` VALUES (570, '1992-06-06', '', NULL, NULL, 342, 206, '');
INSERT INTO `op_bestowals` VALUES (571, '1992-06-06', '', NULL, NULL, 340, 206, '');
INSERT INTO `op_bestowals` VALUES (572, '1992-06-06', '', NULL, NULL, 180, 206, '');
INSERT INTO `op_bestowals` VALUES (573, '1992-06-20', '', NULL, NULL, 215, 168, '(Drachenwald)');
INSERT INTO `op_bestowals` VALUES (574, '1992-06-20', '', NULL, NULL, 215, 250, '(with Viscounty)');
INSERT INTO `op_bestowals` VALUES (575, '1992-06-20', '', NULL, NULL, 49, 250, '(with Viscounty)');
INSERT INTO `op_bestowals` VALUES (576, '1992-06-20', '', NULL, NULL, 49, 168, '(Drachenwald)');
INSERT INTO `op_bestowals` VALUES (577, '1992-06-20', '', NULL, NULL, 215, 253, '');
INSERT INTO `op_bestowals` VALUES (578, '1992-06-28', '.04', NULL, NULL, 316, 181, '');
INSERT INTO `op_bestowals` VALUES (579, '1992-06-28', '.10', NULL, NULL, 98, 178, '(callig. & illum.)');
INSERT INTO `op_bestowals` VALUES (580, '1992-06-28', '.11', NULL, NULL, 54, 177, '(cloth & leather armouring)');
INSERT INTO `op_bestowals` VALUES (581, '1992-07-18', '.02', NULL, NULL, 38, 187, '');
INSERT INTO `op_bestowals` VALUES (582, '1992-07-18', '.07', NULL, NULL, 52, 181, '');
INSERT INTO `op_bestowals` VALUES (583, '1992-08-13', 'a11', NULL, NULL, 15, 173, '');
INSERT INTO `op_bestowals` VALUES (584, '1992-09-06', '', NULL, NULL, 107, 192, '');
INSERT INTO `op_bestowals` VALUES (585, '1992-09-12', 'a01', NULL, NULL, 302, 187, '');
INSERT INTO `op_bestowals` VALUES (586, '1992-09-12', 'a02', NULL, NULL, 86, 187, '');
INSERT INTO `op_bestowals` VALUES (587, '1992-09-12', 'a05', NULL, NULL, 356, 181, '');
INSERT INTO `op_bestowals` VALUES (588, '1992-09-12', 'a06', NULL, NULL, 138, 181, '');
INSERT INTO `op_bestowals` VALUES (589, '1992-09-12', 'a08', NULL, NULL, 300, 183, '');
INSERT INTO `op_bestowals` VALUES (590, '1992-09-26', '', NULL, NULL, 103, 191, '');
INSERT INTO `op_bestowals` VALUES (591, '1992-09-26', '', NULL, NULL, 260, 190, '');
INSERT INTO `op_bestowals` VALUES (592, '1992-09-26', '', NULL, NULL, 66, 192, '');
INSERT INTO `op_bestowals` VALUES (593, '1992-09-26', '', NULL, NULL, 93, 190, '');
INSERT INTO `op_bestowals` VALUES (594, '1992-09-26', '', NULL, NULL, 165, 190, '');
INSERT INTO `op_bestowals` VALUES (595, '1992-09-26', '', NULL, NULL, 283, 192, '');
INSERT INTO `op_bestowals` VALUES (596, '1992-10-04', '', NULL, NULL, 242, 192, '');
INSERT INTO `op_bestowals` VALUES (597, '1992-10-10', '', NULL, NULL, 453, 181, '');
INSERT INTO `op_bestowals` VALUES (598, '1992-10-10', 'c10', NULL, NULL, 181, 181, '');
INSERT INTO `op_bestowals` VALUES (599, '1992-10-24', '', NULL, NULL, 63, 191, '');
INSERT INTO `op_bestowals` VALUES (600, '1992-10-24', '', NULL, NULL, 205, 191, '');
INSERT INTO `op_bestowals` VALUES (601, '1992-10-24', '', NULL, NULL, 281, 191, '');
INSERT INTO `op_bestowals` VALUES (602, '1992-10-24', '', NULL, NULL, 147, 190, '');
INSERT INTO `op_bestowals` VALUES (603, '1992-10-24', '', NULL, NULL, 73, 190, '');
INSERT INTO `op_bestowals` VALUES (604, '1992-10-24', '15', NULL, NULL, 147, 222, '');
INSERT INTO `op_bestowals` VALUES (605, '1992-11-14', '', NULL, NULL, 49, 252, '');
INSERT INTO `op_bestowals` VALUES (606, '1992-11-21', 'a02', NULL, NULL, 58, 187, '');
INSERT INTO `op_bestowals` VALUES (607, '1992-11-21', 'a03', NULL, NULL, 353, 187, '');
INSERT INTO `op_bestowals` VALUES (608, '1992-11-21', 'a15', NULL, NULL, 33, 183, '');
INSERT INTO `op_bestowals` VALUES (609, '1992-11-21', 'a21', NULL, NULL, 228, 173, '');
INSERT INTO `op_bestowals` VALUES (610, '1992-12-12', '.01', NULL, NULL, 269, 187, '');
INSERT INTO `op_bestowals` VALUES (611, '1993-01-09', '', NULL, NULL, 215, 254, '');
INSERT INTO `op_bestowals` VALUES (612, '1993-01-23', '.13', NULL, NULL, 285, 181, '');
INSERT INTO `op_bestowals` VALUES (613, '1993-01-24', '', NULL, NULL, 149, 190, '');
INSERT INTO `op_bestowals` VALUES (614, '1993-01-24', '', NULL, NULL, 136, 190, '');
INSERT INTO `op_bestowals` VALUES (615, '1993-01-24', '', NULL, NULL, 83, 191, '');
INSERT INTO `op_bestowals` VALUES (616, '1993-01-24', '', NULL, NULL, 234, 191, '');
INSERT INTO `op_bestowals` VALUES (617, '1993-01-24', '', NULL, NULL, 159, 191, '');
INSERT INTO `op_bestowals` VALUES (618, '1993-02-06', '', NULL, NULL, 454, 177, '');
INSERT INTO `op_bestowals` VALUES (619, '1993-03-06', '', NULL, NULL, 49, 251, '');
INSERT INTO `op_bestowals` VALUES (620, '1993-03-06', '', NULL, NULL, 215, 251, '');
INSERT INTO `op_bestowals` VALUES (621, '1993-03-06', '', NULL, NULL, 215, 255, '');
INSERT INTO `op_bestowals` VALUES (622, '1993-03-13', 'a01', NULL, NULL, 121, 188, '');
INSERT INTO `op_bestowals` VALUES (623, '1993-03-20', '', NULL, NULL, 46, 190, '');
INSERT INTO `op_bestowals` VALUES (624, '1993-04-03', 'a01', NULL, NULL, 173, 188, '');
INSERT INTO `op_bestowals` VALUES (625, '1993-04-03', 'a02', NULL, NULL, 295, 188, '');
INSERT INTO `op_bestowals` VALUES (626, '1993-04-03', 'a03', NULL, NULL, 260, 187, '');
INSERT INTO `op_bestowals` VALUES (627, '1993-04-03', 'a04', NULL, NULL, 63, 187, '');
INSERT INTO `op_bestowals` VALUES (628, '1993-04-03', 'a05', NULL, NULL, 149, 181, '');
INSERT INTO `op_bestowals` VALUES (629, '1993-04-03', 'a06', NULL, NULL, 61, 187, '');
INSERT INTO `op_bestowals` VALUES (630, '1993-04-03', 'a07', NULL, NULL, 35, 178, '(dance)');
INSERT INTO `op_bestowals` VALUES (631, '1993-04-03', 'b01', NULL, NULL, 46, 187, '');
INSERT INTO `op_bestowals` VALUES (632, '1993-04-03', 'b02', NULL, NULL, 29, 187, '');
INSERT INTO `op_bestowals` VALUES (633, '1993-04-03', 'b03', NULL, NULL, 103, 187, '');
INSERT INTO `op_bestowals` VALUES (634, '1993-04-03', 'b04', NULL, NULL, 57, 187, '');
INSERT INTO `op_bestowals` VALUES (635, '1993-04-03', 'b05', NULL, NULL, 298, 187, '');
INSERT INTO `op_bestowals` VALUES (636, '1993-04-03', 'b06', NULL, NULL, 159, 187, '');
INSERT INTO `op_bestowals` VALUES (637, '1993-04-03', 'b07', NULL, NULL, 274, 187, '');
INSERT INTO `op_bestowals` VALUES (638, '1993-04-03', 'b08', NULL, NULL, 284, 187, '');
INSERT INTO `op_bestowals` VALUES (639, '1993-04-03', 'b09', NULL, NULL, 273, 187, '');
INSERT INTO `op_bestowals` VALUES (640, '1993-04-03', 'b10', NULL, NULL, 201, 187, '');
INSERT INTO `op_bestowals` VALUES (641, '1993-04-03', 'b11', NULL, NULL, 59, 187, '');
INSERT INTO `op_bestowals` VALUES (642, '1993-04-03', 'b12', NULL, NULL, 277, 187, '');
INSERT INTO `op_bestowals` VALUES (643, '1993-04-03', 'b13', NULL, NULL, 44, 187, '');
INSERT INTO `op_bestowals` VALUES (644, '1993-04-03', 'b14', NULL, NULL, 183, 187, '');
INSERT INTO `op_bestowals` VALUES (645, '1993-04-03', 'b15', NULL, NULL, 69, 187, '');
INSERT INTO `op_bestowals` VALUES (646, '1993-04-03', 'b16', NULL, NULL, 313, 181, '');
INSERT INTO `op_bestowals` VALUES (647, '1993-04-03', 'b17', NULL, NULL, 165, 181, '');
INSERT INTO `op_bestowals` VALUES (648, '1993-04-03', 'b18', NULL, NULL, 187, 178, '(callig. & illum.)');
INSERT INTO `op_bestowals` VALUES (649, '1993-04-03', 'b19', NULL, NULL, 28, 178, '');
INSERT INTO `op_bestowals` VALUES (650, '1993-04-03', 'b20', NULL, NULL, 147, 182, '');
INSERT INTO `op_bestowals` VALUES (651, '1993-04-03', 'b21', NULL, NULL, 252, 176, '');
INSERT INTO `op_bestowals` VALUES (652, '1993-04-03', 'b22', NULL, NULL, 317, 176, '');
INSERT INTO `op_bestowals` VALUES (653, '1993-04-03', 'b23', NULL, NULL, 54, 176, '');
INSERT INTO `op_bestowals` VALUES (654, '1993-04-03', 'b24', NULL, NULL, 224, 176, '');
INSERT INTO `op_bestowals` VALUES (655, '1993-04-24', 'b03', NULL, NULL, 356, 173, '');
INSERT INTO `op_bestowals` VALUES (656, '1993-05-08', '1', NULL, NULL, 160, 206, '');
INSERT INTO `op_bestowals` VALUES (657, '1993-05-08', '2', NULL, NULL, 15, 206, '');
INSERT INTO `op_bestowals` VALUES (658, '1993-05-14', '', NULL, NULL, 257, 194, '');
INSERT INTO `op_bestowals` VALUES (659, '1993-05-28', '', NULL, NULL, 215, 280, '(service)');
INSERT INTO `op_bestowals` VALUES (660, '1993-05-28', '', NULL, NULL, 49, 280, '');
INSERT INTO `op_bestowals` VALUES (661, '1993-05-30', '', '5/?/93', NULL, 215, 256, '');
INSERT INTO `op_bestowals` VALUES (662, '1993-05-30', '.01', NULL, NULL, 125, 187, '');
INSERT INTO `op_bestowals` VALUES (663, '1993-05-30', '.10', NULL, NULL, 96, 181, '');
INSERT INTO `op_bestowals` VALUES (664, '1993-05-30', '.11', NULL, NULL, 302, 181, '');
INSERT INTO `op_bestowals` VALUES (665, '1993-06-05', '', NULL, NULL, 277, 190, '');
INSERT INTO `op_bestowals` VALUES (666, '1993-06-05', '', NULL, NULL, 302, 190, '');
INSERT INTO `op_bestowals` VALUES (667, '1993-06-05', '', NULL, NULL, 154, 192, '');
INSERT INTO `op_bestowals` VALUES (668, '1993-06-05', '', NULL, NULL, 149, 223, '');
INSERT INTO `op_bestowals` VALUES (669, '1993-06-05', '.01', NULL, NULL, 275, 187, '');
INSERT INTO `op_bestowals` VALUES (670, '1993-06-05', '.02', NULL, NULL, 101, 187, '');
INSERT INTO `op_bestowals` VALUES (671, '1993-06-05', '.03', NULL, NULL, 195, 187, '');
INSERT INTO `op_bestowals` VALUES (672, '1993-06-05', '.04', NULL, NULL, 66, 178, '(bardic arts)');
INSERT INTO `op_bestowals` VALUES (673, '1993-06-05', '.05', NULL, NULL, 234, 178, '(callig. & illum.)');
INSERT INTO `op_bestowals` VALUES (674, '1993-06-05', '.06', NULL, NULL, 248, 181, '');
INSERT INTO `op_bestowals` VALUES (675, '1993-07-11', '', NULL, NULL, 75, 191, '');
INSERT INTO `op_bestowals` VALUES (676, '1993-07-11', '', NULL, NULL, 69, 191, '');
INSERT INTO `op_bestowals` VALUES (677, '1993-07-11', '', NULL, NULL, 19, 191, '');
INSERT INTO `op_bestowals` VALUES (678, '1993-07-11', '', NULL, NULL, 86, 190, '');
INSERT INTO `op_bestowals` VALUES (679, '1993-07-31', '', NULL, NULL, 92, 273, '');
INSERT INTO `op_bestowals` VALUES (680, '1993-08-19', '', NULL, NULL, 134, 169, '(East)');
INSERT INTO `op_bestowals` VALUES (681, '1993-10-02', 'a31', NULL, NULL, 241, 189, '');
INSERT INTO `op_bestowals` VALUES (682, '1993-10-02', 'b03', NULL, NULL, 64, 189, '');
INSERT INTO `op_bestowals` VALUES (683, '1993-11-06', '', NULL, NULL, 175, 190, '');
INSERT INTO `op_bestowals` VALUES (684, '1993-11-06', '', NULL, NULL, 44, 190, '');
INSERT INTO `op_bestowals` VALUES (685, '1993-11-06', '', NULL, NULL, 29, 190, '');
INSERT INTO `op_bestowals` VALUES (686, '1993-11-06', '', NULL, NULL, 8, 190, '');
INSERT INTO `op_bestowals` VALUES (687, '1993-11-06', '', NULL, NULL, 195, 191, '');
INSERT INTO `op_bestowals` VALUES (688, '1993-11-06', '16', NULL, NULL, 235, 222, '');
INSERT INTO `op_bestowals` VALUES (689, '1993-11-20', 'a02', NULL, NULL, 340, 188, '');
INSERT INTO `op_bestowals` VALUES (690, '1993-11-20', 'a20', NULL, NULL, 64, 176, '');
INSERT INTO `op_bestowals` VALUES (691, '1993-11-29', '', NULL, NULL, 49, 171, '');
INSERT INTO `op_bestowals` VALUES (692, '1993-12-31', '', NULL, NULL, 394, 275, '');
INSERT INTO `op_bestowals` VALUES (693, '1993-12-31', '', '?/?/93', NULL, 394, 173, '(Conveyed by Sea Stag)');
INSERT INTO `op_bestowals` VALUES (694, '1993-12-31', '', '12/?/93', NULL, 49, 206, '');
INSERT INTO `op_bestowals` VALUES (695, '1994-02-05', '.13', NULL, NULL, 125, 181, '');
INSERT INTO `op_bestowals` VALUES (696, '1994-02-19', '.13', NULL, NULL, 278, 187, '');
INSERT INTO `op_bestowals` VALUES (697, '1994-02-26', '', NULL, NULL, 500, 187, '');
INSERT INTO `op_bestowals` VALUES (698, '1994-02-26', 'a01', NULL, NULL, 182, 187, '');
INSERT INTO `op_bestowals` VALUES (699, '1994-02-26', 'a03', NULL, NULL, 190, 187, '');
INSERT INTO `op_bestowals` VALUES (700, '1994-02-26', 'a04', NULL, NULL, 120, 187, '');
INSERT INTO `op_bestowals` VALUES (701, '1994-02-26', 'a05', NULL, NULL, 19, 187, '');
INSERT INTO `op_bestowals` VALUES (702, '1994-02-26', 'a06', NULL, NULL, 169, 187, '');
INSERT INTO `op_bestowals` VALUES (703, '1994-02-26', 'a07', NULL, NULL, 272, 187, '');
INSERT INTO `op_bestowals` VALUES (704, '1994-02-26', 'a11', NULL, NULL, 317, 184, '');
INSERT INTO `op_bestowals` VALUES (705, '1994-02-26', 'a16', NULL, NULL, 83, 181, '');
INSERT INTO `op_bestowals` VALUES (706, '1994-02-26', 'a17', NULL, NULL, 277, 182, '');
INSERT INTO `op_bestowals` VALUES (707, '1994-02-26', 'a18', NULL, NULL, 303, 179, '');
INSERT INTO `op_bestowals` VALUES (708, '1994-02-26', 'a20', NULL, NULL, 181, 178, '(callig. & illum.)');
INSERT INTO `op_bestowals` VALUES (709, '1994-02-26', 'a22', NULL, NULL, 252, 171, '');
INSERT INTO `op_bestowals` VALUES (710, '1994-03-12', 'a01', NULL, NULL, 278, 187, '(second award)');
INSERT INTO `op_bestowals` VALUES (711, '1994-03-31', '', '3/?/94', NULL, 215, 280, '(A&S)');
INSERT INTO `op_bestowals` VALUES (712, '1994-04-09', '.05', NULL, NULL, 297, 187, '');
INSERT INTO `op_bestowals` VALUES (713, '1994-04-09', '.06', NULL, NULL, 100, 187, '');
INSERT INTO `op_bestowals` VALUES (714, '1994-04-09', '.07', NULL, NULL, 162, 187, '');
INSERT INTO `op_bestowals` VALUES (715, '1994-04-09', '.08', NULL, NULL, 313, 178, '(dance)');
INSERT INTO `op_bestowals` VALUES (716, '1994-05-14', 'a13', NULL, NULL, 83, 178, '');
INSERT INTO `op_bestowals` VALUES (717, '1994-05-14', 'a20', NULL, NULL, 252, 189, '');
INSERT INTO `op_bestowals` VALUES (718, '1994-05-14', 'b10', NULL, NULL, 44, 181, '');
INSERT INTO `op_bestowals` VALUES (719, '1994-05-14', 'b12', NULL, NULL, 234, 177, '');
INSERT INTO `op_bestowals` VALUES (720, '1994-05-14', 'b13', NULL, NULL, 216, 176, '');
INSERT INTO `op_bestowals` VALUES (721, '1994-05-14', 'b14', NULL, NULL, 228, 170, '');
INSERT INTO `op_bestowals` VALUES (722, '1994-06-25', '.10', NULL, NULL, 98, 175, '');
INSERT INTO `op_bestowals` VALUES (723, '1994-06-30', '', '6/?/94', NULL, 215, 206, '');
INSERT INTO `op_bestowals` VALUES (724, '1994-07-23', '', NULL, NULL, 44, 191, '');
INSERT INTO `op_bestowals` VALUES (725, '1994-07-23', '', NULL, NULL, 169, 192, '');
INSERT INTO `op_bestowals` VALUES (726, '1994-07-23', '', NULL, NULL, 324, 190, '');
INSERT INTO `op_bestowals` VALUES (727, '1994-07-23', '', NULL, NULL, 64, 192, '');
INSERT INTO `op_bestowals` VALUES (728, '1994-07-23', '', NULL, NULL, 158, 192, '');
INSERT INTO `op_bestowals` VALUES (729, '1994-07-23', '', NULL, NULL, 184, 191, '');
INSERT INTO `op_bestowals` VALUES (730, '1994-07-23', '', NULL, NULL, 183, 192, '');
INSERT INTO `op_bestowals` VALUES (731, '1994-07-23', '', NULL, NULL, 248, 192, '');
INSERT INTO `op_bestowals` VALUES (732, '1994-07-23', '', NULL, NULL, 313, 190, '');
INSERT INTO `op_bestowals` VALUES (733, '1994-07-23', '', NULL, NULL, 216, 191, '(confirmation)');
INSERT INTO `op_bestowals` VALUES (734, '1994-07-23', '', NULL, NULL, 122, 190, '');
INSERT INTO `op_bestowals` VALUES (735, '1994-07-23', '', NULL, NULL, 190, 190, '');
INSERT INTO `op_bestowals` VALUES (736, '1994-07-23', '', NULL, NULL, 325, 190, '');
INSERT INTO `op_bestowals` VALUES (737, '1994-07-23', '', NULL, NULL, 335, 223, '');
INSERT INTO `op_bestowals` VALUES (738, '1994-07-23', 'b04', NULL, NULL, 124, 178, '(costuming)');
INSERT INTO `op_bestowals` VALUES (739, '1994-07-23', 'b05', NULL, NULL, 145, 177, '');
INSERT INTO `op_bestowals` VALUES (740, '1994-07-23', 'b07', NULL, NULL, 321, 187, '');
INSERT INTO `op_bestowals` VALUES (741, '1994-07-23', 'b08', NULL, NULL, 236, 178, '(theatre)');
INSERT INTO `op_bestowals` VALUES (742, '1994-07-23', 'b09', NULL, NULL, 96, 176, '');
INSERT INTO `op_bestowals` VALUES (743, '1994-07-23', 'b12', NULL, NULL, 28, 175, '');
INSERT INTO `op_bestowals` VALUES (744, '1994-07-31', '', NULL, NULL, 239, 271, '');
INSERT INTO `op_bestowals` VALUES (745, '1994-08-18', 'a03', NULL, NULL, 317, 228, '');
INSERT INTO `op_bestowals` VALUES (746, '1994-08-18', 'b04', NULL, NULL, 356, 170, '');
INSERT INTO `op_bestowals` VALUES (747, '1994-08-18', 'b15', NULL, NULL, 317, 171, '');
INSERT INTO `op_bestowals` VALUES (748, '1994-08-20', '', NULL, NULL, 64, 170, '');
INSERT INTO `op_bestowals` VALUES (749, '1994-08-20', '', NULL, NULL, 64, 169, '');
INSERT INTO `op_bestowals` VALUES (750, '1994-08-21', '', NULL, NULL, 327, 192, '');
INSERT INTO `op_bestowals` VALUES (751, '1994-08-21', '', NULL, NULL, 177, 192, '');
INSERT INTO `op_bestowals` VALUES (752, '1994-10-01', '', NULL, NULL, 63, 190, '');
INSERT INTO `op_bestowals` VALUES (753, '1994-10-01', '', NULL, NULL, 124, 222, '');
INSERT INTO `op_bestowals` VALUES (754, '1994-10-01', '', NULL, NULL, 326, 190, '');
INSERT INTO `op_bestowals` VALUES (755, '1994-10-01', '', NULL, NULL, 166, 190, '');
INSERT INTO `op_bestowals` VALUES (756, '1994-10-01', '', NULL, NULL, 236, 191, '');
INSERT INTO `op_bestowals` VALUES (757, '1994-10-01', '.01', NULL, NULL, 64, 193, '(Principal)');
INSERT INTO `op_bestowals` VALUES (758, '1994-10-01', '.02', NULL, NULL, 248, 193, '');
INSERT INTO `op_bestowals` VALUES (759, '1994-10-01', '.02', NULL, NULL, 329, 193, '');
INSERT INTO `op_bestowals` VALUES (760, '1994-10-01', '.02', NULL, NULL, 183, 193, '');
INSERT INTO `op_bestowals` VALUES (761, '1994-10-01', '.02', NULL, NULL, 193, 193, '');
INSERT INTO `op_bestowals` VALUES (762, '1994-10-01', '.02', NULL, NULL, 195, 193, '');
INSERT INTO `op_bestowals` VALUES (763, '1994-10-01', '.02', NULL, NULL, 235, 193, '');
INSERT INTO `op_bestowals` VALUES (764, '1994-10-01', '.02', NULL, NULL, 49, 193, '');
INSERT INTO `op_bestowals` VALUES (765, '1994-10-01', '.02', NULL, NULL, 216, 193, '');
INSERT INTO `op_bestowals` VALUES (766, '1994-10-01', '.02', NULL, NULL, 182, 193, '');
INSERT INTO `op_bestowals` VALUES (767, '1994-10-01', '.02', NULL, NULL, 317, 193, '');
INSERT INTO `op_bestowals` VALUES (768, '1994-10-01', '.02', NULL, NULL, 3, 193, '');
INSERT INTO `op_bestowals` VALUES (769, '1994-10-01', '.02', NULL, NULL, 300, 193, '');
INSERT INTO `op_bestowals` VALUES (770, '1994-10-01', '.02', NULL, NULL, 252, 193, '');
INSERT INTO `op_bestowals` VALUES (771, '1994-10-01', '.02', NULL, NULL, 330, 193, '');
INSERT INTO `op_bestowals` VALUES (772, '1994-10-01', '.02', NULL, NULL, 242, 193, '');
INSERT INTO `op_bestowals` VALUES (773, '1994-10-01', '.02', NULL, NULL, 328, 193, '');
INSERT INTO `op_bestowals` VALUES (774, '1994-10-01', '.02', NULL, NULL, 261, 193, '');
INSERT INTO `op_bestowals` VALUES (775, '1994-10-01', '.02', NULL, NULL, 260, 193, '');
INSERT INTO `op_bestowals` VALUES (776, '1994-10-01', '.02', NULL, NULL, 321, 193, '');
INSERT INTO `op_bestowals` VALUES (777, '1994-10-01', '.02', NULL, NULL, 275, 193, '');
INSERT INTO `op_bestowals` VALUES (778, '1994-10-01', '.02', NULL, NULL, 283, 193, '');
INSERT INTO `op_bestowals` VALUES (779, '1994-10-01', '.02', NULL, NULL, 331, 193, '');
INSERT INTO `op_bestowals` VALUES (780, '1994-10-01', '.02', NULL, NULL, 98, 193, '');
INSERT INTO `op_bestowals` VALUES (781, '1994-10-01', '.02', NULL, NULL, 154, 193, '');
INSERT INTO `op_bestowals` VALUES (782, '1994-10-01', '.02', NULL, NULL, 149, 193, '');
INSERT INTO `op_bestowals` VALUES (783, '1994-10-01', '.02', NULL, NULL, 147, 193, '');
INSERT INTO `op_bestowals` VALUES (784, '1994-10-01', '.02', NULL, NULL, 145, 193, '');
INSERT INTO `op_bestowals` VALUES (785, '1994-10-01', '.02', NULL, NULL, 141, 193, '');
INSERT INTO `op_bestowals` VALUES (786, '1994-10-01', '.02', NULL, NULL, 138, 193, '');
INSERT INTO `op_bestowals` VALUES (787, '1994-10-01', '.02', NULL, NULL, 129, 193, '');
INSERT INTO `op_bestowals` VALUES (788, '1994-10-01', '.02', NULL, NULL, 124, 193, '');
INSERT INTO `op_bestowals` VALUES (789, '1994-10-01', '.02', NULL, NULL, 323, 193, '');
INSERT INTO `op_bestowals` VALUES (790, '1994-10-01', '.02', NULL, NULL, 175, 193, '');
INSERT INTO `op_bestowals` VALUES (791, '1994-10-01', '.02', NULL, NULL, 29, 193, '');
INSERT INTO `op_bestowals` VALUES (792, '1994-10-01', '.02', NULL, NULL, 100, 193, '');
INSERT INTO `op_bestowals` VALUES (793, '1994-10-01', '.02', NULL, NULL, 83, 193, '');
INSERT INTO `op_bestowals` VALUES (794, '1994-10-01', '.02', NULL, NULL, 82, 193, '');
INSERT INTO `op_bestowals` VALUES (795, '1994-10-01', '.02', NULL, NULL, 70, 193, '');
INSERT INTO `op_bestowals` VALUES (796, '1994-10-01', '.02', NULL, NULL, 66, 193, '');
INSERT INTO `op_bestowals` VALUES (797, '1994-10-01', '.02', NULL, NULL, 59, 193, '');
INSERT INTO `op_bestowals` VALUES (798, '1994-10-01', '.02', NULL, NULL, 54, 193, '');
INSERT INTO `op_bestowals` VALUES (799, '1994-10-01', '.02', NULL, NULL, 47, 193, '');
INSERT INTO `op_bestowals` VALUES (800, '1994-10-01', '.02', NULL, NULL, 33, 193, '');
INSERT INTO `op_bestowals` VALUES (801, '1994-10-01', '.02', NULL, NULL, 44, 193, '');
INSERT INTO `op_bestowals` VALUES (802, '1994-10-01', '.02', NULL, NULL, 180, 193, '');
INSERT INTO `op_bestowals` VALUES (803, '1994-10-01', '.02', NULL, NULL, 177, 193, '');
INSERT INTO `op_bestowals` VALUES (804, '1994-10-15', '', NULL, NULL, 317, 189, '');
INSERT INTO `op_bestowals` VALUES (805, '1994-10-15', 'a07', NULL, NULL, 166, 181, '');
INSERT INTO `op_bestowals` VALUES (806, '1994-10-15', 'a08', NULL, NULL, 15, 182, '');
INSERT INTO `op_bestowals` VALUES (807, '1994-11-12', '.01', NULL, NULL, 323, 187, '');
INSERT INTO `op_bestowals` VALUES (808, '1994-11-12', '.04', NULL, NULL, 322, 187, '');
INSERT INTO `op_bestowals` VALUES (809, '1994-11-12', '.10', NULL, NULL, 302, 178, '');
INSERT INTO `op_bestowals` VALUES (810, '1994-11-12', '.11', NULL, NULL, 181, 177, '');
INSERT INTO `op_bestowals` VALUES (811, '1995-01-07', '', NULL, NULL, 336, 193, '');
INSERT INTO `op_bestowals` VALUES (812, '1995-01-07', '', NULL, NULL, 335, 193, '');
INSERT INTO `op_bestowals` VALUES (813, '1995-01-07', '', NULL, NULL, 193, 192, '');
INSERT INTO `op_bestowals` VALUES (814, '1995-01-07', '', NULL, NULL, 169, 191, '');
INSERT INTO `op_bestowals` VALUES (815, '1995-01-07', '', NULL, NULL, 322, 190, '');
INSERT INTO `op_bestowals` VALUES (816, '1995-01-21', '.19', NULL, NULL, 277, 178, '');
INSERT INTO `op_bestowals` VALUES (817, '1995-03-04', 'a01', NULL, NULL, 326, 187, '');
INSERT INTO `op_bestowals` VALUES (818, '1995-03-04', 'a10', NULL, NULL, 24, 181, '');
INSERT INTO `op_bestowals` VALUES (819, '1995-03-04', 'a20', NULL, NULL, 68, 176, '');
INSERT INTO `op_bestowals` VALUES (820, '1995-03-25', '.01', NULL, NULL, 332, 187, '');
INSERT INTO `op_bestowals` VALUES (821, '1995-03-25', '.02', NULL, NULL, 333, 187, '');
INSERT INTO `op_bestowals` VALUES (822, '1995-03-25', '.03', NULL, NULL, 325, 187, '');
INSERT INTO `op_bestowals` VALUES (823, '1995-03-25', '.05', NULL, NULL, 334, 179, '');
INSERT INTO `op_bestowals` VALUES (824, '1995-03-25', '.06', NULL, NULL, 116, 178, '');
INSERT INTO `op_bestowals` VALUES (825, '1995-04-01', '.10', NULL, NULL, 337, 188, '');
INSERT INTO `op_bestowals` VALUES (826, '1995-04-08', '.01', NULL, NULL, 329, 187, '');
INSERT INTO `op_bestowals` VALUES (827, '1995-05-06', '.11', NULL, NULL, 302, 182, '');
INSERT INTO `op_bestowals` VALUES (828, '1995-05-27', '', NULL, NULL, 277, 169, '');
INSERT INTO `op_bestowals` VALUES (829, '1995-05-27', '', NULL, NULL, 63, 181, '');
INSERT INTO `op_bestowals` VALUES (830, '1995-05-27', '.03', NULL, NULL, 338, 187, '');
INSERT INTO `op_bestowals` VALUES (831, '1995-05-27', '.06', NULL, NULL, 302, 182, '');
INSERT INTO `op_bestowals` VALUES (832, '1995-05-28', '.17', NULL, NULL, 322, 229, '');
INSERT INTO `op_bestowals` VALUES (833, '1995-06-10', '', NULL, NULL, 347, 193, '');
INSERT INTO `op_bestowals` VALUES (834, '1995-06-10', '', NULL, NULL, 149, 223, '');
INSERT INTO `op_bestowals` VALUES (835, '1995-06-10', '', NULL, NULL, 344, 193, '');
INSERT INTO `op_bestowals` VALUES (836, '1995-06-10', '', NULL, NULL, 380, 191, '');
INSERT INTO `op_bestowals` VALUES (837, '1995-06-10', '', NULL, NULL, 348, 193, '');
INSERT INTO `op_bestowals` VALUES (838, '1995-06-10', '', NULL, NULL, 215, 193, '');
INSERT INTO `op_bestowals` VALUES (839, '1995-06-10', '', NULL, NULL, 346, 193, '');
INSERT INTO `op_bestowals` VALUES (840, '1995-06-10', '', NULL, NULL, 345, 193, '');
INSERT INTO `op_bestowals` VALUES (841, '1995-06-10', '', NULL, NULL, 343, 193, '');
INSERT INTO `op_bestowals` VALUES (842, '1995-06-10', '', NULL, NULL, 216, 192, '');
INSERT INTO `op_bestowals` VALUES (843, '1995-06-10', '', NULL, NULL, 272, 192, '');
INSERT INTO `op_bestowals` VALUES (844, '1995-06-10', '', NULL, NULL, 317, 192, '');
INSERT INTO `op_bestowals` VALUES (845, '1995-06-10', '.01', NULL, NULL, 341, 188, '');
INSERT INTO `op_bestowals` VALUES (846, '1995-06-10', '.02', NULL, NULL, 342, 188, '');
INSERT INTO `op_bestowals` VALUES (847, '1995-06-10', '.03', NULL, NULL, 339, 187, '');
INSERT INTO `op_bestowals` VALUES (848, '1995-06-10', '.04', NULL, NULL, 331, 187, '');
INSERT INTO `op_bestowals` VALUES (849, '1995-06-10', '.05', NULL, NULL, 330, 187, '');
INSERT INTO `op_bestowals` VALUES (850, '1995-06-10', '.06', NULL, NULL, 340, 187, '');
INSERT INTO `op_bestowals` VALUES (851, '1995-06-10', '.07', NULL, NULL, 184, 181, '');
INSERT INTO `op_bestowals` VALUES (852, '1995-06-10', '.11', NULL, NULL, 235, 169, '');
INSERT INTO `op_bestowals` VALUES (853, '1995-06-10', '.12', NULL, NULL, 234, 169, '');
INSERT INTO `op_bestowals` VALUES (854, '1995-06-10', '.13', NULL, NULL, 317, 170, '');
INSERT INTO `op_bestowals` VALUES (855, '1995-07-01', '', NULL, NULL, 453, 178, '');
INSERT INTO `op_bestowals` VALUES (856, '1995-08-16', '', NULL, NULL, 160, 169, '');
INSERT INTO `op_bestowals` VALUES (857, '1995-08-18', '', NULL, NULL, 345, 192, '');
INSERT INTO `op_bestowals` VALUES (858, '1995-08-18', '', NULL, NULL, 44, 192, '');
INSERT INTO `op_bestowals` VALUES (859, '1995-08-18', '', NULL, NULL, 160, 191, '');
INSERT INTO `op_bestowals` VALUES (860, '1995-08-18', '', NULL, NULL, 180, 190, '');
INSERT INTO `op_bestowals` VALUES (861, '1995-08-18', '', NULL, NULL, 349, 188, '');
INSERT INTO `op_bestowals` VALUES (862, '1995-08-18', '', NULL, NULL, 350, 190, '');
INSERT INTO `op_bestowals` VALUES (863, '1995-08-19', '', NULL, NULL, 33, 228, '');
INSERT INTO `op_bestowals` VALUES (864, '1995-09-30', '', '9/?/95', NULL, 49, 281, '');
INSERT INTO `op_bestowals` VALUES (865, '1995-09-30', '', '9/?/95', NULL, 215, 281, '');
INSERT INTO `op_bestowals` VALUES (866, '1995-10-28', '', NULL, NULL, 500, 264, '');
INSERT INTO `op_bestowals` VALUES (867, '1995-11-04', '', NULL, NULL, 195, 190, '');
INSERT INTO `op_bestowals` VALUES (868, '1995-11-04', '', NULL, NULL, 352, 191, '');
INSERT INTO `op_bestowals` VALUES (869, '1995-11-04', '', NULL, NULL, 252, 191, '');
INSERT INTO `op_bestowals` VALUES (870, '1995-11-04', '', NULL, NULL, 351, 191, '');
INSERT INTO `op_bestowals` VALUES (871, '1995-11-04', '', NULL, NULL, 193, 191, '');
INSERT INTO `op_bestowals` VALUES (872, '1995-11-04', '', NULL, NULL, 335, 190, '');
INSERT INTO `op_bestowals` VALUES (873, '1995-11-04', '', NULL, NULL, 338, 190, '');
INSERT INTO `op_bestowals` VALUES (874, '1995-11-04', '', NULL, NULL, 39, 190, '');
INSERT INTO `op_bestowals` VALUES (875, '1995-11-04', '', NULL, NULL, 44, 222, '');
INSERT INTO `op_bestowals` VALUES (876, '1995-11-18', '', NULL, NULL, 15, 176, '');
INSERT INTO `op_bestowals` VALUES (877, '1995-11-18', '', NULL, NULL, 39, 177, '(brewing)');
INSERT INTO `op_bestowals` VALUES (878, '1995-11-18', '', NULL, NULL, 238, 181, '');
INSERT INTO `op_bestowals` VALUES (879, '1995-11-18', '', NULL, NULL, 302, 176, '');
INSERT INTO `op_bestowals` VALUES (880, '1995-11-18', '', NULL, NULL, 353, 187, '(second presentation)');
INSERT INTO `op_bestowals` VALUES (881, '1995-11-18', '', NULL, NULL, 335, 187, '');
INSERT INTO `op_bestowals` VALUES (882, '1996-01-06', '', NULL, NULL, 330, 191, '');
INSERT INTO `op_bestowals` VALUES (883, '1996-01-06', '', NULL, NULL, 335, 192, '');
INSERT INTO `op_bestowals` VALUES (884, '1996-01-06', '', NULL, NULL, 359, 193, '');
INSERT INTO `op_bestowals` VALUES (885, '1996-01-06', '', NULL, NULL, 360, 193, '');
INSERT INTO `op_bestowals` VALUES (886, '1996-01-06', '', NULL, NULL, 359, 232, '');
INSERT INTO `op_bestowals` VALUES (887, '1996-01-06', '', NULL, NULL, 125, 191, '');
INSERT INTO `op_bestowals` VALUES (888, '1996-02-24', 'a01', NULL, NULL, 348, 187, '');
INSERT INTO `op_bestowals` VALUES (889, '1996-02-24', 'a02', NULL, NULL, 350, 187, '');
INSERT INTO `op_bestowals` VALUES (890, '1996-02-24', 'a03', NULL, NULL, 361, 187, '');
INSERT INTO `op_bestowals` VALUES (891, '1996-02-24', 'a04', NULL, NULL, 362, 187, '');
INSERT INTO `op_bestowals` VALUES (892, '1996-02-24', 'a05', NULL, NULL, 363, 187, '');
INSERT INTO `op_bestowals` VALUES (893, '1996-02-24', 'a06', NULL, NULL, 364, 187, '');
INSERT INTO `op_bestowals` VALUES (894, '1996-02-24', 'a08', NULL, NULL, 347, 187, '');
INSERT INTO `op_bestowals` VALUES (895, '1996-02-24', 'b01', NULL, NULL, 336, 187, '');
INSERT INTO `op_bestowals` VALUES (896, '1996-02-24', 'b02', NULL, NULL, 365, 187, '');
INSERT INTO `op_bestowals` VALUES (897, '1996-02-24', 'b03', NULL, NULL, 366, 187, '');
INSERT INTO `op_bestowals` VALUES (898, '1996-02-24', 'b04', NULL, NULL, 367, 187, '');
INSERT INTO `op_bestowals` VALUES (899, '1996-02-24', 'b05', NULL, NULL, 370, 187, '');
INSERT INTO `op_bestowals` VALUES (900, '1996-02-24', 'b06', NULL, NULL, 368, 185, '');
INSERT INTO `op_bestowals` VALUES (901, '1996-02-24', 'b07', NULL, NULL, 260, 181, '');
INSERT INTO `op_bestowals` VALUES (902, '1996-02-24', 'b08', NULL, NULL, 193, 181, '');
INSERT INTO `op_bestowals` VALUES (903, '1996-02-24', 'b09', NULL, NULL, 201, 181, '');
INSERT INTO `op_bestowals` VALUES (904, '1996-02-24', 'b10', NULL, NULL, 154, 181, '');
INSERT INTO `op_bestowals` VALUES (905, '1996-02-24', 'b11', NULL, NULL, 122, 178, '');
INSERT INTO `op_bestowals` VALUES (906, '1996-02-24', 'b14', NULL, NULL, 64, 173, '');
INSERT INTO `op_bestowals` VALUES (907, '1996-02-24', 'b16', NULL, NULL, 98, 170, '');
INSERT INTO `op_bestowals` VALUES (908, '1996-03-30', '', NULL, NULL, 359, 187, '');
INSERT INTO `op_bestowals` VALUES (909, '1996-03-30', '', NULL, NULL, 96, 170, '');
INSERT INTO `op_bestowals` VALUES (910, '1996-03-30', '.11', NULL, NULL, 338, 181, '');
INSERT INTO `op_bestowals` VALUES (911, '1996-03-30', '.12', NULL, NULL, 215, 181, '');
INSERT INTO `op_bestowals` VALUES (912, '1996-04-13', '', NULL, NULL, 283, 191, '(cooking)');
INSERT INTO `op_bestowals` VALUES (913, '1996-04-13', '', NULL, NULL, 141, 190, '');
INSERT INTO `op_bestowals` VALUES (914, '1996-04-13', '', NULL, NULL, 58, 190, '');
INSERT INTO `op_bestowals` VALUES (915, '1996-04-13', '', NULL, NULL, 321, 191, '(brewing)');
INSERT INTO `op_bestowals` VALUES (916, '1996-04-13', '', NULL, NULL, 218, 191, '(needlework)');
INSERT INTO `op_bestowals` VALUES (917, '1996-04-13', '', NULL, NULL, 367, 191, '(sewing)');
INSERT INTO `op_bestowals` VALUES (918, '1996-04-13', '', NULL, NULL, 246, 191, '(cooking)');
INSERT INTO `op_bestowals` VALUES (919, '1996-04-13', '', NULL, NULL, 369, 190, '');
INSERT INTO `op_bestowals` VALUES (920, '1996-04-13', '', NULL, NULL, 361, 190, '');
INSERT INTO `op_bestowals` VALUES (921, '1996-04-13', '', NULL, NULL, 182, 190, '');
INSERT INTO `op_bestowals` VALUES (922, '1996-05-04', '', NULL, NULL, 374, 181, '');
INSERT INTO `op_bestowals` VALUES (923, '1996-06-01', '', NULL, NULL, 335, 183, '');
INSERT INTO `op_bestowals` VALUES (924, '1996-06-01', '', NULL, NULL, 39, 181, '');
INSERT INTO `op_bestowals` VALUES (925, '1996-06-01', '', NULL, NULL, 345, 187, '');
INSERT INTO `op_bestowals` VALUES (926, '1996-06-01', '', NULL, NULL, 335, 223, '');
INSERT INTO `op_bestowals` VALUES (927, '1996-06-01', '', NULL, NULL, 138, 228, '');
INSERT INTO `op_bestowals` VALUES (928, '1996-06-08', '', NULL, NULL, 322, 233, '(Principal)');
INSERT INTO `op_bestowals` VALUES (929, '1996-06-22', '', NULL, NULL, 129, 228, '');
INSERT INTO `op_bestowals` VALUES (930, '1996-07-14', '', NULL, NULL, 250, 233, '');
INSERT INTO `op_bestowals` VALUES (931, '1996-07-14', '', NULL, NULL, 145, 192, '');
INSERT INTO `op_bestowals` VALUES (932, '1996-07-14', '', NULL, NULL, 372, 234, '');
INSERT INTO `op_bestowals` VALUES (933, '1996-07-14', '', NULL, NULL, 14, 233, '');
INSERT INTO `op_bestowals` VALUES (934, '1996-07-14', '', NULL, NULL, 154, 233, '');
INSERT INTO `op_bestowals` VALUES (935, '1996-07-14', '', NULL, NULL, 44, 233, '');
INSERT INTO `op_bestowals` VALUES (936, '1996-07-14', '', NULL, NULL, 317, 233, '');
INSERT INTO `op_bestowals` VALUES (937, '1996-07-14', '', NULL, NULL, 372, 233, '');
INSERT INTO `op_bestowals` VALUES (938, '1996-07-14', '', NULL, NULL, 367, 233, '');
INSERT INTO `op_bestowals` VALUES (939, '1996-07-14', '', NULL, NULL, 371, 233, '');
INSERT INTO `op_bestowals` VALUES (940, '1996-07-14', '', NULL, NULL, 313, 233, '');
INSERT INTO `op_bestowals` VALUES (941, '1996-07-14', '', NULL, NULL, 345, 233, '');
INSERT INTO `op_bestowals` VALUES (942, '1996-08-17', '', NULL, NULL, 379, 193, '');
INSERT INTO `op_bestowals` VALUES (943, '1996-08-17', '', NULL, NULL, 381, 193, '');
INSERT INTO `op_bestowals` VALUES (944, '1996-08-17', '', NULL, NULL, 371, 190, '');
INSERT INTO `op_bestowals` VALUES (945, '1996-08-31', '', NULL, NULL, 215, 282, '');
INSERT INTO `op_bestowals` VALUES (946, '1996-08-31', '', NULL, NULL, 49, 282, '');
INSERT INTO `op_bestowals` VALUES (947, '1996-10-12', '.01', NULL, NULL, 372, 187, '');
INSERT INTO `op_bestowals` VALUES (948, '1996-10-12', '.03', NULL, NULL, 375, 187, '');
INSERT INTO `op_bestowals` VALUES (949, '1996-10-12', '.04', NULL, NULL, 376, 187, '');
INSERT INTO `op_bestowals` VALUES (950, '1996-10-12', '.05', NULL, NULL, 371, 181, '');
INSERT INTO `op_bestowals` VALUES (951, '1996-10-12', '.06', NULL, NULL, 367, 181, '');
INSERT INTO `op_bestowals` VALUES (952, '1996-10-12', 'a09', NULL, NULL, 45, 176, '');
INSERT INTO `op_bestowals` VALUES (953, '1996-10-26', '', NULL, NULL, 335, 191, '');
INSERT INTO `op_bestowals` VALUES (954, '1996-10-26', '', NULL, NULL, 367, 190, '');
INSERT INTO `op_bestowals` VALUES (955, '1996-10-26', '', NULL, NULL, 277, 191, '');
INSERT INTO `op_bestowals` VALUES (956, '1996-10-26', '', NULL, NULL, 345, 222, '');
INSERT INTO `op_bestowals` VALUES (957, '1996-10-26', '', NULL, NULL, 329, 190, '');
INSERT INTO `op_bestowals` VALUES (958, '1996-10-26', '', NULL, NULL, 116, 190, '');
INSERT INTO `op_bestowals` VALUES (959, '1996-10-26', '', NULL, NULL, 378, 190, '');
INSERT INTO `op_bestowals` VALUES (960, '1996-10-26', '', NULL, NULL, 347, 190, '');
INSERT INTO `op_bestowals` VALUES (961, '1996-10-26', '', NULL, NULL, 338, 191, '');
INSERT INTO `op_bestowals` VALUES (962, '1996-10-26', '', NULL, NULL, 359, 191, '');
INSERT INTO `op_bestowals` VALUES (963, '1996-10-26', '', NULL, NULL, 500, 202, '');
INSERT INTO `op_bestowals` VALUES (964, '1996-11-02', '', NULL, NULL, 39, 181, '');
INSERT INTO `op_bestowals` VALUES (965, '1996-11-02', '', NULL, NULL, 501, 187, '');
INSERT INTO `op_bestowals` VALUES (966, '1996-11-02', '', NULL, NULL, 83, 181, '');
INSERT INTO `op_bestowals` VALUES (967, '1996-11-02', '', NULL, NULL, 377, 180, '');
INSERT INTO `op_bestowals` VALUES (968, '1996-11-02', '', NULL, NULL, 365, 178, '');
INSERT INTO `op_bestowals` VALUES (969, '1997-01-11', '', NULL, NULL, 453, 176, '');
INSERT INTO `op_bestowals` VALUES (970, '1997-01-18', '.01', NULL, NULL, 336, 190, '');
INSERT INTO `op_bestowals` VALUES (971, '1997-01-18', '.02', NULL, NULL, 382, 191, '');
INSERT INTO `op_bestowals` VALUES (972, '1997-01-18', '.03', NULL, NULL, 383, 190, '');
INSERT INTO `op_bestowals` VALUES (973, '1997-01-18', '.04', NULL, NULL, 145, 190, '');
INSERT INTO `op_bestowals` VALUES (974, '1997-01-18', '.05', NULL, NULL, 364, 190, '');
INSERT INTO `op_bestowals` VALUES (975, '1997-01-18', '.06', NULL, NULL, 363, 190, '');
INSERT INTO `op_bestowals` VALUES (976, '1997-01-18', '.07', NULL, NULL, 250, 191, '');
INSERT INTO `op_bestowals` VALUES (977, '1997-01-18', '.08', NULL, NULL, 365, 191, '');
INSERT INTO `op_bestowals` VALUES (978, '1997-01-18', '.09', NULL, NULL, 382, 232, '');
INSERT INTO `op_bestowals` VALUES (979, '1997-02-01', '.20', NULL, NULL, 122, 181, '');
INSERT INTO `op_bestowals` VALUES (980, '1997-02-01', '.22', NULL, NULL, 277, 181, '');
INSERT INTO `op_bestowals` VALUES (981, '1997-02-01', '.23', NULL, NULL, 317, 178, '');
INSERT INTO `op_bestowals` VALUES (982, '1997-03-01', '', NULL, NULL, 382, 178, '');
INSERT INTO `op_bestowals` VALUES (983, '1997-03-01', '', NULL, NULL, 382, 187, '');
INSERT INTO `op_bestowals` VALUES (984, '1997-03-01', '', NULL, NULL, 302, 175, '');
INSERT INTO `op_bestowals` VALUES (985, '1997-03-01', '', NULL, NULL, 15, 175, '');
INSERT INTO `op_bestowals` VALUES (986, '1997-03-01', '', NULL, NULL, 277, 175, '');
INSERT INTO `op_bestowals` VALUES (987, '1997-03-01', '', NULL, NULL, 160, 175, '');
INSERT INTO `op_bestowals` VALUES (988, '1997-04-05', '', NULL, NULL, 386, 191, '');
INSERT INTO `op_bestowals` VALUES (989, '1997-04-05', '.01', NULL, NULL, 389, 193, '');
INSERT INTO `op_bestowals` VALUES (990, '1997-04-05', '.02', NULL, NULL, 390, 193, '');
INSERT INTO `op_bestowals` VALUES (991, '1997-04-05', '.04', NULL, NULL, 389, 190, '');
INSERT INTO `op_bestowals` VALUES (992, '1997-04-05', '.05', NULL, NULL, 69, 190, '');
INSERT INTO `op_bestowals` VALUES (993, '1997-04-05', '.06', NULL, NULL, 69, 191, '');
INSERT INTO `op_bestowals` VALUES (994, '1997-04-05', '.07', NULL, NULL, 372, 191, '');
INSERT INTO `op_bestowals` VALUES (995, '1997-04-05', '.08', NULL, NULL, 360, 190, '');
INSERT INTO `op_bestowals` VALUES (996, '1997-04-05', '.09', NULL, NULL, 375, 190, '');
INSERT INTO `op_bestowals` VALUES (997, '1997-04-05', '.10', NULL, NULL, 385, 190, '');
INSERT INTO `op_bestowals` VALUES (998, '1997-04-05', '.11', NULL, NULL, 384, 190, '');
INSERT INTO `op_bestowals` VALUES (999, '1997-04-05', '.12', NULL, NULL, 387, 190, '');
INSERT INTO `op_bestowals` VALUES (1000, '1997-05-10', '.01', NULL, NULL, 336, 192, '');
INSERT INTO `op_bestowals` VALUES (1001, '1997-05-10', '.02', NULL, NULL, 393, 193, '');
INSERT INTO `op_bestowals` VALUES (1002, '1997-05-10', '.03', NULL, NULL, 395, 193, '');
INSERT INTO `op_bestowals` VALUES (1003, '1997-05-10', '.04', NULL, NULL, 387, 193, '');
INSERT INTO `op_bestowals` VALUES (1004, '1997-05-10', '.05', NULL, NULL, 394, 193, '');
INSERT INTO `op_bestowals` VALUES (1005, '1997-05-10', '.06', NULL, NULL, 336, 223, '');
INSERT INTO `op_bestowals` VALUES (1006, '1997-05-10', '.07', NULL, NULL, 83, 192, '');
INSERT INTO `op_bestowals` VALUES (1007, '1997-05-10', '.08', NULL, NULL, 182, 192, '');
INSERT INTO `op_bestowals` VALUES (1008, '1997-05-10', '.09', NULL, NULL, 392, 191, '(trumpet fanfare at Grand Tourney)');
INSERT INTO `op_bestowals` VALUES (1009, '1997-05-10', '.10', NULL, NULL, 260, 192, '');
INSERT INTO `op_bestowals` VALUES (1010, '1997-05-10', '.11', NULL, NULL, 391, 191, '(cooking)');
INSERT INTO `op_bestowals` VALUES (1011, '1997-05-10', '.a1', NULL, NULL, 378, 187, '');
INSERT INTO `op_bestowals` VALUES (1012, '1997-05-10', '.a2', NULL, NULL, 58, 181, '');
INSERT INTO `op_bestowals` VALUES (1013, '1997-05-10', '.a3', NULL, NULL, 368, 185, '');
INSERT INTO `op_bestowals` VALUES (1014, '1997-05-10', '.a4', NULL, NULL, 335, 235, '');
INSERT INTO `op_bestowals` VALUES (1015, '1997-05-10', '.a7', NULL, NULL, 236, 176, '');
INSERT INTO `op_bestowals` VALUES (1016, '1997-05-25', '', NULL, NULL, 317, 173, '');
INSERT INTO `op_bestowals` VALUES (1017, '1997-05-25', '', NULL, NULL, 44, 173, '');
INSERT INTO `op_bestowals` VALUES (1018, '1997-08-02', '', NULL, NULL, 500, 173, '');
INSERT INTO `op_bestowals` VALUES (1019, '1997-08-14', '', NULL, NULL, 138, 184, '');
INSERT INTO `op_bestowals` VALUES (1020, '1997-08-14', '', NULL, NULL, 33, 184, '');
INSERT INTO `op_bestowals` VALUES (1021, '1997-08-14', '', NULL, NULL, 396, 187, '');
INSERT INTO `op_bestowals` VALUES (1022, '1997-08-14', '', NULL, NULL, 336, 183, '');
INSERT INTO `op_bestowals` VALUES (1023, '1997-08-14', '', NULL, NULL, 335, 177, '');
INSERT INTO `op_bestowals` VALUES (1024, '1997-08-14', '', NULL, NULL, 129, 170, '');
INSERT INTO `op_bestowals` VALUES (1025, '1997-08-16', '', NULL, NULL, 149, 184, '');
INSERT INTO `op_bestowals` VALUES (1026, '1997-08-16', '', NULL, NULL, 360, 192, '');
INSERT INTO `op_bestowals` VALUES (1027, '1997-08-16', '', NULL, NULL, 329, 192, '');
INSERT INTO `op_bestowals` VALUES (1028, '1997-08-16', '', NULL, NULL, 177, 184, '');
INSERT INTO `op_bestowals` VALUES (1029, '1997-08-16', '', NULL, NULL, 252, 184, '(confirmation)');
INSERT INTO `op_bestowals` VALUES (1030, '1997-09-20', '', NULL, NULL, 387, 187, '');
INSERT INTO `op_bestowals` VALUES (1031, '1997-09-20', '', NULL, NULL, 336, 189, '');
INSERT INTO `op_bestowals` VALUES (1032, '1997-09-20', '', NULL, NULL, 138, 189, '');
INSERT INTO `op_bestowals` VALUES (1033, '1997-09-30', '', '9/?/97', NULL, 49, 281, '');
INSERT INTO `op_bestowals` VALUES (1034, '1997-10-11', '.02', NULL, NULL, 397, 187, '');
INSERT INTO `op_bestowals` VALUES (1035, '1997-10-11', '.10', NULL, NULL, 0, 188, '');
INSERT INTO `op_bestowals` VALUES (1036, '1997-10-11', '.10', NULL, NULL, 398, 188, '');
INSERT INTO `op_bestowals` VALUES (1037, '1997-10-11', '.13', NULL, NULL, 313, 176, '');
INSERT INTO `op_bestowals` VALUES (1038, '1997-11-01', '.16', NULL, NULL, 338, 177, '');
INSERT INTO `op_bestowals` VALUES (1039, '1997-11-22', '', NULL, NULL, 402, 190, '');
INSERT INTO `op_bestowals` VALUES (1040, '1997-11-22', '', NULL, NULL, 33, 222, '');
INSERT INTO `op_bestowals` VALUES (1041, '1997-11-22', '', NULL, NULL, 403, 190, '');
INSERT INTO `op_bestowals` VALUES (1042, '1997-11-22', '', NULL, NULL, 401, 190, '');
INSERT INTO `op_bestowals` VALUES (1043, '1997-11-22', '', NULL, NULL, 399, 190, '');
INSERT INTO `op_bestowals` VALUES (1044, '1997-11-22', '', NULL, NULL, 13, 191, '(woodcarving)');
INSERT INTO `op_bestowals` VALUES (1045, '1997-11-22', '', NULL, NULL, 400, 190, '');
INSERT INTO `op_bestowals` VALUES (1046, '1998-01-10', '', NULL, NULL, 354, 178, '(beadwork)');
INSERT INTO `op_bestowals` VALUES (1047, '1998-01-10', '', NULL, NULL, 54, 192, '');
INSERT INTO `op_bestowals` VALUES (1048, '1998-01-10', '', NULL, NULL, 376, 191, '');
INSERT INTO `op_bestowals` VALUES (1049, '1998-01-10', '', NULL, NULL, 395, 190, '');
INSERT INTO `op_bestowals` VALUES (1050, '1998-01-10', '', NULL, NULL, 375, 232, '');
INSERT INTO `op_bestowals` VALUES (1051, '1998-02-07', '', NULL, NULL, 321, 228, '');
INSERT INTO `op_bestowals` VALUES (1052, '1998-02-07', '1', NULL, NULL, 365, 169, '');
INSERT INTO `op_bestowals` VALUES (1053, '1998-02-07', '2', NULL, NULL, 215, 170, '');
INSERT INTO `op_bestowals` VALUES (1054, '1998-02-28', '.01', NULL, NULL, 413, 184, '');
INSERT INTO `op_bestowals` VALUES (1055, '1998-02-28', '.02', NULL, NULL, 405, 187, '');
INSERT INTO `op_bestowals` VALUES (1056, '1998-02-28', '.05', NULL, NULL, 122, 181, '');
INSERT INTO `op_bestowals` VALUES (1057, '1998-02-28', '.07', NULL, NULL, 149, 183, '');
INSERT INTO `op_bestowals` VALUES (1058, '1998-02-28', '.08', NULL, NULL, 216, 236, '');
INSERT INTO `op_bestowals` VALUES (1059, '1998-02-28', '.09', NULL, NULL, 54, 236, '');
INSERT INTO `op_bestowals` VALUES (1060, '1998-02-28', '.10', NULL, NULL, 224, 236, '');
INSERT INTO `op_bestowals` VALUES (1061, '1998-02-28', '.13', NULL, NULL, 160, 173, '');
INSERT INTO `op_bestowals` VALUES (1062, '1998-04-04', '.01', NULL, NULL, 14, 191, '');
INSERT INTO `op_bestowals` VALUES (1063, '1998-04-04', '.02', NULL, NULL, 409, 190, '');
INSERT INTO `op_bestowals` VALUES (1064, '1998-04-04', '.03', NULL, NULL, 410, 190, '');
INSERT INTO `op_bestowals` VALUES (1065, '1998-04-04', '.04', NULL, NULL, 407, 190, '');
INSERT INTO `op_bestowals` VALUES (1066, '1998-04-04', '.05', NULL, NULL, 406, 190, '');
INSERT INTO `op_bestowals` VALUES (1067, '1998-04-04', '.06', NULL, NULL, 350, 191, '');
INSERT INTO `op_bestowals` VALUES (1068, '1998-04-04', '.07', NULL, NULL, 379, 192, '');
INSERT INTO `op_bestowals` VALUES (1069, '1998-04-04', '.08', NULL, NULL, 408, 191, '');
INSERT INTO `op_bestowals` VALUES (1070, '1998-04-18', 'a01', NULL, NULL, 400, 187, '');
INSERT INTO `op_bestowals` VALUES (1071, '1998-04-18', 'a02', NULL, NULL, 401, 187, '');
INSERT INTO `op_bestowals` VALUES (1072, '1998-04-18', 'a03', NULL, NULL, 402, 187, '');
INSERT INTO `op_bestowals` VALUES (1073, '1998-04-18', 'a04', NULL, NULL, 360, 187, '');
INSERT INTO `op_bestowals` VALUES (1074, '1998-04-18', 'a05', NULL, NULL, 376, 181, '');
INSERT INTO `op_bestowals` VALUES (1075, '1998-04-18', 'a14', NULL, NULL, 277, 176, '');
INSERT INTO `op_bestowals` VALUES (1076, '1998-04-18', 'b01', NULL, NULL, 369, 187, '');
INSERT INTO `op_bestowals` VALUES (1077, '1998-04-18', 'b02', NULL, NULL, 411, 187, '');
INSERT INTO `op_bestowals` VALUES (1078, '1998-04-18', 'b03', NULL, NULL, 412, 187, '');
INSERT INTO `op_bestowals` VALUES (1079, '1998-04-18', 'b15', NULL, NULL, 278, 178, '');
INSERT INTO `op_bestowals` VALUES (1080, '1998-05-02', '', NULL, NULL, 500, 263, '');
INSERT INTO `op_bestowals` VALUES (1081, '1998-05-24', '', NULL, NULL, 354, 177, '(beadwork)');
INSERT INTO `op_bestowals` VALUES (1082, '1998-06-06', '', NULL, NULL, 376, 178, '');
INSERT INTO `op_bestowals` VALUES (1083, '1998-06-06', 'a21', NULL, NULL, 466, 181, '');
INSERT INTO `op_bestowals` VALUES (1084, '1998-07-18', '.01', NULL, NULL, 409, 192, '');
INSERT INTO `op_bestowals` VALUES (1085, '1998-07-18', '.02', NULL, NULL, 421, 193, '');
INSERT INTO `op_bestowals` VALUES (1086, '1998-07-18', '.03', NULL, NULL, 420, 193, '');
INSERT INTO `op_bestowals` VALUES (1087, '1998-07-18', '.04', NULL, NULL, 423, 193, '');
INSERT INTO `op_bestowals` VALUES (1088, '1998-07-18', '.05', NULL, NULL, 392, 193, '');
INSERT INTO `op_bestowals` VALUES (1089, '1998-07-18', '.06', NULL, NULL, 409, 223, '');
INSERT INTO `op_bestowals` VALUES (1090, '1998-07-25', '', NULL, NULL, 382, 181, '');
INSERT INTO `op_bestowals` VALUES (1091, '1998-08-13', '', NULL, NULL, 278, 173, 'Aethelmearc');
INSERT INTO `op_bestowals` VALUES (1092, '1998-08-13', '', NULL, NULL, 278, 175, 'Aethelmearc');
INSERT INTO `op_bestowals` VALUES (1093, '1998-08-15', '', NULL, NULL, 195, 192, '');
INSERT INTO `op_bestowals` VALUES (1094, '1998-09-19', 'a??', NULL, NULL, 124, 236, '');
INSERT INTO `op_bestowals` VALUES (1095, '1998-09-19', 'a??', NULL, NULL, 252, 173, '');
INSERT INTO `op_bestowals` VALUES (1096, '1998-09-26', '.01', NULL, NULL, 425, 190, '');
INSERT INTO `op_bestowals` VALUES (1097, '1998-09-26', '.02', NULL, NULL, 332, 191, '(calligraphy and illumination)');
INSERT INTO `op_bestowals` VALUES (1098, '1998-09-26', '.03', NULL, NULL, 424, 191, '(sewing and leather work)');
INSERT INTO `op_bestowals` VALUES (1099, '1998-09-26', '.04', NULL, NULL, 345, 190, '');
INSERT INTO `op_bestowals` VALUES (1100, '1998-09-26', '.05', NULL, NULL, 412, 190, '');
INSERT INTO `op_bestowals` VALUES (1101, '1998-11-14', '.01', NULL, NULL, 435, 190, '');
INSERT INTO `op_bestowals` VALUES (1102, '1998-11-14', '.02', NULL, NULL, 330, 190, '');
INSERT INTO `op_bestowals` VALUES (1103, '1998-11-14', '.03', NULL, NULL, 329, 222, '');
INSERT INTO `op_bestowals` VALUES (1104, '1998-11-21', '.01', NULL, NULL, 436, 233, '');
INSERT INTO `op_bestowals` VALUES (1105, '1998-11-21', '.02', NULL, NULL, 418, 233, '');
INSERT INTO `op_bestowals` VALUES (1106, '1998-11-21', '.03', NULL, NULL, 406, 233, '');
INSERT INTO `op_bestowals` VALUES (1107, '1998-11-21', '.04', NULL, NULL, 407, 233, '');
INSERT INTO `op_bestowals` VALUES (1108, '1998-11-21', '.05', NULL, NULL, 437, 233, '');
INSERT INTO `op_bestowals` VALUES (1109, '1998-11-21', '.06', NULL, NULL, 438, 233, '');
INSERT INTO `op_bestowals` VALUES (1110, '1998-11-21', '.07', NULL, NULL, 439, 233, '');
INSERT INTO `op_bestowals` VALUES (1111, '1998-11-21', '.08', NULL, NULL, 313, 234, '');
INSERT INTO `op_bestowals` VALUES (1112, '1999-01-09', '', NULL, NULL, 500, 171, '');
INSERT INTO `op_bestowals` VALUES (1113, '1999-01-16', '.01', NULL, NULL, 297, 192, '');
INSERT INTO `op_bestowals` VALUES (1114, '1999-01-16', '.02', NULL, NULL, 419, 191, '');
INSERT INTO `op_bestowals` VALUES (1115, '1999-01-16', '.03', NULL, NULL, 321, 192, '');
INSERT INTO `op_bestowals` VALUES (1116, '1999-02-06', '', NULL, NULL, 15, 170, '');
INSERT INTO `op_bestowals` VALUES (1117, '1999-03-20', '', NULL, NULL, 414, 190, '');
INSERT INTO `op_bestowals` VALUES (1118, '1999-03-20', '', NULL, NULL, 295, 190, '');
INSERT INTO `op_bestowals` VALUES (1119, '1999-03-20', '', NULL, NULL, 390, 190, '');
INSERT INTO `op_bestowals` VALUES (1120, '1999-03-20', '', NULL, NULL, 451, 190, '');
INSERT INTO `op_bestowals` VALUES (1121, '1999-03-20', '', NULL, NULL, 173, 190, '');
INSERT INTO `op_bestowals` VALUES (1122, '1999-03-27', '.01', NULL, NULL, 379, 187, '');
INSERT INTO `op_bestowals` VALUES (1123, '1999-03-27', '.02', NULL, NULL, 414, 187, '');
INSERT INTO `op_bestowals` VALUES (1124, '1999-03-27', '.03', NULL, NULL, 406, 187, '');
INSERT INTO `op_bestowals` VALUES (1125, '1999-03-27', '.04', NULL, NULL, 416, 187, '');
INSERT INTO `op_bestowals` VALUES (1126, '1999-03-27', '.06', NULL, NULL, 407, 187, '');
INSERT INTO `op_bestowals` VALUES (1127, '1999-03-27', '.07', NULL, NULL, 410, 187, '');
INSERT INTO `op_bestowals` VALUES (1128, '1999-03-27', '.08', NULL, NULL, 418, 187, '');
INSERT INTO `op_bestowals` VALUES (1129, '1999-03-27', '.10', NULL, NULL, 409, 187, '');
INSERT INTO `op_bestowals` VALUES (1130, '1999-04-10', '', NULL, NULL, 501, 167, '');
INSERT INTO `op_bestowals` VALUES (1131, '1999-04-10', '', NULL, NULL, 277, 173, '');
INSERT INTO `op_bestowals` VALUES (1132, '1999-04-10', '', NULL, NULL, 501, 226, '');
INSERT INTO `op_bestowals` VALUES (1133, '1999-05-22', '.01', NULL, NULL, 98, 223, '');
INSERT INTO `op_bestowals` VALUES (1134, '1999-05-22', '.02', NULL, NULL, 426, 193, '');
INSERT INTO `op_bestowals` VALUES (1135, '1999-05-22', '.03', NULL, NULL, 105, 193, '');
INSERT INTO `op_bestowals` VALUES (1136, '1999-05-22', '.04', NULL, NULL, 427, 193, '');
INSERT INTO `op_bestowals` VALUES (1137, '1999-06-17', 'a01', NULL, NULL, 395, 187, '');
INSERT INTO `op_bestowals` VALUES (1138, '1999-06-17', 'a02', NULL, NULL, 428, 187, '');
INSERT INTO `op_bestowals` VALUES (1139, '1999-06-17', 'a03', NULL, NULL, 321, 181, '');
INSERT INTO `op_bestowals` VALUES (1140, '1999-06-17', 'a04', NULL, NULL, 359, 177, '');
INSERT INTO `op_bestowals` VALUES (1141, '1999-06-17', 'a05', NULL, NULL, 338, 176, '');
INSERT INTO `op_bestowals` VALUES (1142, '1999-06-17', 'a06', NULL, NULL, 49, 176, '');
INSERT INTO `op_bestowals` VALUES (1143, '1999-06-26', '', NULL, NULL, 384, 187, '');
INSERT INTO `op_bestowals` VALUES (1144, '1999-07-17', '', NULL, NULL, 49, 176, '');
INSERT INTO `op_bestowals` VALUES (1145, '1999-08-19', '', NULL, NULL, 49, 173, '(with dragon crest)');
INSERT INTO `op_bestowals` VALUES (1146, '1999-08-19', '', NULL, NULL, 215, 173, '(with dragon crest)');
INSERT INTO `op_bestowals` VALUES (1147, '1999-08-21', '', NULL, NULL, 338, 193, '');
INSERT INTO `op_bestowals` VALUES (1148, '1999-08-21', '', NULL, NULL, 319, 193, '');
INSERT INTO `op_bestowals` VALUES (1149, '1999-08-21', '', NULL, NULL, 13, 193, '');
INSERT INTO `op_bestowals` VALUES (1150, '1999-08-21', '', NULL, NULL, 434, 193, '');
INSERT INTO `op_bestowals` VALUES (1151, '1999-08-28', '', NULL, NULL, 501, 265, '');
INSERT INTO `op_bestowals` VALUES (1152, '1999-08-28', '', NULL, NULL, 501, 200, '');
INSERT INTO `op_bestowals` VALUES (1153, '1999-09-11', '', NULL, NULL, 252, 238, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1154, '1999-09-11', 'b02', NULL, NULL, 33, 181, '');
INSERT INTO `op_bestowals` VALUES (1155, '1999-09-11', 'b03', NULL, NULL, 234, 181, '');
INSERT INTO `op_bestowals` VALUES (1156, '1999-09-11', 'b04', NULL, NULL, 375, 181, '');
INSERT INTO `op_bestowals` VALUES (1157, '1999-09-11', 'b12', NULL, NULL, 44, 170, '');
INSERT INTO `op_bestowals` VALUES (1158, '1999-09-25', '', NULL, NULL, 321, 189, '');
INSERT INTO `op_bestowals` VALUES (1159, '1999-09-25', '', NULL, NULL, 335, 189, '');
INSERT INTO `op_bestowals` VALUES (1160, '1999-09-25', '', NULL, NULL, 278, 173, '');
INSERT INTO `op_bestowals` VALUES (1161, '1999-10-23', '', NULL, NULL, 431, 192, '');
INSERT INTO `op_bestowals` VALUES (1162, '1999-10-23', '', NULL, NULL, 419, 190, '');
INSERT INTO `op_bestowals` VALUES (1163, '1999-10-23', '', NULL, NULL, 500, 262, '');
INSERT INTO `op_bestowals` VALUES (1164, '1999-10-23', '', NULL, NULL, 83, 222, '');
INSERT INTO `op_bestowals` VALUES (1165, '1999-10-23', '', NULL, NULL, 433, 193, '');
INSERT INTO `op_bestowals` VALUES (1166, '1999-10-23', '', NULL, NULL, 432, 191, '');
INSERT INTO `op_bestowals` VALUES (1167, '1999-11-13', '', NULL, NULL, 181, 169, '');
INSERT INTO `op_bestowals` VALUES (1168, '1999-11-13', '', NULL, NULL, 365, 175, '');
INSERT INTO `op_bestowals` VALUES (1169, '1999-11-20', '', NULL, NULL, 418, 234, '');
INSERT INTO `op_bestowals` VALUES (1170, '1999-11-20', '', NULL, NULL, 83, 233, '');
INSERT INTO `op_bestowals` VALUES (1171, '1999-12-04', '', NULL, NULL, 503, 238, '');
INSERT INTO `op_bestowals` VALUES (1172, '1999-12-04', '', NULL, NULL, 502, 238, '');
INSERT INTO `op_bestowals` VALUES (1173, '1999-12-04', '', NULL, NULL, 180, 171, '');
INSERT INTO `op_bestowals` VALUES (1174, '2000-01-15', '.01', NULL, NULL, 401, 232, '');
INSERT INTO `op_bestowals` VALUES (1175, '2000-01-15', '.02', NULL, NULL, 431, 191, '');
INSERT INTO `op_bestowals` VALUES (1176, '2000-01-15', '.03', NULL, NULL, 429, 191, '');
INSERT INTO `op_bestowals` VALUES (1177, '2000-01-15', '.04', NULL, NULL, 430, 190, '');
INSERT INTO `op_bestowals` VALUES (1178, '2000-01-22', '', NULL, NULL, 394, 277, '');
INSERT INTO `op_bestowals` VALUES (1179, '2000-01-22', '', NULL, NULL, 394, 276, '');
INSERT INTO `op_bestowals` VALUES (1180, '2000-02-26', 'a01', NULL, NULL, 337, 238, '');
INSERT INTO `op_bestowals` VALUES (1181, '2000-02-26', 'a02', NULL, NULL, 340, 238, '');
INSERT INTO `op_bestowals` VALUES (1182, '2000-02-26', 'a03', NULL, NULL, 342, 238, '');
INSERT INTO `op_bestowals` VALUES (1183, '2000-02-26', 'a04', NULL, NULL, 216, 238, '');
INSERT INTO `op_bestowals` VALUES (1184, '2000-02-26', 'a05', NULL, NULL, 431, 187, '');
INSERT INTO `op_bestowals` VALUES (1185, '2000-02-26', 'a06', NULL, NULL, 426, 187, '');
INSERT INTO `op_bestowals` VALUES (1186, '2000-02-26', 'a08', NULL, NULL, 429, 187, '');
INSERT INTO `op_bestowals` VALUES (1187, '2000-02-26', 'a09', NULL, NULL, 443, 187, '');
INSERT INTO `op_bestowals` VALUES (1188, '2000-02-26', 'a10', NULL, NULL, 444, 187, '');
INSERT INTO `op_bestowals` VALUES (1189, '2000-02-26', 'a11', NULL, NULL, 427, 187, '');
INSERT INTO `op_bestowals` VALUES (1190, '2000-02-26', 'a14', NULL, NULL, 452, 180, '');
INSERT INTO `op_bestowals` VALUES (1191, '2000-02-26', 'a15', NULL, NULL, 442, 178, '');
INSERT INTO `op_bestowals` VALUES (1192, '2000-02-26', 'a18', NULL, NULL, 440, 179, '');
INSERT INTO `op_bestowals` VALUES (1193, '2000-02-26', 'a19', NULL, NULL, 252, 175, '');
INSERT INTO `op_bestowals` VALUES (1194, '2000-02-26', 'a20', NULL, NULL, 277, 170, '');
INSERT INTO `op_bestowals` VALUES (1195, '2000-02-26', 'a21', NULL, NULL, 321, 171, '');
INSERT INTO `op_bestowals` VALUES (1196, '2000-03-31', '', '3/?/2000', NULL, 449, 190, '');
INSERT INTO `op_bestowals` VALUES (1197, '2000-04-01', '', NULL, NULL, 338, 170, '');
INSERT INTO `op_bestowals` VALUES (1198, '2000-04-01', '', NULL, NULL, 430, 187, '');
INSERT INTO `op_bestowals` VALUES (1199, '2000-04-01', '', NULL, NULL, 446, 178, '');
INSERT INTO `op_bestowals` VALUES (1200, '2000-04-01', '', NULL, NULL, 446, 187, 'Seperately in conjunction with OW');
INSERT INTO `op_bestowals` VALUES (1201, '2000-04-01', '', NULL, NULL, 382, 169, '');
INSERT INTO `op_bestowals` VALUES (1202, '2000-04-01', '', NULL, NULL, 414, 181, '');
INSERT INTO `op_bestowals` VALUES (1203, '2000-04-15', 'a27', NULL, NULL, 317, 238, '');
INSERT INTO `op_bestowals` VALUES (1204, '2000-04-15', 'a28', NULL, NULL, 238, 238, '');
INSERT INTO `op_bestowals` VALUES (1205, '2000-04-15', 'a30', NULL, NULL, 248, 238, '');
INSERT INTO `op_bestowals` VALUES (1206, '2000-04-15', 'a32', NULL, NULL, 428, 238, '');
INSERT INTO `op_bestowals` VALUES (1207, '2000-04-15', 'a37', NULL, NULL, 82, 238, '');
INSERT INTO `op_bestowals` VALUES (1208, '2000-04-15', 'a39', NULL, NULL, 277, 238, '');
INSERT INTO `op_bestowals` VALUES (1209, '2000-04-15', 'a40', NULL, NULL, 365, 238, '');
INSERT INTO `op_bestowals` VALUES (1210, '2000-05-13', '', NULL, NULL, 500, 203, '');
INSERT INTO `op_bestowals` VALUES (1211, '2000-05-28', '', NULL, NULL, 330, 181, '');
INSERT INTO `op_bestowals` VALUES (1212, '2000-06-03', '', NULL, NULL, 445, 188, '');
INSERT INTO `op_bestowals` VALUES (1213, '2000-06-03', '', NULL, NULL, 432, 187, '');
INSERT INTO `op_bestowals` VALUES (1214, '2000-06-03', '', NULL, NULL, 248, 228, '');
INSERT INTO `op_bestowals` VALUES (1215, '2000-06-24', '', NULL, NULL, 500, 261, '');
INSERT INTO `op_bestowals` VALUES (1216, '2000-07-15', '', NULL, NULL, 375, 191, '');
INSERT INTO `op_bestowals` VALUES (1217, '2000-07-15', '', NULL, NULL, 195, 223, '');
INSERT INTO `op_bestowals` VALUES (1218, '2000-07-15', '', NULL, NULL, 447, 193, '');
INSERT INTO `op_bestowals` VALUES (1219, '2000-07-22', '', NULL, NULL, 63, 259, '');
INSERT INTO `op_bestowals` VALUES (1220, '2000-08-17', '', NULL, NULL, 49, 170, '');
INSERT INTO `op_bestowals` VALUES (1221, '2000-08-17', '', NULL, NULL, 369, 176, '');
INSERT INTO `op_bestowals` VALUES (1222, '2000-08-17', '', NULL, NULL, 418, 229, '');
INSERT INTO `op_bestowals` VALUES (1223, '2000-08-19', '', NULL, NULL, 448, 193, '');
INSERT INTO `op_bestowals` VALUES (1224, '2000-09-09', '', NULL, NULL, 501, 166, '');
INSERT INTO `op_bestowals` VALUES (1225, '2000-09-09', '.02', NULL, NULL, 449, 187, '');
INSERT INTO `op_bestowals` VALUES (1226, '2000-09-09', '.03', NULL, NULL, 389, 187, '');
INSERT INTO `op_bestowals` VALUES (1227, '2000-09-09', '.05', NULL, NULL, 450, 187, '');
INSERT INTO `op_bestowals` VALUES (1228, '2000-09-09', '.06', NULL, NULL, 390, 187, '');
INSERT INTO `op_bestowals` VALUES (1229, '2000-09-09', '.08', NULL, NULL, 215, 182, '');
INSERT INTO `op_bestowals` VALUES (1230, '2000-09-23', 'a09', NULL, NULL, 124, 169, '');
INSERT INTO `op_bestowals` VALUES (1231, '2000-11-18', '', NULL, NULL, 347, 192, '');
INSERT INTO `op_bestowals` VALUES (1232, '2000-11-18', '', NULL, NULL, 375, 191, '');
INSERT INTO `op_bestowals` VALUES (1233, '2000-11-18', '', NULL, NULL, 330, 192, '');
INSERT INTO `op_bestowals` VALUES (1234, '2000-11-18', '', NULL, NULL, 443, 190, '');
INSERT INTO `op_bestowals` VALUES (1235, '2000-11-18', '', NULL, NULL, 321, 190, '');
INSERT INTO `op_bestowals` VALUES (1236, '2000-11-18', '', NULL, NULL, 456, 193, '');
INSERT INTO `op_bestowals` VALUES (1237, '2000-11-18', '', NULL, NULL, 457, 193, '');
INSERT INTO `op_bestowals` VALUES (1238, '2000-11-18', '', NULL, NULL, 455, 190, '');
INSERT INTO `op_bestowals` VALUES (1239, '2000-11-18', '', NULL, NULL, 338, 222, '');
INSERT INTO `op_bestowals` VALUES (1240, '2001-01-01', '', '?/?/00-01', NULL, 496, 234, '');
INSERT INTO `op_bestowals` VALUES (1241, '2001-01-13', '', NULL, NULL, 347, 191, '');
INSERT INTO `op_bestowals` VALUES (1242, '2001-01-13', '', NULL, NULL, 103, 191, '');
INSERT INTO `op_bestowals` VALUES (1243, '2001-01-13', '', NULL, NULL, 442, 232, '');
INSERT INTO `op_bestowals` VALUES (1244, '2001-01-13', '', NULL, NULL, 33, 191, '');
INSERT INTO `op_bestowals` VALUES (1245, '2001-02-03', '', NULL, NULL, 33, 244, '');
INSERT INTO `op_bestowals` VALUES (1246, '2001-02-17', '', NULL, NULL, 394, 171, '(Outlands)');
INSERT INTO `op_bestowals` VALUES (1247, '2001-03-16', '.01', NULL, NULL, 336, 175, '');
INSERT INTO `op_bestowals` VALUES (1248, '2001-03-16', '.02', NULL, NULL, 335, 175, '');
INSERT INTO `op_bestowals` VALUES (1249, '2001-03-16', '.04', NULL, NULL, 98, 235, '');
INSERT INTO `op_bestowals` VALUES (1250, '2001-03-17', '', NULL, NULL, 434, 190, '');
INSERT INTO `op_bestowals` VALUES (1251, '2001-03-17', '', NULL, NULL, 265, 191, '');
INSERT INTO `op_bestowals` VALUES (1252, '2001-03-17', '', NULL, NULL, 113, 191, '');
INSERT INTO `op_bestowals` VALUES (1253, '2001-03-17', '', NULL, NULL, 469, 190, '');
INSERT INTO `op_bestowals` VALUES (1254, '2001-04-07', '.01', NULL, NULL, 463, 188, '');
INSERT INTO `op_bestowals` VALUES (1255, '2001-04-07', '.02', NULL, NULL, 341, 257, '');
INSERT INTO `op_bestowals` VALUES (1256, '2001-04-07', '.03', NULL, NULL, 462, 258, '');
INSERT INTO `op_bestowals` VALUES (1257, '2001-04-07', '.04', NULL, NULL, 335, 189, '');
INSERT INTO `op_bestowals` VALUES (1258, '2001-04-07', '.06', NULL, NULL, 435, 187, '');
INSERT INTO `op_bestowals` VALUES (1259, '2001-04-07', '.08', NULL, NULL, 467, 187, '');
INSERT INTO `op_bestowals` VALUES (1260, '2001-04-07', '.10', NULL, NULL, 434, 187, '');
INSERT INTO `op_bestowals` VALUES (1261, '2001-04-07', '.15', NULL, NULL, 265, 178, '');
INSERT INTO `op_bestowals` VALUES (1262, '2001-04-07', '.16', NULL, NULL, 19, 178, '');
INSERT INTO `op_bestowals` VALUES (1263, '2001-04-07', '.17', NULL, NULL, 350, 178, '');
INSERT INTO `op_bestowals` VALUES (1264, '2001-04-07', '.18', NULL, NULL, 113, 178, '');
INSERT INTO `op_bestowals` VALUES (1265, '2001-04-07', '.22', NULL, NULL, 45, 173, '(Dragon Crest)');
INSERT INTO `op_bestowals` VALUES (1266, '2001-06-30', '', '6/?/01', NULL, 215, 284, '');
INSERT INTO `op_bestowals` VALUES (1267, '2001-07-14', '', NULL, NULL, 463, 190, '');
INSERT INTO `op_bestowals` VALUES (1268, '2001-07-14', '', NULL, NULL, 458, 193, '');
INSERT INTO `op_bestowals` VALUES (1269, '2001-07-14', '', NULL, NULL, 428, 193, '');
INSERT INTO `op_bestowals` VALUES (1270, '2001-07-14', '', NULL, NULL, 459, 193, '');
INSERT INTO `op_bestowals` VALUES (1271, '2001-07-14', '', NULL, NULL, 460, 193, '');
INSERT INTO `op_bestowals` VALUES (1272, '2001-07-14', '', NULL, NULL, 461, 190, '');
INSERT INTO `op_bestowals` VALUES (1273, '2001-07-14', '', NULL, NULL, 462, 190, '');
INSERT INTO `op_bestowals` VALUES (1274, '2001-07-14', '', NULL, NULL, 389, 223, '');
INSERT INTO `op_bestowals` VALUES (1275, '2001-08-31', '', '8/?/01', NULL, 482, 187, '');
INSERT INTO `op_bestowals` VALUES (1276, '2001-10-13', '', NULL, NULL, 394, 278, '');
INSERT INTO `op_bestowals` VALUES (1277, '2001-10-20', '', NULL, NULL, 418, 184, '');
INSERT INTO `op_bestowals` VALUES (1278, '2001-11-17', '', NULL, NULL, 379, 222, '');
INSERT INTO `op_bestowals` VALUES (1279, '2001-11-17', '', NULL, NULL, 464, 193, '');
INSERT INTO `op_bestowals` VALUES (1280, '2001-12-01', '', NULL, NULL, 473, 187, '');
INSERT INTO `op_bestowals` VALUES (1281, '2001-12-01', '', NULL, NULL, 465, 187, '');
INSERT INTO `op_bestowals` VALUES (1282, '2001-12-01', '', NULL, NULL, 473, 181, '');
INSERT INTO `op_bestowals` VALUES (1283, '2002-01-12', '', NULL, NULL, 470, 232, '(Leatherworker)');
INSERT INTO `op_bestowals` VALUES (1284, '2002-01-12', '', NULL, NULL, 416, 190, '(service as Exchequer)(confirmation)');
INSERT INTO `op_bestowals` VALUES (1285, '2002-01-12', '', NULL, NULL, 468, 191, '(illumination)');
INSERT INTO `op_bestowals` VALUES (1286, '2002-01-12', '', NULL, NULL, 444, 190, '(service to the Barony)');
INSERT INTO `op_bestowals` VALUES (1287, '2002-01-12', '', NULL, NULL, 473, 191, '(diverse arts)');
INSERT INTO `op_bestowals` VALUES (1288, '2002-01-12', '', NULL, NULL, 446, 191, '(pottery)');
INSERT INTO `op_bestowals` VALUES (1289, '2002-01-12', '', NULL, NULL, 434, 191, '(poetry)');
INSERT INTO `op_bestowals` VALUES (1290, '2002-01-12', '', NULL, NULL, 476, 190, '(service to Hawkes Keye)');
INSERT INTO `op_bestowals` VALUES (1291, '2002-01-12', '', NULL, NULL, 428, 190, '(aid and comfort to fighters)');
INSERT INTO `op_bestowals` VALUES (1292, '2002-01-12', '', NULL, NULL, 435, 191, '(calligraphy)');
INSERT INTO `op_bestowals` VALUES (1293, '2002-01-12', '', NULL, NULL, 442, 191, '');
INSERT INTO `op_bestowals` VALUES (1294, '2002-01-26', '', NULL, NULL, 321, 233, '');
INSERT INTO `op_bestowals` VALUES (1295, '2002-01-26', '', NULL, NULL, 472, 233, '');
INSERT INTO `op_bestowals` VALUES (1296, '2002-01-26', '', NULL, NULL, 471, 233, '');
INSERT INTO `op_bestowals` VALUES (1297, '2002-01-26', '', NULL, NULL, 439, 234, '');
INSERT INTO `op_bestowals` VALUES (1298, '2002-02-02', '', NULL, NULL, 302, 169, '');
INSERT INTO `op_bestowals` VALUES (1299, '2002-02-02', '', NULL, NULL, 246, 181, '');
INSERT INTO `op_bestowals` VALUES (1300, '2002-02-02', '', NULL, NULL, 321, 177, '');
INSERT INTO `op_bestowals` VALUES (1301, '2002-02-02', '', NULL, NULL, 49, 221, '(On a chief vert, a tower Or)');
INSERT INTO `op_bestowals` VALUES (1302, '2002-02-02', '', NULL, NULL, 468, 181, '');
INSERT INTO `op_bestowals` VALUES (1303, '2002-02-02', '', NULL, NULL, 283, 176, '');
INSERT INTO `op_bestowals` VALUES (1304, '2002-04-13', '', NULL, NULL, 330, 178, '(Costume Heraldic Decoration, Calligraphy & Illumination)');
INSERT INTO `op_bestowals` VALUES (1305, '2002-04-13', '', NULL, NULL, 215, 221, '(a drakkar)');
INSERT INTO `op_bestowals` VALUES (1306, '2002-04-13', '', NULL, NULL, 278, 176, '');
INSERT INTO `op_bestowals` VALUES (1307, '2002-05-10', '', NULL, NULL, 466, 178, '');
INSERT INTO `op_bestowals` VALUES (1308, '2002-05-10', 'a17', NULL, NULL, 471, 187, '');
INSERT INTO `op_bestowals` VALUES (1309, '2002-05-11', '', NULL, NULL, 465, 187, '');
INSERT INTO `op_bestowals` VALUES (1310, '2002-05-11', '', NULL, NULL, 13, 238, '');
INSERT INTO `op_bestowals` VALUES (1311, '2002-05-11', '', NULL, NULL, 336, 235, '');
INSERT INTO `op_bestowals` VALUES (1312, '2002-05-18', '', NULL, NULL, 497, 183, '');
INSERT INTO `op_bestowals` VALUES (1313, '2002-05-18', '', NULL, NULL, 389, 183, '');
INSERT INTO `op_bestowals` VALUES (1314, '2002-05-25', '', NULL, NULL, 122, 247, '');
INSERT INTO `op_bestowals` VALUES (1315, '2002-05-26', '', NULL, NULL, 338, 249, '');
INSERT INTO `op_bestowals` VALUES (1316, '2002-05-26', '', NULL, NULL, 418, 245, '');
INSERT INTO `op_bestowals` VALUES (1317, '2002-05-31', '', '5/?/02', NULL, 49, 286, '');
INSERT INTO `op_bestowals` VALUES (1318, '2002-06-15', '', NULL, NULL, 475, 193, '');
INSERT INTO `op_bestowals` VALUES (1319, '2002-06-15', '', NULL, NULL, 474, 193, '');
INSERT INTO `op_bestowals` VALUES (1320, '2002-06-15', '', NULL, NULL, 406, 191, '');
INSERT INTO `op_bestowals` VALUES (1321, '2002-06-15', '', NULL, NULL, 479, 190, '');
INSERT INTO `op_bestowals` VALUES (1322, '2002-06-15', '', NULL, NULL, 465, 190, '');
INSERT INTO `op_bestowals` VALUES (1323, '2002-06-15', '', NULL, NULL, 431, 233, '');
INSERT INTO `op_bestowals` VALUES (1324, '2002-06-15', '', NULL, NULL, 480, 190, '');
INSERT INTO `op_bestowals` VALUES (1325, '2002-06-15', '', NULL, NULL, 478, 190, '');
INSERT INTO `op_bestowals` VALUES (1326, '2002-06-15', '', NULL, NULL, 477, 190, '');
INSERT INTO `op_bestowals` VALUES (1327, '2002-06-29', '', NULL, NULL, 454, 170, '');
INSERT INTO `op_bestowals` VALUES (1328, '2002-07-06', 'a12', NULL, NULL, 29, 248, '');
INSERT INTO `op_bestowals` VALUES (1329, '2002-07-13', '', NULL, NULL, 49, 183, '');
INSERT INTO `op_bestowals` VALUES (1330, '2002-07-13', '', NULL, NULL, 215, 282, '');
INSERT INTO `op_bestowals` VALUES (1331, '2002-08-15', '', NULL, NULL, 215, 228, '');
INSERT INTO `op_bestowals` VALUES (1332, '2002-08-20', '', NULL, NULL, 49, 284, '');
INSERT INTO `op_bestowals` VALUES (1333, '2002-08-31', '', NULL, NULL, 49, 285, '');
INSERT INTO `op_bestowals` VALUES (1334, '2002-08-31', '', NULL, NULL, 215, 285, '');
INSERT INTO `op_bestowals` VALUES (1335, '2002-09-04', '', '?/?/?', NULL, 49, 283, '');
INSERT INTO `op_bestowals` VALUES (1336, '2002-09-04', '', '?/?/?', NULL, 215, 283, '');
INSERT INTO `op_bestowals` VALUES (1337, '2002-09-14', '', NULL, NULL, 484, 223, '');
INSERT INTO `op_bestowals` VALUES (1338, '2002-09-14', '', NULL, NULL, 433, 223, '');
INSERT INTO `op_bestowals` VALUES (1339, '2002-09-14', '', NULL, NULL, 458, 192, '');
INSERT INTO `op_bestowals` VALUES (1340, '2002-09-14', '.08', NULL, NULL, 461, 187, '');
INSERT INTO `op_bestowals` VALUES (1341, '2002-09-14', '.09', NULL, NULL, 419, 187, '');
INSERT INTO `op_bestowals` VALUES (1342, '2002-09-14', '.13', NULL, NULL, 435, 181, '');
INSERT INTO `op_bestowals` VALUES (1343, '2002-09-14', '.14', NULL, NULL, 400, 181, '');
INSERT INTO `op_bestowals` VALUES (1344, '2002-09-14', '.19', NULL, NULL, 335, 169, '');
INSERT INTO `op_bestowals` VALUES (1345, '2002-10-26', '', NULL, NULL, 464, 191, '');
INSERT INTO `op_bestowals` VALUES (1346, '2002-10-26', '', NULL, NULL, 483, 193, '');
INSERT INTO `op_bestowals` VALUES (1347, '2002-10-26', '', NULL, NULL, 426, 222, '');
INSERT INTO `op_bestowals` VALUES (1348, '2003-01-11', '', NULL, NULL, 336, 191, '');
INSERT INTO `op_bestowals` VALUES (1349, '2003-01-11', '', NULL, NULL, 446, 232, '');
INSERT INTO `op_bestowals` VALUES (1350, '2003-01-11', '', NULL, NULL, 499, 190, '');
INSERT INTO `op_bestowals` VALUES (1351, '2003-01-11', '', NULL, NULL, 448, 190, '');
INSERT INTO `op_bestowals` VALUES (1352, '2003-02-01', '', NULL, NULL, 283, 170, '');
INSERT INTO `op_bestowals` VALUES (1353, '2003-02-01', '', '?/?/03', NULL, 407, 234, '');
INSERT INTO `op_bestowals` VALUES (1354, '2003-02-01', '', NULL, NULL, 474, 187, '');
INSERT INTO `op_bestowals` VALUES (1355, '2003-02-01', '', NULL, NULL, 379, 228, '');
INSERT INTO `op_bestowals` VALUES (1356, '2003-02-01', '', NULL, NULL, 464, 187, '');
INSERT INTO `op_bestowals` VALUES (1357, '2003-02-22', '', NULL, NULL, 503, 176, '');
INSERT INTO `op_bestowals` VALUES (1358, '2003-04-05', '', NULL, NULL, 278, 238, '');
INSERT INTO `op_bestowals` VALUES (1359, '2003-04-05', '', NULL, NULL, 428, 176, '');
INSERT INTO `op_bestowals` VALUES (1360, '2003-04-05', '', NULL, NULL, 375, 178, '');
INSERT INTO `op_bestowals` VALUES (1361, '2003-04-05', '', NULL, NULL, 82, 228, '');
INSERT INTO `op_bestowals` VALUES (1362, '2003-05-17', '', NULL, NULL, 487, 187, '');
INSERT INTO `op_bestowals` VALUES (1363, '2003-05-17', '', NULL, NULL, 446, 169, '');
INSERT INTO `op_bestowals` VALUES (1364, '2003-05-17', 'a15', NULL, NULL, 466, 181, '');
INSERT INTO `op_bestowals` VALUES (1365, '2003-05-25', 'a12', NULL, NULL, 29, 181, '');
INSERT INTO `op_bestowals` VALUES (1366, '2003-06-28', 'a15', NULL, NULL, 339, 181, '');
INSERT INTO `op_bestowals` VALUES (1367, '2003-07-19', '', NULL, NULL, 491, 190, '');
INSERT INTO `op_bestowals` VALUES (1368, '2003-07-19', '', NULL, NULL, 494, 190, '');
INSERT INTO `op_bestowals` VALUES (1369, '2003-07-19', '', NULL, NULL, 493, 190, '');
INSERT INTO `op_bestowals` VALUES (1370, '2003-07-19', '', NULL, NULL, 475, 190, '');
INSERT INTO `op_bestowals` VALUES (1371, '2003-07-19', '', NULL, NULL, 492, 190, '');
INSERT INTO `op_bestowals` VALUES (1372, '2003-07-19', '', NULL, NULL, 495, 192, '');
INSERT INTO `op_bestowals` VALUES (1373, '2003-07-19', '', NULL, NULL, 434, 192, '');
INSERT INTO `op_bestowals` VALUES (1374, '2003-07-19', '', NULL, NULL, 426, 192, '');
INSERT INTO `op_bestowals` VALUES (1375, '2003-07-19', '', NULL, NULL, 429, 233, '');
INSERT INTO `op_bestowals` VALUES (1376, '2003-07-19', '', NULL, NULL, 330, 233, '');
INSERT INTO `op_bestowals` VALUES (1377, '2003-07-19', '', NULL, NULL, 389, 233, '');
INSERT INTO `op_bestowals` VALUES (1378, '2003-07-19', '', NULL, NULL, 426, 233, '');
INSERT INTO `op_bestowals` VALUES (1379, '2003-07-26', 'a05', NULL, NULL, 433, 183, '');
INSERT INTO `op_bestowals` VALUES (1380, '2003-08-16', '', NULL, NULL, 412, 192, '');
INSERT INTO `op_bestowals` VALUES (1381, '2003-08-16', '', '8/?/03', NULL, 354, 176, '');
INSERT INTO `op_bestowals` VALUES (1382, '2003-08-16', '', '8/?/03', NULL, 129, 235, '');
INSERT INTO `op_bestowals` VALUES (1383, '2003-08-16', '', NULL, NULL, 122, 176, '');
INSERT INTO `op_bestowals` VALUES (1384, '2003-08-16', '', NULL, NULL, 407, 229, '');
INSERT INTO `op_bestowals` VALUES (1385, '2003-08-16', '', '8/?/03', NULL, 248, 244, '');
INSERT INTO `op_bestowals` VALUES (1386, '2003-08-16', '', '8/?/03', NULL, 395, 228, '');
INSERT INTO `op_bestowals` VALUES (1387, '2003-09-20', '', NULL, NULL, 497, 223, '');
INSERT INTO `op_bestowals` VALUES (1388, '2003-09-20', '', NULL, NULL, 278, 182, '');
INSERT INTO `op_bestowals` VALUES (1389, '2003-09-20', '', NULL, NULL, 248, 189, '');
INSERT INTO `op_bestowals` VALUES (1390, '2003-09-20', '', NULL, NULL, 129, 223, '');
INSERT INTO `op_bestowals` VALUES (1391, '2003-11-01', '', NULL, NULL, 290, 191, '');
INSERT INTO `op_bestowals` VALUES (1392, '2003-11-01', '', NULL, NULL, 488, 190, '');
INSERT INTO `op_bestowals` VALUES (1393, '2003-11-01', '', NULL, NULL, 489, 190, '');
INSERT INTO `op_bestowals` VALUES (1394, '2003-11-01', '', NULL, NULL, 470, 191, '');
INSERT INTO `op_bestowals` VALUES (1395, '2003-11-01', '', NULL, NULL, 347, 222, '');
INSERT INTO `op_bestowals` VALUES (1396, '2003-11-01', '', NULL, NULL, 471, 190, '');
INSERT INTO `op_bestowals` VALUES (1397, '2003-11-01', '', NULL, NULL, 487, 190, '');
INSERT INTO `op_bestowals` VALUES (1398, '2003-11-01', '', NULL, NULL, 486, 193, '');
INSERT INTO `op_bestowals` VALUES (1399, '2004-01-17', '', NULL, NULL, 485, 178, '');
INSERT INTO `op_bestowals` VALUES (1400, '2004-01-17', 'a35', NULL, NULL, 453, 247, '');
INSERT INTO `op_bestowals` VALUES (1401, '2004-01-17', 'a39', NULL, NULL, 336, 176, '');
INSERT INTO `op_bestowals` VALUES (1402, '2004-01-17', 'a40', NULL, NULL, 382, 176, '');
INSERT INTO `op_bestowals` VALUES (1403, '2004-01-24', '', NULL, NULL, 453, 232, '');
INSERT INTO `op_bestowals` VALUES (1404, '2004-02-07', '', NULL, NULL, 487, 234, '');
INSERT INTO `op_bestowals` VALUES (1405, '2004-02-28', 'a18', NULL, NULL, 339, 178, '');
INSERT INTO `op_bestowals` VALUES (1406, '2004-02-28', 'a20', NULL, NULL, 79, 183, '');
INSERT INTO `op_bestowals` VALUES (1407, '2004-02-28', 'a33', NULL, NULL, 113, 178, '');
INSERT INTO `op_bestowals` VALUES (1408, '2004-04-03', 'a12', NULL, NULL, 426, 228, '');
INSERT INTO `op_bestowals` VALUES (1409, '2004-04-03', 'a16', NULL, NULL, 466, 176, '');
INSERT INTO `op_bestowals` VALUES (1411, '2004-04-17', '', NULL, NULL, 520, 188, '');
INSERT INTO `op_bestowals` VALUES (1412, '2004-04-17', '', NULL, NULL, 449, 181, '');
INSERT INTO `op_bestowals` VALUES (1413, '2004-04-17', '.01', NULL, NULL, 527, 190, '');
INSERT INTO `op_bestowals` VALUES (1414, '2004-04-17', 'a01', NULL, NULL, 511, 188, '');
INSERT INTO `op_bestowals` VALUES (1415, '2004-04-17', 'a10', NULL, NULL, 54, 175, '');
INSERT INTO `op_bestowals` VALUES (1416, '2004-04-17', 'a12', NULL, NULL, 54, 221, 'An ermine tail enflaimed Or');
INSERT INTO `op_bestowals` VALUES (1417, '2004-04-17', 'a13', NULL, NULL, 538, 187, '');
INSERT INTO `op_bestowals` VALUES (1418, '2004-04-17', 'a14', NULL, NULL, 548, 187, '');
INSERT INTO `op_bestowals` VALUES (1419, '2004-04-17', 'a15', NULL, NULL, 464, 228, '');
INSERT INTO `op_bestowals` VALUES (1420, '2004-04-17', 'a15', NULL, NULL, 499, 187, '');
INSERT INTO `op_bestowals` VALUES (1421, '2004-04-17', 'a22', NULL, NULL, 224, 175, '');
INSERT INTO `op_bestowals` VALUES (1422, '2004-04-17', 'a24', NULL, NULL, 248, 174, 'Flaming Gryphon');
INSERT INTO `op_bestowals` VALUES (1423, '2004-04-17', 'a24', NULL, NULL, 224, 221, 'An ermine spot enflamed');
INSERT INTO `op_bestowals` VALUES (1424, '2004-04-17', 'a25', NULL, NULL, 428, 174, 'Flaming Gryphon');
INSERT INTO `op_bestowals` VALUES (1425, '2004-06-05', 'a14', NULL, NULL, 458, 181, '');
INSERT INTO `op_bestowals` VALUES (1426, '2004-06-26', 'a25', NULL, NULL, 547, 187, '');
INSERT INTO `op_bestowals` VALUES (1427, '2004-07-10', '.01', NULL, NULL, 354, 190, '');
INSERT INTO `op_bestowals` VALUES (1428, '2004-07-10', '.02', NULL, NULL, 446, 190, '');
INSERT INTO `op_bestowals` VALUES (1429, '2004-07-10', '.03', NULL, NULL, 458, 190, '');
INSERT INTO `op_bestowals` VALUES (1430, '2004-07-10', '.04', NULL, NULL, 412, 193, '');
INSERT INTO `op_bestowals` VALUES (1431, '2004-07-10', '.05', NULL, NULL, 471, 193, '');
INSERT INTO `op_bestowals` VALUES (1432, '2004-07-10', '.06', NULL, NULL, 487, 193, '');
INSERT INTO `op_bestowals` VALUES (1433, '2004-07-10', '.07', NULL, NULL, 521, 193, '');
INSERT INTO `op_bestowals` VALUES (1434, '2004-07-10', '.08', NULL, NULL, 522, 193, '');
INSERT INTO `op_bestowals` VALUES (1435, '2004-07-10', '.09', NULL, NULL, 523, 193, '');
INSERT INTO `op_bestowals` VALUES (1436, '2004-07-31', 'a30', NULL, NULL, 464, 184, '');
INSERT INTO `op_bestowals` VALUES (1437, '2004-08-19', '.01', NULL, NULL, 504, 193, '');
INSERT INTO `op_bestowals` VALUES (1438, '2004-08-19', '.02', NULL, NULL, 505, 190, '');
INSERT INTO `op_bestowals` VALUES (1439, '2004-08-19', '.02', NULL, NULL, 0, 190, '');
INSERT INTO `op_bestowals` VALUES (1440, '2004-08-19', '.03', NULL, NULL, 506, 190, '');
INSERT INTO `op_bestowals` VALUES (1441, '2004-08-19', '.04', NULL, NULL, 431, 190, '');
INSERT INTO `op_bestowals` VALUES (1442, '2004-08-19', '.05', NULL, NULL, 471, 192, '');
INSERT INTO `op_bestowals` VALUES (1443, '2004-08-19', 'a29', NULL, NULL, 246, 170, '');
INSERT INTO `op_bestowals` VALUES (1444, '2004-09-18', '.01', NULL, NULL, 524, 190, '(presented at Havenholde 12th Night, 1/8/05)');
INSERT INTO `op_bestowals` VALUES (1445, '2004-09-18', '.02', NULL, NULL, 525, 190, '(presented at Havenholde 12th Night, 1/8/05)');
INSERT INTO `op_bestowals` VALUES (1446, '2004-09-18', '.03', NULL, NULL, 463, 190, '');
INSERT INTO `op_bestowals` VALUES (1447, '2004-09-18', '.04', NULL, NULL, 521, 190, '');
INSERT INTO `op_bestowals` VALUES (1448, '2004-09-18', '.05', NULL, NULL, 523, 190, '{Osric Gelehrten ?)');
INSERT INTO `op_bestowals` VALUES (1449, '2004-09-18', '.06', NULL, NULL, 526, 190, '');
INSERT INTO `op_bestowals` VALUES (1450, '2004-09-18', '.07', NULL, NULL, 82, 192, '');
INSERT INTO `op_bestowals` VALUES (1451, '2004-09-18', '.08', NULL, NULL, 407, 192, '');
INSERT INTO `op_bestowals` VALUES (1452, '2005-01-08', '', NULL, NULL, 488, 187, '');
INSERT INTO `op_bestowals` VALUES (1453, '2005-01-08', '.01', NULL, NULL, 433, 190, '');
INSERT INTO `op_bestowals` VALUES (1454, '2005-01-08', '.02', NULL, NULL, 507, 191, '');
INSERT INTO `op_bestowals` VALUES (1455, '2005-01-08', '.03', NULL, NULL, 485, 191, '');
INSERT INTO `op_bestowals` VALUES (1456, '2005-01-08', '.04', NULL, NULL, 453, 191, '');
INSERT INTO `op_bestowals` VALUES (1457, '2005-02-05', 'a04', NULL, NULL, 389, 181, '');
INSERT INTO `op_bestowals` VALUES (1458, '2005-02-05', 'a21', NULL, NULL, 113, 247, '');
INSERT INTO `op_bestowals` VALUES (1459, '2005-02-05', 'a25', NULL, NULL, 265, 169, '');
INSERT INTO `op_bestowals` VALUES (1460, '2005-02-12', 'a25', NULL, NULL, 464, 244, '');
INSERT INTO `op_bestowals` VALUES (1461, '2005-02-19', 'a05', NULL, NULL, 390, 181, '');
INSERT INTO `op_bestowals` VALUES (1462, '2005-02-26', 'a04', NULL, NULL, 510, 187, '');
INSERT INTO `op_bestowals` VALUES (1463, '2005-02-26', 'a05', NULL, NULL, 546, 187, '');
INSERT INTO `op_bestowals` VALUES (1464, '2005-02-26', 'a06', NULL, NULL, 521, 187, '');
INSERT INTO `op_bestowals` VALUES (1465, '2005-02-26', 'a07', NULL, NULL, 429, 229, '');
INSERT INTO `op_bestowals` VALUES (1466, '2005-02-26', 'a09', NULL, NULL, 497, 181, '');
INSERT INTO `op_bestowals` VALUES (1467, '2005-03-05', '', NULL, NULL, 501, 190, '');
INSERT INTO `op_bestowals` VALUES (1468, '2005-03-05', '', NULL, NULL, 500, 190, '');
INSERT INTO `op_bestowals` VALUES (1469, '2005-04-16', 'a06', NULL, NULL, 464, 189, '');
INSERT INTO `op_bestowals` VALUES (1470, '2005-04-23', '.01', NULL, NULL, 531, 190, '');
INSERT INTO `op_bestowals` VALUES (1471, '2005-04-23', '.02', NULL, NULL, 533, 190, '');
INSERT INTO `op_bestowals` VALUES (1472, '2005-04-23', '.03', NULL, NULL, 534, 190, '');
INSERT INTO `op_bestowals` VALUES (1473, '2005-04-23', '.04', NULL, NULL, 510, 190, '');
INSERT INTO `op_bestowals` VALUES (1474, '2005-04-23', '.05', NULL, NULL, 535, 190, '');
INSERT INTO `op_bestowals` VALUES (1475, '2005-04-23', '.06', NULL, NULL, 536, 190, '');
INSERT INTO `op_bestowals` VALUES (1476, '2005-04-23', '.07', NULL, NULL, 504, 190, '');
INSERT INTO `op_bestowals` VALUES (1477, '2005-04-23', '.08', NULL, NULL, 537, 190, '');
INSERT INTO `op_bestowals` VALUES (1478, '2005-04-23', '.09', NULL, NULL, 538, 190, '');
INSERT INTO `op_bestowals` VALUES (1479, '2005-04-23', '.10', NULL, NULL, 248, 233, '');
INSERT INTO `op_bestowals` VALUES (1480, '2005-05-14', 'a01', NULL, NULL, 195, 238, '');
INSERT INTO `op_bestowals` VALUES (1481, '2005-05-14', 'a07', NULL, NULL, 514, 187, '');
INSERT INTO `op_bestowals` VALUES (1482, '2005-05-14', 'a14', NULL, NULL, 360, 228, '');
INSERT INTO `op_bestowals` VALUES (1483, '2005-05-28', 'a02', NULL, NULL, 470, 178, '');
INSERT INTO `op_bestowals` VALUES (1484, '2005-05-28', 'a03', NULL, NULL, 435, 178, '');
INSERT INTO `op_bestowals` VALUES (1485, '2005-05-28', 'a07', NULL, NULL, 539, 187, '');
INSERT INTO `op_bestowals` VALUES (1486, '2005-05-28', 'a08', NULL, NULL, 491, 187, '');
INSERT INTO `op_bestowals` VALUES (1487, '2005-05-28', 'a09', NULL, NULL, 448, 187, '');
INSERT INTO `op_bestowals` VALUES (1488, '2005-05-28', 'a12', NULL, NULL, 79, 174, '{Fenix}');
INSERT INTO `op_bestowals` VALUES (1489, '2005-06-11', 'a17', NULL, NULL, 470, 178, '');
INSERT INTO `op_bestowals` VALUES (1490, '2005-07-30', 'a13', NULL, NULL, 470, 178, '');
INSERT INTO `op_bestowals` VALUES (1491, '2005-09-10', 'a01', NULL, NULL, 329, 238, '');
INSERT INTO `op_bestowals` VALUES (1492, '2005-09-10', 'a02', NULL, NULL, 412, 221, 'An ermine tail');
INSERT INTO `op_bestowals` VALUES (1493, '2005-09-10', 'a03', NULL, NULL, 545, 179, '');
INSERT INTO `op_bestowals` VALUES (1494, '2005-09-10', 'a04', NULL, NULL, 463, 187, '');
INSERT INTO `op_bestowals` VALUES (1495, '2005-09-10', 'a09', NULL, NULL, 501, 181, '');
INSERT INTO `op_bestowals` VALUES (1496, '2005-09-10', 'a10', NULL, NULL, 412, 181, '');
INSERT INTO `op_bestowals` VALUES (1497, '2005-11-12', 'a03', NULL, NULL, 531, 187, '');
INSERT INTO `op_bestowals` VALUES (1498, '2005-11-12', 'a04', NULL, NULL, 508, 187, '');
INSERT INTO `op_bestowals` VALUES (1499, '2006-02-04', 'a13', NULL, NULL, 113, 169, '');
INSERT INTO `op_bestowals` VALUES (1500, '2006-03-04', 'a01', NULL, NULL, 453, 221, 'A candle enflamed argent');
INSERT INTO `op_bestowals` VALUES (1501, '2006-03-04', 'a04', NULL, NULL, 532, 187, '');
INSERT INTO `op_bestowals` VALUES (1502, '2006-03-04', 'a08', NULL, NULL, 325, 181, '');
INSERT INTO `op_bestowals` VALUES (1503, '2006-03-04', 'a10', NULL, NULL, 538, 178, '');
INSERT INTO `op_bestowals` VALUES (1504, '2006-03-16', 'a12', NULL, NULL, 79, 228, '');
INSERT INTO `op_bestowals` VALUES (1505, '2006-04-22', '.01', NULL, NULL, 485, 190, '');
INSERT INTO `op_bestowals` VALUES (1506, '2006-04-22', '.02', NULL, NULL, 507, 191, '');
INSERT INTO `op_bestowals` VALUES (1507, '2006-04-22', '.03', NULL, NULL, 491, 191, '');
INSERT INTO `op_bestowals` VALUES (1508, '2006-04-22', '.04', NULL, NULL, 508, 191, '');
INSERT INTO `op_bestowals` VALUES (1509, '2006-04-22', '.05', NULL, NULL, 509, 191, '');
INSERT INTO `op_bestowals` VALUES (1510, '2006-04-22', '.06', NULL, NULL, 488, 192, '');
INSERT INTO `op_bestowals` VALUES (1511, '2006-04-22', '.07', NULL, NULL, 19, 190, '');
INSERT INTO `op_bestowals` VALUES (1512, '2006-04-22', '.08', NULL, NULL, 510, 190, '');
INSERT INTO `op_bestowals` VALUES (1513, '2006-05-13', 'a02', NULL, NULL, 488, 238, '');
INSERT INTO `op_bestowals` VALUES (1514, '2006-05-13', 'a16', NULL, NULL, 504, 187, '');
INSERT INTO `op_bestowals` VALUES (1515, '2006-05-27', '', NULL, NULL, 339, 190, '');
INSERT INTO `op_bestowals` VALUES (1516, '2006-05-28', 'a04', NULL, NULL, 339, 247, '');
INSERT INTO `op_bestowals` VALUES (1517, '2006-05-28', 'a06', NULL, NULL, 29, 177, '');
INSERT INTO `op_bestowals` VALUES (1518, '2006-05-28', 'a09', NULL, NULL, 238, 176, '');
INSERT INTO `op_bestowals` VALUES (1519, '2006-05-28', 'a10', NULL, NULL, 501, 176, '');
INSERT INTO `op_bestowals` VALUES (1520, '2006-05-28', 'a11', NULL, NULL, 283, 175, '');
INSERT INTO `op_bestowals` VALUES (1521, '2006-05-28', 'a12', NULL, NULL, 336, 170, '');
INSERT INTO `op_bestowals` VALUES (1522, '2006-06-03', 'a03', NULL, NULL, 350, 181, '');
INSERT INTO `op_bestowals` VALUES (1523, '2006-06-03', 'a04', NULL, NULL, 389, 229, '');
INSERT INTO `op_bestowals` VALUES (1524, '2006-06-10', 'a02', NULL, NULL, 544, 187, '');
INSERT INTO `op_bestowals` VALUES (1525, '2006-06-10', 'a12', NULL, NULL, 384, 181, '');
INSERT INTO `op_bestowals` VALUES (1526, '2006-06-10', 'a13', NULL, NULL, 509, 181, '');
INSERT INTO `op_bestowals` VALUES (1527, '2006-06-24', 'a12', NULL, NULL, 19, 181, '');
INSERT INTO `op_bestowals` VALUES (1528, '2006-06-24', 'a16', NULL, NULL, 491, 181, '');
INSERT INTO `op_bestowals` VALUES (1529, '2006-07-08', '.01', NULL, NULL, 500, 193, '');
INSERT INTO `op_bestowals` VALUES (1530, '2006-07-08', '.02', NULL, NULL, 516, 193, '');
INSERT INTO `op_bestowals` VALUES (1531, '2006-07-08', '.03', NULL, NULL, 500, 191, '');
INSERT INTO `op_bestowals` VALUES (1532, '2006-07-08', '.04', NULL, NULL, 501, 191, '');
INSERT INTO `op_bestowals` VALUES (1533, '2006-07-08', '.05', NULL, NULL, 395, 191, '');
INSERT INTO `op_bestowals` VALUES (1534, '2006-07-08', '.06', NULL, NULL, 412, 191, '');
INSERT INTO `op_bestowals` VALUES (1535, '2006-07-08', '.07', NULL, NULL, 517, 190, '');
INSERT INTO `op_bestowals` VALUES (1536, '2006-07-08', '.08', NULL, NULL, 518, 190, '');
INSERT INTO `op_bestowals` VALUES (1537, '2006-07-08', '.09', NULL, NULL, 484, 190, '');
INSERT INTO `op_bestowals` VALUES (1538, '2006-07-08', '.10', NULL, NULL, 382, 190, '');
INSERT INTO `op_bestowals` VALUES (1539, '2006-07-08', '.11', NULL, NULL, 470, 190, '');
INSERT INTO `op_bestowals` VALUES (1540, '2006-07-08', '.12', NULL, NULL, 454, 190, '');
INSERT INTO `op_bestowals` VALUES (1541, '2006-07-08', '.13', NULL, NULL, 453, 190, '');
INSERT INTO `op_bestowals` VALUES (1542, '2006-07-29', 'a21', NULL, NULL, 510, 181, '');
INSERT INTO `op_bestowals` VALUES (1543, '2006-07-29', 'a23', NULL, NULL, 500, 181, '');
INSERT INTO `op_bestowals` VALUES (1544, '2006-09-09', '.01', NULL, NULL, 338, 192, '');
INSERT INTO `op_bestowals` VALUES (1545, '2006-09-09', '.a1', NULL, NULL, 511, 258, '');
INSERT INTO `op_bestowals` VALUES (1546, '2006-11-18', 'a02', NULL, NULL, 541, 187, '');
INSERT INTO `op_bestowals` VALUES (1547, '2006-11-18', 'a04', NULL, NULL, 542, 187, '');
INSERT INTO `op_bestowals` VALUES (1548, '2007-01-06', '.01', NULL, NULL, 142, 190, '');
INSERT INTO `op_bestowals` VALUES (1549, '2007-01-06', '.02', NULL, NULL, 532, 190, '');
INSERT INTO `op_bestowals` VALUES (1550, '2007-01-06', '.03', NULL, NULL, 433, 191, '');
INSERT INTO `op_bestowals` VALUES (1551, '2007-01-06', '.04', NULL, NULL, 517, 190, '');
INSERT INTO `op_bestowals` VALUES (1552, '2007-01-06', '.05', NULL, NULL, 347, 232, '');
INSERT INTO `op_bestowals` VALUES (1553, '2007-02-17', 'a07', NULL, NULL, 407, 181, '');
INSERT INTO `op_bestowals` VALUES (1554, '2007-02-17', 'a08', NULL, NULL, 488, 181, '');
INSERT INTO `op_bestowals` VALUES (1555, '2007-02-24', '', NULL, NULL, 448, 181, '');
INSERT INTO `op_bestowals` VALUES (1556, '2007-03-03', '', NULL, NULL, 491, 178, '');
INSERT INTO `op_bestowals` VALUES (1557, '2007-03-03', '.01', NULL, NULL, 505, 193, '');
INSERT INTO `op_bestowals` VALUES (1558, '2007-03-03', '.02', NULL, NULL, 488, 191, '');
INSERT INTO `op_bestowals` VALUES (1559, '2007-03-15', 'a13', NULL, NULL, 446, 176, '');
INSERT INTO `op_bestowals` VALUES (1560, '2007-05-27', 'a07', NULL, NULL, 501, 247, '');
INSERT INTO `op_bestowals` VALUES (1561, '2007-06-09', '', NULL, NULL, 518, 187, '');
INSERT INTO `op_bestowals` VALUES (1562, '2007-06-09', '', NULL, NULL, 530, 229, '');
INSERT INTO `op_bestowals` VALUES (1563, '2007-06-23', '.01', NULL, NULL, 500, 191, '');
INSERT INTO `op_bestowals` VALUES (1564, '2007-06-23', '.02', NULL, NULL, 678, 190, '');
INSERT INTO `op_bestowals` VALUES (1565, '2007-06-23', '.03', NULL, NULL, 72, 190, '');
INSERT INTO `op_bestowals` VALUES (1566, '2007-06-23', '.04', NULL, NULL, 514, 190, '');
INSERT INTO `op_bestowals` VALUES (1567, '2007-06-23', '.05', NULL, NULL, 515, 190, '');
INSERT INTO `op_bestowals` VALUES (1568, '2007-06-23', 'b01', NULL, NULL, 0, 187, '');
INSERT INTO `op_bestowals` VALUES (1569, '2007-06-23', 'b01', NULL, NULL, 540, 187, '');
INSERT INTO `op_bestowals` VALUES (1570, '2007-06-23', 'b03', NULL, NULL, 506, 187, '');
INSERT INTO `op_bestowals` VALUES (1571, '2007-06-23', 'b08', NULL, NULL, 426, 244, '');
INSERT INTO `op_bestowals` VALUES (1572, '2007-06-23', 'b09', NULL, NULL, 278, 170, '');
INSERT INTO `op_bestowals` VALUES (1573, '2007-06-23', 'b11', NULL, NULL, 484, 181, '');
INSERT INTO `op_bestowals` VALUES (1574, '2007-06-23', 'b13', NULL, NULL, 347, 177, '');
INSERT INTO `op_bestowals` VALUES (1575, '2045-12-31', '', '?', NULL, 22, 199, '');
INSERT INTO `op_bestowals` VALUES (1576, '2045-12-31', '', '?', NULL, 217, 197, '');
INSERT INTO `op_bestowals` VALUES (1577, '1996-10-31', '', '10/?/96', NULL, 500, 268, '');
INSERT INTO `op_bestowals` VALUES (1578, '2045-12-31', '', '?', NULL, 64, 218, '');
INSERT INTO `op_bestowals` VALUES (1579, '2045-12-31', '', '?', NULL, 285, 217, '(twice)');
INSERT INTO `op_bestowals` VALUES (1580, '2045-12-31', '', '?', NULL, 230, 215, '');
INSERT INTO `op_bestowals` VALUES (1581, '2045-12-31', '', '?', NULL, 142, 214, '');
INSERT INTO `op_bestowals` VALUES (1582, '2045-12-31', '', '?', NULL, 238, 216, '');
INSERT INTO `op_bestowals` VALUES (1583, '1993-01-31', '', '10/?/93', NULL, 500, 269, '');
INSERT INTO `op_bestowals` VALUES (1584, '2045-12-31', '', '?', NULL, 252, 227, '(former Rebel Baroness)');
INSERT INTO `op_bestowals` VALUES (1585, '1997-10-31', '', '10/?/97', NULL, 500, 267, '');
INSERT INTO `op_bestowals` VALUES (1586, '0000-00-00', '', '10/?/94', NULL, 500, 266, '');
INSERT INTO `op_bestowals` VALUES (1587, '2045-12-31', '', '?', NULL, 64, 212, '');
INSERT INTO `op_bestowals` VALUES (1588, '2045-12-31', '', '?', NULL, 131, 203, '(awarded four times)');
INSERT INTO `op_bestowals` VALUES (1589, '2045-12-31', '', '?', NULL, 131, 202, '');
INSERT INTO `op_bestowals` VALUES (1590, '2045-12-31', '', '?', NULL, 77, 194, '');
INSERT INTO `op_bestowals` VALUES (1591, '2045-12-31', '', '?', NULL, 142, 213, '');
INSERT INTO `op_bestowals` VALUES (1592, '2900-01-01', '', '?/?/?', NULL, 374, 237, '(al-Barrons, Outlands) (for Baronial service)');
INSERT INTO `op_bestowals` VALUES (1593, '2005-03-05', '.01', NULL, NULL, 532, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1594, '2005-03-05', '.02', NULL, NULL, 514, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1595, '2007-03-03', '.04', NULL, NULL, 540, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1596, '2006-03-04', '.01', NULL, NULL, 530, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1597, '2005-01-22', '.01', NULL, NULL, 429, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1600, '2004-11-13', NULL, NULL, NULL, 195, 222, 'No court report');
INSERT INTO `op_bestowals` VALUES (1599, '2007-03-03', '.06', NULL, NULL, 434, 181, NULL);
INSERT INTO `op_bestowals` VALUES (1601, '2005-11-05', NULL, NULL, NULL, 177, 222, 'No court report');
INSERT INTO `op_bestowals` VALUES (1602, '2006-10-28', NULL, NULL, NULL, 488, 222, 'No court report');
INSERT INTO `op_bestowals` VALUES (1603, '2006-03-04', 'a02', NULL, NULL, 475, 187, NULL);
INSERT INTO `op_bestowals` VALUES (1604, '2009-06-13', NULL, NULL, 'Push for Pennsic', 488, 233, '');
INSERT INTO `op_bestowals` VALUES (1605, '2010-07-17', NULL, NULL, 'Push for Pennsic', 563, 233, '');
INSERT INTO `op_bestowals` VALUES (1606, '2008-04-12', NULL, NULL, 'Grand Tournament of the Unicorn', 506, 233, '');
INSERT INTO `op_bestowals` VALUES (1607, '2009-06-13', NULL, NULL, 'Push for Pennsic', 573, 233, '');
INSERT INTO `op_bestowals` VALUES (1608, '2010-01-09', NULL, NULL, 'Twelfth Night', 576, 233, '');
INSERT INTO `op_bestowals` VALUES (1609, '2010-04-22', NULL, NULL, 'Fight practice', 588, 233, '');
INSERT INTO `op_bestowals` VALUES (1610, '2009-09-05', NULL, NULL, 'Harvest Day', 552, 223, '');
INSERT INTO `op_bestowals` VALUES (1611, '2010-09-11', NULL, NULL, 'Harvest Day', 555, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1612, '2009-09-05', NULL, NULL, 'Harvest Day', 515, 223, '');
INSERT INTO `op_bestowals` VALUES (1613, '2009-09-05', NULL, NULL, 'Harvest Day', 484, 223, '');
INSERT INTO `op_bestowals` VALUES (1614, '2008-09-06', NULL, NULL, 'Harvest Day', 195, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1615, '2008-09-06', NULL, NULL, 'Harvest Day', 583, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1616, '2010-09-11', NULL, NULL, 'Harvest Day', 584, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (1617, '2010-09-11', NULL, NULL, 'Harvest Day', 428, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1618, '2010-09-11', NULL, NULL, 'Harvest Day', 508, 289, '');
INSERT INTO `op_bestowals` VALUES (1619, '2010-01-09', NULL, NULL, 'Twelfth Night', 554, 232, '');
INSERT INTO `op_bestowals` VALUES (1620, '2008-01-26', NULL, NULL, 'Twelfth Night', 545, 232, '');
INSERT INTO `op_bestowals` VALUES (1621, '2009-01-10', NULL, NULL, 'Twelfth Night', 195, 232, '');
INSERT INTO `op_bestowals` VALUES (1622, '2007-11-03', NULL, NULL, 'Baronial Championship', 521, 222, '');
INSERT INTO `op_bestowals` VALUES (1623, '2009-11-14', NULL, NULL, 'Baronial Championship', 474, 222, '');
INSERT INTO `op_bestowals` VALUES (1624, '2008-11-01', NULL, NULL, 'Baronial Championship', 593, 222, '');
INSERT INTO `op_bestowals` VALUES (1625, '2008-04-12', NULL, NULL, 'Grand Tournament of the Unicorn', 514, 234, '');
INSERT INTO `op_bestowals` VALUES (1626, '2009-03-07', NULL, NULL, 'Ceilidh', 572, 234, '');
INSERT INTO `op_bestowals` VALUES (1627, '2010-03-06', NULL, NULL, 'Ceilidh', 576, 234, '');
INSERT INTO `op_bestowals` VALUES (1628, '2009-03-07', NULL, NULL, 'Ceilidh', 520, 190, '');
INSERT INTO `op_bestowals` VALUES (1629, '2009-06-13', NULL, NULL, 'Push for Pennsic', 555, 190, '');
INSERT INTO `op_bestowals` VALUES (1630, '2007-11-03', NULL, NULL, 'Baronial Championship', 426, 190, '');
INSERT INTO `op_bestowals` VALUES (1631, '2007-11-03', NULL, NULL, 'Baronial Championship', 561, 190, '');
INSERT INTO `op_bestowals` VALUES (1632, '2010-01-09', NULL, NULL, 'Twelfth Night', 567, 190, '');
INSERT INTO `op_bestowals` VALUES (1633, '2010-04-10', NULL, NULL, 'Grand Tournament of the Unicorn', 568, 190, '');
INSERT INTO `op_bestowals` VALUES (1634, '2007-11-03', NULL, NULL, 'Baronial Championship', 218, 190, '');
INSERT INTO `op_bestowals` VALUES (1635, '2007-11-03', NULL, NULL, 'Baronial Championship', 581, 190, '');
INSERT INTO `op_bestowals` VALUES (1636, '2010-07-17', NULL, NULL, 'Push for Pennsic', 544, 190, '');
INSERT INTO `op_bestowals` VALUES (1637, '2010-03-06', NULL, NULL, 'Ceilidh', 586, 190, '');
INSERT INTO `op_bestowals` VALUES (1638, '2010-07-17', NULL, NULL, 'Push for Pennsic', 589, 190, '');
INSERT INTO `op_bestowals` VALUES (1639, '2007-11-03', NULL, NULL, 'Baronial Championship', 594, 190, '');
INSERT INTO `op_bestowals` VALUES (1640, '2010-04-10', NULL, NULL, 'Grand Tournament of the Unicorn', 595, 190, '');
INSERT INTO `op_bestowals` VALUES (1641, '2010-03-06', NULL, NULL, 'Ceilidh', 596, 190, '');
INSERT INTO `op_bestowals` VALUES (1642, '2009-06-13', NULL, NULL, 'Push for Pennsic', 33, 288, '');
INSERT INTO `op_bestowals` VALUES (1643, '2008-11-01', NULL, NULL, 'Baronial Championship', 64, 288, '');
INSERT INTO `op_bestowals` VALUES (1644, '2009-09-05', NULL, NULL, 'Harvest Day', 129, 288, '');
INSERT INTO `op_bestowals` VALUES (1645, '2010-07-17', NULL, NULL, 'Push for Pennsic', 195, 288, '');
INSERT INTO `op_bestowals` VALUES (1646, '2009-03-07', NULL, NULL, 'Ceilidh', 277, 288, '');
INSERT INTO `op_bestowals` VALUES (1647, '2009-03-07', NULL, NULL, 'Ceilidh', 317, 288, '');
INSERT INTO `op_bestowals` VALUES (1648, '2008-11-01', NULL, NULL, 'Baronial Championship', 558, 287, '');
INSERT INTO `op_bestowals` VALUES (1649, '2010-04-10', NULL, NULL, 'Grand Tournament of the Unicorn', 574, 287, '');
INSERT INTO `op_bestowals` VALUES (1650, '2009-03-07', NULL, NULL, 'Ceilidh', 511, 287, '');
INSERT INTO `op_bestowals` VALUES (1651, '2009-03-07', NULL, NULL, 'Ceilidh', 587, 287, '');
INSERT INTO `op_bestowals` VALUES (1652, '2009-03-07', NULL, NULL, 'Ceilidh', 592, 287, '');
INSERT INTO `op_bestowals` VALUES (1653, '2010-03-06', NULL, NULL, 'Ceilidh', 554, 191, '');
INSERT INTO `op_bestowals` VALUES (1654, '2008-01-26', NULL, NULL, 'Twelfth Night', 531, 191, '');
INSERT INTO `op_bestowals` VALUES (1655, '2009-06-13', NULL, NULL, 'Push for Pennsic', 557, 191, '');
INSERT INTO `op_bestowals` VALUES (1656, '2004-12-08', NULL, NULL, 'Fight practice', 64, 191, '');
INSERT INTO `op_bestowals` VALUES (1657, '2010-07-17', NULL, NULL, 'Push for Pennsic', 564, 191, '');
INSERT INTO `op_bestowals` VALUES (1658, '2009-06-13', NULL, NULL, 'Push for Pennsic', 566, 191, '');
INSERT INTO `op_bestowals` VALUES (1659, '2007-11-03', NULL, NULL, 'Baronial Championship', 532, 191, '');
INSERT INTO `op_bestowals` VALUES (1660, '2009-04-04', NULL, NULL, 'Grand Tournament of the Unicorn', 578, 191, '');
INSERT INTO `op_bestowals` VALUES (1661, '2010-07-17', NULL, NULL, 'Push for Pennsic', 580, 191, '');
INSERT INTO `op_bestowals` VALUES (1662, '2009-06-13', NULL, NULL, 'Push for Pennsic', 325, 191, '');
INSERT INTO `op_bestowals` VALUES (1663, '2007-11-03', NULL, NULL, 'Baronial Championship', 500, 192, '');
INSERT INTO `op_bestowals` VALUES (1664, '2008-09-06', NULL, NULL, 'Harvest Day', 561, 192, '');
INSERT INTO `op_bestowals` VALUES (1665, '2008-09-06', NULL, NULL, 'Harvest Day', 443, 192, '');
INSERT INTO `op_bestowals` VALUES (1666, '2010-08-11', NULL, NULL, 'Pennsic', 595, 192, '');
INSERT INTO `op_bestowals` VALUES (1667, '2010-04-22', NULL, NULL, 'Fight practice', 550, 193, '');
INSERT INTO `op_bestowals` VALUES (1668, '2010-04-22', NULL, NULL, 'Fight practice', 551, 193, '');
INSERT INTO `op_bestowals` VALUES (1669, '2009-06-13', NULL, NULL, 'Push for Pennsic', 553, 193, '');
INSERT INTO `op_bestowals` VALUES (1670, '2010-09-11', NULL, NULL, 'Harvest Day', 341, 193, '');
INSERT INTO `op_bestowals` VALUES (1671, '2009-06-13', NULL, NULL, 'Push for Pennsic', 556, 193, '');
INSERT INTO `op_bestowals` VALUES (1672, '2008-07-12', NULL, NULL, 'Push for Pennsic', 418, 193, '');
INSERT INTO `op_bestowals` VALUES (1673, '2010-07-17', NULL, NULL, 'Push for Pennsic', 559, 193, '');
INSERT INTO `op_bestowals` VALUES (1674, '2009-06-13', NULL, NULL, 'Push for Pennsic', 560, 193, '');
INSERT INTO `op_bestowals` VALUES (1675, '2010-09-11', NULL, NULL, 'Harvest Day', 562, 193, '');
INSERT INTO `op_bestowals` VALUES (1676, '2010-07-17', NULL, NULL, 'Push for Pennsic', 563, 193, '');
INSERT INTO `op_bestowals` VALUES (1677, '2010-04-22', NULL, NULL, 'Fight practice', 565, 193, '');
INSERT INTO `op_bestowals` VALUES (1678, '2009-04-04', NULL, NULL, 'Grand Tournament of the Unicorn', 567, 193, '');
INSERT INTO `op_bestowals` VALUES (1679, '2008-07-12', NULL, NULL, 'Push for Pennsic', 569, 193, '');
INSERT INTO `op_bestowals` VALUES (1680, '2010-04-22', NULL, NULL, 'Fight practice', 570, 193, '');
INSERT INTO `op_bestowals` VALUES (1681, '2009-04-04', NULL, NULL, 'Grand Tournament of the Unicorn', 571, 193, '');
INSERT INTO `op_bestowals` VALUES (1682, '2010-04-10', NULL, NULL, 'Grand Tournament of the Unicorn', 573, 193, '');
INSERT INTO `op_bestowals` VALUES (1683, '2010-01-09', NULL, NULL, 'Twelfth Night', 575, 193, '');
INSERT INTO `op_bestowals` VALUES (1684, '2008-07-12', NULL, NULL, 'Push for Pennsic', 619, 193, '');
INSERT INTO `op_bestowals` VALUES (1685, '2010-04-22', NULL, NULL, 'Fight practice', 579, 193, '');
INSERT INTO `op_bestowals` VALUES (1686, '2009-04-04', NULL, NULL, 'Grand Tournament of the Unicorn', 582, 193, '');
INSERT INTO `op_bestowals` VALUES (1687, '2010-04-22', NULL, NULL, 'Fight practice', 585, 193, '');
INSERT INTO `op_bestowals` VALUES (1688, '2009-04-04', NULL, NULL, 'Grand Tournament of the Unicorn', 589, 193, '');
INSERT INTO `op_bestowals` VALUES (1689, '2009-04-04', NULL, NULL, 'Grand Tournament of the Unicorn', 590, 193, '');
INSERT INTO `op_bestowals` VALUES (1690, '2008-07-12', NULL, NULL, 'Push for Pennsic', 591, 193, '');
INSERT INTO `op_bestowals` VALUES (1691, '2010-01-09', NULL, NULL, 'Twelfth Night', 597, 193, '');
INSERT INTO `op_bestowals` VALUES (1692, '2008-07-12', NULL, NULL, 'Push for Pennsic', 598, 193, '');
INSERT INTO `op_bestowals` VALUES (1693, '2010-01-09', NULL, NULL, 'Twelfth Night', 599, 193, '');
INSERT INTO `op_bestowals` VALUES (1694, '2005-01-08', NULL, NULL, 'Flaming Gryphon Twelfth Night', 485, 232, NULL);
INSERT INTO `op_bestowals` VALUES (1695, '2006-01-07', NULL, '1/?/06', 'Flaming Gryphon Twelfth Night', 122, 232, NULL);
INSERT INTO `op_bestowals` VALUES (1696, '2009-11-14', NULL, NULL, 'Baronial Championship', 600, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1697, '2010-11-06', NULL, NULL, 'Baronial Championship', 573, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1698, '2010-11-06', NULL, NULL, 'Baronial Championship', 601, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1699, '2010-11-06', NULL, NULL, 'Baronial Championship', 602, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1700, '2010-11-06', NULL, NULL, 'Baronial Championship', 568, 222, NULL);
INSERT INTO `op_bestowals` VALUES (1701, '2009-08-05', NULL, NULL, 'Pennsic', 482, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1702, '2009-08-05', NULL, NULL, 'Pennsic', 603, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1703, '1999-01-16', '.04', NULL, NULL, 234, 232, NULL);
INSERT INTO `op_bestowals` VALUES (1704, '2011-01-15', NULL, NULL, 'Flaming Gryphon Twelfth Night', 555, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1705, '2011-01-15', NULL, NULL, 'Flaming Gryphon Twelfth Night', 604, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1706, '2011-01-15', NULL, NULL, 'Flaming Gryphon Twelfth Night', 605, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1707, '2011-01-15', NULL, NULL, 'Flaming Gryphon Twelfth Night', 606, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1708, '2011-01-15', NULL, NULL, 'Flaming Gryphon Twelfth Night', 561, 232, '(Mosaic)');
INSERT INTO `op_bestowals` VALUES (1709, '2011-01-15', NULL, NULL, 'Flaming Gryphon Twelfth Night', 607, 232, '(Youth)');
INSERT INTO `op_bestowals` VALUES (1710, '2010-01-09', NULL, NULL, 'Flaming Gryphon Twelfth Night', 574, 232, '(Youth)');
INSERT INTO `op_bestowals` VALUES (1711, '2011-03-05', NULL, NULL, 'Ceilidh XXIII', 609, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1712, '2011-03-05', NULL, NULL, 'Ceilidh XXIII', 607, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1713, '2011-03-05', NULL, NULL, 'Ceilidh XXIII', 608, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1714, '2011-03-05', NULL, NULL, 'Ceilidh XXIII', 412, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1715, '2011-04-02', NULL, NULL, 'Grant Tournament of the Unicorn', 491, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1716, '2009-11-14', NULL, NULL, NULL, 594, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1717, '2011-07-09', NULL, NULL, 'Push for Pennsic', 586, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1718, '2011-07-09', NULL, NULL, 'Push for Pennsic', 491, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1719, '2011-07-09', NULL, NULL, 'Push for Pennsic', 64, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1720, '2011-07-09', NULL, NULL, 'Push for Pennsic', 500, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1721, '2011-07-09', NULL, NULL, 'Push for Pennsic', 530, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1722, '2011-07-09', NULL, NULL, 'Push for Pennsic', 572, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1723, '2011-07-09', NULL, NULL, 'Push for Pennsic', 540, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1724, '2011-07-09', NULL, NULL, 'Push for Pennsic', 488, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1725, '2011-07-09', NULL, NULL, 'Push for Pennsic', 609, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1726, '2011-07-09', NULL, NULL, 'Push for Pennsic', 610, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1727, '2011-07-09', NULL, NULL, 'Push for Pennsic', 555, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1728, '2011-07-09', NULL, NULL, 'Push for Pennsic', 583, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1729, '2011-07-09', NULL, NULL, 'Push for Pennsic', 611, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1730, '2011-07-09', NULL, NULL, 'Push for Pennsic', 612, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1731, '2011-07-09', NULL, NULL, 'Push for Pennsic', 613, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1732, '2011-07-09', NULL, NULL, 'Push for Pennsic', 614, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1733, '2011-07-09', NULL, NULL, 'Push for Pennsic', 615, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1734, '2011-07-09', NULL, NULL, 'Push for Pennsic', 580, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1735, '2011-07-09', NULL, NULL, 'Push for Pennsic', 462, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1736, '2011-07-09', NULL, NULL, 'Push for Pennsic', 325, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1737, '2011-08-10', NULL, NULL, 'Pennsic 40', 521, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1738, '2011-08-10', NULL, NULL, 'Pennsic 40', 593, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1739, '2011-08-10', NULL, NULL, 'Pennsic 40', 567, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1740, '2011-08-10', NULL, NULL, 'Pennsic 40', 454, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1741, '2011-08-10', NULL, NULL, 'Pennsic 40', 616, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1742, '2011-08-10', NULL, NULL, 'Pennsic 40', 266, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1743, '2011-09-10', NULL, NULL, 'Harvest Days', 515, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1744, '2011-09-10', NULL, NULL, 'Harvest Days', 488, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1745, '2011-09-10', NULL, NULL, 'Harvest Days', 439, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1746, '2011-09-10', NULL, NULL, 'Harvest Days', 471, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1747, '2011-09-10', NULL, NULL, 'Harvest Days', 15, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1748, '2011-09-10', NULL, NULL, 'Harvest Days', 216, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1749, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 617, 222, NULL);
INSERT INTO `op_bestowals` VALUES (1750, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 183, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1751, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 554, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1752, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 618, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1753, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 553, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1754, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 619, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1755, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 596, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1756, '2011-11-12', NULL, NULL, 'Flaming Gryphon Baronial Championship', 586, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1757, '2012-01-14', NULL, NULL, 'Flaming Gryphon Twelfth Night', 620, 232, '(Youth)');
INSERT INTO `op_bestowals` VALUES (1758, '2012-01-14', NULL, NULL, 'Flaming Gryphon Twelfth Night', 33, 232, NULL);
INSERT INTO `op_bestowals` VALUES (1759, '2012-01-14', NULL, NULL, 'Flaming Gryphon Twelfth Night', 621, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1760, '2012-01-14', NULL, NULL, 'Flaming Gryphon Twelfth Night', 72, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1761, '2012-01-14', NULL, NULL, 'Flaming Gryphon Twelfth Night', 428, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1762, '2012-01-14', NULL, NULL, 'Flaming Gryphon Twelfth Night', 19, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1763, '2012-03-10', NULL, NULL, 'Ceilidh', 521, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1764, '2012-03-10', NULL, NULL, 'Ceilidh', 530, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1765, '2012-03-10', NULL, NULL, 'Ceilidh', 561, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1766, '2012-03-10', NULL, NULL, 'Ceilidh', 557, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1767, '2012-07-07', '.01', NULL, 'Push for Pennsic', 514, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1768, '2012-07-07', '.02', NULL, 'Push for Pennsic', 622, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1769, '2012-07-07', '.03', NULL, 'Push for Pennsic', 623, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1770, '2012-07-07', '.04', NULL, 'Push for Pennsic', 576, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1771, '2012-07-07', '.05', NULL, 'Push for Pennsic', 276, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1772, '2012-11-03', '.01', NULL, 'Baronial Champions', 583, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1773, '2012-11-03', '.02', NULL, 'Baronial Champions', 491, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1774, '2012-11-03', '.03', NULL, 'Baronial Champions', 620, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1775, '2012-11-03', NULL, NULL, 'Baronial Champions', 488, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1776, '2012-11-03', '.05', NULL, 'Baronial Champions', 600, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1777, '2012-03-31', NULL, NULL, 'Grand Tournament of the Unicorn', 624, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1778, '2012-03-31', NULL, NULL, 'Grand Tournament of the Unicorn', 625, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1779, '2012-03-31', NULL, NULL, 'Grand Tournament of the Unicorn', 626, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1780, '2012-03-31', NULL, NULL, 'Grand Tournament of the Unicorn', 627, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1781, '2012-03-31', NULL, NULL, 'Grand Tournament of the Unicorn', 628, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1782, '2012-03-31', NULL, NULL, 'Grand Tournament of the Unicorn', 206, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1791, '2012-09-08', NULL, NULL, 'Harvest Days', 631, 223, '(youth)');
INSERT INTO `op_bestowals` VALUES (1790, '2012-09-08', NULL, NULL, 'Harvest Days', 195, 223, '(crossbow)');
INSERT INTO `op_bestowals` VALUES (1789, '2012-09-08', NULL, NULL, 'Harvest Days', 584, 223, '(longbow)');
INSERT INTO `op_bestowals` VALUES (1787, '2012-07-07', NULL, NULL, 'Push for Pennsic', 572, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1792, '2012-11-03', NULL, NULL, 'Baronial Championship', 632, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1793, '2012-11-03', NULL, NULL, 'Baronial Championship', 624, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1794, '2012-11-03', NULL, NULL, 'Baronial Championship', 633, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1795, '2012-11-03', NULL, NULL, 'Baronial Championship', 623, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1796, '2012-11-03', NULL, NULL, 'Baronial Championship', 622, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1797, '2012-11-03', NULL, NULL, 'Baronial Championship', 634, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1798, '2012-11-03', NULL, NULL, 'Baronial Championship', 601, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1799, '2012-11-03', NULL, NULL, 'Baronial Championship', 491, 222, NULL);
INSERT INTO `op_bestowals` VALUES (1800, '2012-11-03', NULL, NULL, 'Baronial Championship', 252, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1801, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 72, 232, NULL);
INSERT INTO `op_bestowals` VALUES (1802, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 635, 232, '(youth)');
INSERT INTO `op_bestowals` VALUES (1803, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 248, 290, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1804, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 521, 290, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1805, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 491, 290, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1806, '2013-01-12', NULL, NULL, 'Baronila Twelfth Night', 561, 290, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1807, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 617, 290, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1808, '2013-01-12', NULL, NULL, 'Baronila Twelfth Night', 265, 291, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1809, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 113, 291, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1810, '2013-01-12', NULL, NULL, 'Baronila Twelfth Night', 464, 291, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1811, '2013-01-12', NULL, NULL, 'Baronial Twelfth Night', 488, 291, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1812, '2013-01-12', NULL, NULL, 'Baronila Twelfth Night', 72, 291, '(Principal)');
INSERT INTO `op_bestowals` VALUES (1813, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 624, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1814, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 338, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1815, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 622, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1816, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 636, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1817, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 612, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1818, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 632, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1819, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 637, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1820, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 636, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1821, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 638, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1822, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 639, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1823, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 642, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1824, '2013-03-23', NULL, NULL, 'Grand Tournament of the Unicorn', 641, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1825, '2013-09-07', NULL, NULL, 'Harvest Days', 33, 223, '(longbow)');
INSERT INTO `op_bestowals` VALUES (1826, '2013-09-07', NULL, NULL, 'Harvest Days', 642, 223, '(crossbow)');
INSERT INTO `op_bestowals` VALUES (1827, '2013-09-07', NULL, NULL, 'Harvest Days', 574, 223, '(youth)');
INSERT INTO `op_bestowals` VALUES (1828, '2009-06-13', NULL, NULL, 'Push for Pennsic', 643, 292, NULL);
INSERT INTO `op_bestowals` VALUES (1829, '2013-11-02', NULL, NULL, NULL, 634, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1830, '2013-11-02', NULL, NULL, NULL, 642, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1831, '2013-11-02', NULL, NULL, NULL, 612, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1832, '2014-01-11', NULL, NULL, NULL, 618, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1833, '2014-01-11', NULL, NULL, NULL, 216, 291, NULL);
INSERT INTO `op_bestowals` VALUES (1834, '2014-01-11', NULL, NULL, NULL, 644, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1835, '2014-01-11', NULL, NULL, NULL, 635, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1836, '2014-01-11', NULL, NULL, NULL, 645, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1837, '2014-03-29', NULL, NULL, NULL, 593, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1838, '2014-03-29', NULL, NULL, NULL, 646, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1839, '2014-03-29', NULL, NULL, NULL, 116, 290, NULL);
INSERT INTO `op_bestowals` VALUES (1840, '2014-03-29', NULL, NULL, NULL, 260, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1841, '2014-03-29', NULL, NULL, NULL, 218, 288, NULL);
INSERT INTO `op_bestowals` VALUES (1842, '2014-03-29', NULL, NULL, NULL, 647, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1843, '2014-06-14', NULL, NULL, NULL, 610, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1844, '2014-06-14', NULL, NULL, NULL, 295, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1845, '2014-06-14', NULL, NULL, NULL, 648, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1846, '2014-08-06', NULL, NULL, NULL, 54, 291, NULL);
INSERT INTO `op_bestowals` VALUES (1847, '2014-08-06', NULL, NULL, NULL, 464, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1848, '2014-08-06', NULL, NULL, NULL, 443, 290, NULL);
INSERT INTO `op_bestowals` VALUES (1849, '2004-09-18', NULL, NULL, 'Harvest Days', 433, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1850, '2004-09-18', NULL, NULL, 'Harvest Days', 389, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1851, '2005-09-10', NULL, NULL, 'Harvest Days', 335, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1852, '2005-09-10', NULL, NULL, 'Harvest Days', 484, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1853, '2006-09-09', NULL, NULL, 'Harvest Days', 448, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1854, '2006-09-09', NULL, NULL, 'Harvest Days', 195, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1855, '2007-09-08', NULL, NULL, 'Harvest Days', 433, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1856, '2007-09-08', NULL, NULL, 'Harvest Days', 484, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1857, '2014-09-06', NULL, NULL, 'Harvest Days', 515, 223, 'Longbow');
INSERT INTO `op_bestowals` VALUES (1858, '2014-09-06', NULL, NULL, 'Harvest Days', 428, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1859, '2014-09-06', NULL, NULL, 'Harvest Days', 574, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (1861, '2014-01-11', '', '', '12th Night', 621, 232, '');
INSERT INTO `op_bestowals` VALUES (1862, '2015-01-03', '', '', '12th Night', 651, 232, '');
INSERT INTO `op_bestowals` VALUES (1863, '2015-01-03', '', '', '12th Night', 645, 232, 'Youth');
INSERT INTO `op_bestowals` VALUES (1864, '2015-01-03', '', '', '12th Night', 652, 190, '');
INSERT INTO `op_bestowals` VALUES (1865, '2015-01-03', '', '', '12th Night', 574, 190, '');
INSERT INTO `op_bestowals` VALUES (1866, '2015-01-03', '', '', '12th Night', 594, 191, '');
INSERT INTO `op_bestowals` VALUES (1867, '2015-01-03', '', '', '12th Night', 33, 191, '');
INSERT INTO `op_bestowals` VALUES (1868, '2015-01-03', '', '', '12th Night', 419, 290, '');
INSERT INTO `op_bestowals` VALUES (1869, '2014-01-11', '', '', '12th Night', 649, 232, 'Youth');
INSERT INTO `op_bestowals` VALUES (1870, '2013-07-31', '', '', 'Pennsic', 276, 288, '');
INSERT INTO `op_bestowals` VALUES (1871, '2001-03-17', '', '', 'Sheep & Easy', 456, 191, '');
INSERT INTO `op_bestowals` VALUES (1872, '2013-11-02', '', '', 'Baronial Championships', 650, 193, '');
INSERT INTO `op_bestowals` VALUES (1873, '2013-11-02', '', '', 'Baronial Championships', 633, 222, '');
INSERT INTO `op_bestowals` VALUES (1874, '2015-09-12', '', '', 'Harvest Days', 624, 223, 'Long bow');
INSERT INTO `op_bestowals` VALUES (1875, '2015-09-12', '', '', 'Harvest Days', 428, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1876, '2015-09-12', '', '', 'Harvest Days', 644, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (1877, '2016-01-09', '', '', '12th Night', 456, 232, '');
INSERT INTO `op_bestowals` VALUES (1878, '2016-01-09', '', '', '12th Night', 653, 232, 'Youth');
INSERT INTO `op_bestowals` VALUES (1879, '2016-01-09', '', '', '12th Night', 654, 190, '');
INSERT INTO `op_bestowals` VALUES (1880, '2016-01-09', '', '', '12th Night', 655, 191, '');
INSERT INTO `op_bestowals` VALUES (1881, '2016-01-09', '', '', '12th Night', 656, 291, '');
INSERT INTO `op_bestowals` VALUES (1882, '2015-03-28', '', '', 'Ceilidh', 622, 234, '');
INSERT INTO `op_bestowals` VALUES (1883, '2014-11-15', '', '', 'Baronial Championships', 553, 222, '');
INSERT INTO `op_bestowals` VALUES (1884, '2014-11-15', '', '', 'Baronial Championships', 657, 193, '');
INSERT INTO `op_bestowals` VALUES (1885, '2014-11-15', '', '', 'Baronial Championships', 658, 190, '');
INSERT INTO `op_bestowals` VALUES (1886, '2014-11-15', '', '', 'Baronial Championships', 659, 190, '');
INSERT INTO `op_bestowals` VALUES (1887, '2014-11-15', '', '', 'Baronial Championships', 639, 190, '');
INSERT INTO `op_bestowals` VALUES (1888, '2014-11-15', '', '', 'Baronial Championships', 624, 190, '');
INSERT INTO `op_bestowals` VALUES (1889, '2015-11-07', '', '', 'Baronial Championships', 601, 222, '');
INSERT INTO `op_bestowals` VALUES (1890, '2015-06-20', '', '', 'Push for Pennsic', 661, 287, '');
INSERT INTO `op_bestowals` VALUES (1891, '2015-06-20', '', '', 'Push for Pennsic', 662, 287, '');
INSERT INTO `op_bestowals` VALUES (1892, '2015-06-20', '', '', 'Push for Pennsic', 663, 191, '');
INSERT INTO `op_bestowals` VALUES (1893, '2015-06-20', '', '', 'Push for Pennsic', 339, 191, '');
INSERT INTO `op_bestowals` VALUES (1894, '2015-06-20', '', '', 'Push for Pennsic', 638, 191, '');
INSERT INTO `op_bestowals` VALUES (1895, '2015-06-20', '', '', 'Push for Pennsic', 665, 190, '');
INSERT INTO `op_bestowals` VALUES (1896, '2015-06-20', '', '', 'Push for Pennsic', 666, 193, '');
INSERT INTO `op_bestowals` VALUES (1897, '2015-06-20', '', '', 'Push for Pennsic', 667, 193, '');
INSERT INTO `op_bestowals` VALUES (1898, '2015-06-20', '', '', 'Push for Pennsic', 668, 233, '');
INSERT INTO `op_bestowals` VALUES (1954, '2012-08-08', '', '', 'Pennsic 41', 555, 192, '');
INSERT INTO `op_bestowals` VALUES (1953, '2014-06-14', NULL, NULL, NULL, 683, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1904, '2014-03-29', '', '', 'Grand Tournament of the Unicorn', 669, 233, '');
INSERT INTO `op_bestowals` VALUES (1905, '2014-03-29', '', '', 'Grand Tournament of the Unicorn', 670, 233, '');
INSERT INTO `op_bestowals` VALUES (1906, '2015-09-12', '', '', 'Harvest Days', 24, 293, '');
INSERT INTO `op_bestowals` VALUES (1907, '2015-09-12', '', '', 'Harvest Days', 33, 293, '');
INSERT INTO `op_bestowals` VALUES (1908, '2015-09-12', '', '', 'Harvest Days', 54, 293, '');
INSERT INTO `op_bestowals` VALUES (1909, '2015-09-12', '', '', 'Harvest Days', 98, 293, '');
INSERT INTO `op_bestowals` VALUES (1910, '2015-09-12', '', '', 'Harvest Days', 129, 293, '');
INSERT INTO `op_bestowals` VALUES (1911, '2015-09-12', '', '', 'Harvest Days', 149, 293, '');
INSERT INTO `op_bestowals` VALUES (1912, '2015-09-12', '', '', 'Harvest Days', 217, 293, '');
INSERT INTO `op_bestowals` VALUES (1913, '2015-09-12', '', '', 'Harvest Days', 235, 293, '');
INSERT INTO `op_bestowals` VALUES (1914, '2015-09-12', '', '', 'Harvest Days', 242, 293, '');
INSERT INTO `op_bestowals` VALUES (1915, '2015-09-12', '', '', 'Harvest Days', 315, 293, '');
INSERT INTO `op_bestowals` VALUES (1916, '2015-09-12', '', '', 'Harvest Days', 335, 293, '');
INSERT INTO `op_bestowals` VALUES (1917, '2015-09-12', '', '', 'Harvest Days', 336, 293, '');
INSERT INTO `op_bestowals` VALUES (1918, '2015-09-12', '', '', 'Harvest Days', 389, 293, '');
INSERT INTO `op_bestowals` VALUES (1919, '2015-09-12', '', '', 'Harvest Days', 409, 293, '');
INSERT INTO `op_bestowals` VALUES (1920, '2015-09-12', '', '', 'Harvest Days', 428, 293, '');
INSERT INTO `op_bestowals` VALUES (1921, '2015-09-12', '', '', 'Harvest Days', 433, 293, '');
INSERT INTO `op_bestowals` VALUES (1922, '2015-09-12', '', '', 'Harvest Days', 484, 293, '');
INSERT INTO `op_bestowals` VALUES (1923, '2015-09-12', '', '', 'Harvest Days', 497, 293, '');
INSERT INTO `op_bestowals` VALUES (1924, '2015-09-12', '', '', 'Harvest Days', 515, 293, '');
INSERT INTO `op_bestowals` VALUES (1925, '2015-09-12', '', '', 'Harvest Days', 522, 293, '');
INSERT INTO `op_bestowals` VALUES (1926, '2015-09-12', '', '', 'Harvest Days', 527, 293, '');
INSERT INTO `op_bestowals` VALUES (1927, '2015-09-12', '', '', 'Harvest Days', 555, 293, '');
INSERT INTO `op_bestowals` VALUES (1928, '2015-09-12', '', '', 'Harvest Days', 574, 293, '');
INSERT INTO `op_bestowals` VALUES (1929, '2015-09-12', '', '', 'Harvest Days', 583, 293, '');
INSERT INTO `op_bestowals` VALUES (1930, '2015-09-12', '', '', 'Harvest Days', 584, 293, '');
INSERT INTO `op_bestowals` VALUES (1931, '2015-09-12', '', '', 'Harvest Days', 624, 293, '');
INSERT INTO `op_bestowals` VALUES (1932, '2015-09-12', '', '', 'Harvest Days', 642, 293, '');
INSERT INTO `op_bestowals` VALUES (1933, '2015-09-12', '', '', 'Harvest Days', 260, 293, '');
INSERT INTO `op_bestowals` VALUES (1934, '2015-09-12', '', '', 'Harvest Days', 276, 293, '');
INSERT INTO `op_bestowals` VALUES (1935, '2015-09-12', '', '', 'Harvest Days', 448, 293, '');
INSERT INTO `op_bestowals` VALUES (1936, '2015-09-12', '', '', 'Harvest Days', 470, 293, '');
INSERT INTO `op_bestowals` VALUES (1937, '2015-09-12', '', '', 'Harvest Days', 471, 293, '');
INSERT INTO `op_bestowals` VALUES (1938, '2015-09-12', '', '', 'Harvest Days', 488, 293, '');
INSERT INTO `op_bestowals` VALUES (1939, '2015-09-12', '', '', 'Harvest Days', 558, 293, '');
INSERT INTO `op_bestowals` VALUES (1940, '2015-09-12', '', '', 'Harvest Days', 631, 293, '');
INSERT INTO `op_bestowals` VALUES (1941, '2015-09-12', '', '', 'Harvest Days', 671, 293, '');
INSERT INTO `op_bestowals` VALUES (1942, '2015-09-12', '', '', 'Harvest Days', 672, 293, '');
INSERT INTO `op_bestowals` VALUES (1943, '2015-09-12', '', '', 'Harvest Days', 673, 293, '');
INSERT INTO `op_bestowals` VALUES (1944, '2015-09-12', '', '', 'Harvest Days', 674, 293, '');
INSERT INTO `op_bestowals` VALUES (1945, '2015-09-12', '', '', 'Harvest Days', 675, 293, '');
INSERT INTO `op_bestowals` VALUES (1946, '2015-09-12', '', '', 'Harvest Days', 676, 293, '');
INSERT INTO `op_bestowals` VALUES (1947, '2015-09-12', '', '', 'Harvest Days', 677, 293, '');
INSERT INTO `op_bestowals` VALUES (1948, '2015-09-12', '', '', 'Harvest Days', 678, 293, '');
INSERT INTO `op_bestowals` VALUES (1949, '2015-09-12', '', '', 'Harvest Days', 679, 293, '');
INSERT INTO `op_bestowals` VALUES (1950, '2015-09-12', '', '', 'Harvest Days', 680, 293, '');
INSERT INTO `op_bestowals` VALUES (1951, '2015-09-12', '', '', 'Harvest Days', 681, 293, '');
INSERT INTO `op_bestowals` VALUES (1952, '2015-09-12', '', '', 'Harvest Days', 682, 293, '');
INSERT INTO `op_bestowals` VALUES (1955, '2015-08-05', '', '', 'Pennsic 44', 622, 192, '');
INSERT INTO `op_bestowals` VALUES (1956, '2015-08-05', '', '', 'Pennsic 44', 632, 192, '');
INSERT INTO `op_bestowals` VALUES (1957, '2015-08-05', '', '', 'Pennsic 44', 522, 192, '');
INSERT INTO `op_bestowals` VALUES (1958, '2015-08-05', '', '', 'Pennsic 44', 474, 192, '');
INSERT INTO `op_bestowals` VALUES (1959, '2015-08-05', '', '', 'Pennsic 44', 684, 291, '');
INSERT INTO `op_bestowals` VALUES (1960, '2013-03-23', '', '', 'Grand Tournament of the Unicorn', 659, 233, '');
INSERT INTO `op_bestowals` VALUES (1961, '2014-04-19', NULL, NULL, NULL, 632, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1962, '2017-01-21', NULL, NULL, 'Spirit of 12th Night', 635, 232, 'Youth');
INSERT INTO `op_bestowals` VALUES (1963, '2017-01-21', NULL, NULL, 'Spirit of 12th Night', 339, 232, NULL);
INSERT INTO `op_bestowals` VALUES (1981, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 691, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1965, '2016-04-24', NULL, NULL, 'Ceilidh', 669, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1966, '2016-04-24', NULL, NULL, 'Ceilidh', 685, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1967, '2016-04-24', NULL, NULL, 'Ceilidh', 686, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1968, '2016-11-05', '', '', 'Baronial Championships', 663, 193, '');
INSERT INTO `op_bestowals` VALUES (1969, '2016-11-05', '', '', 'Baronial Championships', 687, 193, '');
INSERT INTO `op_bestowals` VALUES (1970, '2016-11-05', '', '', 'Baronial Championships', 688, 193, '');
INSERT INTO `op_bestowals` VALUES (1971, '2016-11-05', '', '', 'Baronial Championships', 456, 191, '');
INSERT INTO `op_bestowals` VALUES (1972, '2016-11-05', '', '', 'Baronial Championships', 685, 192, '');
INSERT INTO `op_bestowals` VALUES (1973, '2016-11-05', '', '', 'Baronial Championships', 663, 190, '');
INSERT INTO `op_bestowals` VALUES (1974, '2016-11-05', '', '', 'Baronial Championships', 678, 191, '');
INSERT INTO `op_bestowals` VALUES (1975, '2016-11-05', '', '', 'Baronial Championships', 689, 222, '');
INSERT INTO `op_bestowals` VALUES (1976, '2016-09-12', '', '', 'Harvest Days', 685, 223, 'Long/Recurve');
INSERT INTO `op_bestowals` VALUES (1977, '2016-09-12', '', '', 'Harvest Days', 677, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (1978, '2016-09-12', '', '', 'Harvest Days', 644, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (1979, '2016-09-12', '', '', 'Harvest Days', 690, 287, '');
INSERT INTO `op_bestowals` VALUES (1980, '2016-07-09', '', '', 'Push for Pennsic', 266, 190, '');
INSERT INTO `op_bestowals` VALUES (1982, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 694, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1983, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 692, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1986, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 649, 287, NULL);
INSERT INTO `op_bestowals` VALUES (1987, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 632, 191, NULL);
INSERT INTO `op_bestowals` VALUES (1988, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 456, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1989, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 685, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1990, '2017-04-01', NULL, NULL, 'Grand Tournament of the Unicorn', 693, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1994, '2017-03-25', NULL, NULL, NULL, 656, 234, NULL);
INSERT INTO `op_bestowals` VALUES (1993, '2017-04-01', NULL, NULL, NULL, 83, 289, NULL);
INSERT INTO `op_bestowals` VALUES (1995, '2013-06-01', NULL, NULL, NULL, 695, 233, NULL);
INSERT INTO `op_bestowals` VALUES (1996, '2013-06-22', NULL, NULL, NULL, 695, 193, NULL);
INSERT INTO `op_bestowals` VALUES (1997, '2017-03-25', NULL, NULL, NULL, 628, 192, NULL);
INSERT INTO `op_bestowals` VALUES (1998, '2017-03-25', NULL, NULL, NULL, 442, 190, NULL);
INSERT INTO `op_bestowals` VALUES (1999, '2017-03-25', NULL, NULL, NULL, 696, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2000, '2005-09-10', 't01', NULL, NULL, 11975, 27, 'Aethelmearc');
INSERT INTO `op_bestowals` VALUES (2001, '2017-07-08', NULL, NULL, NULL, 700, 287, NULL);
INSERT INTO `op_bestowals` VALUES (2002, '2017-07-08', NULL, NULL, NULL, 701, 295, NULL);
INSERT INTO `op_bestowals` VALUES (2003, '2017-11-04', NULL, NULL, NULL, 33, 233, NULL);
INSERT INTO `op_bestowals` VALUES (2004, '2017-11-04', NULL, NULL, NULL, 657, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2005, '2017-11-04', NULL, NULL, NULL, 553, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2006, '2017-11-04', NULL, NULL, NULL, 611, 192, NULL);
INSERT INTO `op_bestowals` VALUES (2007, '2017-11-04', NULL, NULL, NULL, 234, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2008, '2017-11-04', NULL, NULL, NULL, 686, 222, NULL);
INSERT INTO `op_bestowals` VALUES (2010, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 678, 232, NULL);
INSERT INTO `op_bestowals` VALUES (2011, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 649, 232, 'Youth');
INSERT INTO `op_bestowals` VALUES (2012, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 406, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2013, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 515, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2014, '2017-01-21', NULL, NULL, NULL, 619, 296, NULL);
INSERT INTO `op_bestowals` VALUES (2015, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 669, 296, NULL);
INSERT INTO `op_bestowals` VALUES (2016, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 704, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2017, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 703, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2018, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 656, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2019, '2018-01-06', NULL, NULL, 'Flaming Gryphon Twelfth Night', 697, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2020, '2015-08-05', NULL, NULL, 'Pennsic 44', 562, 192, NULL);
INSERT INTO `op_bestowals` VALUES (2021, '2017-07-08', NULL, NULL, NULL, 685, 293, NULL);
INSERT INTO `op_bestowals` VALUES (2022, '2017-07-08', NULL, NULL, NULL, 693, 293, NULL);
INSERT INTO `op_bestowals` VALUES (2023, '2017-07-08', NULL, NULL, NULL, 300, 293, NULL);
INSERT INTO `op_bestowals` VALUES (2024, '2018-07-07', NULL, NULL, NULL, 234, 293, NULL);
INSERT INTO `op_bestowals` VALUES (2025, '2019-07-06', NULL, NULL, NULL, 705, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2026, '2019-07-06', NULL, NULL, NULL, 544, 295, NULL);
INSERT INTO `op_bestowals` VALUES (2027, '2019-07-06', NULL, NULL, NULL, 601, 192, NULL);
INSERT INTO `op_bestowals` VALUES (2028, '2019-07-06', NULL, NULL, NULL, 645, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2029, '2019-07-06', NULL, NULL, NULL, 706, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2030, '2019-08-07', NULL, NULL, NULL, 707, 287, NULL);
INSERT INTO `op_bestowals` VALUES (2031, '2019-09-07', NULL, NULL, NULL, 195, 293, NULL);
INSERT INTO `op_bestowals` VALUES (2032, '2019-09-07', NULL, NULL, NULL, 708, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (2033, '2019-09-07', NULL, NULL, NULL, 195, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (2034, '2019-09-07', NULL, NULL, NULL, 685, 223, 'Long/Recurve');
INSERT INTO `op_bestowals` VALUES (2035, '2019-09-07', NULL, NULL, NULL, 709, 233, NULL);
INSERT INTO `op_bestowals` VALUES (2036, '2019-09-07', NULL, NULL, NULL, 710, 233, NULL);
INSERT INTO `op_bestowals` VALUES (2037, '2019-11-02', NULL, NULL, NULL, 456, 222, NULL);
INSERT INTO `op_bestowals` VALUES (2038, '2020-01-04', NULL, NULL, NULL, 699, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2039, '2020-01-04', NULL, NULL, NULL, 695, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2040, '2020-01-04', NULL, NULL, NULL, 558, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2041, '2020-01-04', NULL, NULL, NULL, 690, 232, 'Youth');
INSERT INTO `op_bestowals` VALUES (2042, '2020-01-04', NULL, NULL, NULL, 406, 232, NULL);
INSERT INTO `op_bestowals` VALUES (2043, '2020-01-04', NULL, NULL, NULL, 332, 296, NULL);
INSERT INTO `op_bestowals` VALUES (2044, '2020-07-11', NULL, NULL, NULL, 652, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2045, '2020-07-11', NULL, NULL, NULL, 659, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2046, '2020-07-11', NULL, NULL, NULL, 454, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2047, '2021-01-23', NULL, NULL, NULL, 711, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2048, '2021-01-23', NULL, NULL, NULL, 712, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2049, '2021-01-23', NULL, NULL, NULL, 713, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2050, '2021-01-23', NULL, NULL, NULL, 406, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2051, '2021-01-23', NULL, NULL, NULL, 276, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2052, '2021-07-08', NULL, NULL, NULL, 338, 288, NULL);
INSERT INTO `op_bestowals` VALUES (2053, '2017-09-09', NULL, NULL, NULL, 693, 223, 'Long/Recurve');
INSERT INTO `op_bestowals` VALUES (2054, '2017-09-09', NULL, NULL, NULL, 583, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (2055, '2017-09-09', NULL, NULL, NULL, 645, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (2056, '2018-09-08', NULL, NULL, NULL, 713, 223, 'Long/Recurve');
INSERT INTO `op_bestowals` VALUES (2057, '2018-09-08', NULL, NULL, NULL, 583, 223, 'Crossbow');
INSERT INTO `op_bestowals` VALUES (2058, '2018-09-08', NULL, NULL, NULL, 690, 223, 'Youth');
INSERT INTO `op_bestowals` VALUES (2060, '2018-04-14', NULL, NULL, NULL, 456, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2061, '2018-04-14', NULL, NULL, NULL, 686, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2062, '2018-04-14', NULL, NULL, NULL, 678, 291, NULL);
INSERT INTO `op_bestowals` VALUES (2063, '2018-04-14', NULL, NULL, NULL, 714, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2064, '2008-02-01', NULL, '2008-02-??', NULL, 491, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2065, '2018-07-07', NULL, NULL, NULL, 685, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2066, '2018-07-07', NULL, NULL, NULL, 616, 295, NULL);
INSERT INTO `op_bestowals` VALUES (2067, '2018-07-07', NULL, NULL, NULL, 715, 295, 'Youth');
INSERT INTO `op_bestowals` VALUES (2068, '2018-07-07', NULL, NULL, NULL, 715, 0, NULL);
INSERT INTO `op_bestowals` VALUES (2069, '2018-08-08', NULL, NULL, NULL, 699, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2070, '2018-11-03', NULL, NULL, NULL, 716, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2071, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `op_bestowals` VALUES (2072, '2018-11-03', NULL, NULL, NULL, 717, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2073, '2018-11-03', NULL, NULL, NULL, 718, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2074, '2018-11-03', NULL, NULL, NULL, 611, 290, NULL);
INSERT INTO `op_bestowals` VALUES (2075, '2018-11-03', NULL, NULL, NULL, 686, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2076, '2018-11-03', NULL, NULL, NULL, 82, 222, NULL);
INSERT INTO `op_bestowals` VALUES (2077, '2019-01-05', NULL, NULL, NULL, 33, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2078, '2019-01-05', NULL, NULL, NULL, 347, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2079, '2019-01-05', NULL, NULL, NULL, 646, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2080, '2019-01-05', NULL, NULL, NULL, 704, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2081, '2019-01-05', NULL, NULL, NULL, 419, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2082, '2019-01-05', NULL, NULL, NULL, 711, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2083, '2019-01-05', NULL, NULL, NULL, 716, 296, NULL);
INSERT INTO `op_bestowals` VALUES (2084, '2019-01-05', NULL, NULL, NULL, 697, 232, NULL);
INSERT INTO `op_bestowals` VALUES (2085, '2019-02-23', NULL, NULL, NULL, 719, 0, NULL);
INSERT INTO `op_bestowals` VALUES (2086, '2019-03-23', NULL, NULL, NULL, 720, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2087, '2019-03-23', NULL, NULL, NULL, 719, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2088, '2019-03-23', NULL, NULL, NULL, 721, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2089, '2019-03-23', NULL, NULL, NULL, 722, 234, NULL);
INSERT INTO `op_bestowals` VALUES (2090, '2019-03-23', NULL, NULL, NULL, 646, 289, NULL);
INSERT INTO `op_bestowals` VALUES (2091, '2018-03-01', NULL, '2018-03-??', NULL, 622, 234, NULL);
INSERT INTO `op_bestowals` VALUES (2092, '2019-04-13', NULL, NULL, NULL, 697, 291, NULL);
INSERT INTO `op_bestowals` VALUES (2093, '2021-11-06', NULL, NULL, NULL, 693, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2094, '2021-11-06', NULL, NULL, NULL, 177, 293, NULL);
INSERT INTO `op_bestowals` VALUES (2095, '2021-11-06', NULL, NULL, NULL, 723, 193, NULL);
INSERT INTO `op_bestowals` VALUES (2096, '2021-11-06', NULL, NULL, NULL, 690, 191, NULL);
INSERT INTO `op_bestowals` VALUES (2097, '2021-11-06', NULL, NULL, NULL, 33, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2098, '2021-11-06', NULL, NULL, NULL, 724, 190, NULL);
INSERT INTO `op_bestowals` VALUES (2099, '2021-11-06', NULL, NULL, NULL, 685, 222, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_calendar`
-- 

CREATE TABLE `op_calendar` (
  `eventID` int(11) NOT NULL auto_increment,
  `event` varchar(120) collate utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY  (`eventID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=62 ;

-- 
-- Dumping data for table `op_calendar`
-- 

INSERT INTO `op_calendar` VALUES (1, 'Butts & Bales', '2011-06-18');
INSERT INTO `op_calendar` VALUES (2, 'Push for Pennsic', '2011-07-09');
INSERT INTO `op_calendar` VALUES (3, 'Pennsic War', '2011-08-10');
INSERT INTO `op_calendar` VALUES (22, 'Harvest Days/Tournament of Chivalry', '2011-09-10');
INSERT INTO `op_calendar` VALUES (26, 'Twelfth Night', '2012-01-07');
INSERT INTO `op_calendar` VALUES (27, 'Winged Hills Collegium', '2012-03-24');
INSERT INTO `op_calendar` VALUES (25, 'Baronial Championship', '2011-11-12');
INSERT INTO `op_calendar` VALUES (28, 'Ceilidh', '2012-03-10');
INSERT INTO `op_calendar` VALUES (29, 'Grand Tournament of the Unicorn', '2012-03-31');
INSERT INTO `op_calendar` VALUES (30, 'Harvest Days / Tournament of Chivalry', '2013-09-07');
INSERT INTO `op_calendar` VALUES (31, 'Push for Pennsic', '2015-06-20');
INSERT INTO `op_calendar` VALUES (32, 'Pennsic', '2015-08-05');
INSERT INTO `op_calendar` VALUES (33, 'Harvest Days', '2015-09-12');
INSERT INTO `op_calendar` VALUES (34, 'Grand Tournament of the Unicorn', '2016-04-02');
INSERT INTO `op_calendar` VALUES (35, 'Ceilidh', '2016-04-23');
INSERT INTO `op_calendar` VALUES (36, 'Push for Pennsic', '2016-07-09');
INSERT INTO `op_calendar` VALUES (37, 'Harvest Days', '2016-09-10');
INSERT INTO `op_calendar` VALUES (38, 'Pennsic (Baronial Court)', '2016-08-11');
INSERT INTO `op_calendar` VALUES (39, 'Coronation', '2016-10-15');
INSERT INTO `op_calendar` VALUES (40, 'Spirit of 12th Night', '2017-01-21');
INSERT INTO `op_calendar` VALUES (41, 'Keep Calm and Ceilidh On', '2017-03-25');
INSERT INTO `op_calendar` VALUES (42, 'Grand Tournament of the Unicorn', '2017-04-01');
INSERT INTO `op_calendar` VALUES (43, 'Spring Coronation', '2017-05-06');
INSERT INTO `op_calendar` VALUES (44, 'Push for Pennsic', '2017-07-08');
INSERT INTO `op_calendar` VALUES (45, 'Pennsic War 46', '2017-08-09');
INSERT INTO `op_calendar` VALUES (46, 'Harvest Days', '2017-09-09');
INSERT INTO `op_calendar` VALUES (50, 'Baronial Championships', '2017-11-04');
INSERT INTO `op_calendar` VALUES (51, 'Baronial Twelfth Night', '2018-01-06');
INSERT INTO `op_calendar` VALUES (52, 'Winged Hills Collegium', '2018-03-10');
INSERT INTO `op_calendar` VALUES (53, 'Keep Calm and Ceilidh On', '2018-03-24');
INSERT INTO `op_calendar` VALUES (54, 'Grand Tournament of the Unicorn', '2018-04-14');
INSERT INTO `op_calendar` VALUES (55, 'Push for Pennsic', '2018-07-07');
INSERT INTO `op_calendar` VALUES (56, 'Pennsic', '2018-08-08');
INSERT INTO `op_calendar` VALUES (57, 'Harvest Days', '2018-09-08');
INSERT INTO `op_calendar` VALUES (58, 'Baronial Championships', '2018-11-03');
INSERT INTO `op_calendar` VALUES (59, 'Baronial Twelfth Night', '2019-01-12');
INSERT INTO `op_calendar` VALUES (60, 'Flaming Gryphon Baronial Championship', '2022-11-05');
INSERT INTO `op_calendar` VALUES (61, 'Baronial Twelfth Night', '2023-01-14');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_collection`
-- 

CREATE TABLE `op_collection` (
  `collectionID` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`collectionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- Dumping data for table `op_collection`
-- 

INSERT INTO `op_collection` VALUES (1, 'System Administrator', '');
INSERT INTO `op_collection` VALUES (2, 'Baron & Baroness', '');
INSERT INTO `op_collection` VALUES (3, 'Baronial Pursuivant', '');
INSERT INTO `op_collection` VALUES (4, 'Clerk of the Precedence', '');
INSERT INTO `op_collection` VALUES (5, 'Baronial Signet', '');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_collection2permission`
-- 

CREATE TABLE `op_collection2permission` (
  `collectionID` int(11) NOT NULL default '0',
  `permissionID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`collectionID`,`permissionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `op_collection2permission`
-- 

INSERT INTO `op_collection2permission` VALUES (1, 1);
INSERT INTO `op_collection2permission` VALUES (1, 5);
INSERT INTO `op_collection2permission` VALUES (1, 6);
INSERT INTO `op_collection2permission` VALUES (1, 7);
INSERT INTO `op_collection2permission` VALUES (2, 2);
INSERT INTO `op_collection2permission` VALUES (2, 3);
INSERT INTO `op_collection2permission` VALUES (2, 4);
INSERT INTO `op_collection2permission` VALUES (3, 2);
INSERT INTO `op_collection2permission` VALUES (3, 3);
INSERT INTO `op_collection2permission` VALUES (3, 4);
INSERT INTO `op_collection2permission` VALUES (3, 5);
INSERT INTO `op_collection2permission` VALUES (4, 1);
INSERT INTO `op_collection2permission` VALUES (4, 8);
INSERT INTO `op_collection2permission` VALUES (5, 2);
INSERT INTO `op_collection2permission` VALUES (5, 6);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_configuration`
-- 

CREATE TABLE `op_configuration` (
  `key` varchar(20) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Dumping data for table `op_configuration`
-- 

INSERT INTO `op_configuration` VALUES ('adminName', 'Dafydd Blaidd');
INSERT INTO `op_configuration` VALUES ('adminEmail', 'dafydd@midrealm.org');
INSERT INTO `op_configuration` VALUES ('libdir', 'libs');
INSERT INTO `op_configuration` VALUES ('cssdir', 'styles');
INSERT INTO `op_configuration` VALUES ('imgdir', 'images');
INSERT INTO `op_configuration` VALUES ('groupNameShort', 'Flaming Gryphon');
INSERT INTO `op_configuration` VALUES ('groupNameLong', 'The Barony of the Flaming Gryphon');
INSERT INTO `op_configuration` VALUES ('admdir', 'admin');
INSERT INTO `op_configuration` VALUES ('incdir', 'includes');
INSERT INTO `op_configuration` VALUES ('coronet', 'Edward and Allegra');
INSERT INTO `op_configuration` VALUES ('scriptdir', 'js');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_groups`
-- 

CREATE TABLE `op_groups` (
  `groupID` int(11) NOT NULL auto_increment,
  `groupName` varchar(120) collate utf8_unicode_ci NOT NULL,
  `groupDesignator` varchar(120) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`groupID`),
  UNIQUE KEY `groupName` (`groupName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `op_groups`
-- 

INSERT INTO `op_groups` VALUES (1, 'Havenholde', 'Marche of');
INSERT INTO `op_groups` VALUES (2, 'Hawkes Keye', 'Marche of');
INSERT INTO `op_groups` VALUES (3, 'Norborough', 'Marche of');
INSERT INTO `op_groups` VALUES (4, 'Saint Joan', 'College of');
INSERT INTO `op_groups` VALUES (5, 'Unicorn', 'Marche of');
INSERT INTO `op_groups` VALUES (6, 'Winged Hills', 'Marche of');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_honorimages`
-- 

CREATE TABLE `op_honorimages` (
  `imageID` bigint(20) unsigned NOT NULL auto_increment,
  `honorkey` int(11) NOT NULL,
  `filename` varchar(255) collate utf8_unicode_ci NOT NULL,
  `mime_type` varchar(255) collate utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_data` longblob NOT NULL,
  PRIMARY KEY  (`imageID`),
  KEY `filename` (`filename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

-- 
-- Dumping data for table `op_honorimages`
-- 

INSERT INTO `op_honorimages` VALUES (6, 190, 'brand.gif', 'image/gif', 3238, 0x4749463839615c005c00f70000c0c0c00808081010101818182121213131313939394a4a4a5252525a5a5a6363636b6b6b7373737b7b7b8484848c8c8c9494949c9c9ca5a5a5adadadb5b5b5bdbdbdc6c6c6cececed6d6d6dededee7e7e7efefeff7f7f7efe7e7cec6c6d6cece948c8ca59c9cc6b5b5ad9c9cd6bdbd8c73737b6363d6adadbd9494d69c9c392929ce8484211010e729295a00007b0000e70000ef0000ff0000e71008e70800ff0800d64239b53129ce2118ef1000c66b63e72918d62110b5736b9c524aef1800ff1800ad7b7384524abd4a39d63118ef2100f72100b58c84d6a59c8c635ade8c7bef4a29d6b5ad73524aad6b5ade735ae75a39ef3100ff3100945a4aad5a42ce3910f74210de3100f73900ff3900bd5231ad4221ef3900b55229c6b5ada55a39ef6321ce5218de4a08ef5208ff5200de8c63e77339ef5200e7bda5dea584ef6308ce5200ef5a00ff6300b57b52ad52108c6b52d69463c67331ef8429f77b10de6b08ef7308ff7b08e76b00ef6b00f77300ff7300d6bda56b5a4a211810d68c4ad68439e78c39d67b29d67318ff7b00b5ada57b736b5a4a399c7b5ad6a573ad845ae79c52efe7deefad63ad7331ef9c42f79421f78c10efc694ce7b18e78408ef8400ff8c00ceb594bd7b21d68410ef8c00f78c00e7d6bda56300ce7b0094846bb59c739c6b18ef9400ff9c00a59c8c9c7b42de9c21de9408e79400ef9c009c9484deceade7bd6be7b552e7ad39dea531ffad00f7efdeefd69ce7ce94efad18f7ad08f7ad00dec68cceb573cead5affb500e7bd42f7bd10efb508ffbd08d6ceb5efc64aefbd21e7ce73efbd00ffc600c6bd94dec663c6ad31ad9410debd10efc608f7ce00c6bd8cbdad52a59431ceb521e7c608bdb57bbdad42b5a539ad9c21a59418bda500ceb500ffde00c6bd73ad9c08ad9c00b5a500dec600e7ce00f7de00ffe700e7de73d6ce5acebd00e7d600efde00ffef00e7de52ded639efe731ded621e7de10f7ef18efe708f7ef08fff700efefe7cecec6d6d6cee7e7deb5b5ad94948c8c8c84e7e7c6dedebdceceadd6d69cd6d67badad5a007b7b00848400000021f90401000000002c000000005c005c000008ff0001081c48b0a0c18308132a5cc8b0a1c3870bff499c489122c48b18330eacc8a1a3c78f1f2b6a1c4952e044902853a29c58b26543892a416e38604043cc90ff5cea2478f2e647091219f8c4997327499843413e9088202948894633fe738ad2824409549f467d8834eb4f085e9f16dd9a706ad88e1a2a7ca440e16cc7b1640bfe6bebf6c03fb01ce809f837c12d07b871272af03be0df010c9c0c491cecb63060a37c253af0abe2df825fd148496cb0c16d65068f5dfe8b30d3805f0e10545c28c66f9581021836740e1b414506ab51ff55607cba638679d99ccd8a772143060db3bd76de1d5ae35409a67b7390cda95935567c3c5cc0a001b95be87f4577ff7440a0b76c0df3f04dd3d62a113d0bdb33c04b9e95fcdb92663928c87f3616230d1960c00435dcbc12070a1454b0dd3cc8d197d47e1e35e7507e06fc63815b8c70c24980ab21338e297f1c21c17bbffc729c6c5955786178ce7984c15e93f94453061f6d708f247c7c704105a068d34d268004118104145ca28f3cc66d90c10105d078d38bffc4c8e245fc4d2051743101f58f501d6d308f2c8da42102058594628d37a808820808104880cb3ef92c0881440bf864e53f584e392148fbfd4380932a2df54f53d3c1738f308f9481c2084784724d39a80c4245090f40908b38c5288841034cf9d4e79f2141c4df5f133d709355ff6035dd3cfa003387193af4ffe04627dd7c934a1d5af8508222afa0130d3d0a6a19814f14991a21577cfe334000040cb0a24a12e0b58106f8ec134c24600c31c41b9e94f38d2d788471830972d0a24e33214c6001061048a9d27ecb36fbac9e6581a48100102c20c005041c90525a6b4da0c12ae7f062c9183b10b18626cb80334a1e57e020c420b4ac234d3ded5a70620574d98bafbefcfa1b6a4428d9f480001c7887d201010ccb01057b41704b3a068f61c40e6ad4828d39b0e8c1c50c5bd861cb3ac77cf2d9051a4c1040007d95ccc1c9293b28a149315590c04d04e0791c68fff4610c3bc45842861140b0610936e0c0b207163370b1872dee3c83c85e05506001d7bca164754c538fff9ad5671850a0251cbbb81336194000d1c62868c34248163564a1872edf24538a1f864910410492b9d5b75fb5dd06810606a8904830868b9df8e23b8fb207e45910a2cb3bc93872c8001040d000060618e0205512faaddccb0a28c94419bcbc73f8ea8cf3fc7ae47be8628e329824d140040e20d0ddef5935277c58d0c193011281f8a2bcea8a339ef6e33548b1072cef2833c9140d40c04093369d16daf76191a7c1074a9883f99697bec63d2f0bd17bc73232f105433c200103e00ef7ba6710fe792501ffc000099e4007629c0f71e90387c3d8173be91183125d30c10354a432bf3cc68254d94001f8720228dc617604649df36097406c50220c266840d6ff22908109024f2e43a149fe6202a50520610937fc20f31a47c2f799031b9b0843131410807f284082315122b178e2132dd5e9265a32c00aaca0070fe6507d6ae3210e37318626d8e51f0540da04cd38c68df84450848a0906ffc18216588110c430c71b5b4742d95df16038a8cc3f043081e304aa5337810b0c51a52a956c60222f9081146427c502ee107ab3c386d86ae082892c008c55b94a1fa96627bc78125e0190010cb860875eb4a317951843118aa0064d78831ca8b0c3cfae608754ac63189418030d62b01701082002b151c9046cc9373fc604601ea9805a509201013860901549a73ad729910034600006b88083c0d911716692962ab18bcb2ab0ff978e7d646b7b61a740d7598000e4ae0227fa883eebd9cf6e02c082593bc0713865199568200207a0e840373aa803a80002eae20e48223a513a39d48295796505eee42e8f4c0b032b952447d949000428800120d5580b39905298b2f4a437099d0520309302c4444916a04004ba38537506e00009588003224081e23848a84465d23d1fea93e5e4cd9301aa800404d5d48a1cc0a60d7880042a808122a2c4ab49290a0c3b029eae6a000349c55e592962009b3260aa55b524b4f204d4a13ca03c4379e94a2150a1bd16000151ad5f4877aa14c4f671ae1cc06052a695811d8d35a03315c0591550bfb516678929d1ec50e49a14156df6ae79754059fb7ad307ff444041828d896b2f3b1428b5f4ad34e10e5eb7d9d4be4675aad0518d1139e0dbd5e2332677222c4acca824cf9275a0a34deb0428fa559444d7b95cf594440600a894c876509cbd8052670a55a91269011211594cfa445ede12ab54a7926575c53a53bfe6544b9d5449b16669415ccaeb261330d6746e4381fe4a95aac5898082dfa52c6639cba1cff558be04600115c8f723f4e400c7bab3a33e09b4bd0e90c00422a0327b96ec631cf63086c3ebc9a7a1ccad2bbb4b4760962ad89a989d5065c0032650a1077486025df4a74b6dcc011ca7449343d95b4c48ba01bc6d00aff01d285a214081c218606b8ba9dad5664963ca6c09a65a72407529600f810e00ff010fae40d616a0de3b4df82c80c16c506d33540e30093977ad403d044a80e3aed501aaa940567da7bf0a4a07ae2e85ed9c689a00214b605d181071773de768e970a0ae1e0190053443d3daaacbad11902ea73bdd1bfbd4a8b3485e6700b61cd8ceb8ba37def3f47ee8a358a6a673d6a485b05b31b85ca7044f3abbed52a07d5d9159c7598f1b48f6aa11f2bdd2a03625cd05315eb5f46b43af0b3917805157c5f864857c4f4b5c82ee9564c2e0751ec0d4dffef4bad1181401930c258014afb2cabbe675faf7d49da16f79f18d49addc1b249cbcaf4426dc6f75a255d8c819704c12be9297a4649be22580859fa5587fc7993b1a30f085a1cbcd63ed092de3ffac67ca410c630bf42bd2783d2f5fa3aa56b6de15c621fbd7ca5d4caf832f54c40d7d2b93777ae50eabd300429eecb486cebd9ff3732ef711554748aa01ee8af95f9d052d455450bf5a7b8402635609d5ad3eb57a018ebf510a4b751d5311034c15b7c5fec8d9d35c76730b95343439cbb42ec00066074000eeb579dc3d72f7d2d4dddcd3d1f4695e6a81c65ea9d26a8d775620dd732ad155d55981ade3f144da9ce6362b753d3c43a6726bb7889ac7ca52c002aee7f5fe9547f42f81d0e2611d50c0fff5b6563d4b9f7263a1c56b6047b55f80a5057f960a9125ed7e617ced19a05dc97be5457179a89e2d8a57ae11a001533df5b5e30afb914cffad9d6d6c8300869f7b0a461f897abf8daf0fd026b63a39aee73f48576298010c0ae0efe69cc069074faaf8d7cb2be1c6000810000f300005e07efcd77dc7f77d1b501cfa22568145594fa680d1d71389a501127000dbd156124814fe271598f552c691500246811f2817f39712b2b182dcc31227a8131ca182f421122f58811c5583389883081110003b);
INSERT INTO `op_honorimages` VALUES (3, 191, 'plume.gif', 'image/gif', 4244, 0x4749463839615c005c00f70000ffffff0808081010101818182929293939394a4a4a5252525a5a5a6363636b6b6b7373737b7b7b8484848c8c8c9494949c9c9ca5a5a5bdbdbdc6c6c6cececed6d6d6dededef7f7f7fff7f7ada5a5b5adadc6bdbd948c8cc0c0c0f7e7e7decece6b6363635a5a4a42428c7b7bffdede393131efcecea58c8cdebdbdad8c8cffceceefbdbd9c7b7bc69c9c735a5adeadadffc6c6e7adadf7b5b5a57373523939ffadadf7a5a5181010de9494ffa5a58c5a5a845252ef9494ff9c9c291818d67b7bad6363e78484f78c8cde7b7bff8c8cbd6363ad5a5aff8484944a4ad66b6be77373f77b7bde6b6bf77373ff7373f76b6bff6363ef5a5a421818ff5a5aef52523110104a1818a53131e74242f74242ff4242631818e73131731818ef3131ad2121631010d621216b10108410105208085a0808630808c61010730808bd0808080000100000210000310000390000b50000e77b73e7524ad64239c63129bd2118ce6352e76b5ade947bce8463d6946bb5734ad6a57bbd8452423931d6cec67b736b736b63ce9c6bc6945aa57339debd94d6b58cb5844a9c6b31946329d6bd9cad8442a57b39946b297b73631810006b6352524a39a59c84635a424231009c947bad9442a59c7bd6ceadada584423910292100ad9c42312900ada573847b42b5a54abdb57ba59c5aded694d6ce8cded68cd6ce7bcec673635a084a42005a5200c6bd5abdb552ada54ab5ad42a59c39ada5399c9431a59c31948c299c9429948c218c84187b73106b6308bdbdb594948cb5b5a563635aadad9c8c8c7b7b7b6b9c9c84adad8ca5a584c6c69c6b6b528c8c6bc6c694cece94adad7bdede9c84845acece8c949463adad73a5a56b9c9c63cece7bc6c67373734284844acece73c6c66b8c8c4ab5b55abdbd5a949442a5a54abdbd52636329b5b54aadad42848431a5a539949431adad398484296b6b21a5a5318c8c299494299c9c298484217b7b188484185a5a106b6b107373107b7b105a5a086363086b6b081010001818004242004a4a005252005a6308296b6b216b6b107373087b7b007373007b7b00848400000021f9040100001d002c000000005c005c000008ff003b081c48b0a0c18308132a5cc8b0a1c3870bff499c489122c48b18330eac08a0a3c78f1f2b6a1c4952e044902853a29c58b26543892a417a2870c043cc90ff5cea2478f2e647051235f8c4997327499843411e90e8202948894633aec140d5a9c7081227587d1af5219b351ea88ac560f54184ad2b8b764dc8460589b7243c84157b5382848f126ca2f5a8766d41372a600856e136eedcaa2871fd13701700847f06f67a54ec97601b376064d4a82143c6e0c287c97e4c209181070b06fe0d90dc913454bf6c74b8e992a387ed1e3938c320fcf6f0c706122348a8b0e01f01d60080ffd3d077e79a1632ba14e171a4fa11223c7a705ec15b2e5d00330d78ff8030c1020108c82f1410ff38ea1a172d54d8e841648993fb4b961cc9ae9bb077c4175c00400277e9959e80043647921a18d090820932d0b7c4134f4001c5134ee84784762bec16d7581e89701672288908808219fd7301063e7000830c36d457e114345a9821763978d6dd77033440224a3d76842244ff607081056a187349222ff030e114544449058d182eb1617f8651e5811a09fcf8d105ff7429e4511778c01c28a340334a228404f1c4145ac419e51417eac7438ebba9e0dd06ff9420a097004cf04f017f0ef952801e14078828d394820c29a31472071c54c4a9c519745051e5863974e8960723a87143053e85f7674cc00940ea9818a978a405052cff06cc28cf9442caada4989207a561bcf1861754d4b91f9e84d1b0c61a1988a65271ff8c189308418574d13f00202a8100121920cc33cf88e2ad28a598724d2075a4f14618734271a3769d59f15508caa6b4d43f4dc564c1001289c91791d59ec6ec3f6ae4a24c29a58c428a28c88c720d2babe841871772d2f9849d3900d1461b6cb031974a58fda3554c0e5074ea890f51db2f2e02e08b6d09c03ca34ab7b7227c0d2de818124516724ea9ee124c8821061952b0e1c2c6293d20944a174c30c00001e09bc0c886f2f4116a034020c07a012c000a2bd48872abc1a43cf3892ce0d48185a53a3ff1c518439481040b6d7cf05d4776e165a047171c3000050228fff0800077931c11de1754300105011cd040020950028d36aa20ecb5b7a5ac320b3a83d88173c417128186112bacf02162b804104063100410194a7201204053810b9e90c91d216a0105222ce0c0028c0363cd37d4d45a3029c888424d2ce8b08247a55acc89e1154ad4c0dde864b9669a05d0ae1613028da51435edb5bf2a41040f30a0c0012074c24a2c9f346ab0adb7ce0c8b209a73fec4111c7e2a9672c21167dc4d018ac9f740623b0a8c6f7709401f3360718de241aa14d33005c1a8018be4e5210a11c310fea457182dad673ce5390f720c053ec279c0701a7840031480000300a219dcb886a3484130975d6315b578473bbe11080cc6690a1accdf87ffc083a002fd6848250cdf692a70400624d000be60c5379ef1a85140f01a9f58c5fad0910e5908820a38d3999d38a827c498c84b284aa2096f870b0820f0000620062b54510aaf85cb14d4a086ad54410b76a0830f606c1e9d9cb01f0e8e0e0041029482d488b7254e20852b0cc1010e40896c68c35bb782203524588a6bcc421d35639e160659c8e985654b080094ec360240f058808929345f080cb00b67ace21ab59ac6355e418b6f70c315e740473bda410b43c4218ca4e481213dc0274229b2208cf488054a60000bdc6e7ce563a10b43e10a6ad05015df30c7395c418e4f70a315b468873a0e318730068b90ca9c5ea84655aaf58ccc7b52bb0950fe01ff81d34ca08d0e70221c01910dae81eb1aad80052c62b8c96eb4e31dec38841c36474aedecc6586ac8804ff6e92c95f4259a1d995703e4623809b8917707100120ca018b097e821cb388c52cccf18a6ed082139a4807238ef943756d3006523856087c32af7a09309f31e958815e29813636807704b84132ba718e2c7e6315aad0c627c2f109ad9a0315ff78872278aa33276c08086ef80a586ed2b18f1d95953e314bb5cac4d4581ec0740470c62cba710d6aa86215dcd82a2cce718e5ac04313ffa0c721783a4a0c31c10c5b7043504110bb8f186d286a0169dd3c22010bd015960e18c00d44108047fcee15aa585f3758d10d58cc1494b400ab62c94aa72fff74210860d0010b6e50d9cdd2adb2fbea403415c3988e3cc60005c445041ca0001004a004bfc8062da64bd35790831c0a35c72c66418b773842138860acc478508619a8c004610109715107999b14259ad63b4d6a568328c30174010328000280410d5ac0e316ea48473be2718a77c0231eecb8c52dda610f7b84179913bbc20f7643b4d69446beaa71af49501594e100e53801b2a6051e098115b67017c0804639da215375b8b816e840072d14aa8e7a70821d83a8430697a04cb720a623cad18087fff7d6685e809a20340f7a6ab744096820a02080630852cc4b59ccc216eab4853b68718e58c0221df408ab22ea372542f640063e56d691d913c2257b74ffc331092081c043c0d35040b96f14c1949f410b77a0a316e9b8c53b4e610b766c191df0f8c73cd251092684515d44e85419bf54443a6b58b8493923a58f84c2122f0001703c403094418b53ac6215b2a0853a0a5d0f4d4cc216b3880727d2b10a4a350f0a3cae419a4bd4d12227650046a5b42363c9c294220013d0b0462bcc510b73b4630d6ae0843dd8a10e73d8e214eca0052b2e38a527447a373ff608b093f2dea180299529292036cd076a11881a19d458052cfcbb068938621293a8873deae188777ce31a7bb0039d9670e632c6ebdce486f34d04e5cc74d3d580e46377a823610c789bc31dee78c744e6a1897a80750de900073508a10475f100cd24ff8857a006754f7c62da27a95a154a10450102144003e45be1130ff00b643c0316b1b8462cda710b5ba0c31ce648873d24d28e5550a3104a5082106a008394c72be69855f8b3a285b40becb301d8d4391c0d100965c0e215565cc537bad18a9ab622164b87873960018d4204210836a87ab8a1b59cacbfdc5ef80a1300e7b5803be77c01513680a85d118e2b7263dedb45878bd5310978c4101a84c041de2df0e37be5cbef200540c826d2f28f3c6639d7d4c049132f024f6cc214e27ac5bcd5e18e6b9be313f778072c7c490d65bc0005e83dd5e825527a6969fd4b4a639ad38adf11b3c885a900f545020a10803e642382d7f8462bbea1ce4fd242a6eda887ff395821f24400df032b4adad29a1626e67f1469062000dffc06b8946c3640b8a040ea4bac80015c6d18d6d00dda070b2eb67bdc650edca00eff600edaa00e0d74091fd03a1e107ff3f737c0b54ad1741aae033b29415cb8d07c90316cfc374937400ca0f00a49f70ef5400f93e06aef706df2f00e33d60dd6800c1b6001e8e74a1b68696f065737c13d31e11a0b806103f0594ea6422c340022e038dab009cec60ef0700fd42663e9800ee5c00ef5000fdd700c158083a702843ef17ea5721341366404a06e11a74d3c5771cf400d7d95476ec80ad5400cc99009eb900eae600d1ae0857f7281c6e78392a11e6ca664fd624d8607652d7400bd000cc5d088c6fff088d0c00ad20009346000372009d9800ee0c00cfa17404eb1483f2267468437aff44f6e2471068000bb0002ac0802bed000c40008f9a578200008de400eaba00b15807eccc715d0a44a9aa64427f44fcb254b2d640022908ccaa87803500207800009b000c9000ee6600db8c087096710a1e71489543b4c067d879700218000a03649e68800cf15028ca3000ce00de9f00dccd0859e7869dae82560a22f84f359c4a8420cb0000aa000090090010990c6f18fffb800d1800edf600dba2017f3d88307b18d3ec170a5673b23e664e4e3000dd0000cd0911db938aad1910b3092be9089e6c0899ed58b03941233511330b71832c79214500205800b18190110ff909310f00039b91402d0001cc09123490ce5508dd73893e2019111a912fb74345bd777333757fbe40014300176d154b8909559590212b100392792d5d00dd9000c15e01abd165cb3232f4c71139e277871961affc000d654011540015579388f842d9081674fb50080200eead00c1300973eb2120ca1466d7513c3a7226c251179711aa72162d6c40014e164a7c8007f802fd8800ba3d73d7fa8106a245748937cecf73437611601929ae8b79ab8b07ef87200b800491d898ee2c00b15d00010d07251f38b74e3997931737a5381f58712be05009d959aaa69000330010290000d100036f9950c5000ebb00ce5817eb86020bbc99beb655cedc53a36f13a3cfff8111e582d0ff09d326101ae335274d9540fa0910d7000f2300e0ed085e7b93aabf412037261a89161dbe3992021844448401fc13d0f77841a5900f3600fc9300113903dac322dfc331cc5711c31e18765e83f16aa12bc485756999196b80ea1f00012f061f949241f441e84c81a82e8010fd066e6166228443ebd4000dbb00a0ca00135779e6452697e981401a400a318a37666993b990bd6700011d03adb393800108c5e02a5e6169906847311a001bc50000e807e4d7a98885498aad48d5621a356a9011a800b4a631a5dfa126e0928f7881602f27c55d9541220284b11152ca74a1409a721568a0eda316ba12aaa84757c1a9974590140511948f1237c71e794857a1aaf51197fc71a6d898f63aa9a6bda121209322213880192a92eb1a8634a9acb2719912aa94bb91579b3377d63817b01aa5d21aa43d13ae2f9a36981aa2523ab3e01869f78aab89aab4ef190ee05abbf0a4dbafaaabe5aac474111bdca12caaaa81511adc9faacd45aad021110003b);
INSERT INTO `op_honorimages` VALUES (4, 192, 'g_spear.gif', 'image/gif', 2510, 0x4749463839615a005b00f7ff00ffffff0808081010101818182121212929293131314242424a4a4a5252525a5a5a6363636b6b6b7373737b7b7b8484848c8c8c9494949c9c9ca5a5a5adadadb5b5b5bdbdbdbdb5b5ada5a5b5adad948c8c9c9494a59c9c8c84847b7373736b6b847b7b6b6363bdadad5a5252b5a5a5635a5a524a4aad9c9c9c8c8ca594944a42429484848c7b7b8473737b6b6b423939393131736363ad9494a58c8c9c84846b5a5a312929635252947b7b5a4a4a8c7373846b6b2921215242427b6363735a5a9473734a39396b52528c6b6b846363634a4a4231315a42427b5a5a211818946b6b3929297352525239396b4a4a3121211810106342427b52524a31315a39394229295231312918183921214a29295a31311008084221213118182110103918182910101808083110102108080800001000008c736b846b63392118ad9c94a5948c8c7b7384736b6b5a5263524a4a39314231292918107b6b635a4a4239292194847b73635a524239312118a59c94847b73211810b5ada59c948c948c847b736b393129312921181008ada59c8c847b4a4239292118bdbdb5b5b5ada5a59c424239292921181810101008080800b5b5bd000008bdb5bdada5adb5adb5948c949c949ca59ca57b737b6b636b393139312931292129211821181018100810080008ad9ca58c7b846b5a634a39422918219c8c9494848c7b6b7373636b5a4a5252424a392931312129180810a5949c84737b63525a423139211018947b84735a635239423118219c848c7b636b5a424a392129a58c948c737b846b736b525a634a524a31394229312910187b5a635a394239182184636b73525a6b4a5263424a4a2931422129000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0c0c021f904010000ff002c000000005a005b000008ff00ff091c48b0a0c18308132a5cc8b0a1c38710234a9c48b1a2c58b042d54c078d102008e0e1d0cf8085222802d080000c040b2a4c103fe5aba6c08a084bf06004cf8eb30b3200001fe24f474f8d3df040001fc6d1c2ab0823f7f0b98329cf014c0067f5b64f674f0b48056a9046b62b5a0c0df48b0999efab30016210028fe0858e0e1cfab54006a03086deb53c253151a9ebef8ea72c153036cf9867df1d404637f1f087304000166dc078915ff7bfb744492a71d2463b4e0c00182020f1c4cd0bc19825ab84f334b7d8080f5400b49d53e2520ba246ddb022390d1fdf4406f90bf6d032040fca986e31c1f1c50eea1b93f01d0a3d76e0b00040400b8ad37ffd02c9daf5f7f2f3239b20e0382050ceeb34f4c7e578575eb49034091edb23c58001ddc2720197bf544df5d3008a85b000b58e01153fefd37808282f137d48110a9e4500614fa7380472ac937df740b81a7d5021e1c449289156cd1610003c0c0490108502022441822f441092b62e04f093e8127100501e8d4e17d381948a2420024c81600d5f9f340901f01c0c091d6d9f041042c19b85d420038e50f022018498685b70d87a55a233c38db922a82a0267101a0b919736bd6e52658390e04c063f88df0955879f2481e9c61d9a42083320110419e4f298081051350b0a7972a12d961568b414a1c19013870238e886e66df9164a8d012679eaa65830a5060ff00e197020160409e880dc461ab643800a28617c2d99da7cf0dd96aae8a1d08005d79722a90059e06109a83c04298c947945a5000832594001485015c70dbb79e821aeaa8a4aa0442001f2c2000082f24919b8203885b2ba0adfa73e69b9b85801e08e41eb945062be2e9e90b1350cbef3f166432c0030032e05dc0d6152bd005adaa70e96c5f02bb625a0a9ab0e2089022b0319fb41a0400578b7a64c1039eaac00007762ab910051d0ee0e29c9e0a70145321fed36746f9b65af345419bb690052e169d276f25017041c22b0e5d2b074e0b3880031950e06b050ba80a52981a0410400312a8a4b49f7b02f041d6f7095042dbe8d6aa1549d03e35de811a08ff60c08af8c2dd9ca818a9a47046b929f0cfda9b7d3be566f30a5e71dd9b81e86f91ab9236210c0028f025070380e00f141f612cf98075d794d467fe04c0436212042000694f71409fe149cd5dd6e94f0990803f0c6400d452d596c8f2821e54f998c60e980d4302d502c03aefc4313037c3b3d7fa90adfed840f10594cd6bc303135e8780020d3cf081024d53bf6066c51345f207b7eaf6c279ee3b6d63470114f0b66ef26280951830820794207226704002a6973fdd10c004207059fc1822165f45c91f0a884c9554123bdda4cd700c6c2071b620001554e046d0f24a820410821081c700735a8002923080002880602aa9c005422842fb1dcd279f090c7aff64223ab50c06020a789487dc04001bf4f03e303a998a3ed3b50f5c4a4cfe88a0d0142044bbd40a664f8422c4186201a03c496549f99b4068038002f8637f7e525418adf30229d62a4001908c531600ac07240037d0bb1bd6e6781f049c307a507a0ae10e52c63d4180009908c1e1c2c23342d2e905257840043ca0826f0d064c7f6cc90306133daa01c892902283004b542dc6d56a04641080097e87cab878c04804a0983f926045746108000b0018a4a020001e98c003ee0990a778c041013ae899d4a25c8e0c67300a4161032e7c961b5b652fca292442062963ebeec3830b48313c4b74c0363bf4b8b189326505b1000772d30066f54e34dd41406804b2ffab0e31336aa21456f1c4f437a6a945644c9289388f1481b04c7044b592c00c23532bfb648f610d48400b23024c2ce9c5702ad04b74a63397d7acc839ddd9cb43c9584905f1000601184e06b403001524c048fe10140010f0941258c68e34299fa75679113f9a082f6a019575d43891f0e50b7a18895098a41352dd18202902a893492c50bf7c252faa2af01303ac9881e941ec029161c00f6b6529f094a0a56ae95a091240000224a839d889ea927c649dc460eb87e0794c4c0504020e6c304413885c000c551195484779ba19c067f2e850262900aef6a3c0092bbb199cd6c99b04f1cf205ba70000d072a644f95fdc10b0c88c18006adc534b92f4ba1998abecc823175ceb40a802c5e7dccd6bdf828105ae6455d00ea43c27110ab67423226536270968ba00c502d0be0a81c401d3e95c4bfac9b987a0333703e8009a00205903e852374bd1ce661a65987d79b77547e14a3b55f6c1d85a87020075cb84be4a14d955690b290aaa75f8a81900846000f8258a011669814f5290620288807139ba52845caac20409d00230f082012840b7c0891a08c0b7de092b06c360327188551ce216bbf8c5330908003b);
INSERT INTO `op_honorimages` VALUES (5, 193, 's_shield.gif', 'image/gif', 1716, 0x4749463839615c005c00d50000ffffff0808081010101818182121212929293131313939394242424a4a4a5252525a5a5a6363636b6b6b7373737b7b7b8484848c8c8c9494949c9c9ca5a5a5adadadb5b5b5bdbdbdc6c6c6cececed6d6d6dededee7e7e7efefeff7f7f7080800101000181800212100c0c0c03131003939004242004a4a005252005a5a006363006b6b007373007b7b008484008c8c009494009c9c00a5a500adad00b5b500bdbd00c6c600cece00007b7b00848400000000000000000000000000000000000021f90401000023002c000000005c005c000006ffc09170482c1a8fc8a472c96c3a9f4b9d744aa542afd8ecb00ae87a01375b785cd59acfc2e977edb5b9df6fb2144d6f4ad79dc481c31e8bff6171367375855b776c14520e6c708e7e80538668886c5d11520a8d7e906e819e628493573a966b1852147d8e82819da1a34f95a65e151296a09c709f806ea2b148a5b45e1c175f17c65ebcbb7fbdad83c0c1c35f093a135d17023a166dbabcdfcd713ad144b3d3043a091b1c0f520ccaacb9f2cc81bfa3c2d35f053a0e1a178a3a20b4e9f50adc3232c0f0e5f332a1c0060c13f21cf0002f1ea482e13c8d9ba470a1970e002ebcf340b11b4166cfe86934d4d1e3170a082c2d4bf9ca192868745abaf4028100aeff78408302dd68a66395a348932a5dca544a0b3844b3186d4ab5aad5292d6a68c52995cdd5af608f7e603183060dad5165590acb36ec8a18326494e5ea44c7800d5edbeaad8ae2c50b183166d4a0cb444a84bc7b132b3dc1a2850b1832cea655a223008101184a7651cc19a989152b5abc883c78f2111d0d04602090403380ceb0a79850b182c58bc083099f8620000007905f62c72e91a2b68b18677d4509b9c09470d82554a860715cf0ca24a5483a7fce99f8f4e3c995639fc6bdbb74ea7273df309d265f79c5c48d23cf0debb4fbf77ba37fc70dd5fe7dfc6d7947dd7cb94ca613620086a5df80e1bd61e0420906785e75ead5b785171ee8c10782115e25ff2078f45dd75e170035b05687602de8427af244850f263a68c2218a547d48a0232e7a818a0eaacc4823532af2d74b8eb5dc72e28f55d9d8a088c214734c325e20695574c6b1e8cc46c254734d48da7013a594354e78e32e5876818e3aec4861e297600299c27ed65d39e23e0df853811402b1d9a652412e799d300d3d24411e06b8b6a79b70d2e747995d80241200da0577289f135ac90ba35ec0b4dda448f5a9e81f9876d1d3a69c5661639c648ee8c5023ab8a667a95378fa4ca81e1ca0030647c21aeb9be8c579a9aa0068a04d9e6be86aaa980d2e0aec9d3ac4e463a924f04a212beb01cb8014773dcbe99bfb250baaaa1e507158b1c64af1410ad2def8ff6b7b1e5c3b806598b9666bb922bc59db6dde567b21070248901a0605b446aeb1e816671b69ac10095204bd6d00dc47e8e80a02bab48916193d4462d39c251eb4a3ab7770d2208878c0466a490601c01a020af6da366624451cc8c60603a84c71689085f7c983f9903401ac27dcfc18aae21821f31a1e70c0eaa4d1723ba0afcd987634861cac76e8ca371feca7be462fe441071b3470287137b790f3a7ba5d984f071c64a08d941f90ed747522dfc45e1a126dc8710716bc8d6408054b17da683a8b781a408cd0e2c1cf70b3cc6d6874a374771a994cb3b40029773871e0c69dfdc8e494f3384c075430e0377ee7524c1b759eb7688791a6b4ab0301010c30ffc003fbe00738e7aca71722c9858504e517fc4a60fa05041c50c1d2dcc92d3875a309f629d77664b38d250b0be04106dc5bb040e6b1994071cb2edc267d3ca01bed0e2dde43da81061858f040c49c7d20beea9de316224258e039bafb1c78880526500dce38ee71acd3dfc8d2561757c52e691bc8c03f0ab897c0094e3439db1a03ebe2129280cd1f166800f8c092bac035e62f72a9dbc8a8d7158f789003f0ab406ac2522fce0dae752b4c9f1d76f23518c62f0235bb4ad3f087c1b2ecaf6885981ad292063f0bccab2a437c9e68e0e2a7a8dd83871d001bc09a55230bd6668a0843090b93b8130064d17a0bb8d65282863fe8054683168a853986e1332918d1407ea7a3021b11f898141ed1173aa4c44e9636800afc837e5360a30aece518c89cef111b94a30ba9e000095220773a00c11e9fd7c7b3fcae1ee408c6d46447bbcb50000313048108a4c3ad8af5f191430aa4246951bc7fb1460312acc07456201ddadc9034688b64280f414b00f00600ebf820065ed00216b00034273cdb27ed314ccacc51635d78e10662000366b6a0916f546128a8594d3bb4c464eeebc00c64c0cdbf387249e42c2714d4a0380fd48006eb8ccb0c1e29097926910a96d0ca3dcd428332f8931c5539a842178a842000003b);
INSERT INTO `op_honorimages` VALUES (13, 288, 'brand.gif', 'image/gif', 3238, 0x4749463839615c005c00f70000c0c0c00808081010101818182121213131313939394a4a4a5252525a5a5a6363636b6b6b7373737b7b7b8484848c8c8c9494949c9c9ca5a5a5adadadb5b5b5bdbdbdc6c6c6cececed6d6d6dededee7e7e7efefeff7f7f7efe7e7cec6c6d6cece948c8ca59c9cc6b5b5ad9c9cd6bdbd8c73737b6363d6adadbd9494d69c9c392929ce8484211010e729295a00007b0000e70000ef0000ff0000e71008e70800ff0800d64239b53129ce2118ef1000c66b63e72918d62110b5736b9c524aef1800ff1800ad7b7384524abd4a39d63118ef2100f72100b58c84d6a59c8c635ade8c7bef4a29d6b5ad73524aad6b5ade735ae75a39ef3100ff3100945a4aad5a42ce3910f74210de3100f73900ff3900bd5231ad4221ef3900b55229c6b5ada55a39ef6321ce5218de4a08ef5208ff5200de8c63e77339ef5200e7bda5dea584ef6308ce5200ef5a00ff6300b57b52ad52108c6b52d69463c67331ef8429f77b10de6b08ef7308ff7b08e76b00ef6b00f77300ff7300d6bda56b5a4a211810d68c4ad68439e78c39d67b29d67318ff7b00b5ada57b736b5a4a399c7b5ad6a573ad845ae79c52efe7deefad63ad7331ef9c42f79421f78c10efc694ce7b18e78408ef8400ff8c00ceb594bd7b21d68410ef8c00f78c00e7d6bda56300ce7b0094846bb59c739c6b18ef9400ff9c00a59c8c9c7b42de9c21de9408e79400ef9c009c9484deceade7bd6be7b552e7ad39dea531ffad00f7efdeefd69ce7ce94efad18f7ad08f7ad00dec68cceb573cead5affb500e7bd42f7bd10efb508ffbd08d6ceb5efc64aefbd21e7ce73efbd00ffc600c6bd94dec663c6ad31ad9410debd10efc608f7ce00c6bd8cbdad52a59431ceb521e7c608bdb57bbdad42b5a539ad9c21a59418bda500ceb500ffde00c6bd73ad9c08ad9c00b5a500dec600e7ce00f7de00ffe700e7de73d6ce5acebd00e7d600efde00ffef00e7de52ded639efe731ded621e7de10f7ef18efe708f7ef08fff700efefe7cecec6d6d6cee7e7deb5b5ad94948c8c8c84e7e7c6dedebdceceadd6d69cd6d67badad5a007b7b00848400000021f90401000000002c000000005c005c000008ff0001081c48b0a0c18308132a5cc8b0a1c3870bff499c489122c48b18330eacc8a1a3c78f1f2b6a1c4952e044902853a29c58b26543892a416e38604043cc90ff5cea2478f2e647091219f8c4997327499843413e9088202948894633fe738ad2824409549f467d8834eb4f085e9f16dd9a706ad88e1a2a7ca440e16cc7b1640bfe6bebf6c03fb01ce809f837c12d07b871272af03be0df010c9c0c491cecb63060a37c253af0abe2df825fd148496cb0c16d65068f5dfe8b30d3805f0e10545c28c66f9581021836740e1b414506ab51ff55607cba638679d99ccd8a772143060db3bd76de1d5ae35409a67b7390cda95935567c3c5cc0a001b95be87f4577ff7440a0b76c0df3f04dd3d62a113d0bdb33c04b9e95fcdb92663928c87f3616230d1960c00435dcbc12070a1454b0dd3cc8d197d47e1e35e7507e06fc63815b8c70c24980ab21338e297f1c21c17bbffc729c6c5955786178ce7984c15e93f94453061f6d708f247c7c704105a068d34d268004118104145ca28f3cc66d90c10105d078d38bffc4c8e245fc4d2051743101f58f501d6d308f2c8da42102058594628d37a808820808104880cb3ef92c0881440bf864e53f584e392148fbfd4380932a2df54f53d3c1738f308f9481c2084784724d39a80c4245090f40908b38c5288841034cf9d4e79f2141c4df5f133d709355ff6035dd3cfa003387193af4ffe04627dd7c934a1d5af8508222afa0130d3d0a6a19814f14991a21577cfe334000040cb0a24a12e0b58106f8ec134c24600c31c41b9e94f38d2d788471830972d0a24e33214c6001061048a9d27ecb36fbac9e6581a48100102c20c005041c90525a6b4da0c12ae7f062c9183b10b18626cb80334a1e57e020c420b4ac234d3ded5a70620574d98bafbefcfa1b6a4428d9f480001c7887d201010ccb01057b41704b3a068f61c40e6ad4828d39b0e8c1c50c5bd861cb3ac77cf2d9051a4c1040007d95ccc1c9293b28a149315590c04d04e0791c68fff4610c3bc45842861140b0610936e0c0b207163370b1872dee3c83c85e05506001d7bca164754c538fff9ad5671850a0251cbbb81336194000d1c62868c34248163564a1872edf24538a1f864910410492b9d5b75fb5dd06810606a8904830868b9df8e23b8fb207e45910a2cb3bc93872c8001040d000060618e0205512faaddccb0a28c94419bcbc73f8ea8cf3fc7ae47be8628e329824d140040e20d0ddef5935277c58d0c193011281f8a2bcea8a339ef6e33548b1072cef2833c9140d40c04093369d16daf76191a7c1074a9883f99697bec63d2f0bd17bc73232f105433c200103e00ef7ba6710fe792501ffc000099e4007629c0f71e90387c3d8173be91183125d30c10354a432bf3cc68254d94001f8720228dc617604649df36097406c50220c266840d6ff22908109024f2e43a149fe6202a50520610937fc20f31a47c2f799031b9b0843131410807f284082315122b178e2132dd5e9265a32c00aaca0070fe6507d6ae3210e37318626d8e51f0540da04cd38c68df84450848a0906ffc18216588110c430c71b5b4742d95df16038a8cc3f043081e304aa5337810b0c51a52a956c60222f9081146427c502ee107ab3c386d86ae082892c008c55b94a1fa96627bc78125e0190010cb860875eb4a317951843118aa0064d78831ca8b0c3cfae608754ac63189418030d62b01701082002b151c9046cc9373fc604601ea9805a509201013860901549a73ad729910034600006b88083c0d911716692962ab18bcb2ab0ff978e7d646b7b61a740d7598000e4ae0227fa883eebd9cf6e02c082593bc0713865199568200207a0e840373aa803a80002eae20e48223a513a39d48295796505eee42e8f4c0b032b952447d949000428800120d5580b39905298b2f4a437099d0520309302c4444916a04004ba38537506e00009588003224081e23848a84465d23d1fea93e5e4cd9301aa800404d5d48a1cc0a60d7880042a808122a2c4ab49290a0c3b029eae6a000349c55e592962009b3260aa55b524b4f204d4a13ca03c4379e94a2150a1bd16000151ad5f4877aa14c4f671ae1cc06052a695811d8d35a03315c0591550bfb516678929d1ec50e49a14156df6ae79754059fb7ad307ff444041828d896b2f3b1428b5f4ad34e10e5eb7d9d4be4675aad0518d1139e0dbd5e2332677222c4acca824cf9275a0a34deb0428fa559444d7b95cf594440600a894c876509cbd8052670a55a91269011211594cfa445ede12ab54a7926575c53a53bfe6544b9d5449b16669415ccaeb261330d6746e4381fe4a95aac5898082dfa52c6639cba1cff558be04600115c8f723f4e400c7bab3a33e09b4bd0e90c00422a0327b96ec631cf63086c3ebc9a7a1ccad2bbb4b4760962ad89a989d5065c0032650a1077486025df4a74b6dcc011ca7449343d95b4c48ba01bc6d00aff01d285a214081c218606b8ba9dad5664963ca6c09a65a72407529600f810e00ff010fae40d616a0de3b4df82c80c16c506d33540e30093977ad403d044a80e3aed501aaa940567da7bf0a4a07ae2e85ed9c689a00214b605d181071773de768e970a0ae1e0190053443d3daaacbad11902ea73bdd1bfbd4a8b3485e6700b61cd8ceb8ba37def3f47ee8a358a6a673d6a485b05b31b85ca7044f3abbed52a07d5d9159c7598f1b48f6aa11f2bdd2a03625cd05315eb5f46b43af0b3917805157c5f864857c4f4b5c82ee9564c2e0751ec0d4dffef4bad1181401930c258014afb2cabbe675faf7d49da16f79f18d49addc1b249cbcaf4426dc6f75a255d8c819704c12be9297a4649be22580859fa5587fc7993b1a30f085a1cbcd63ed092de3ffac67ca410c630bf42bd2783d2f5fa3aa56b6de15c621fbd7ca5d4caf832f54c40d7d2b93777ae50eabd300429eecb486cebd9ff3732ef711554748aa01ee8af95f9d052d455450bf5a7b8402635609d5ad3eb57a018ebf510a4b751d5311034c15b7c5fec8d9d35c76730b95343439cbb42ec00066074000eeb579dc3d72f7d2d4dddcd3d1f4695e6a81c65ea9d26a8d775620dd732ad155d55981ade3f144da9ce6362b753d3c43a6726bb7889ac7ca52c002aee7f5fe9547f42f81d0e2611d50c0fff5b6563d4b9f7263a1c56b6047b55f80a5057f960a9125ed7e617ced19a05dc97be5457179a89e2d8a57ae11a001533df5b5e30afb914cffad9d6d6c8300869f7b0a461f897abf8daf0fd026b63a39aee73f48576298010c0ae0efe69cc069074faaf8d7cb2be1c6000810000f300005e07efcd77dc7f77d1b501cfa22568145594fa680d1d71389a501127000dbd156124814fe271598f552c691500246811f2817f39712b2b182dcc31227a8131ca182f421122f58811c5583389883081110003b);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_honors`
-- 

CREATE TABLE `op_honors` (
  `honorkey` int(11) NOT NULL auto_increment,
  `honor` varchar(120) collate utf8_unicode_ci NOT NULL,
  `type` varchar(30) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `abbrev` varchar(15) collate utf8_unicode_ci default NULL,
  `level` int(11) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  `catagory` varchar(10) collate utf8_unicode_ci default NULL,
  `rec` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`honorkey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=297 ;

-- 
-- Dumping data for table `op_honors`
-- 

INSERT INTO `op_honors` VALUES (190, 'Flaming Brand', 'Award of the', 'Given for service to the Barony. Members may wear the badge of the order: Ermine, a torch proper.', 'AFB', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (191, 'Gryphon''s Plume', 'Award of the', 'Given for excellence in arts or sciences. Members may wear the badge: Ermine, a feather bendwise Or enflamed gules.', 'AGP', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (192, 'Gryphons Spear', 'Order of the', 'Given for service to the Barony directly contributing to the success of the Pennsic War campaign. The five principal members are known as the Gold Company. Members may wear the badge of the order: (Fieldless) A griffin passant maintaining a spear sable', 'OGS', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (233, 'Academie de Griffe', 'The', 'Given to all of the Barony''s authorized fencers.', 'AdG', 30, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (193, 'Sable Shield', 'Order of the', 'Given to all authorized heavy-weapons fighters. Members are known as Companions, Soldiers or Tourniers of the Sable Shield, and may wear the badge of the order: Per pale ermine', 'OSS', 30, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (227, 'Flaming Rose', 'Order of the', 'Given to former Landed Baronesses of the Barony of the Flaming Gryphon.', 'OFR', 20, 1, 'BAR', 0);
INSERT INTO `op_honors` VALUES (194, 'Gryphon''s Paw', 'Order of the', 'Given to beasts who have provided great service to members of the Barony.', 'OGPw', 10, 1, 'BAR', 0);
INSERT INTO `op_honors` VALUES (223, 'Baronial Archery Champion', NULL, 'Chosen by contest of skill at the Push for Pennsic event. This post is held until the next Archery Champion is chosen, and conveys no permanent rank.', NULL, 0, 1, 'FGCH', 0);
INSERT INTO `op_honors` VALUES (232, 'Baronial Artisan', NULL, 'Chosen by contest of skill at the Twelfth Night event. This post is held until the next Baronial Artisan is chosen, and conveys no permanent rank.', NULL, 0, 1, 'FGCH', 0);
INSERT INTO `op_honors` VALUES (222, 'Baronial Champion', NULL, 'Chosen by the ladies of the Barony on the basis of prowess, demeanor and skill at arts and sciences. This post is held until the next Champion is chosen, and conveys no permanent rank.', NULL, 0, 1, 'FGCH', 0);
INSERT INTO `op_honors` VALUES (234, 'Capitaíne de Griffe', NULL, 'Chosen in a manner determined by Their Excellencies on the basis of skill at light weapons and honor. This post is held until the next Capitaíne is chosen, and conveys no permanent rank.', NULL, 0, 1, 'FGCH', 1);
INSERT INTO `op_honors` VALUES (287, 'Gryphon''s Treasure', 'Award of the', 'Given for service to the Barony by a minor.', 'AGT', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (288, 'Gryphon''s Fire', 'Award of the', 'Given for long and distinguished service to the Barony.', 'AGF', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (289, 'Baronial Bardic Champion', NULL, 'Selected by Their Excellencies for excellence at the bardic arts. This post is held until the next Bardic Champion is chosen, and conveys no permanent rank.', NULL, 0, 1, 'FGCH', 0);
INSERT INTO `op_honors` VALUES (290, 'Baroness''s Cypher', 'The', 'Given by the Baroness for exhibiting courteous behavior at all times. Recipients may wear a stylized badge consisting of the Baroness'' initial combined with the letter ''B'' and may style themselves as a Bearer of the Baroness'' Cypher (BBC). This recognition may be received multiple times.', 'BBC', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (291, 'St. Crispin', 'Order of', 'Given for exemplary efforts in authenticity. The first five members will be known as the \\"Hand of St. Crispin\\". Members may wear the badge of the order as registered by the SCA College of Arms and may style themselves as Companion of the Order of St. Crispin (CSC).', 'CSC', 50, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (292, 'Baronial Equestrian Champion', NULL, 'Selected by Their Excellencies for excellence at the equestrian arts. This post is held until the next Equestrian Champion is chosen, and conveys no permanent rank.', NULL, 0, 1, 'FGCH', 0);
INSERT INTO `op_honors` VALUES (293, 'Guardsmen of Flaming Gryphon', 'The', 'Given to all archers who have, by virtue of having met the minimum requirements, qualified to stand with the Baronial Archery Guard. Members may wear the badge of the order: Per pale ermine and Or, on a flame gules a pheon inverted Or.', 'GFG', 30, 1, 'BAR', 1);
INSERT INTO `op_honors` VALUES (295, 'Baronial Thrown Weapons Champion', NULL, 'Thrown Weapons Champion for the Barony of Flaming Gryphon', NULL, 0, 1, 'FGCH', 0);
INSERT INTO `op_honors` VALUES (296, 'Baronial Gaming Champion', '', 'This is the individual who is chosen by contest(s) to represent the Barony at the gaming tables and, most importantly, in an annual game of chess held between Flaming Gryphon and a Barony from The East (Bhakail)', '', 0, 1, 'bfg', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_permission`
-- 

CREATE TABLE `op_permission` (
  `permissionID` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`permissionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `op_permission`
-- 

INSERT INTO `op_permission` VALUES (1, 'All', 'All permissions - no restrictions');
INSERT INTO `op_permission` VALUES (2, 'Edit recipients', 'View the recipients tab and edit the recipients');
INSERT INTO `op_permission` VALUES (3, 'Edit honors', 'View the Honors tab and edit the honors');
INSERT INTO `op_permission` VALUES (4, 'Process court reports', 'View and process submitted court reports');
INSERT INTO `op_permission` VALUES (5, 'Edit progress', 'View and edit the Baronial progress');
INSERT INTO `op_permission` VALUES (6, 'View recommendations', 'View award recommendations');
INSERT INTO `op_permission` VALUES (7, 'Create court list', 'Create court lists from recommendations');
INSERT INTO `op_permission` VALUES (8, 'View/Edit tickets', 'View and process any error/update reports');
INSERT INTO `op_permission` VALUES (9, 'Enter Court Reports', 'View the New Court Report tab and enter a court report to be processed');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_recevents`
-- 

CREATE TABLE `op_recevents` (
  `recID` int(11) NOT NULL,
  `eventID` int(11) NOT NULL,
  PRIMARY KEY  (`recID`,`eventID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `op_recevents`
-- 

INSERT INTO `op_recevents` VALUES (14, 46);
INSERT INTO `op_recevents` VALUES (16, 46);
INSERT INTO `op_recevents` VALUES (17, 46);
INSERT INTO `op_recevents` VALUES (18, 46);
INSERT INTO `op_recevents` VALUES (19, 46);
INSERT INTO `op_recevents` VALUES (20, 46);
INSERT INTO `op_recevents` VALUES (21, 46);
INSERT INTO `op_recevents` VALUES (22, 46);
INSERT INTO `op_recevents` VALUES (92, 50);
INSERT INTO `op_recevents` VALUES (92, 51);
INSERT INTO `op_recevents` VALUES (93, 50);
INSERT INTO `op_recevents` VALUES (93, 51);
INSERT INTO `op_recevents` VALUES (94, 53);
INSERT INTO `op_recevents` VALUES (94, 54);
INSERT INTO `op_recevents` VALUES (95, 53);
INSERT INTO `op_recevents` VALUES (95, 54);
INSERT INTO `op_recevents` VALUES (96, 52);
INSERT INTO `op_recevents` VALUES (96, 53);
INSERT INTO `op_recevents` VALUES (96, 54);
INSERT INTO `op_recevents` VALUES (96, 55);
INSERT INTO `op_recevents` VALUES (97, 52);
INSERT INTO `op_recevents` VALUES (97, 53);
INSERT INTO `op_recevents` VALUES (97, 54);
INSERT INTO `op_recevents` VALUES (98, 52);
INSERT INTO `op_recevents` VALUES (98, 53);
INSERT INTO `op_recevents` VALUES (98, 54);
INSERT INTO `op_recevents` VALUES (98, 55);
INSERT INTO `op_recevents` VALUES (99, 53);
INSERT INTO `op_recevents` VALUES (99, 54);
INSERT INTO `op_recevents` VALUES (99, 55);
INSERT INTO `op_recevents` VALUES (100, 53);
INSERT INTO `op_recevents` VALUES (100, 54);
INSERT INTO `op_recevents` VALUES (100, 55);
INSERT INTO `op_recevents` VALUES (106, 56);
INSERT INTO `op_recevents` VALUES (106, 57);
INSERT INTO `op_recevents` VALUES (106, 58);
INSERT INTO `op_recevents` VALUES (111, 58);
INSERT INTO `op_recevents` VALUES (111, 59);
INSERT INTO `op_recevents` VALUES (112, 58);
INSERT INTO `op_recevents` VALUES (113, 58);
INSERT INTO `op_recevents` VALUES (113, 59);
INSERT INTO `op_recevents` VALUES (141, 60);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_recipients`
-- 

CREATE TABLE `op_recipients` (
  `reckey` int(11) unsigned NOT NULL auto_increment,
  `scaname` varchar(250) collate utf8_unicode_ci default NULL,
  `mname` varchar(250) collate utf8_unicode_ci default NULL,
  `gender` enum('M','F') collate utf8_unicode_ci default NULL,
  `active` tinyint(1) NOT NULL default '1',
  `name_registered` tinyint(1) NOT NULL default '0',
  `device_registered` tinyint(1) NOT NULL default '0',
  `device_blazon` text collate utf8_unicode_ci,
  PRIMARY KEY  (`reckey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=725 ;

-- 
-- Dumping data for table `op_recipients`
-- 

INSERT INTO `op_recipients` VALUES (3, 'Aaron de Hameldene', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (5, 'Alain de Bastien', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (6, 'Alaric Duath', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (7, 'Alaric of the North', 'Eric Grunden', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (8, 'Aldeyn von Lütringen', 'Tim Shurts', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (10, 'Aldred the Ingeniteur', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (12, 'Alexa Basarab', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (13, 'Alexander Blackstar', 'Kevin Haney', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (14, 'Alexandra Häbich die Schliesserin', 'Tracy Schlueter', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (15, 'Alexis MacAlister of Beverlay', 'Bev Roden', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (18, 'Alisaundre of Greyhame', 'Sandra Hackemann', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (19, 'Allegra Ginevra Soave da Napoli', 'Nancy Terselic', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (20, 'Alys of Ashmoor', 'Nancy Alger', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (21, 'Ambrosia Belle-Étoile', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (22, 'Andrew of Seldomrest', 'Andrew Holly', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (23, 'Anika Gael Quicksilver', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (24, 'Anluan Bryan Mathgamhain MacMurrough', 'Dan Gilliam', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (28, 'Anne Winterskye of Flaming Gryphon', 'Steph Burk', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (29, 'Aodhfin Seibert', 'Scott Lane', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (31, 'Aodhnait ni Amblaih', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (32, 'Aquilon de Calmoutier', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (33, 'Arthur Bear', 'Bryan Wymer', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (35, 'Ardewyne of Oxneford', 'Tracy Dougherty', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (37, 'Aretius Bellini', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (38, 'Arianna Ginevra Lucrezia della Rovere', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (39, 'Arinbjorn Runolfsson Rafnssonar', 'Bengt Brown', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (40, 'Arkaydian Blackstar', 'Ken Hurley', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (42, 'Arlette de Coeur', 'Wendy (Mitchell) Kimmel', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (44, 'Arthen ap Rhodri', 'Greg Rowlands', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (45, 'Arundel the Falconer', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (46, 'Asleif Eilifdottir', 'Megan Dunkin', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (47, 'Atai Yoshina', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (49, 'Myles Blackheath', 'Mike Reeseman', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (50, 'Aveline Rosa of Lyons', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (51, 'Azura Safir del Saule et la Lun', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (52, 'Barbra of Canterbury', 'Barb (Canterberry) Adams', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (53, 'Flaming Gryphon, Barony of', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (54, 'Berach de Winterbourne', 'Scott Finke', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (55, 'Beryl Lilith the Paragon', 'Donna Shrout', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (56, 'Bidina Dillon', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (57, 'Biorgulv Rafnsson', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (58, 'Bohemir of Esclavonia', 'Jim Stanuszek', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (59, 'Breunor von Vallulf', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (60, 'Brice of Winged Hills', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (61, 'Brietta Arlana Cambrensis', 'Christina (Crowder) Herbert', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (63, 'Bronwyn ni Mhathain', 'Yonnie Travis', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (64, 'Brusten de Bearsul', 'Pat Smith', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (66, 'Bryne ap Llewellyn', 'Tony Dismukes', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (68, 'Buadhach the Houndmaster', 'Bruce Fields', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (69, 'Cateline Geneviéve du Mont', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (70, 'Cathbarr MacQuarrie', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (71, 'Catherine Elaine de Marksburry', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (72, 'Gyða Arnórsdóttir', 'Anne Berdanier', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (73, 'Agnes la Perdue', 'Beck (Good) Snyder', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (75, 'Cecilia d''Inghilterra', 'Cindy Simerlink', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (77, 'Chip McPhelan O''Flynn', 'Chip', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (78, 'Chirhart Blackstar', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (79, 'Christophe van der Ross', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (80, 'Ciaran McDav of Circa Duine', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (81, 'Clifton Court Dancers', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (82, 'Collin O''Flannery', 'Matthew Flannery', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (83, 'Conor mac Lellan', 'Richard Smith', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (85, 'Conrad of Northfield', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (86, 'Cwenwyn Beorhtwig', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (87, 'Cyndarra Morgani', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (88, 'Damian Vilkmir Litvonov', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (89, 'David de Kunstenaar', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (90, 'David the Smith', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (92, 'Demetrios ho Bibliophilos', 'James "J" Yakura', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (93, 'Deryk the Mouse', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (96, 'Dmitrii Volkovich', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (97, 'Dorien Moonshadow', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (98, 'Dorinda Scorpione', 'Linda Banzhof', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (100, 'Draxel Kalhart', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (101, 'Dubheasa ní Chonchobhair', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (103, 'Dineen Berwick', 'Dineen Ford', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (104, 'Duncan Donné de Notre Dame', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (105, 'Duncan McAlp the Lost Scot', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (106, 'Dur of Hidden Mountain', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (107, 'Eadunn Finhest', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (110, 'Ealasaid of the Isles', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (113, 'Edouard Halidai', 'Dan Myers', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (114, 'Edvard Gayer', 'Ken Buzzard', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (115, 'Eirik Broken-axe', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (116, 'Eirik the Elder', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (117, 'Elana van der Ross', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (118, 'Eleanor of Alnwick', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (119, 'Elizabeth Karien of the Four Winds', 'Betsy Wintermute', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (120, 'Lizaveta  Kirillovna Zametov', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (121, 'Ellen called Toad', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (122, 'Grizel', 'Jen Funk-Segrest', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (123, 'Elspeth ní Cormac MacComyn', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (124, 'Emrys Eustace', 'Joe Marfice', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (125, 'Therasia Agnetis', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (126, 'Erich von Plauen', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (127, 'Erick Harivaldsson', 'Eric Hughes', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (128, 'Erienne FitzWarren of Bridgewater', 'Amy Adams', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (129, 'Erik Erikson the Scout', 'Ernie Husted, Jr.', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (131, 'Estasia Angele', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (133, 'Etienne Harcourt de Lyon', '', '', 0, 0, 0, '');
INSERT INTO `op_recipients` VALUES (134, 'Evonne le Doulette de Rouen', '', '', 0, 0, 0, '');
INSERT INTO `op_recipients` VALUES (136, 'Farman de Montargis', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (137, 'Felicia Hilary Thurston', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (138, 'Finn Finnegan O''Flynn', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (141, 'Fiodhnait of Chelsea', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (142, 'Folly GilIan', 'Mary Smith', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (143, 'Galfridus Windsson of Noere', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (144, 'Garlanda de Stanas', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (145, 'Gareth Emeric', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (147, 'Gerard Montjoie de la Fontaine', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (148, 'Gheronda Gwyneth of the Dark Lake', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (149, 'Gildor Cuthalion', 'Mark Herbert', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (150, 'Girolamo Oldandesse di Firenze', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (151, 'Glyn Rees', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (152, 'Gordon the Righteous', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (154, 'Griffin Kyle ap Morgan', 'David Goshorn', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (156, 'Grocklig Glavekeeper', 'Don Adams', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (158, 'Gwendolyn Arwen des etoilles d''or', 'Jo Kennedy', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (159, 'Gwendolyn Maire Nic Thaidhg', 'Mary Bertke', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (160, 'Gwyneth Banfhidhleir', 'Ginny Beatty', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (161, 'Harivald Harivaldsson', 'Harold Spicer', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (162, 'Viviana de la Touraine', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (165, 'Heidi Truelsen Blackstar', 'Heidi', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (166, 'Helena Jan Folkje', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (167, 'Hibrida Longhair', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (169, 'Hrothgar the Blind', 'Mark French', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (170, 'Iago ap Gwilym', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (173, 'Ian mac Lellan', 'Richard Smith', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (174, 'Ian McPhelan', 'Rob Carolina', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (175, 'Ian the Lucky', 'Scott Husted', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (176, 'Idonia d''Aubignie', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (177, 'Ingold of Flaming Gryphon', 'Tim Rittgers', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (178, 'Ingrid Elizabeth de Marksburry', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (179, 'Iscandar Blackstar', 'Steve', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (180, 'Ismail al-Qasim', 'Frank Gonzales', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (181, 'Isolde de la Ramée', 'Mary Savelli', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (182, 'Ivan the Mad', 'Bill Champion', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (183, 'Ivar Tordenskiold', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (184, 'Jael al-Gamal bint Moehanmed', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (185, 'James Edward de Marksburry', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (186, 'Jamie McDubhghall', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (187, 'Jesca McCutchen', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (189, 'Jobyna von dem Rotstuhl', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (190, 'John Alexander of Winged Hills', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (191, 'John de Somerville', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (192, 'John Finar of the Salt Bluffs', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (193, 'John Maelan', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (194, 'Josée de Belvanoir', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (195, 'Joshua Frost', 'James Rutan', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (196, 'Julianna van der Ross', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (197, 'Kaleeb the Inflammable', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (198, 'Kalina Crna Zvjezda', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (199, 'Karl von Kugler', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (200, 'Katarina of Greyhame', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (201, 'Branwen ferch Dai called Wryn', 'Jennifer Riddle', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (202, 'Katharina Alexandra Zrinski', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (203, 'Kato Alexander', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (205, 'Katriona nic Mahlcolm GilChrist MacLeod', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (206, 'Kateryn Miriam Draper y Torres of Connaught', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (207, 'Kedrick Blackstar', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (208, 'Kedrigan Deward', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (209, 'Keeley Alywn', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (210, 'Kenelm Talintyre', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (211, 'Kenneth the Traveler', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (212, 'Khalea von Seig', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (213, 'Khalil al-Hadji', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (214, 'Khariessa Ilyavich Svetlova', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (215, 'Katharina von der Waldwiese', 'Sarah Reeseman', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (216, 'Lancelin Peregrinus', 'Grant Root', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (217, 'Lann Lerben O''Cambion', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (218, 'Leah of High Wycombe', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (219, 'Lioba Perlschlopfier', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (220, 'Lorimer MacAltin of the Garioch', 'Phil Freund', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (223, 'Luinrandir Hernsen', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (224, 'M''fanwy of Ceredigion', 'Gail Finke', 'F', 0, 0, 0, '');
INSERT INTO `op_recipients` VALUES (225, 'Madoch Greyson', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (226, 'Maeve of the Unicorn', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (227, 'Magdalena Ysabel von Wolfenburg', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (228, 'Mairin of the East Isles', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (229, 'Malcom Fourboar', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (230, 'Margot of Glamorgan', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (231, 'Maria Theresa Cleopha de Casselini', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (232, 'Marissa de Courette', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (233, 'Mary Elizabeth Blackstar', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (234, 'Mary Garrett of Seasalter', 'Mary Dahlberg', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (235, 'Mattew Widdershins', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (236, 'Meadhbh ni Bhriain', 'Deirdre Bray Root', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (237, 'Melinda of Voranthúl', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (238, 'Melisande de Canonwald', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (239, 'Melissa of Winged Hills', 'Melissa Alger-Yakura', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (240, 'Mellryn of the Lost Mountain', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (241, 'Michael Arthur of Kerry', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (242, 'Michael O''Flynn', 'Mike Thompson', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (243, 'Micheal MacAveely', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (244, 'Molly Bluespoon', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (246, 'Nicholaa Halden', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (248, 'Nicholas of Wicklow', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (250, 'Nishimura Kon Koga-Mono', 'Sam Foster', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (251, 'Oshima Kikuneko', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (252, 'Osmundus Thorkelsson', 'Craig Osborne', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (254, 'Owain ap Cynan gan Caerleon', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (256, 'Patrick Connor O''Donnell McPhelan', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (257, 'Penelope McPhelan O''Flynn', 'Penny', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (258, 'Prydwen Fflur ferch Ioseff', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (260, 'Ragnar of Birka', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (261, 'Ragnar Karlsson', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (262, 'Ramona of Crystal Lake', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (263, 'Rashid al-Rashidum ibn Yaakov b''hup b''l Salaam', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (264, 'Rayah bint Yousef', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (265, 'Emmelyne de Marksbury', 'Cindy Myers', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (266, 'Rees of Northwoods', 'Chuck Berdanier', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (267, 'Rhiannon ap Celemon', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (268, 'Rhys Micheil Morgan', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (269, 'Rhys Stevynson', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (270, 'Richard Ironforger', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (271, 'Richard of Aston Heath', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (272, 'Richard of Bewcastle', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (273, 'Richard Henri Sanson', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (274, 'Rioghnach MacLeod', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (275, 'Robert Alinson of Yorkshire', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (276, 'Rolin Thurmondsson', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (277, 'Rosamund Beauvisage', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (278, 'Alexandra dei Campagnella', 'Amy Reed', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (279, 'Scout Archers of the Shadow Dancers', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (281, 'Seamus MacShomhairle GilChrist MacLeod', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (283, 'Sean O''Shaughnessy', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (284, 'Sekemoto Shushigoro', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (285, 'Serafina de Folo de Navarre', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (288, 'Shadowdancers', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (289, 'Sharai Jahan', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (290, 'Sharra de la Praderia Blanca', 'Shirley Manley', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (291, 'Signy Dimmridaela', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (293, 'Simon the Subtle', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (294, 'Siobhan McPhelan O''Flynn', 'Jane Thompson', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (295, 'Sorcha mac Lellan', 'Rhiannon Smith', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (296, 'Stephanie Thorncroft', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (297, 'Stephanus of St. Joan', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (298, 'Sven the Merchant', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (299, 'Sylvia of Tirnewydd', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (300, 'Taliesin of Archenfield', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (301, 'Tamar bint Yusef', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (302, 'Tamara di Firenze', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (303, 'Lord Chatelaine''s Men, The', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (304, 'Thomas Damian Blackmoore', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (305, 'Thomas the Quiet', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (306, 'Thomas the Rythmour', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (307, 'Thorolf Allfroken', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (308, 'Thorval Wronghand', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (310, 'Ton the Traveller', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (311, 'Treasa ni Rosemarin', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (312, 'Tuk of Hidden Moon', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (313, 'Valentine Warner', 'Tom N. Tumbusch', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (314, 'Veronica of Seldomrest', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (315, 'Werner Einseidler aus dem Schwarzwald', 'Mike Adams', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (316, 'Villi Ormsson', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (317, 'William of Fairhaven', 'Pat Savelli', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (318, 'Winged Hills Cooks Guild', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (319, 'Wolfgang von Waldstadt Schwarzstern', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (320, 'Yoshiki Choshi', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (321, 'Richard GryLion', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (322, 'Llwyd Aldrydd', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (323, 'Zephan Killyon O''Suileabhain', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (324, 'Calum MacDhaibhidh', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (325, 'Shamira Rae Linacre', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (326, 'Eibhlin Brigit Ó Murchadha', 'Elizabeth Barnes', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (327, 'Peter Petrovich', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (328, 'Pavel Vlademyerich', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (329, 'Sebastian de Grenada', 'Scott Hargrose', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (330, 'Sharilla GryLion', 'Vicki Willems', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (331, 'Thorstein of Drakensburg called Thurston', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (332, 'Christopher of St. Joan', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (333, 'Laura of St. Joan', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (334, 'Conor, Farman, and William', '', '', 0, 0, 0, '');
INSERT INTO `op_recipients` VALUES (335, 'James Cunningham', 'Jim Pratt', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (336, 'Alan of Caerlaverock', 'Bruce Banzhof', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (337, 'Aisha bint Ismail', 'Krissy Gonzales', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (338, 'Dafydd Blaidd', 'Dave Majors', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (339, 'Aminah al yazici bint Ismail', 'Jen VonStein', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (340, 'Kira bint Ismail', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (341, 'Belle of Flaming Gryphon', 'Andrea Willems', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (342, 'Yasmine bint Ismail', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (343, 'Gaufridus of Blackthorne', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (344, 'Gideon of Unicorn', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (345, 'John Cook', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (346, 'Jonathon Stonehouse', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (347, 'Timothy the Just', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (348, 'William Forest Oldemixon', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (349, 'Rose of Carrick Fergus', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (350, 'Meriel FitzWilliam', 'Jani Riley', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (351, 'Loren Duilliath Siemster', 'Loren Kuhlmann', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (352, 'Vincenzio Fornaio', 'Pat Santucci', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (353, 'Lorna Velora', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (354, 'Irene the Questing', 'Susie Groseclose', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (355, 'Judith Deborah von Ankum', 'Julie Bertke', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (356, 'Melchior Stoneteeth', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (357, 'Sephora Talitha', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (358, 'Torpe Mago', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (359, 'Cecil the Silent', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (360, 'Ian Farrar', 'Ian Bäby', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (361, 'Suzanne of Tarpoint', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (362, 'Moirin ni Bhriain', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (363, 'Lily Cheswick', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (364, 'Thorkatla Wulfsdottir', 'Kate (Irwin) Dixon', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (365, 'Wolfgang von Ressler', 'Mark Yungblut', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (366, 'Gormlie Goldenhead', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (367, 'Isabella de Corbie', 'Angee Polzinetti (Toffolo)', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (368, 'Havenholde, Marche of', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (369, 'Padraiga Isobel de Hough', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (370, 'Rachel Lamorran', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (371, 'Olaf Brekeblade', 'Don Sexton', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (372, 'Francesco Maria Visconti', 'Chris Lauricella', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (374, 'Margarete of Stirlingshire', 'Mary (Anderson) Higgins', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (375, 'Juliana the Meeke', 'Karen Wohlafka', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (376, 'Elisabeth de Gerdeston', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (377, 'Crown Tournament Staff (Fall A.S. XXXI)', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (378, 'Tobias of St. Joan', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (379, 'Rusaad Azeem Muhammad', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (380, 'Karl Josef von Kühlmann', 'Karl Kuhlmann', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (381, 'Nicolas Kempe', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (382, 'Andrea Pellegrini', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (383, 'Eulalia', 'Michelle', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (384, 'Marisa Ashgrove', 'Sue Warner', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (385, 'Cillian McClure', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (386, 'Theresa von Rotenburg', 'Julia (Buerger) Phillips', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (387, 'Muirne Cos Fada', 'Linda Eipper', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (389, 'Caedmon Wilson', 'Chad Wilson', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (390, 'Timothy MacFarlane', 'Tim Brown', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (391, 'Roberto Carlos Montoyo Dominguez', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (392, 'Michael the Quick', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (393, 'Alisdair Mac Ghille Fhionnain', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (394, 'Samuel de Grace', 'Samuel Jernigen', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (395, 'Alfred the Trapper', 'Jerome Sye', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (396, 'Anastasia Drakina', 'Anastasia (Lynn) Sexton', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (397, 'Donna of Flaming Gryphon', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (398, 'Maria of Flaming Gryphon', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (399, 'Clare Kidwelly', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (400, 'Alastair McKeye', 'Lee Boling', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (401, 'Oriana Sarsfield', 'Michele Boling', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (402, 'Ceridwen d''Arci of Stag Oakes', 'Marie Bradford', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (403, 'Christopher Lawrence', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (405, 'Jennifer of St. Joan', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (406, 'Marjorie de ffeyrefeld', 'Tina Smith', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (407, 'Ailianor O''Malley', 'Amy Beumer', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (408, 'Séadach Ó Flaherty', 'Kate Santucci', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (409, 'Berengar Leclerc', 'Phil Baggett', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (410, 'Elizabeth Griffin', 'Chrissy Ryman', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (411, 'Elizabeth MacDonald', 'Beth Osborne', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (412, 'AnnMarie Morgaine', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (413, 'Eirik Michaelsson', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (414, 'Tatiana Kalinkova', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (416, 'Isabeau of St. Joan', 'Joanne Skuya', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (418, 'Colin MacNish', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (419, 'Thalia Baroncelli', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (420, 'Denegar of Unicorn', 'Mark Sugalski', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (421, 'Christopher of Unicorn', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (423, 'Jim of Unicorn', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (424, 'Gwen Pengam', 'Tammy Schwab', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (425, 'Aasa Sørensdotter', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (426, 'Cadogan Blaydes', 'Aaron Krempa', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (427, 'Lloyd the Raven', 'Greg Pencil', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (428, 'Soffya von Kulpe', 'Judith Bolenbaugh', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (429, 'Gertrude Krumpf', 'Marie Akers', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (430, 'Meliora Blythe', 'Bess DeTardo', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (431, 'Bainard Grey', 'Chad McInturff', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (432, 'Fritz von Eisig', 'Chris Zander', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (433, 'Angus MacGregor', 'David Peterson', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (434, 'Erol O''Hara', 'Mike Harrah', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (435, 'Abigail the Innocent', 'Paula Brinkman', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (436, 'Caspian Fitzpatrick', 'John Collins', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (437, 'Eric Galland', 'Mike Burnside', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (438, 'Otto von Bekh', 'Greg Bernard', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (439, 'Damen Von Alexander', 'Todd Pedicord', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (440, 'Musica Subterranea', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (442, 'Gregor Burcardus', 'Jim Stump', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (443, 'Gwennan Myngrudd', 'Faith Wymer', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (444, 'Katherine Raven', 'Sheila Pencil', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (445, 'Corwin of Flaming Gryphon', 'Corwin Willems', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (446, 'Nonna the Midwife of Stormgenger', 'Anne L. Carenbauer', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (447, 'Christopher called Cub', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (448, 'Faelan mac Neill', 'Theo Brinkman', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (449, 'Alia Greniczer', 'Steph Brown', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (450, 'Iseut la Gaunt-Roussie called Midori', 'Sarah Lane-Dorrance', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (451, 'Susan of Unicorn', 'Susan Burchardt', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (452, 'Saint Joan, College of', 'U. D. Medieval Club', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (453, 'Fiadhnait ó Ghlinne Alainn', 'Carol Reed', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (454, 'Phillip the Pilgrim', 'Phil Reed', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (455, 'Aleksandr Zabashnin', 'Jesse McIntyre', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (456, 'Auðin Hrafnsson', 'Chris Hudson', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (457, 'Hadakya Nakayama', 'Joe Kooyman', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (458, 'Hamish mor Dubh nan Cath', 'Christopher Adams', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (459, 'Julie', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (460, 'Jim', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (461, 'Gwindelin O''Dell', 'Gwindelin Fourman', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (462, 'Shavana Leigh O''Dell', 'Rashel Fourman', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (463, 'Violet O''Dell', 'Amanda O''Dell', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (464, 'Gunnar Red Boar', 'Patrick Hayes', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (465, 'Ramirez Santiago Saragossa', 'Brian Moyer', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (466, 'Aidan Alpin', 'Jack Wymer', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (467, 'Booscalia of Flaming Gryphon', 'Diana Wesley', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (468, 'Galiena Aubrey', 'Julie Walborn', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (469, 'Catriona Campbell', 'Sall Hensley', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (470, 'Eoin Drake', 'Rob "Drake" Schneider', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (471, 'Alrekr Eiríksson', 'Daniel J. Ross', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (472, 'Chance Dees', 'Chance Dees', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (473, 'Sebesa de la Cabrera etxetik Blackstar', 'Sebesa Moyer', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (474, 'Leif Viggaskald', 'Rance Clark', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (475, 'Garret Aubrey', 'William Walborn', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (476, 'Perdita von Hawkes Keye', 'Rebecca Fulmer', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (477, 'Dan the Cook', 'Dan Hensley', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (478, 'Dustin O''Dell', 'Dustin Fourman', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (479, 'Caitlin of St. Joan', 'Melissa Sepos', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (480, 'Evelyn Warner', 'Evelyn Warner', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (482, 'Virgil Aldenson of Lonewood', 'Scott Law', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (483, 'McCalla Houlagroski', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (484, 'Elspeth MacGregor', 'Brook Peterson', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (485, 'Edlyn of Meadowburne', 'Christine Bonder', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (486, 'Gurlock of Hawkes Keye', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (487, 'Kaðlín Sveinsdóttir', 'Kristina Walker', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (488, 'Boris Movila', 'Scott Bradley', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (489, 'Cianna Tremelian', 'Janie Leach', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (491, 'Edward Foxley', 'Jason Butsch', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (492, 'Elspeth McCleod', 'Evelyn Peterson', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (493, 'Duncan Campbell', 'Pete Fulmer', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (494, 'Ruth Ellen of Hawkes Keye', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (691, 'Beatrice of Darkwater', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (496, 'Sebastian Sabatini', 'Cleon Grover', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (497, 'Erin of the Unicorn', 'Erin Wilson', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (499, 'Brea Bayeldi the Meadster', 'Brea Ludwigson', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (500, 'Alexander Kyppyn Kirkcaldy', 'Kipp S. Martines', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (501, 'Sabine de Rouen', 'Michele R. Martines', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (502, 'Thorvald the Golden', 'Steven Tuck', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (503, 'Branwen Corbeau Blanc', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (504, 'Anghard verch Llewelyn', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (505, 'Duncan Frost', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (506, 'Kashka Mokosheva', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (507, 'Celia le Fleur', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (508, 'Rowan Hen Enaid', 'Mary Beth Gardner', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (509, 'Erica of Paragon Keep', 'Erica Bradley', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (510, 'Elizabethe Alles', 'Ashley Smith', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (511, 'Obedience Theodora', 'Jocelyn Walborn', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (514, 'Darius Lowen', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (515, 'Bertrande Fresneau', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (516, 'Tristan la Bear', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (517, 'Aedric of Lambert', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (518, 'Khayra bint Mujahid al-Tayyiba', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (520, 'Alexander Aubrey', 'Alec Walborn', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (521, 'Christiana de Burgh', 'Kristi Petranek', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (522, 'Thorgrim Sigurdsson', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (523, 'Osric of Unicorn', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (524, 'Anne Beaumont', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (525, 'Edward Beaumont', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (526, 'Johannes von Lubeck', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (527, 'Julien Wynter', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (530, 'Wit die Groot', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (531, 'Avelyn Grene', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (532, 'Hector de Florentia', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (533, 'Livia of Unicorn', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (534, 'Lucius of Unicorn', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (535, 'Keja Leifsdottir', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (536, 'Melissa of Unicorn', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (537, 'Sara of Unicorn', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (538, 'Felice Debbage', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (539, 'Sven Karlsson', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (540, 'Thomas of Effingham', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (541, 'Julianne of St. Joan', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (542, 'Cinnait of St. Joan', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (544, 'Orn Áskelsson', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (545, 'I Scandali', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (546, 'Elisabeth Fairchild', 'Lynaya', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (547, 'Mark of Unicorn', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (548, 'Dubhchobhlaigh inghean ui Dhiarmada', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (549, 'Rose Aubrey', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (550, 'Aestan of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (551, 'Aidien Alecsander', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (552, 'Alexander Edouardson', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (553, 'Aldís Sigurðardóttir', 'Audrey O''Hara', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (554, 'Amari Qira bat Abraham', 'Jennifer Thomas-Larsen', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (555, 'Appolonia von Württemberg', 'Theresa Fredette', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (556, 'Benjamin of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (557, 'Birna of Orkney', 'Sheryl L. Eldridge-Clark', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (558, 'Draenge Svenson', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (559, 'Daniel Featherstone', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (560, 'Edward of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (561, 'Elizabeta Foscari', 'Sarah Hines', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (562, 'Iofurr Ormarsson', 'Mark G. Griffith', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (563, 'Erich Von Kessel', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (564, 'Eva Perrin', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (565, 'Ewen de Cameron', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (566, 'Finepopla la Brewster', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (567, 'Gavin Landsgard', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (568, 'Gilchryst MacPhearson', 'Doyle McPherson', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (569, 'Grimarr', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (570, 'Joel of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (571, 'Judo', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (572, 'Kara de Korte', 'Kara VanRoekel', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (573, 'Kateline Crowe', 'Kathleen A. Anlage', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (574, 'Elisabeth Beauvisage', 'Alexandra Yungblut', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (575, 'Kevin of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (576, 'Lars Larsen the Rockthrower', 'Michael Larsen', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (578, 'Magnus Lutrsson', 'Matthew Allen', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (579, 'Marcus of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (580, 'Marie de Besançon', 'Erin Berdanier', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (581, 'Martym de Lagos', 'James Smith', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (582, 'Mike of Unicorn', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (583, 'Richard le Fournier', 'Russell Fredette', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (584, 'Richard of Norwich', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (585, 'Robert Fortune', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (586, 'Ruger Von Rosenau', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (587, 'Sarah of Fenix', 'Sarah VonStein', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (588, 'Skye of Flaming Gryphon', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (589, 'Sorca Drac', 'Diane Brunner', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (590, 'Stephen', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (591, 'Styrkarr', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (592, 'Summer of Fenix', 'Summer VonStein', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (593, 'Sven of Havenholde', 'Ian Swanson', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (594, 'Tilla Chandler', 'Jennifer Bishop', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (595, 'Ulliam MacAoidh', 'Jeffrey Glasgow', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (596, 'Walther Ravenolt', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (597, 'William Thomas', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (598, 'Wolf', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (599, 'Zach of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (600, 'Brigita Gescheid', 'Andrea Moore', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (601, 'Wulfric Gunnarsson', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (602, 'Stephanie of Unicorn', NULL, 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (603, 'Moira Glanny', 'Judy Law', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (604, 'Talfryn Dai Kensington', 'Floyd Taylor', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (605, 'Bayard of Flaming Gryphon', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (606, 'Elena MacPhearson', 'Brenda McPherson', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (607, 'Marie ferch Kirkcaldy', 'Amelia', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (608, 'Jayne ferch Kirkcaldy', 'Tabitha Martines', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (609, 'Emine of Flaming Gryphon', 'Jessica Featherstone', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (610, 'AgnarrTyr Johanson', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (611, 'Christopher Gray', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (612, 'Henry of Hawkes Keye', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (613, 'Steve of Flaming Gryphon', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (614, 'Alex of Flaming Gryphon', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (615, 'Cory of Flaming Gryphon', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (616, 'Mathaeus Blades', 'Matt Fonner', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (617, 'Machonna of Dark River', 'Matt Swanson', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (618, 'Anastasia Tremayne', 'Lisa Neumeister', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (619, 'Magnus Refsson', 'Shawn O\\\\\\''Hara', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (620, 'Victoria of High Harrogate', 'Kate Berdanier', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (621, 'Isra al-Zarqa', 'Karen Thomas', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (622, 'Toly Woodsman', 'Roy Suttles', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (623, 'Hrolf Evangson', 'Bill Barrett', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (624, 'Galin Ridleye', 'Gregory Reeder', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (625, 'Jean Michelle', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (626, 'Elizabeta of Unicorn', 'Emily DaCapite', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (627, 'Ada Glockner', 'Emily Kreinest', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (628, 'Bardas of Unicorn', 'Michael Dennis', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (631, 'Nico Eduardson', 'Nico Myers', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (632, 'Geneviefve de Chenonceaux', 'Nicole Sheldon', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (633, 'Atsur Heikan', 'Tim Smoot', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (634, 'Nikias Spartaites', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (635, 'Ben Timsson', 'Ben Hines', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (636, 'Masahiro of Unicorn', 'Jacob Medvick', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (637, 'Vlad of Unicorn', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (638, 'Ainthbine Hergeirskona', 'Patricia Wood', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (639, 'Heirgeirr Olafson', 'Brandon Wood', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (641, 'Chen of Unicorn', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (642, 'Albertus von Feuchtwangen', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (643, 'Severin Rheinfelser of Norborough', 'Bill Cramer', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (644, 'Matthias de Bear', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (645, 'Godfrey Timsson', 'Alex Hines', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (646, 'Alizaunde de Bregeuf', 'Honour', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (647, 'Finepopla le Tavenniere', 'Theresa Hayes', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (648, 'Galen of Ockham', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (649, 'Helena Svensdottir', 'Helena Swanson', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (650, 'Rore Bucahnan', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (651, 'Orianna Morgan of Ely', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (652, 'Clara de Guevara', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (653, 'Isaac Duneyrrson', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (654, 'Aveline verch Hywell', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (655, 'Moll Sotherden', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (656, 'Costança Daguiar', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (657, 'Muirgen inghean Conamhail', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (658, 'Aldis Trondelag', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (659, 'LaLa Shwaree Sah', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (661, 'Valentina of Flaming Gryphon', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (662, 'Aaron of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (663, 'Isibel Ingen Ui Bheoliain', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (665, 'Kristiana MacIntoshe', '', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (666, 'Hrafen of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (667, 'Rune of Flaming Gryphon', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (668, 'Dimitrius Von Drachentels', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (669, 'Isaac Fynn', 'Dakota Gambler Cole', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (670, 'Marzel of Unicorn', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (671, 'Adi of Havenhold', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (672, 'Dave of Flaming Gryphon', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (673, 'Dieterich Reuss', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (674, 'Drustice of St. Joan', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (675, 'Einar Ghylthir', '', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (676, 'Fiona Tremelian', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (677, 'Eustace Kilpin', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (678, 'Genevieve de Mirabel', 'Katie Brown', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (679, 'Legriel Elvellon', '', '', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (680, 'Michael of St. Joan', '', 'M', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (681, 'Seonaid inghean Dhomniall', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (682, 'Thea the Spinner', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (683, 'Melinda del Feld', '', 'F', 0, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (684, 'Ustad Hasan al Hadji', 'Ortega Hobson', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (685, 'Einarr Ginnfastsson', 'Scott Haley', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (686, 'Hrafna Ivarr', 'Isaac Pulfer', 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (687, 'Sigeird', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (688, 'Hjortr Svenson', '', '', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (689, 'Astrid Feilan', 'Val Barr', 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (690, 'Ellisif Auðinardóttir', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (692, 'Zbigneiw Winkler', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (693, 'Muira Makoto', 'David Caron', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (694, 'Akechi Shichiro', NULL, 'M', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (695, 'Antony Wolverton', 'Anthony Stoffolano', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (696, 'Jerusha a''Laon', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (697, 'Sarah Ketillswif', 'Sarah Covert Chapman', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (698, 'Ketill Melrakki', 'Joe Chapman', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (699, 'Ragna Auðinskona', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (700, 'Maeva of Winged Hills', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (701, 'Brun of Flaming Gryphon', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (702, 'Altan of the Moritu', NULL, 'F', 1, 0, 0, NULL);
INSERT INTO `op_recipients` VALUES (703, 'Elvira de Granada', 'Julia M Shepherd', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (704, 'Anna Rosina Krumphardt', 'Leslie Edens', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (705, 'Alexander Thorfinnson', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (706, 'Oberon', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (707, 'Luci Svensdottir', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (708, 'Thomas Minniear', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (709, 'Sif Raymondsdottir', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (710, 'Violante', '', '', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (711, 'Leonora Annalea Maria Martelli', 'Marty Smith', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (712, 'Aveline de Ceresbroch', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (713, 'Kathryn de Wrytar', 'Kathy Burden', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (714, 'Sigismund', 'Gary Washington', '', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (715, 'Leo', '', '', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (716, 'Carlos de la Agula', 'Matt Smith', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (717, 'Bryan', '', '', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (718, 'Dan of Flaming Gryphon', 'Dan Burden', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (719, 'Logan of Unicorn', '', '', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (720, 'Merewen de Cotesmore', '', 'F', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (721, 'Raimund Juan Diaz', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (722, 'Miguel Mono de Hierro', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (723, 'Silvius (?)', '', 'M', 1, 0, 0, '');
INSERT INTO `op_recipients` VALUES (724, 'Lothar Nachtshatten', 'Anton Kinsel', 'M', 1, 0, 0, '');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_recommendations`
-- 

CREATE TABLE `op_recommendations` (
  `recID` int(11) NOT NULL auto_increment,
  `yourtitle` varchar(120) collate utf8_unicode_ci default NULL,
  `yourscaname` varchar(250) collate utf8_unicode_ci NOT NULL,
  `yourmname` varchar(250) collate utf8_unicode_ci default NULL,
  `youremail` varchar(250) collate utf8_unicode_ci NOT NULL,
  `title` varchar(120) collate utf8_unicode_ci default NULL,
  `scaname` varchar(250) collate utf8_unicode_ci NOT NULL,
  `mname` varchar(250) collate utf8_unicode_ci default NULL,
  `shire` varchar(30) collate utf8_unicode_ci default NULL,
  `gender` enum('M','F') collate utf8_unicode_ci default NULL,
  `minor` tinyint(1) NOT NULL default '0',
  `honorkey` int(11) NOT NULL,
  `recdate` date NOT NULL,
  `deserve` text collate utf8_unicode_ci,
  `given` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`recID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=144 ;

-- 
-- Dumping data for table `op_recommendations`
-- 

INSERT INTO `op_recommendations` VALUES (14, 'Mistress', 'Gwyneth Banfhidhleir', 'Ginny Beatty', 'ginbeatty@gmail.com', 'Sir', 'Lothar Nachtshatten', 'Walter Kinzel', 'Out of Barony', 'M', 0, 193, '2017-06-15', 'Sir Lothar has recently been claimed by the barony at the Grand tournament of the Unicorn. He regularly attends fight practice in Oxford and Hamilton, training himself and helping new fighters. Though he is a knight of considerable reknown, I thought it would be fitting to &quot;mark&quot; him with a symbol of the new to flaming gryphon combatant.', 0);
INSERT INTO `op_recommendations` VALUES (16, 'Baron', 'Gavin MacFergus', 'Ronnie McCormack', 'Ron.mccormack06@yahoo.com', 'Lady', 'Astrid', 'Val Barr', 'Unicorn', 'F', 0, 192, '2017-08-09', 'As a combatant of the Knowne World Baronial Champions Tournament at the PENNSIC war, and as a warrior of the Middle Kingdom, it has been my distinct pleasure to face Lady Astrid on the field of combat on many separate occasions.  I have also worked with her in a service capacity on several occasions.<br /><br />That said, in my 29 years in the SCA, I have never met a more enthusiastic and dedicated warrior servant.  On the field, she is always smiling and is an inspiration to every other warrior.  When she is doing service, even the smallest and most insignificant task, she ALWAYS does it with a smile on her face and joy in her heart.<br /><br />Her skill at arms and her absolutely joyous attitude earned her the accolade of the "Knowne World Baronial Champion".  I competed against her, and I can say that in the hundreds of tournaments in which have competed, I have NEVER been so happy to lose to anyone.<br /><br />She is truly an asset to the Barony of Flaming Gryphon and is truly a treasure.<br /><br />I cannot comment her highly enough for admittance into your most noble order of the Gryphons Spear.<br /><br />Yours in service,<br /><br />Baron Gavin MacFergus<br />BOE, ORC, OSS, CGD, AST, OSO, OPF', 0);
INSERT INTO `op_recommendations` VALUES (20, 'Lord', 'Einarr Ginnfastsson', 'Scott Haley', 'Eagle_jixx@hotmail.com', 'Lordship', 'Muira Makoto', 'David Caron', 'Hawkes Keye', 'M', 0, 192, '2017-08-19', 'Mako fought in all rapier battles with the Barony and water bared for the heavy weapons unit. Even when not able to reach the barony in the woods to water bare for heavy, Mako provided aid and service to our honorable enemies, while wearing his ermine and or. On the rapier field, he helped prepare our unit for success leading up to Pennsic, organized the 1st Calvarie de Griffe and was a prominent warrior on the field that usually survived longer on the front lines than most of the unit. In the woods he was apart or a small skirmish unit on the far left side that help up opposing collars for quite a long time,', 0);
INSERT INTO `op_recommendations` VALUES (23, 'Lady', 'Geneviefve de Chenonceaux', 'Nicole Sheldon', 'Sheldon2@miamioh.edu', '', 'Christofer de Gray', 'Jason Gray', 'Norborough', 'M', 0, 192, '2017-09-14', 'Christofer stepped up at Pennsic where many others were unable to. He organized, ran, and lead the Rapier Valkries this year, stepping in late in the season. He helped keep the rapier fighters hydrated and feed while during each battle while also fighting each heavy battle. He did this all humbly and without need for commendation. The rapier group has already provided him a token for his service, but I believe we are all in agreement that we would love to see his hard work called out and celebrated publicly.', 0);
INSERT INTO `op_recommendations` VALUES (25, 'Lady', 'Sarah Ketillswif', 'Sarah J Chapman', 'sarahjochapman@gmail.com', 'Lady', 'Aldis Sigurdsdaughter', 'Audrey O''Hara', 'Hawkes Keye', 'F', 0, 190, '2017-09-15', 'Aldis has a long history of service, Hawkes K Seneschal, champion, service behind the scenes, constant retaining, royalty room guarding, royalty liaison at Push . . . she truly serves her barony and helps insure the reputation of BFG is upheld.', 0);
INSERT INTO `op_recommendations` VALUES (27, 'Baron', 'Gavin MacFergus', 'Ron McCormack', 'Ron.mccormack06@yahoo.com', 'Lady', 'Astrid', 'Val Barr', 'Unknown', 'F', 0, 192, '2017-09-17', 'Unto Your Excellencies Edward and Allegra, Baron and Baroness of Flaming Gryphon do I, Baron Gavin MacFergus send greetings!rnrnI write this day to recommend one of your subjects, Astrid (Val Barr), for the Gryphons Spear.rnrnI feel that Astrid deserves to be recognized by this award for the following reasons:rnAs a combatant of the Knowne World Baronial Champions Tournament at the PENNSIC war, and as a warrior of the Middle Kingdom, it has been my distinct pleasure to face Lady Astrid on the field of combat on many separate occasions. I have also worked with her in a service capacity on several occasions.  That said, in my 29 years in the SCA, I have never met a more enthusiastic and dedicated warrior servant. On the field, she is always smiling and is an inspiration to every other warrior. When she is doing service, even the smallest and most insignificant task, she ALWAYS does it with a smile on her face and joy in her heart.  Her skill at arms and her absolutely joyous attitude earned her the accolade of the &quot;Knowne World Baronial Champion&quot;. I competed against her, and I can say that in the hundreds of tournaments in which have competed, I have NEVER been so happy to lose to anyone.  She is truly an asset to the Barony of Flaming Gryphon and is truly a treasure.  I  cannot commend her highly enough for admittance into your most noble order of the Gryphons Spear.rnrnYours in service,rnrnBaron Gavin MacFergusrnORC, OSS, CGD, AST, OSO, OPF, BOE', 0);
INSERT INTO `op_recommendations` VALUES (94, 'Hlaefdige (Baroness/Mistress)', 'Gyda Arnarsdottir', 'Anne Berdanier', 'baroness_cat@hotmail.com', 'Baron', 'Eirik the Elder', 'Frank Scott', 'Norborough', 'M', 0, 288, '2018-02-07', 'Eirik has served on and off in this barony since before 1988 at least (i.e. before my time here in \\''88). He does calligraphy and illumination and is an active supporter of the thrown weapon community.  He is a upstanding member of the barony and has taken offices for the barony.  I believe he is currently the Thrown Weapon\\''s Marshal for Flaming Gryphon. He is proud to promote the barony as far afield as Gulf Wars!', 0);
INSERT INTO `op_recommendations` VALUES (95, 'Hlaefdige (Baroness, OP, OL)', 'Gy&Atilde;&deg;a Arnarsd&Atilde;&sup3;ttir', 'Anne Berdanier', 'baroness_cat@hotmail.com', 'Mistress', 'Mary Garrett of Seasalter', 'Mary Dahlberg', 'Norborough', 'F', 0, 288, '2018-02-07', 'I know Mary is a bit contentious at times but really, over all, her track record is positive for the Barony in general.  She has served the barony in various ways over the years, granted sometime more active than others, but in the long run she has been around the barony for 30 years. She has served as Baronial Artisan, and taken an office or two locally and at large - Chatelaine for Norborough and Thrown Weapons Marshal come to mind.  She has put in personal time, energy, and resources for the barony in the metalwork tokens she has made for various Champions (Artisan, Baronial Champion, Baron &amp; Baroness) as well as the Baronial coronets, and the old Flaming Gryphon gates. She has supported events as a volunteer and created site tokens.  She has made five silk banners for the Marches of our group. And mostly she is a supporter of the Barony.  Her sometimes erratic behavior towards the barony stems partly from her desire to be an active and appreciated member of the Barony and her modern world issues (I can explain privately if you wish to be filled in but it is not for public record).', 0);
INSERT INTO `op_recommendations` VALUES (96, 'Lady', 'Geneviefve de Chenonceaux', 'Nicole Sheldon', 'sheldon2@miamioh.edu', 'Lady', 'Genevieve de Mirabelle', 'Katie Brown', 'Hawkes Keye', 'F', 0, 291, '2018-03-04', 'Genevieve has done a wonderful job of portraying authenticity in her persona. She has done research over the years on the transitional French period and has worked to bring that period to life through her costuming and arts. She continually improves her garb and kit each year adding items from her research. \\r\\n\\r\\nShe also continues to teach about this period and the arts, helping others to improve their persona\\''s authenticity.', 0);
INSERT INTO `op_recommendations` VALUES (97, 'Lady', 'Geneviefve de Chenonceaux', 'Nicole Sheldon', 'sheldon2@miamioh.edu', '', 'Nora', 'Marty Martineau', 'Hawkes Keye', 'F', 0, 233, '2018-03-04', 'Nora (name recently changed from Arnorra) authorized this year as a fencer in our Barony. She has not yet received her cloak.', 0);
INSERT INTO `op_recommendations` VALUES (98, 'Lady', 'Geneviefve de Chenonceaux', 'Nicole Sheldon', 'sheldon2@miamioh.edu', '', 'Ernin Ainsheasccar O Raghallaigh', 'Tori', 'Hawkes Keye', 'F', 0, 233, '2018-03-04', 'Ernin authorized last year as part of the barony and has not yet received her cloak.', 0);
INSERT INTO `op_recommendations` VALUES (99, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Christopher Hudson', 'Hudson13@gmail.com', 'Lord', 'Hrafn Ivarr', 'Isaac Pulfer', 'Unknown', 'M', 0, 192, '2018-03-15', 'I feel that Hrafn&acirc;', 0);
INSERT INTO `op_recommendations` VALUES (100, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', '', 'Hudson13@gmail.com', 'Lord', 'Hrafn Ivarr', 'Isaac Pulfer', 'Unknown', 'M', 0, 190, '2018-03-15', 'Hrafn is always serving. He is often on of the first to step up to volunteer. From brute squad, marshaling, teaching or any of the many other ways he serves, I feel that he deserves to be recognized for his effort and passion for our Barony', 0);
INSERT INTO `op_recommendations` VALUES (101, 'Baroness, Mistress, Forester', 'Mary Garrett of Seasalter', 'Mary Dahlberg', 'mdahlberg6633@gmail.com', 'Lord', 'Audin Hrafnsson', 'Christopher Hudson', 'Hawkes Keye', 'M', 0, 190, '2018-03-20', 'Audin has been the Baronial Artisan and has run the competition twice.\\r\\nHe has taught leather-work and shield painting to many baronial folk and is always happy to create and donate his work for the betterment of the Society and Barony.  He created the sheathe for the new MK TW (big ax!) regalia.  Audin has also taken charge of the Baronial Trailer (to keep Tim the Just happy).  Whenever he has been asked to \\''do something\\'', he has done it with a smile.', 0);
INSERT INTO `op_recommendations` VALUES (102, 'Baroness, Mistress, Forester', 'Mary Garrett of Seasalter', 'Mary Dahlberg', 'mdahlberg6633@gmail.com', 'Lord', 'Audin Hrafnsson', 'Christopher Hudson', 'Hawkes Keye', 'M', 0, 190, '2018-03-20', 'Audin has been the Baronial Artisan and has run the competition twice.\\r\\nHe has taught leather-work and shield painting to many baronial folk and is always happy to create and donate his work for the betterment of the Society and Barony.  He created the sheathe for the new MK TW (big ax!) regalia.  Audin has also taken charge of the Baronial Trailer (to keep Tim the Just happy).  Whenever he has been asked to \\''do something\\'', he has done it with a smile.', 0);
INSERT INTO `op_recommendations` VALUES (103, 'THL', 'Marjorie de ffeyrefeld', 'Tina Smith', 'ldymarjorie@gmail.com', 'Lord', 'Einarr Ginfastsson', '', 'Hawkes Keye', 'M', 0, 191, '2018-04-22', 'Einarr does an excellent job of helping where he is able and gives generously of his time.  He recently taught a class on the History of Paper making and has been working at improving his sewing abilities.  He is happy to teach what he knows and is visibly making improvements in his abilities in the Arts and Sciences.', 0);
INSERT INTO `op_recommendations` VALUES (104, 'Lady', 'Sarah Ketillswif', 'Sarah J Chapman', 'sarahjochapman@gmail.com', 'Lady', 'Ragna Audinskona', 'Keshia Hudson', 'Unknown', '', 0, 190, '2018-07-14', 'Ragna is the unsung hero among the barony.  She watches kids while so others can fight and serve.  She cooks for EVERYTHING, she helps at lunch taverns, she judged leg contests and Celidgh.  She never leads and so the spotlight never shines on her but if there is something being done SOMEWHERE Ragna is there, making the magic possible.  Our barony is richer for her.', 0);
INSERT INTO `op_recommendations` VALUES (105, 'Lady', 'Sarah Ketillswif', 'Sarah J Chapman', 'sarahjochapman@gmail.com', 'Lady', 'Ragna Audinskona', 'Keshia Hudson', 'Unknown', '', 0, 190, '2018-07-14', 'Ragna is the unsung hero among the barony.  She watches kids while so others can fight and serve.  She cooks for EVERYTHING, she helps at lunch taverns, she judged leg contests and Celidgh.  She never leads and so the spotlight never shines on her but if there is something being done SOMEWHERE Ragna is there, making the magic possible.  Our barony is richer for her.', 0);
INSERT INTO `op_recommendations` VALUES (106, 'Lady', 'Sarah Ketillswif', 'Sarah J Chapman', 'sarahjochapman@gmail.com', 'Lady', 'Ragna Audinskona', 'Keshia Hudson', 'Unknown', '', 0, 190, '2018-07-14', 'Ragna is the unsung hero among the barony.  She watches kids so others can fight and serve.  She cooks for EVERYTHING, she helps at lunch taverns, she judged leg contests and Celidgh.  She never leads and so the spotlight never shines on her but if there is something being done SOMEWHERE Ragna is there, making the magic possible.  Our barony is richer for her.', 0);
INSERT INTO `op_recommendations` VALUES (107, '', '', '', '', '', '', '', '', '', 0, 0, '2018-07-14', '', 0);
INSERT INTO `op_recommendations` VALUES (108, 'Baroness', 'Gyda Arnarsdottir', 'Anne', 'Baroness_cat@hotmail.com', 'Mistress', 'Alizaunde de Bregeuf (but I don\\''t think that is how she spells it)', 'Honour', 'Winged Hills', 'F', 0, 190, '2018-09-01', 'Honestly, looking at her track record, Mistress Alizaundra de Brebeuf (also know by Una), deserves a Flaming Brand for her support of the Barony. She is one of the first to offer to attend a demo and participate when rides are available or her mode of transportation is running, she is always stepping up to provide a class for events or shire meetings when a call goes out. She may not be so popular due to her Aspie personality but her service is there. Her heart is in the SCA and she does want to belong and fit in.', 0);
INSERT INTO `op_recommendations` VALUES (109, 'Lord', 'Laurentius Le Rous', 'Frank Petersen', 'soulkeeper@grungyape.com', 'Lord', 'Christopher De Grey', 'Jason Gray', 'Unknown', 'M', 0, 190, '2018-09-06', 'The sheer amount of time and dedication spent driving to, training, and practicing with heavy members, esp myself, in the shire of Grenemere. Came every chance he could, even when weather was questionable.', 0);
INSERT INTO `op_recommendations` VALUES (110, 'Lord', 'Laurentius Le Rous', 'Frank Petersen', 'soulkeeper@grungyape.com', 'Lord', 'Hrafn-Ivarr', 'Isaac Pulfer', 'Unknown', 'M', 0, 190, '2018-09-06', 'Isaac was non stop.  This young man worked all night, barely took a time to sleep and continued to show up to every possible fighter practice we had to get us trained, authorized and in my case on my path to marshal status.  He offered advice, criticism, and instruction each time it was due, and made sure that he was at the disposal of every fighter who needed him.  In addition, he always came with enough loaner armor to go around.  I personally, am indebted.', 0);
INSERT INTO `op_recommendations` VALUES (111, 'THL', 'Marjorie de ffeyrefeld', 'Tina Smith', 'ldymarjorie@gmail.com', 'Lord', 'Audin Hrafnsson', 'Chris Hudson', 'Hawkes Keye', 'M', 0, 190, '2018-10-14', 'Audin has long been a supporter of the Arts in Flaming Gryphon, but he also serves the barony and that should not be overlooked.  From gifts of his art, I have a shield he painted for St. Joan back when he was Oweyn Hudson, and more recently his art has graced the Flaming Gryphon Heavy and Rapier champion shields, as well as the leather hoods for spear/axes in the barony.  In addition to these gifts, he has served well as the Minister of Arts and Sciences in Hawkes Keye.  During his time as MOAS, Hawkes Keye has held regular A&amp;S nights and he has shared his knowledge and expertise at some of these classes.\\r\\nFor these reasons, and many more which are not mentioned here, I believe Audin Hrafnsson should be awarded the Flaming Brand', 0);
INSERT INTO `op_recommendations` VALUES (112, 'THL', 'Marjorie de ffeyrefeld', 'Tina Smith', 'ldymarjorie@gmail.com', 'Lady', 'Anna Rosina Krumphardt', 'Leslie Edens', 'Winged Hills', 'F', 0, 190, '2018-10-14', 'Anna Rosina has been generous with her time and service.  She has arranged and continues to liase with the 12th night site.  It is such a great site that we have also held Collegium there.  Anna Rosina has taken on the position of Deputy MOAS for the Marche of Winged Hills and will be stepping in as MOAS in the near future, giving Fiadnata a break after her long service in this role.  Additionally, she has acted as deputy Autocrat for the Winged Hills Collegium/South Oaken Regional A&amp;S Faire, and did an excellent job.\\r\\nFor these reasons and several more not listed here, it is my opinion that Anna Rosina Krumphardt should be awarded the Flaming Brand', 0);
INSERT INTO `op_recommendations` VALUES (113, 'THL', 'Marjorie de ffeyrefeld', 'Tina Smith', 'ldymarjorie@gmail.com', 'Lord', 'Dan of Flaming Gryphon (the Burden)', 'Dan Burden', 'Winged Hills', 'M', 0, 190, '2018-10-14', 'Dan the Burden is anything but.  He helps out wherever he is able.  At Pennsic, he worked water point almost every day of War week, filling literally hundreds of gallons of water.  At Harvest Day Last year, he could be seen driving a golf cart, shuttling people and gear from the parking lot to various points on the site.  This year at Harvest Day he assisted with set up, arriving a day before the event began, and tear down and assisted people wherever he saw a need.  He does woodwork, and has opened his shop to people in the barony that were inclined to do do woodworking, or learn more about it.  \\r\\nFor these reasons, I believe Dan should be awarded a Flaming Brand.', 0);
INSERT INTO `op_recommendations` VALUES (114, '', 'Christofer Degray', 'JASON A GRAY', 'dracoinvictus224@gmail.com', '', 'Merewen de cotesmore', 'Misti Reisz', 'Norborough', 'F', 0, 190, '2019-03-02', 'Misti has taken over the role as autocrat for celidh this year. In doing so she has worked countless hours while still fulfilling the needs of her family. Misti has also sacrificed her time (and some sanity) to ensure that the event will run as smooth as possible. However I feel that what I have stated so far only scratches the surface. Merewen brings an enthusiasm that is unbridled to norborogh. She has a love of the sca that is displayed relentlessly and works tirelessly behind the scenes.', 0);
INSERT INTO `op_recommendations` VALUES (115, '', '', '', '', '', '', '', '', '', 0, 0, '2019-03-02', '', 0);
INSERT INTO `op_recommendations` VALUES (116, '', 'Christofer Degray', 'JASON A GRAY', 'dracoinvictus224@gmail.com', '', 'Merewen de cotesmore', 'Misti Reisz', 'Norborough', 'F', 0, 190, '2019-03-02', 'Misti has taken over the role as autocrat for celidh this year. In doing so she has worked countless hours while still fulfilling the needs of her family. Misti has also sacrificed her time (and some sanity) to ensure that the event will run as smooth as possible. However I feel that what I have stated so far only scratches the surface. Merewen brings an enthusiasm that is unbridled to norborogh. She has a love of the sca that is displayed relentlessly and works tirelessly behind the scenes.', 0);
INSERT INTO `op_recommendations` VALUES (117, 'Lady', 'Thalia Baroncelli', 'Melissa Townsend', 'thalibaroncelli@juno.com', 'Captain', 'Arthur Bear', 'Brian Wymer', 'Winged Hills', 'M', 0, 190, '2019-03-08', 'Captain Bear has freely given of his time and effort to initiate and develop the Southoaken Iron Man at Pennsic.  Each year, he has a new (dog tag) medallion struck to honor those who have fought or carried water in every heavy weapons battle at that Pennsic.\\r\\n\\r\\nAfter the last field battle, he will personally hand out the medallions and congratulate each recipient for supporting the Midrealm.  I have personally witnessed many fighters wearing their tags with pride and explaining to new fighters how to earn one.  \\r\\n\\r\\nNote to Their Excellencies: I realize this should be a Gryphon\\''s Spear but the Spear is an Order so you can only join once whereas an Award can be given multiple times.', 0);
INSERT INTO `op_recommendations` VALUES (118, 'Sir', 'Gunnar Redboar', 'Patrick Hayes', 'syr.redboar@gmail.com', 'Sir', 'Wulfric Gunnarson', 'Chris McDonough', 'Winged Hills', 'M', 0, 192, '2019-03-18', 'Wulfric has served two years as the Baronial Warlord. He has certainly contributed to the Pennsic War Effort.', 0);
INSERT INTO `op_recommendations` VALUES (119, 'Sir', 'Gunnar Redboar', 'Patrick Hayes', 'syr.redboar@gmail.com', 'Lord', 'Ketill Melrakki', 'Joe Champman', 'Hawkes Keye', 'M', 0, 193, '2019-03-18', 'Ketill has fought with the Barony at Pennsic on several occasions has been overlooked for the Sable Shield.', 0);
INSERT INTO `op_recommendations` VALUES (120, 'Sir', 'Gunnar Redboar', 'Patrick Hayes', 'syr.redboar@gmail.com', 'Lord', 'Sigismund of Red Hammer', 'Gary Washington', 'Winged Hills', 'M', 0, 193, '2019-03-18', 'Sigismund has fought with the baronial levy at Pennsic and has been overlooked for this recognition.', 0);
INSERT INTO `op_recommendations` VALUES (121, 'Sir', 'Gunnar Redboar', 'Patrick Hayes', 'syr.redboar@gmail.com', 'Lady', 'Sarah Ketillswif', 'Sarah Covert-Chapman', 'Hawkes Keye', 'F', 0, 291, '2019-03-18', 'Sarah continues to pursue period excellence in her garb, day camp and arts presentation. Her recent entries in baronial arts were not only period but garnered her the baronial arts championship. She is worthy of this recommendation.', 0);
INSERT INTO `op_recommendations` VALUES (122, 'Lady', 'Kathryn de Wrytar', 'Kathy Burden', 'khall0510@yahoo.com', '', 'Do not have her SCA name', 'Ellen Ottoson', 'Havenholde', 'F', 0, 190, '2019-04-15', 'Mary opened up her home and allowed her personal loom to be occupied by another for months, teaching her patiently the art of weaving, guiding her to enjoy and succeed at a new endeavor. This not only shows caring for another but an oblivious joy for her art and a devotion to our society.', 0);
INSERT INTO `op_recommendations` VALUES (123, 'Lady', 'Anastasia Tremayne', 'Lisa Neumeister', 'whynot198@gmail.com', 'Lord', 'Dr&Atilde;&brvbar;nge Svenson', 'Byron Swanson', 'Unknown', 'M', 0, 190, '2019-08-20', 'At MK50, I had the duty to manage the Queen\\''s Ball. At the end of the evening there were several Gryphonites left to help manage the cleanup, including our own Baroness. In the midst of packing the food away I go to the kitchen to find Dr&Atilde;&brvbar;nge elbow deep in the sinks with a scrub brush and the drink coolers. I had told him just to rise them and that I would scrub them later. At almost 2am,he had taken it upon himself not to merely rinse them, but to properly wash each of the 5 gallon coolers. When I thanked him for his effort, he shrugged and said', 0);
INSERT INTO `op_recommendations` VALUES (124, 'Lady', 'Kathryn de Wrytar', 'Kathy Burden', 'Khall0510@yahoo.com', 'Lady', 'Daneen Yvonne Perry', 'Daneen Yvonne Perry', 'Havenholde', 'F', 0, 190, '2019-09-24', 'In addition to serving in any capacity that is needed Daneen was a successful leader for a Demo with an immediate invitation to participate next year.  Her love of the SCA and her service to the Barony are known and appreciated by all.', 0);
INSERT INTO `op_recommendations` VALUES (125, '', 'Antony Wolverton', 'Anthony Stoffolano', 'Stoffolanot@gmail.com', '', 'Ragna Au&Atilde;&deg;inskona', 'Keisha Hudson', 'Hawkes Keye', 'F', 0, 190, '2019-11-03', 'For prepping and cooking of Baronial Champs feast, helping out at events and where she can.', 0);
INSERT INTO `op_recommendations` VALUES (126, '', 'Antony Wolverton', 'Anthony Stoffolano', 'Stoffolanot@gmail.com', '', 'Ragna Au&Atilde;&deg;inskona', 'Keisha Hudson', 'Hawkes Keye', 'F', 0, 190, '2019-11-03', 'For prepping and cooking of Baronial Champs feast, helping out at events and where she can.', 0);
INSERT INTO `op_recommendations` VALUES (127, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Christopher Hudson', 'Hudson13@gmail.com', '', 'Antony Wolverton', '', 'Hawkes Keye', 'M', 0, 190, '2019-11-03', 'Antony is always lending a hand where needed. He can be seen marshaling, working troll help with set up and clean up of event sites. He has served as an officer of Hawkes Keye. It was quite a surprise to learn that he has yet to be recognized for all that he does', 0);
INSERT INTO `op_recommendations` VALUES (128, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Christopher Hudson', 'Hudson13@gmail.com', '', 'Antony Wolverton', '', 'Hawkes Keye', 'M', 0, 190, '2019-11-03', 'Antony is always lending a hand where needed. He can be seen marshaling, working troll help with set up and clean up of event sites. He has served as an officer of Hawkes Keye. It was quite a surprise to learn that he has yet to be recognized for all that he does', 0);
INSERT INTO `op_recommendations` VALUES (129, 'Lord', 'Audin Hrafnsson', 'Christopher Hudson', 'Hudson23@gmail.com', 'Lady', 'Ragna Au&Atilde;&deg;inarkona', 'Keshia Hudson', 'Unknown', 'F', 0, 191, '2019-11-05', 'Ragna has shown exceptional skill in the art and science of cooking and baking. Her most recent planned g and preparation of the feast for the Baronial Championship Is a testament to these skills, for which I feel she deserves to be recognized.', 0);
INSERT INTO `op_recommendations` VALUES (130, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Christopher Hudson', 'Hudson13@gmail.com', 'Lord', 'Antony Wolverton', 'Tony stoffolano', 'Hawkes Keye', 'M', 0, 191, '2019-11-05', 'Antony has shown great skill in his fiber arts. His recent display of a wool shawl that he hand spun and wove combined with his increasing skill in embroidery is why I feel he deserves to be recognized with the award of the Gryphon&acirc;', 0);
INSERT INTO `op_recommendations` VALUES (131, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Christopher Hudson', 'Hudson13@gmail.com', 'Lady', 'Ragna Au&Atilde;&deg;inarkona', 'Keshia Hudson', 'Hawkes Keye', 'F', 0, 191, '2019-11-05', 'Ragna has continued to demonstrate her passion and skill in the art and science of food preparation with her cooking and baking. Her recent planning and preparation of feast for the Baronial Championship is a shining example of her skill and love for her art and is why I would like to recommend her to be recognized by receiving the award of the Gryphon&acirc;', 0);
INSERT INTO `op_recommendations` VALUES (132, 'Lord', 'Hrafn-Ivarr', 'Isaac Pulfer', 'isaac.pulfer@yahoo.com', 'Lord', 'Anthony Wolferton', 'Anothony Stoffolano', 'Winged Hills', 'M', 0, 191, '2019-11-10', 'Tony, has done amazing work with embroidery, and woodworking for the barony. He is always eager to explain and display his his work to anybody who asks about it.', 0);
INSERT INTO `op_recommendations` VALUES (133, 'Lord', 'Hrafn-Ivarr', 'Isaac Pulfer', 'isaac.pulfer@yahoo.com', 'Lord', 'Anthony Wolferton', 'Anothony Stoffolano', 'Winged Hills', 'M', 0, 191, '2019-11-10', 'Tony, has done amazing work with embroidery, and woodworking for the barony. He is always eager to explain and display his his work to anybody who asks about it.', 0);
INSERT INTO `op_recommendations` VALUES (134, 'Lord', 'Hrafn-Ivarr', 'Isaac Pulfer', 'isaac.pulfer@yahoo.com', '', 'Elesif Authinsdotter', 'Charlie Hudson', 'Unknown', 'F', 1, 191, '2020-01-10', 'Charlie has show great work in Leather working, and knowledge of tools for her age. She is the current Baronial art\\''s Champion for the youth.', 0);
INSERT INTO `op_recommendations` VALUES (135, 'Lord', 'Choi Min', 'Jacquelyn Hansel', 'jacquelyn.hansel@gmail.com', '', 'Erlingr Elldiarnsson', 'Levi Blake', 'Out of Barony', 'M', 0, 190, '2021-12-23', 'Erlingr has been serving the Incipient Shire of Grenemere since 2018 in various posts. Most significantly as the marshal. He is the sole driving force for hosting practices, making loaner gear, and more for our few local fighters. He does his utmost to recruit more. It\\''s been rough going virtual for a few years for him, but he hasn\\''t lost his passion.', 0);
INSERT INTO `op_recommendations` VALUES (136, 'YuvQOlNswWTzfVYN', 'johnansaz', 'johnansaz', 'smithio34jja1134@yahoo.com', 'fPbBOprQqDOVNfbz', 'johnansaz', 'johnansaz', 'Norborough', 'F', 0, 190, '2022-04-10', 'http://t-links.org/EZjAi12N real sex dating near you!', 0);
INSERT INTO `op_recommendations` VALUES (137, 'JjfrAlpaDJOrfzgk', 'johnansaz', 'johnansaz', 'smithio34jja1134@yahoo.com', 'VcVXhSlvMb', 'johnansaz', 'johnansaz', 'Havenholde', 'M', 0, 293, '2022-04-18', 'http://imrdsoacha.gov.co/silvitra-120mg-qrms', 0);
INSERT INTO `op_recommendations` VALUES (138, 'The Honorable Lady', 'Marjorie de ffeyrefeld', 'Tina Smith', 'ldymarjorie@gmail.com', 'Baron', 'Orn Askelsson', 'Michael Klefas', 'Winged Hills', 'M', 0, 191, '2022-05-03', 'For his woodwork.  Especially his work on the Baronial thrones.  Additionally, his artistry can been be found in the Serving trays used by Bronwyn at the lunch served at Mistress Appolonia\\''s Elevation during Grand Tourney of the Dragon.  As well as in the Chess boards used by the Flaming Gryphon Baronial Gaming champion.  I feel Orn has been previously overlooked for this award, as he is often recognized for his service, but seldom recognized for his Art, which is often given just as freely.', 0);
INSERT INTO `op_recommendations` VALUES (139, 'Baroness Mistress', 'Rosamund Beauvisage', 'Laura Hume', 'rosamundi2021@gmail.com', '', 'Inga Johansdottir', 'Angela Acker', 'Winged Hills', 'F', 0, 191, '2022-09-08', 'Inga has been a fiber arts (nalbinding, spinning, weaving) force of nature in producing Norse era items, entering A&amp;S, teaching individuals and classes, and encouraging the arts and sciences in myriad other ways. She&acirc;', 0);
INSERT INTO `op_recommendations` VALUES (140, 'Master', 'Lancelin Peregrinus', 'Grant Root', 'lancelin@rootcentral.org', 'Lord', 'John Doeslayer', 'John Doe', 'Winged Hills', 'M', 0, 190, '2022-09-09', 'He\\''s just an awesome guy!', 0);
INSERT INTO `op_recommendations` VALUES (141, 'Master', 'Lancelin Peregrinus', 'Grant Root', 'lancelin@rootcentral.org', 'Lord', 'John Doeslayer', 'John Doe', 'Winged Hills', 'M', 0, 190, '2022-09-09', 'He\\''s just a really cool dude!', 0);
INSERT INTO `op_recommendations` VALUES (142, 'Sir', 'Magnus Refsson', 'Shawn O\\''Hara', 'PhoenixFirewall@msn.com', 'Sergeant', 'Astrid Feilan', 'Valerie Barr', 'Unknown', 'F', 0, 193, '2022-10-30', 'It has come to my attention that this individual does not appear on the Roll of Honor for this Order.  I seek to remedy this.', 0);
INSERT INTO `op_recommendations` VALUES (143, 'The Honorable Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Chris Hudson', 'Gullinhrafn@gmail.com', '', 'Willow Au&Atilde;&deg;inardottir', 'Willow Hudson', 'Hawkes Keye', 'F', 1, 287, '2022-11-17', 'For her  tireless efforts in preparing and serving at baronial champs feast. Willow spent many hours helping prep and cook the feast in the days leading up to the event as well as time spent in the kitchen the day of the event. She was the first volunteer to sign up for serving, as well.', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_reportStatus`
-- 

CREATE TABLE `op_reportStatus` (
  `statusID` tinyint(4) NOT NULL,
  `status` varchar(40) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`statusID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `op_reportStatus`
-- 

INSERT INTO `op_reportStatus` VALUES (0, 'New');
INSERT INTO `op_reportStatus` VALUES (1, 'Open');
INSERT INTO `op_reportStatus` VALUES (2, 'Pending');
INSERT INTO `op_reportStatus` VALUES (3, 'Resolved');
INSERT INTO `op_reportStatus` VALUES (4, 'Closed (no resolution)');

-- --------------------------------------------------------

-- 
-- Table structure for table `op_reports`
-- 

CREATE TABLE `op_reports` (
  `reportkey` int(11) NOT NULL auto_increment,
  `statusID` tinyint(4) NOT NULL default '0',
  `title` varchar(120) collate utf8_unicode_ci default NULL,
  `scaname` varchar(250) collate utf8_unicode_ci NOT NULL,
  `mname` varchar(250) collate utf8_unicode_ci default NULL,
  `email` varchar(250) collate utf8_unicode_ci NOT NULL,
  `error` text collate utf8_unicode_ci NOT NULL,
  `resolution` text collate utf8_unicode_ci,
  `reportdate` date NOT NULL default '0000-00-00',
  `lastworkdate` date default NULL,
  `notify_me` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`reportkey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=45 ;

-- 
-- Dumping data for table `op_reports`
-- 

INSERT INTO `op_reports` VALUES (14, 4, 'Master', 'Dafydd Blaidd', 'Dave Majors', 'dafydd@midrealm.org', 'THIS IS A TEST', 'testing...\r\nmore testing...\r\neven more testing...', '2011-06-01', '2017-04-10', 1);
INSERT INTO `op_reports` VALUES (15, 3, 'THL', 'Lancelin Peregrinus', 'Grant Root', 'lancelin@rootcentral.org', 'My court barony is not listed!', 'I''m looking into it...\r\nThis is a Kingdom award and it seems that it is not listed in the Kingdom OP.  After looking a bit deeper, it seems that it was not published in The Pale, nor was it actually ever read into court.  You''ll have to take this up with others higher up the chain.', '2011-06-09', '2011-06-23', 1);
INSERT INTO `op_reports` VALUES (17, 3, 'Baron', 'Brusten de Bearsul', 'Patrick Smith', 'pat.epub@gmail.com', 'Both my SCA name and my arms are registered with the College of Arms. See http://oanda.sca.org/oanda_name.cgi?p=Brusten+de+Bearsul', 'In a rare early instance, the name and device were registered in a single record. This single record uses a different designator. That designator was added to the list of designators to search for for names.', '2017-01-29', '2017-04-10', 1);
INSERT INTO `op_reports` VALUES (18, 3, 'Baron', 'Brusten de Bearsul', 'Patrick Smith', 'pat.epub@gmail.com', 'Alexis has all her Society & kingdon awards missing from the Baronial OP. Also, he name and arms are registered with the College of Arms. See http://oanda.sca.org/oanda_name.cgi?p=Alexis+MacAlister+of+Beverlay', 'Her name was shortened in the database. It has been updated to reflect her full registered name.', '2017-01-29', '2017-04-10', 1);
INSERT INTO `op_reports` VALUES (19, 3, 'Baron', 'Brusten de Bearsul', 'Patrick Smith', 'pat.epub@gmail.com', 'Fiadnata''s name and arms are registered, under a slightly different spelling than you have in the OP. See \r\nhttp://oanda.sca.org/oanda_name.cgi?p=Fiadhnait+o+Ghlinne+Alainn', 'The spelling has been changed to reflect the registered version.', '2017-01-29', '2017-04-10', 1);
INSERT INTO `op_reports` VALUES (20, 4, 'Master', 'Dafydd Blaidd', 'Dave Majors', 'dafydd@midrealm.org', 'DISREGARD: THIS IS A TEST', '', '2017-04-05', '2017-04-10', 1);
INSERT INTO `op_reports` VALUES (21, 4, 'Master', 'Dafydd Blaidd', 'Dave Majors', 'dafydd@midrealm.org', 'DISREGARD: THIS IS ANOTHER TEST', '', '2017-04-05', '2017-04-10', 1);
INSERT INTO `op_reports` VALUES (22, 3, 'Master', 'Dafydd Blaidd', 'Dave Majors', 'dafydd@midrealm.org', 'I am testing the error reporting system.\r\nThis is a test', 'Still testing!\r\nTest is SUCCESSFUL!', '2017-04-05', '2017-04-05', 1);
INSERT INTO `op_reports` VALUES (23, 4, 'Master', 'Dafydd Blaidd', 'Dave Majors', 'dafydd@midrealm.org', 'Computer''s characters & stuff', 'Character escaping still needs work.', '2017-04-10', '2017-06-27', 1);
INSERT INTO `op_reports` VALUES (24, 3, 'Lord', 'Auðin Hrafnsson', 'Christopher Hudson', 'hudson13@gmail.com', 'Listed: Ellisye Audinsdottier\r\nCorrect spelling: Ellisif Auðinardóttir', 'Spelling corrected despite the character set issues).', '2017-05-17', '2017-05-17', 1);
INSERT INTO `op_reports` VALUES (33, 3, 'Lady', 'Elvira de Granada', 'Julia Shepherd', 'ldyelvira@gmail.com', 'I received my AoA in March. Thanks!', 'You were correctly added in the Midrealm OP but no record in the FG OP. I added you and now you are correct.', '2017-11-14', '2017-11-29', 1);
INSERT INTO `op_reports` VALUES (25, 3, '', 'Anthony Wolverton', 'Anthony Stoffolano', 'Stoffolanot@gmail.com', 'My mundane name is up but not my sca name, my AoA is missing I got it on march 28  2015, also my blazing Vert, a wolf''s head erased contourny and a chief argent.', 'They were reversed. It is fixed.', '2017-05-21', '2017-06-27', 1);
INSERT INTO `op_reports` VALUES (26, 3, 'Baroness', 'Cathryn of Chester', 'Anne Berdanier', 'Baroness_cat@hotmail.com', 'Rees of Mercia is also Rees of Cambria and was also Rees of Northwoods. On the Kingdom OP he has two enties which should be combined (if that is done from this OP) and on the Baronial one, he does have arms registered. I guess for ease you can use Rees of Northwoods for all.  He only goes by Rees. And if it matters he also has a PCS from Drachenwald 19 July 97.', 'Fixed all. Added PCS to MKOP, changed both to Rees of Northwoods (which is what is registered) with alt names of Rees of Mercia and Rees of Cambria.', '2017-06-11', '2017-06-27', 1);
INSERT INTO `op_reports` VALUES (27, 3, 'Ladyship I believe', 'Moll Sotherden', 'Molly Sotherden', 'glasslassie@gmail.com', '2 things: Hergeirr''s wife (MKA as Patty) Ainthbine Hergeirskona (chk last name spelling) isn''t in here that I could find. She tends to fly under the radar... so I didn''t want her to get overlooked. (2) My last name is spelled Sotherden. There''s no "u" in it. (My high school made the same mistake on my diploma.) Thanks Dafydd!', 'Both have been fixed. Thanks for the input.', '2017-06-23', '2017-11-03', 1);
INSERT INTO `op_reports` VALUES (28, 3, 'Lord', 'Altan of the Moritu', 'Alan Lirtzman', 'altan.of.the.moritu@gmail.com', 'The Middle Kingdom Order of Precedence has my name incorrectly as Alton  Moritu rather than Altan of the Moritu.  I am not, but should be, listed in the Flaming Gryphon Order of Precedence.', 'Altan of the Moritu has been added to the FGOP.', '2017-07-10', '2017-10-29', 1);
INSERT INTO `op_reports` VALUES (29, 4, 'Baron', 'Dafydd Blaidd', 'Dave Majors', 'dafydd@midrealm.org', 'This is a test', '', '2017-07-20', '2017-10-29', 1);
INSERT INTO `op_reports` VALUES (30, 4, 'Mistress', 'Mary Garrett of Seasalter', 'Mary Dahlberg', 'eiriktheelder@gmail.com', 'Wondering why there are no entries for Rolin Thurmondsson Halfdwarf in the BFG OP.  He''s certainly part of our group and history.', 'He is listed in both the FG and MK OPs as Rolin Thurmondsson. His SCA name is not registered and he has never contacted either me nor any other Clerk of Precedence to correct it. If he does, I will certainly correct it on both immediately.', '2017-09-13', '2017-10-29', 1);
INSERT INTO `op_reports` VALUES (31, 3, '', 'Atsur Heikan', 'Tim Smoot', 'Atsur.Heikan@gmail.com', 'The database is showing my old unregistered surname Ukkonen. Please update Atsur Ukkonen to Atsur Heikan, Thanks', 'Name has been updated', '2017-09-15', '2017-10-29', 1);
INSERT INTO `op_reports` VALUES (34, 0, 'Lord', 'Au&Atilde;&deg;in Hrafnsson', 'Christopher Hudson', 'Hudson13@gmail.com', 'Ragna Au&Atilde;&deg;inskona makes should be Ragna Au&Atilde;&deg;inAtkins. Her name and device was registered July of 2017. http://oanda.sca.org/oanda_name.cgi?p=Ragna+Au%F0inarkona', '', '2017-11-30', '2017-11-30', 1);
INSERT INTO `op_reports` VALUES (35, 0, 'Honorable Lady', 'Aveline de Ceresbroch', 'Tonia Brown', 'harpyandhag@gmail.com', 'Two SCA members have moved in to the Barony and should eventually be placed on the BFG precedence list:\\\\r\\\\n\\\\r\\\\nAveline de Ceresbroch\\\\r\\\\nhttp://www.midrealm.org/op/op.php?searchvar=byname&amp;sure=no&amp;input1=Aveline+de+Ceresbroch\\\\r\\\\n\\\\r\\\\nLothar Nachtshatten (also: Lothar the Bald)\\\\r\\\\nhttp://www.midrealm.org/op/op.php?searchvar=byname&amp;sure=no&amp;input1=Lothar+Nachshatten', '', '2018-09-18', '2018-09-18', 1);
INSERT INTO `op_reports` VALUES (36, 0, 'Name change request in OP', 'Miura Makoto', 'David Caron', 'wayseeker@gmail.com', 'Please change my name in the order of precedence to Mako Hammarhj&Atilde;&curren;rta.', '', '2019-10-20', '2019-10-20', 1);
INSERT INTO `op_reports` VALUES (37, 0, 'Hlaedige', 'Gy&Atilde;&deg;a Arn&Atilde;&sup3;rsd&Atilde;&sup3;ttir (or on Kingdom OP Gy&Atilde;&deg;a Arnarsd&Atilde;&sup3;ttir)', 'Anne Berdanier', 'mberdanier@gmail.com', 'I use the Kingdom spelling, but I do believe the heralds have me listed as the former rather than the latter. I do note that my awards have not melded with Kingdom Awards quite directly. For example I am not listed under the Kingdom Augmentation Award list.', '', '2020-09-27', '2020-09-27', 1);
INSERT INTO `op_reports` VALUES (38, 0, 'Baroness', 'Allegra Ginevra Soave da Napoli', 'Nancy M. Terselic', 'nancyterselic@juno.com', 'I was trying to look up some people on the OP and kept getting fatal errors.  When I went to search by Award/Honor, this was the error message:  \\\\r\\\\n\\\\r\\\\nWarning: file_get_contents(http://api.midrealm.org/honor/) [function.file-get-contents]: failed to open stream: HTTP request failed! HTTP/1.1 404 Not Found in /home/gryphony/website/src/public/op/Classes/OP.php on line 291\\\\r\\\\n\\\\r\\\\nFatal error: Cannot use string offset as an array in /home/gryphony/website/src/public/op/Classes/OP.php on line 299', '', '2021-01-21', '2021-01-21', 1);
INSERT INTO `op_reports` VALUES (39, 0, 'Sir', 'Timothy The Just', 'Tim Hines', 'Thines@wayne-local.com', 'Please add Order of St. Crispin', '', '2021-09-21', '2021-09-21', 1);
INSERT INTO `op_reports` VALUES (40, 0, '', 'Altan of the Moritu', 'Alan Lirtzman', 'alirtzman@gmail.com', 'My gender is listed as Female. It should be Male.', '', '2022-09-11', '2022-09-11', 1);
INSERT INTO `op_reports` VALUES (41, 0, '', 'Altan of the Moritu', 'Alan Lirtzman', 'altan.of.the.moritu@gmail.com', 'The Order of Precedence shows my gender as Female.  It should be Male.', '', '2022-10-23', '2022-10-23', 1);
INSERT INTO `op_reports` VALUES (42, 0, '', 'Altan of the Moritu', 'Alan Lirtzman', 'alirtzman@gmail.com', 'My gender is incorrectly listed as female rather then male.', '', '2022-11-11', '2022-11-11', 1);
INSERT INTO `op_reports` VALUES (43, 0, 'Forester', 'Taliesin of Archenfield', 'Joe Herbert', 'talygryphon@yahoo.com', 'Archery Championship is now decided at Harvest Days (change to description of title) instead of Push for Pennsic\\\\r\\\\n\\\\r\\\\nPlease make the following additions to the Archery Champions:\\\\r\\\\n9-18-2021 \\\\r\\\\nSabine de Creuequoer - bow\\\\r\\\\nJoshua Frost - crossbow\\\\r\\\\nMatthew of Wolfhou - youth\\\\r\\\\n\\\\r\\\\n9-10-2022\\\\r\\\\nSabine de Creuequoer - bow \\\\r\\\\nJoshua Frost - crossbow\\\\r\\\\nEllisif Audinardottir - youth\\\\r\\\\n\\\\r\\\\n9-9-2023\\\\r\\\\nBertrande Fresneau - bow\\\\r\\\\nTaliesin of Archenfield - crossbow\\\\r\\\\n\\\\r\\\\nThank you!', '', '2023-09-13', '2023-09-13', 1);
INSERT INTO `op_reports` VALUES (44, 0, 'Forester', 'Taliesin of Archenfield', 'Joe Herbert', 'talygryphon@yahoo.com', 'Please add Award of the Flaming Brand for me on 11-6-2021. \\\\r\\\\nThanks!', '', '2023-09-13', '2023-09-13', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_sources`
-- 

CREATE TABLE `op_sources` (
  `sourceName` varchar(255) collate utf8_unicode_ci NOT NULL,
  `sourceURL` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`sourceName`),
  UNIQUE KEY `sourceURL` (`sourceURL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `op_sources`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `op_user2collection`
-- 

CREATE TABLE `op_user2collection` (
  `userID` int(11) NOT NULL default '0',
  `collectionID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`userID`,`collectionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `op_user2collection`
-- 

INSERT INTO `op_user2collection` VALUES (1, 1);
INSERT INTO `op_user2collection` VALUES (1, 4);
INSERT INTO `op_user2collection` VALUES (2, 1);
INSERT INTO `op_user2collection` VALUES (6, 2);
INSERT INTO `op_user2collection` VALUES (7, 2);

-- --------------------------------------------------------

-- 
-- Table structure for table `op_users`
-- 

CREATE TABLE `op_users` (
  `userID` int(11) NOT NULL auto_increment,
  `username` varchar(50) collate utf8_unicode_ci NOT NULL,
  `password` varchar(50) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `scaname` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`userID`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `op_users`
-- 

INSERT INTO `op_users` VALUES (1, 'dafydd', '71dd5bbb62bab4a95e739a33929b21a9', 'dafydd@midrealm.org', 'Dafydd Blaidd');
INSERT INTO `op_users` VALUES (2, 'lancelin', '0698c34891ed202796442e99ce4488ca', 'lancelin@rootcentral.org', 'Lancelin Peregrinus');
INSERT INTO `op_users` VALUES (3, 'meriel', '0fbc70591369d9df3e310bc8c3f0a470', 'meriel@midrealm.org', 'Meriel Fitzwilliam');
INSERT INTO `op_users` VALUES (4, 'sorca', '94e8cde4612b3fd390677d42e7b22002', 'sorca@midrealm.org', 'Sorca Drac');
INSERT INTO `op_users` VALUES (5, 'cathryn', '94e8cde4612b3fd390677d42e7b22002', 'baronesscat@gmail.com', 'Cathryn of Chester');
INSERT INTO `op_users` VALUES (6, 'timothy', '64d9d711afde97b61dccd74106e71995', 'flaminggryphon.baron@midrealm.org', 'Timothy Just');
INSERT INTO `op_users` VALUES (7, 'elizabeta', '64d9d711afde97b61dccd74106e71995', 'flaminggryphon.baron@midrealm.org', 'Elizabeta Foscari');
