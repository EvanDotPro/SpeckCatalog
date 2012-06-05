CREATE TABLE IF NOT EXISTS `catalog_availability` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `search_data` text,
  `parent_product_uom_id` int(11) NOT NULL,
  `distributor_company_id` int(11) DEFAULT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_category` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `search_data` text NOT NULL,
  PRIMARY KEY (`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_category_category_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `parent_category_id` int(11) NOT NULL,
  `child_category_id` int(11) NOT NULL,
  PRIMARY KEY (`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_category_product_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_timestamp` bigint(20) NOT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_choice` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `search_data` text,
  `override_name` varchar(255) DEFAULT NULL,
  `default_choice_id` int(11) DEFAULT NULL,
  `type` enum('choice','product') NOT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_choice_option_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `linker_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `choice_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `link` (`choice_id`,`option_id`),
  KEY `linker_id` (`linker_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_company` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `search_data` text NOT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_media` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `search_data` text,
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_option` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `instruction` varchar(255) DEFAULT NULL,
  `search_data` text,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `list_type` enum('radio','checkbox','dropdown') DEFAULT 'radio',
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_option_choice_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `linker_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `option_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  KEY `linker_id` (`linker_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_option_image_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `linker_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `option_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  KEY `linker_id` (`linker_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_product` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_datetime` datetime NOT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `rev_active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `type` enum('item','shell','builder') NOT NULL DEFAULT 'shell',
  `item_number` varchar(255) DEFAULT NULL,
  `manufacturer_company_id` int(11) DEFAULT NULL,
  `search_data` text,
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_product_document_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `linker_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  KEY `linker_id` (`linker_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_product_image_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `linker_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  KEY `linker_id` (`linker_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_product_option_linker` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `linker_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `link` (`option_id`,`product_id`),
  KEY `linker_id` (`linker_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_product_spec` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` text,
  `search_data` text,
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `catalog_product_uom` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `rev_active` int(1) NOT NULL DEFAULT '1',
  `rev_datetime` datetime NOT NULL,
  `rev_eol_datetime` datetime DEFAULT NULL,
  `rev_user_id` int(11) DEFAULT NULL,
  `parent_product_id` int(11) NOT NULL,
  `search_data` text,
  `price` float NOT NULL,
  `retail` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `uom_code` varchar(2) NOT NULL DEFAULT 'EA',
  `sort_weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rev_id`),
  KEY `record_id` (`record_id`,`rev_active`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- ansi uoms // note: needs to be updated, you will get errors relating to
-- missing fields if you use this.

CREATE TABLE IF NOT EXISTS `ansi_uom` (
  `uom_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`uom_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `ansi_uom` (`record_id`, `name`, `enabled`) VALUES
('1', 'Actual Pounds', 0),
('10', 'Group', 0),
('11', 'Outfit', 0),
('12', 'Packet', 0),
('13', 'Ration', 0),
('14', 'Shot', 0),
('15', 'Stick', 0),
('16', '115 Kilogram Drum', 0),
('17', '100 Pound Drum', 0),
('18', '55 Gallon Drum', 0),
('19', 'Tank Truck', 0),
('1A', 'Car Mile', 0),
('1B', 'Car Count', 0),
('1C', 'Locomotive Count', 0),
('1D', 'Caboose Count', 0),
('1E', 'Empty Car', 0),
('1F', 'Train Mile', 0),
('1G', 'Fuel Usage (Gallons)', 0),
('1H', 'Caboose Mile', 0),
('1I', 'Fixed Rate', 0),
('1J', 'Ton Miles', 0),
('1K', 'Locomotive Mile', 0),
('1L', 'Total Car Count', 0),
('1M', 'Total Car Mile', 0),
('1N', 'Count', 0),
('1O', 'Season', 0),
('1P', 'Tank Car', 0),
('1Q', 'Frames', 0),
('1R', 'Transactions', 0),
('1X', 'Quarter Mile', 0),
('2', 'Statute Mile', 0),
('20', '20 Foot Container', 0),
('21', '40 Foot Container', 0),
('22', 'Deciliter per Gram', 0),
('23', 'Grams per Cubic Centimeter', 0),
('24', 'Theoretical Pounds', 0),
('25', 'Grams per Square Centimeter', 0),
('26', 'Actual Tons', 0),
('27', 'Theoretical Tons', 0),
('28', 'Kilograms per Square Meter', 0),
('29', 'Pounds per 1000 Square Feet', 0),
('2A', 'Radians Per Second', 0),
('2B', 'Radians Per Second Squared', 0),
('2C', 'Roentgen', 0),
('2F', 'Volts Per Meter', 0),
('2G', 'Volts (Alternating Current)', 0),
('2H', 'Volts (Direct Current)', 0),
('2I', 'British Thermal Units (BTUs) Per Hour', 0),
('2J', 'Cubic Centimeters Per Second', 0),
('2K', 'Cubic Feet Per Hour', 0),
('2L', 'Cubic Feet Per Minute', 0),
('2M', 'Centimeters Per Second', 0),
('2N', 'Decibels', 0),
('2P', 'Kilobyte', 0),
('2Q', 'Kilobecquerel', 0),
('2R', 'Kilocurie', 0),
('2U', 'Megagram', 0),
('2V', 'Megagrams Per Hour', 0),
('2W', 'Bin', 0),
('2X', 'Meters Per Minute', 0),
('2Y', 'Milliroentgen', 0),
('2Z', 'Millivolts', 0),
('3', 'Seconds', 0),
('30', 'Horsepower Days per Air Dry Metric Tons', 0),
('31', 'Catchweight', 0),
('32', 'Kilograms per Air Dry Metric Tons', 0),
('33', 'Kilopascal Square Meters per Gram', 0),
('34', 'Kilopascals per Millimeter', 0),
('35', 'Milliliters per Square Centimeter Second', 0),
('36', 'Cubic Feet per Minute per Square Foot', 0),
('37', 'Ounces per Square Foot', 0),
('38', 'Ounces per Square Foot per 0.01 Inch', 0),
('39', 'Basis Points', 0),
('3B', 'Megajoule', 0),
('3C', 'Manmonth', 0),
('3E', 'Pounds Per Pound of Product', 0),
('3F', 'Kilograms Per Liter of Product', 0),
('3G', 'Pounds Per Piece of Product', 0),
('3H', 'Kilograms Per Kilogram of Product', 0),
('3I', 'Kilograms Per Piece of Product', 0),
('4', 'Small Spray', 0),
('40', 'Milliliter per Second', 0),
('41', 'Milliliter per Minute', 0),
('43', 'Super Bulk Bag', 0),
('44', '500 Kilogram Bulk Bag', 0),
('45', '300 Kilogram Bulk Bag', 0),
('46', '25 Kilogram Bulk Bag', 0),
('47', '50 Pound Bag', 0),
('48', 'Bulk Car Load', 0),
('4A', 'Bobbin', 0),
('4B', 'Cap', 0),
('4C', 'Centistokes', 0),
('4D', 'Curie', 0),
('4E', '20-Pack', 0),
('4F', '100-Pack', 0),
('4G', 'Microliter', 0),
('4H', 'Micrometer', 0),
('4I', 'Meters Per Second', 0),
('4J', 'Meters Per Second Per Second', 0),
('4K', 'Milliamperes', 0),
('4L', 'Megabyte', 0),
('4M', 'Milligrams Per Hour', 0),
('4N', 'Megabecquerel', 0),
('4O', 'Microfarad', 0),
('4P', 'Newtons Per Meter', 0),
('4Q', 'Ounce Inch', 0),
('4R', 'Ounce Foot', 0),
('4S', 'Pascal', 0),
('4T', 'Picofarad', 0),
('4U', 'Pounds Per Hour', 0),
('4V', 'Cubic Meter Per Hour', 0),
('4W', 'Ton Per Hour', 0),
('4X', 'Kiloliter Per Hour', 0),
('5', 'Lifts', 0),
('50', 'Actual Kilograms', 0),
('51', 'Actual Tonnes', 0),
('52', 'Credits', 0),
('53', 'Theoretical Kilograms', 0),
('54', 'Theoretical Tonnes', 0),
('56', 'Sitas', 0),
('57', 'Mesh', 0),
('58', 'Net Kilograms', 0),
('59', 'Parts Per Million', 0),
('5A', 'Barrels per Minute', 0),
('5B', 'Batch', 0),
('5C', 'Gallons per Thousand', 0),
('5E', 'MMSCF/Day', 0),
('5F', 'Pounds per Thousand', 0),
('5G', 'Pump', 0),
('5H', 'Stage', 0),
('5I', 'Standard Cubic Foot', 0),
('5J', 'Hydraulic Horse Power', 0),
('5K', 'Count per Minute', 0),
('5P', 'Seismic Level', 0),
('5Q', 'Seismic Line', 0),
('6', 'Digits', 0),
('60', 'Percent Weight', 0),
('61', 'Parts Per Billion', 0),
('62', 'Percent Per 1000 Hours', 0),
('63', 'Failure Rate In Time', 0),
('64', 'Pounds Per Square Inch Gauge', 0),
('65', 'Coulomb', 0),
('66', 'Oersteds', 0),
('67', 'Siemens', 0),
('68', 'Ampere', 0),
('69', 'Test Specific Scale', 0),
('7', 'Strand', 0),
('70', 'Volt', 0),
('71', 'Volt-Ampere Per Pound', 0),
('72', 'Watts Per Pound', 0),
('73', 'Ampere Turn Per Centimeter', 0),
('74', 'Milli Pascals', 0),
('76', 'Gauss', 0),
('77', 'Mil', 0),
('78', 'Kilogauss', 0),
('79', 'Electron Volt', 0),
('8', 'Heat Lots', 0),
('80', 'Pounds Per Square Inch Absolute', 0),
('81', 'Henry', 0),
('82', 'Ohm', 0),
('83', 'Farad', 0),
('84', 'Kilo Pounds Per Square Inch (KSI)', 0),
('85', 'Foot Pounds', 0),
('86', 'Joules', 0),
('87', 'Pounds per Cubic Foot', 0),
('89', 'Poise', 0),
('8C', 'Cord', 0),
('8D', 'Duty', 0),
('8P', 'Project', 0),
('8R', 'Program', 0),
('8S', 'Session', 0),
('8U', 'Square Kilometer', 0),
('9', 'Tire', 0),
('90', 'Saybold Universal Second', 0),
('91', 'Stokes', 0),
('92', 'Calories per Cubic Centimeter', 0),
('93', 'Calories per Gram', 0),
('94', 'Curl Units', 0),
('95', '20,000 Gallon Tankcar', 0),
('96', '10,000 Gallon Tankcar', 0),
('97', '10 Kilogram Drum', 0),
('98', '15 Kilogram Drum', 0),
('99', 'Watt', 0),
('A8', 'Dollars per Hours', 0),
('AA', 'Ball', 0),
('AB', 'Bulk Pack', 0),
('AC', 'Acre', 0),
('AD', 'Bytes', 0),
('AE', 'Amperes per Meter', 0),
('AF', 'Centigram', 0),
('AG', 'Angstrom', 0),
('AH', 'Additional Minutes', 0),
('AI', 'Average Minutes Per Call', 0),
('AJ', 'Cop', 0),
('AK', 'Fathom', 0),
('AL', 'Access Lines', 0),
('AM', 'Ampoule', 0),
('AN', 'Minutes or Messages', 0),
('AO', 'Ampere-turn', 0),
('AP', 'Aluminum Pounds Only', 0),
('AQ', 'Anti-hemophilic Factor (AHF) Units', 0),
('AR', 'Suppository', 0),
('AS', 'Assortment', 0),
('AT', 'Atmosphere', 0),
('AU', 'Ocular Insert System', 0),
('AV', 'Capsule', 0),
('AW', 'Powder-Filled Vials', 0),
('AX', 'Twenty', 0),
('AY', 'Assembly', 0),
('AZ', 'British Thermal Units (BTUs) per Pound', 0),
('B0', 'British Thermal Units (BTUs) per Cubic Foot', 0),
('B1', 'Barrels per Day', 0),
('B2', 'Bunks', 0),
('B3', 'Batting Pound', 0),
('B4', 'Barrel, Imperial', 0),
('B5', 'Billet', 0),
('B6', 'Bun', 0),
('B7', 'Cycles', 0),
('B8', 'Board', 0),
('B9', 'Batt', 0),
('BA', 'Bale', 0),
('BB', 'Base Box', 0),
('BC', 'Bucket', 0),
('BD', 'Bundle', 0),
('BE', 'Beam', 0),
('BF', 'Board Feet', 0),
('BG', 'Bag', 0),
('BH', 'Brush', 0),
('BI', 'Bar', 0),
('BJ', 'Band', 0),
('BK', 'Book', 0),
('BL', 'Block', 0),
('BM', 'Bolt', 0),
('BN', 'Bulk', 0),
('BO', 'Bottle', 0),
('BP', '100 Board Feet', 0),
('BQ', 'Brake horse power', 0),
('BR', 'Barrel', 0),
('BS', 'Basket', 0),
('BT', 'Belt', 0),
('BU', 'Bushel', 0),
('BV', 'Bushel, Dry Imperial', 0),
('BW', 'Base Weight', 0),
('BX', 'Box', 1),
('BY', 'British Thermal Unit (BTU)', 0),
('BZ', 'Million BTU''s', 0),
('C0', 'Calls', 0),
('C1', 'Composite Product Pounds (Total Weight)', 0),
('C2', 'Carset', 0),
('C3', 'Centiliter', 0),
('C4', 'Carload', 0),
('C5', 'Cost', 0),
('C6', 'Cell', 0),
('C7', 'Centipoise (CPS)', 0),
('C8', 'Cubic Decimeter', 0),
('C9', 'Coil Group', 0),
('CA', 'Case', 1),
('CB', 'Carboy', 0),
('CC', 'Cubic Centimeter', 0),
('CD', 'Carat', 0),
('CE', 'Centigrade, Celsius', 0),
('CF', 'Cubic Feet', 0),
('CG', 'Card', 0),
('CH', 'Container', 0),
('CI', 'Cubic Inches', 0),
('CJ', 'Cone', 0),
('CK', 'Connector', 0),
('CL', 'Cylinder', 0),
('CM', 'Centimeter', 0),
('CN', 'Can', 0),
('CO', 'Cubic Meters (Net)', 0),
('CP', 'Crate', 0),
('CQ', 'Cartridge', 0),
('CR', 'Cubic Meter', 0),
('CS', 'Cassette', 0),
('CT', 'Carton', 0),
('CU', 'Cup', 0),
('CV', 'Cover', 0),
('CW', 'Hundred Pounds (CWT)', 0),
('CX', 'Coil', 0),
('CY', 'Cubic Yard', 0),
('CZ', 'Combo', 0),
('D2', 'Shares', 0),
('D3', 'Square Decimeter', 0),
('D5', 'Kilogram Per Square Centimeter', 0),
('D8', 'Draize Score', 0),
('D9', 'Dyne per Square Centimeter', 0),
('DA', 'Days', 0),
('DB', 'Dry Pounds', 0),
('DC', 'Disk (Disc)', 0),
('DD', 'Degree', 0),
('DE', 'Deal', 0),
('DF', 'Dram', 0),
('DG', 'Decigram', 0),
('DH', 'Miles', 0),
('DI', 'Dispenser', 0),
('DJ', 'Decagram', 0),
('DK', 'Kilometers', 0),
('DL', 'Deciliter', 0),
('DM', 'Decimeter', 0),
('DN', 'Deci Newton-Meter', 0),
('DO', 'Dollars, U.S.', 0),
('DP', 'Dozen Pair', 0),
('DQ', 'Data Records', 0),
('DR', 'Drum', 0),
('DS', 'Display', 0),
('DT', 'Dry Ton', 0),
('DU', 'Dyne', 0),
('DW', 'Calendar Days', 0),
('DX', 'Dynes per Centimeter', 0),
('DY', 'Directory Books', 0),
('DZ', 'Dozen', 0),
('E1', 'Hectometer', 0),
('E3', 'Inches, Fraction--Average', 0),
('E4', 'Inches, Fraction--Minimum', 0),
('E5', 'Inches, Fraction--Actual', 0),
('E7', 'Inches, Decimal--Average', 0),
('E8', 'Inches, Decimal--Actual', 0),
('E9', 'English, (Feet, Inches)', 0),
('EA', 'Each', 1),
('EB', 'Electronic Mail Boxes', 0),
('EC', 'Each per Month', 0),
('ED', 'Inches, Decimal--Nominal', 0),
('EE', 'Employees', 0),
('EF', 'Inches, Fraction-Nominal', 0),
('EG', 'Double-time Hours', 0),
('EH', 'Knots', 0),
('EJ', 'Locations', 0),
('EM', 'Inches, Decimal-Minimum', 0),
('EP', 'Eleven pack', 0),
('EQ', 'Equivalent Gallons', 0),
('EV', 'Envelope', 0),
('EX', 'Feet, Inches and Fraction', 0),
('EY', 'Feet, Inches and Decimal', 0),
('EZ', 'Feet and Decimal', 0),
('F1', 'Thousand Cubic Feet Per Day', 0),
('F2', 'International Unit', 0),
('F3', 'Equivalent', 0),
('F4', 'Minim', 0),
('F5', 'MOL', 0),
('F6', 'Price Per Share', 0),
('F9', 'Fibers per Cubic Centimeter of Air', 0),
('FA', 'Fahrenheit', 0),
('FB', 'Fields', 0),
('FC', '1000 Cubic Feet', 0),
('FD', 'Million Particles per Cubic Foot', 0),
('FE', 'Track Foot', 0),
('FF', 'Hundred Cubic Meters', 0),
('FG', 'Transdermal Patch', 0),
('FH', 'Micromolar', 0),
('FJ', 'Sizing Factor', 0),
('FK', 'Fibers', 0),
('FL', 'Flake Ton', 0),
('FM', 'Million Cubic Feet', 0),
('FO', 'Fluid Ounce', 0),
('FP', 'Pounds per Sq. Ft.', 0),
('FR', 'Feet Per Minute', 0),
('FS', 'Feet Per Second', 0),
('FT', 'Foot', 0),
('FZ', 'Fluid Ounce (Imperial)', 0),
('G2', 'U.S. Gallons Per Minute', 0),
('G3', 'Imperial Gallons Per Minute', 0),
('G4', 'Gigabecquerel', 0),
('G5', 'Gill (Imperial)', 0),
('G7', 'Microfiche Sheet', 0),
('GA', 'Gallon', 0),
('GB', 'Gallons/Day', 0),
('GC', 'Grams per 100 Grams', 0),
('GD', 'Gross Barrels', 0),
('GE', 'Pounds per Gallon', 0),
('GF', 'Grams per 100 Centimeters', 0),
('GG', 'Great Gross (Dozen Gross)', 0),
('GH', 'Half Gallon', 0),
('GI', 'Imperial Gallons', 0),
('GJ', 'Grams per Milliliter', 0),
('GK', 'Grams per Kilogram', 0),
('GL', 'Grams per Liter', 0),
('GM', 'Grams per Sq. Meter', 0),
('GN', 'Gross Gallons', 0),
('GO', 'Milligrams per Square Meter', 0),
('GP', 'Milligrams per Cubic Meter', 0),
('GQ', 'Micrograms per Cubic Meter', 0),
('GR', 'Gram', 0),
('GS', 'Gross', 0),
('GT', 'Gross Kilogram', 0),
('GU', 'Gauss per Oersteds', 0),
('GV', 'Gigajoules', 0),
('GW', 'Gallons Per Thousand Cubic Feet', 0),
('GX', 'Grain', 0),
('GY', 'Gross Yard', 0),
('GZ', 'Gage Systems', 0),
('H1', 'Half Pages - Electronic', 0),
('H2', 'Half Liter', 0),
('H4', 'Hectoliter', 0),
('HA', 'Hank', 0),
('HB', 'Hundred Boxes', 0),
('HC', 'Hundred Count', 0),
('HD', 'Half Dozen', 0),
('HE', 'Hundredth of a Carat', 0),
('HF', 'Hundred Feet', 0),
('HG', 'Hectogram', 0),
('HH', 'Hundred Cubic Feet', 0),
('HI', 'Hundred Sheets', 0),
('HJ', 'Horsepower', 0),
('HK', 'Hundred Kilograms', 0),
('HL', 'Hundred Feet - Linear', 0),
('HM', 'Miles Per Hour', 0),
('HN', 'Millimeters of Mercury', 0),
('HO', 'Hundred Troy Ounces', 0),
('HP', 'Millimeter H20', 0),
('HQ', 'Hectare', 0),
('HR', 'Hours', 0),
('HS', 'Hundred Square Feet', 0),
('HT', 'Half Hour', 0),
('HU', 'Hundred', 0),
('HV', 'Hundred Weight (Short)', 0),
('HW', 'Hundred Weight (Long)', 0),
('HY', 'Hundred Yards', 0),
('HZ', 'Hertz', 0),
('IA', 'Inch Pound', 0),
('IB', 'Inches Per Second (Vibration Velocity)', 0),
('IC', 'Counts per Inch', 0),
('IE', 'Person', 0),
('IF', 'Inches of Water', 0),
('IH', 'Inhaler', 0),
('II', 'Column-Inches', 0),
('IK', 'Peaks per Inch (PPI)', 0),
('IL', 'Inches per Minute', 0),
('IM', 'Impressions', 0),
('IN', 'Inch', 0),
('IP', 'Insurance Policy', 0),
('IT', 'Counts per Centimeter', 0),
('IU', 'Inches Per Second (Linear Speed)', 0),
('IV', 'Inches Per Second Per Second (Acceleration)', 0),
('IW', 'Inches Per Second Per Second (Vibration Acceleration)', 0),
('J2', 'Joule Per Kilogram', 0),
('JA', 'Job', 0),
('JB', 'Jumbo', 0),
('JE', 'Joule Per Kelvin', 0),
('JG', 'Joule per Gram', 0),
('JK', 'Mega Joule per Kilogram', 0),
('JM', 'Megajoule/Cubic Meter', 0),
('JO', 'Joint', 0),
('JR', 'Jar', 0),
('JU', 'Jug', 0),
('K1', 'Kilowatt Demand', 0),
('K2', 'Kilovolt Amperes Reactive Demand', 0),
('K3', 'Kilovolt Amperes Reactive Hour', 0),
('K4', 'Kilovolt Amperes', 0),
('K5', 'Kilovolt Amperes Reactive', 0),
('K6', 'Kiloliter', 0),
('K7', 'Kilowatt', 0),
('K9', 'Kilograms per Millimeter Squared (KG/MM2)', 0),
('KA', 'Cake', 0),
('KB', 'Kilocharacters', 0),
('KC', 'Kilograms per Cubic Meter', 0),
('KD', 'Kilograms Decimal', 0),
('KE', 'Keg', 0),
('KF', 'Kilopackets', 0),
('KG', 'Kilogram', 0),
('KH', 'Kilowatt Hour', 0),
('KI', 'Kilograms/Millimeter Width', 0),
('KJ', 'Kilosegments', 0),
('KK', '100 Kilograms', 0),
('KL', 'Kilograms/Meter', 0),
('KM', 'Kilograms per Square Meter, Kilograms, Decimal', 0),
('KO', 'Millequivalence Caustic Potash per Gram of Product', 0),
('KP', 'Kilometers Per Hour', 0),
('KQ', 'Kilopascal', 0),
('KR', 'Kiloroentgen', 0),
('KS', '1000 Pounds per Square Inch', 0),
('KT', 'Kit', 0),
('KU', 'Task', 0),
('KV', 'Kelvin', 0),
('KW', 'Kilograms per Millimeter', 0),
('KX', 'Milliliters per Kilogram', 0),
('L2', 'Liters Per Minute', 0),
('LA', 'Pounds Per Cubic Inch', 0),
('LB', 'Pound', 0),
('LC', 'Linear Centimeter', 0),
('LE', 'Lite', 0),
('LF', 'Linear Foot', 0),
('LG', 'Long Ton', 0),
('LH', 'Labor Hours', 0),
('LI', 'Linear Inch', 0),
('LJ', 'Large Spray', 0),
('LK', 'Link', 0),
('LL', 'Lifetime', 0),
('LM', 'Linear Meter', 0),
('LN', 'Length', 0),
('LO', 'Lot', 0),
('LP', 'Liquid Pounds', 0),
('LQ', 'Liters Per Day', 0),
('LR', 'Layer(s)', 0),
('LS', 'Lump Sum', 0),
('LT', 'Liter', 0),
('LX', 'Linear Yards Per Pound', 0),
('LY', 'Linear Yard', 0),
('M0', 'Magnetic Tapes', 0),
('M1', 'Milligrams per Liter', 0),
('M2', 'Millimeter-Actual', 0),
('M3', 'Mat', 0),
('M4', 'Monetary Value', 0),
('M5', 'Microcurie', 0),
('M6', 'Millibar', 0),
('M7', 'Micro Inch', 0),
('M8', 'Mega Pascals', 0),
('M9', 'Million British Thermal Units per One Thousand Cubic Feet', 0),
('MA', 'Machine/Unit', 0),
('MB', 'Millimeter-Nominal', 0),
('MC', 'Microgram', 0),
('MD', 'Air Dry Metric Ton', 0),
('ME', 'Milligram', 0),
('MF', 'Milligram per Sq. Ft. per Side', 0),
('MG', 'Metric Gross Ton', 0),
('MH', 'Microns (Micrometers)', 0),
('MI', 'Metric', 0),
('MJ', 'Minutes', 0),
('MK', 'Milligrams Per Square Inch', 0),
('ML', 'Milliliter', 0),
('MM', 'Millimeter', 0),
('MN', 'Metric Net Ton', 0),
('MO', 'Months', 0),
('MP', 'Metric Ton', 0),
('MQ', '1000 Meters', 0),
('MR', 'Meter', 0),
('MS', 'Square Millimeter', 0),
('MT', 'Metric Long Ton', 0),
('MU', 'Millicurie', 0),
('MV', 'Number of Mults', 0),
('MW', 'Metric Ton Kilograms', 0),
('MX', 'Mixed', 0),
('MY', 'Millimeter-Average', 0),
('MZ', 'Millimeter-minimum', 0),
('N1', 'Pen Calories', 0),
('N2', 'Number of Lines', 0),
('N3', 'Print Point', 0),
('N4', 'Pen Grams (Protein)', 0),
('N6', 'Megahertz', 0),
('N7', 'Parts', 0),
('N9', 'Cartridge Needle', 0),
('NA', 'Milligrams per Kilogram', 0),
('NB', 'Barge', 0),
('NC', 'Car', 0),
('ND', 'Net Barrels', 0),
('NE', 'Net Liters', 0),
('NF', 'Messages', 0),
('NG', 'Net Gallons', 0),
('NH', 'Message Hours', 0),
('NI', 'Net Imperial Gallons', 0),
('NJ', 'Number of Screens', 0),
('NL', 'Load', 0),
('NM', 'Nautical Mile', 0),
('NN', 'Train', 0),
('NQ', 'Mho', 0),
('NR', 'Micro Mho', 0),
('NS', 'Short Ton', 0),
('NT', 'Trailer', 0),
('NU', 'Newton-Meter', 0),
('NV', 'Vehicle', 0),
('NW', 'Newton', 0),
('NX', 'Parts Per Thousand', 0),
('NY', 'Pounds Per Air-Dry Metric Ton', 0),
('OA', 'Panel', 0),
('OC', 'Billboard', 0),
('ON', 'Ounces per Square Yard', 0),
('OP', 'Two pack', 0),
('OT', 'Overtime Hours', 0),
('OZ', 'Ounce - Av', 0),
('P0', 'Pages - Electronic', 0),
('P1', 'Percent', 0),
('P2', 'Pounds per Foot', 0),
('P3', 'Three pack', 0),
('P4', 'Four-pack', 0),
('P5', 'Five-pack', 0),
('P6', 'Six pack', 0),
('P7', 'Seven pack', 0),
('P8', 'Eight-pack', 0),
('P9', 'Nine pack', 0),
('PA', 'Pail', 0),
('PB', 'Pair Inches', 0),
('PC', 'Piece', 0),
('PD', 'Pad', 0),
('PE', 'Pounds Equivalent', 0),
('PF', 'Pallet (Lift)', 0),
('PG', 'Pounds Gross', 0),
('PH', 'Pack (PAK)', 0),
('PI', 'Pitch', 0),
('PJ', 'Pounds, Decimal - Pounds per Square Foot - Pound Gage', 0),
('PK', 'Package', 0),
('PL', 'Pallet/Unit Load', 0),
('PM', 'Pounds-Percentage', 0),
('PN', 'Pounds Net', 0),
('PO', 'Pounds per Inch of Length', 0),
('PP', 'Plate', 0),
('PQ', 'Pages per Inch', 0),
('PR', 'Pair', 0),
('PS', 'Pounds per Sq. Inch', 0),
('PT', 'Pint', 0),
('PU', 'Mass Pounds', 0),
('PV', 'Half Pint', 0),
('PW', 'Pounds per Inch of Width', 0),
('PX', 'Pint, Imperial', 0),
('PY', 'Peck, Dry U.S.', 0),
('PZ', 'Peck, Dry Imperial', 0),
('Q1', 'Quarter (Time)', 0),
('Q2', 'Pint U.S. Dry', 0),
('Q3', 'Meal', 0),
('Q4', 'Fifty', 0),
('Q5', 'Twenty-Five', 0),
('Q6', 'Thirty-Six', 0),
('Q7', 'Twenty-Four', 0),
('QA', 'Pages - Facsimile', 0),
('QB', 'Pages - Hardcopy', 0),
('QC', 'Channel', 0),
('QD', 'Quarter Dozen', 0),
('QE', 'Photographs', 0),
('QH', 'Quarter Hours', 0),
('QK', 'Quarter Kilogram', 0),
('QR', 'Quire', 0),
('QS', 'Quart, Dry U.S.', 0),
('QT', 'Quart', 0),
('QU', 'Quart, Imperial', 0),
('R1', 'Pica', 0),
('R2', 'Becquerel', 0),
('R3', 'Revolutions Per Minute', 0),
('R4', 'Calorie', 0),
('R5', 'Thousands of Dollars', 0),
('R6', 'Millions of Dollars', 0),
('R7', 'Billions of Dollars', 0),
('R8', 'Roentgen Equivalent in Man (REM)', 0),
('R9', 'Thousand Cubic Meters', 0),
('RA', 'Rack', 0),
('RB', 'Radian', 0),
('RC', 'Rod (area) - 16.25 Square Yards', 0),
('RD', 'Rod (length) - 5.5 Yards', 0),
('RE', 'Reel', 0),
('RG', 'Ring', 0),
('RH', 'Running or Operating Hours', 0),
('RK', 'Roll-Metric Measure', 0),
('RL', 'Roll', 0),
('RM', 'Ream', 0),
('RN', 'Ream-Metric Measure', 0),
('RO', 'Round', 0),
('RP', 'Pounds per Ream', 0),
('RS', 'Resets', 0),
('RT', 'Revenue Ton Miles', 0),
('RU', 'Run', 0),
('S1', 'Semester', 0),
('S2', 'Trimester', 0),
('S3', 'Square Feet per Second', 0),
('S4', 'Square Meters per Second', 0),
('S5', 'Sixty-fourths of an Inch', 0),
('S6', 'Sessions', 0),
('S7', 'Storage Units', 0),
('S8', 'Standard Advertising Units (SAUs)', 0),
('S9', 'Slip Sheet', 0),
('SA', 'Sandwich', 0),
('SB', 'Square Mile', 0),
('SC', 'Square Centimeter', 0),
('SD', 'Solid Pounds', 0),
('SE', 'Section', 0),
('SF', 'Square Foot', 0),
('SG', 'Segment', 0),
('SH', 'Sheet', 0),
('SI', 'Square Inch', 0),
('SJ', 'Sack', 0),
('SK', 'Split Tanktruck', 0),
('SL', 'Sleeve', 0),
('SM', 'Square Meter', 0),
('SN', 'Square Rod', 0),
('SO', 'Spool', 0),
('SP', 'Shelf Package', 0),
('SQ', 'Square', 0),
('SR', 'Strip', 0),
('SS', 'Sheet-Metric Measure', 0),
('ST', 'Set', 0),
('SV', 'Skid', 0),
('SW', 'Skein', 0),
('SX', 'Shipment', 0),
('SY', 'Square Yard', 0),
('SZ', 'Syringe', 0),
('T0', 'Telecommunications Lines in Service', 0),
('T1', 'Thousand pounds gross', 0),
('T2', 'Thousandths of an Inch', 0),
('T3', 'Thousand Pieces', 0),
('T4', 'Thousand Bags', 0),
('T5', 'Thousand Casings', 0),
('T6', 'Thousand Gallons', 0),
('T7', 'Thousand Impressions', 0),
('T8', 'Thousand Linear Inches', 0),
('T9', 'Thousand Kilowatt Hours', 0),
('TA', 'Tenth Cubic Foot', 0),
('TB', 'Tube', 0),
('TC', 'Truckload', 0),
('TD', 'Therms', 0),
('TE', 'Tote', 0),
('TF', 'Ten Square Yards', 0),
('TG', 'Gross Ton', 0),
('TH', 'Thousand', 0),
('TI', 'Thousand Square Inches', 0),
('TJ', 'Thousand Sq. Centimeters', 0),
('TK', 'Tank', 0),
('TL', 'Thousand Feet (Linear)', 0),
('TM', 'Thousand Feet (Board)', 0),
('TN', 'Net Ton (2,000 LB).', 0),
('TO', 'Troy Ounce', 0),
('TP', 'Ten-pack', 0),
('TQ', 'Thousand Feet', 0),
('TR', 'Ten Square Feet', 0),
('TS', 'Thousand Square Feet', 0),
('TT', 'Thousand Linear Meters', 0),
('TU', 'Thousand Linear Yards', 0),
('TV', 'Thousand Kilograms', 0),
('TW', 'Thousand Sheets', 0),
('TX', 'Troy Pound', 0),
('TY', 'Tray', 0),
('TZ', 'Thousand Cubic Feet', 0),
('U1', 'Treatments', 0),
('U2', 'Tablet', 0),
('U3', 'Ten', 0),
('U5', 'Two Hundred Fifty', 0),
('UA', 'Torr', 0),
('UB', 'Telecommunications Lines in Service - Average', 0),
('UC', 'Telecommunications Ports', 0),
('UD', 'Tenth Minutes', 0),
('UE', 'Tenth Hours', 0),
('UF', 'Usage per Telecommunications Line - Average', 0),
('UH', 'Ten Thousand Yards', 0),
('UL', 'Unitless', 0),
('UM', 'Million Units', 0),
('UN', 'Unit', 0),
('UP', 'Troche', 0),
('UQ', 'Wafer', 0),
('UR', 'Application', 0),
('US', 'Dosage Form', 0),
('UT', 'Inhalation', 0),
('UU', 'Lozenge', 0),
('UV', 'Percent Topical Only', 0),
('UW', 'Milliequivalent', 0),
('UX', 'Dram (Minim)', 0),
('UY', 'Fifty Square Feet', 0),
('UZ', 'Fifty Count', 0),
('V1', 'Flat', 0),
('V2', 'Pouch', 0),
('VA', 'Volt-ampere per Kilogram', 0),
('VC', 'Five Hundred', 0),
('VI', 'Vial', 0),
('VP', 'Percent Volume', 0),
('VR', 'Volt-ampere-reactive', 0),
('VS', 'Visit', 0),
('W2', 'Wet Kilo', 0),
('WA', 'Watts per Kilogram', 0),
('WB', 'Wet Pound', 0),
('WD', 'Work Days', 0),
('WE', 'Wet Ton', 0),
('WG', 'Wine Gallon', 0),
('WH', 'Wheel', 0),
('WI', 'Weight per Square Inch', 0),
('WK', 'Week', 0),
('WM', 'Working Months', 0),
('WP', 'Pennyweight', 0),
('WR', 'Wrap', 0),
('WW', 'Milliliters of Water', 0),
('X1', 'Chains (Land Survey)', 0),
('X2', 'Bunch', 0),
('X3', 'Clove', 0),
('X4', 'Drop', 0),
('X5', 'Head', 0),
('X6', 'Heart', 0),
('X7', 'Leaf', 0),
('X8', 'Loaf', 0),
('X9', 'Portion', 0),
('XP', 'Base Box per Pound', 0),
('Y1', 'Slice', 0),
('Y2', 'Tablespoon', 0),
('Y3', 'Teaspoon', 0),
('Y4', 'Tub', 0),
('YD', 'Yard', 0),
('YL', '100 Lineal Yards', 0),
('YR', 'Years', 0),
('YT', 'Ten Yards', 0),
('Z1', 'Lift Van', 0),
('Z2', 'Chest', 0),
('Z3', 'Cask', 0),
('Z4', 'Hogshead', 0),
('Z5', 'Lug', 0),
('Z6', 'Conference Points', 0),
('Z8', 'Newspaper Agate Line', 0),
('ZA', 'Bimonthly', 0),
('ZB', 'Biweekly', 0),
('ZC', 'Semiannual', 0),
('ZP', 'Page', 0),
('ZZ', 'Mutually Defined', 0);
