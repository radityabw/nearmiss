-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.39 - Source distribution
-- Server OS:                    Linux
-- HeidiSQL Version:             9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for she
DROP DATABASE IF EXISTS `she`;
CREATE DATABASE IF NOT EXISTS `she` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `she`;


-- Dumping structure for table she.application_events
DROP TABLE IF EXISTS `application_events`;
CREATE TABLE IF NOT EXISTS `application_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `computer` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `event_time` datetime DEFAULT NULL,
  `in_work_hours` int(11) DEFAULT NULL,
  `pc_alert_level` int(11) DEFAULT NULL,
  `ext_tags` longtext,
  `selmid` varchar(255) DEFAULT NULL,
  `scanned_computer` varchar(255) DEFAULT NULL,
  `rule_name` varchar(255) DEFAULT NULL,
  `description_id` int(11) DEFAULT NULL,
  `rel_ext_tags` longtext,
  `esm_instance_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_index` (`category`),
  KEY `computer_index` (`computer`),
  KEY `esm_instance_id_index` (`esm_instance_id`),
  KEY `event_date_index` (`event_date`),
  KEY `event_time_index` (`event_time`),
  KEY `eventid_index` (`eventid`),
  KEY `id_index` (`id`),
  KEY `in_work_hours_index` (`in_work_hours`),
  KEY `pc_alert_level_index` (`pc_alert_level`),
  KEY `rule_name_index` (`rule_name`),
  KEY `scanned_computer_index` (`scanned_computer`),
  KEY `selmid_index` (`selmid`),
  KEY `source_index` (`source`),
  KEY `type_index` (`type`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.application_events: ~0 rows (approximately)
DELETE FROM `application_events`;
/*!40000 ALTER TABLE `application_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_events` ENABLE KEYS */;


-- Dumping structure for table she.constval
DROP TABLE IF EXISTS `constval`;
CREATE TABLE IF NOT EXISTS `constval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table she.constval: ~4 rows (approximately)
DELETE FROM `constval`;
/*!40000 ALTER TABLE `constval` DISABLE KEYS */;
INSERT INTO `constval` (`id`, `name`, `value`) VALUES
	(1, 'sf_anggotabadan_code_prefix', 'AB'),
	(2, 'show_number_datatable', '10'),
	(3, 'sf_cedera_code_prefix', 'CE'),
	(4, 'sf_hubungan_code_prefix', 'SH');
/*!40000 ALTER TABLE `constval` ENABLE KEYS */;


-- Dumping structure for table she.detailrmap
DROP TABLE IF EXISTS `detailrmap`;
CREATE TABLE IF NOT EXISTS `detailrmap` (
  `code` varchar(3) DEFAULT NULL,
  `detailcode` varchar(2) DEFAULT NULL,
  `detailuraian` varchar(200) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.detailrmap: ~0 rows (approximately)
DELETE FROM `detailrmap`;
/*!40000 ALTER TABLE `detailrmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `detailrmap` ENABLE KEYS */;


-- Dumping structure for table she.dtproperties
DROP TABLE IF EXISTS `dtproperties`;
CREATE TABLE IF NOT EXISTS `dtproperties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) DEFAULT NULL,
  `property` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `uvalue` varchar(510) DEFAULT NULL,
  `lvalue` tinyblob,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.dtproperties: ~0 rows (approximately)
DELETE FROM `dtproperties`;
/*!40000 ALTER TABLE `dtproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `dtproperties` ENABLE KEYS */;


-- Dumping structure for table she.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `if_url` varchar(250) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `publish` enum('Y','N') DEFAULT 'Y',
  `order` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table she.menu: ~24 rows (approximately)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `nama`, `url`, `if_url`, `parent_id`, `publish`, `order`, `icon`) VALUES
	(1, 'Home', 'home', 'home', 0, 'Y', 1, 'fa-home'),
	(2, 'Master', '#', 'master*', 0, 'Y', 2, 'fa-th-large'),
	(3, 'Anggota Badan', 'master/safetyanggotabadan', 'master/safetyanggotabadan*', 2, 'Y', 1, NULL),
	(4, 'Cedera', 'master/safetycedera', NULL, 2, 'Y', 2, NULL),
	(5, 'Hub dengan plant', 'master/safetyhubungan', NULL, 2, 'Y', 3, NULL),
	(6, 'Jenis Pekerjaan', NULL, NULL, 2, 'Y', 4, NULL),
	(7, 'Jenis Bahaya', NULL, NULL, 2, 'Y', 5, NULL),
	(8, 'Keadaan', NULL, NULL, 2, 'Y', 6, NULL),
	(9, 'Pegawai', NULL, NULL, 2, 'Y', 7, NULL),
	(10, 'Departemen', NULL, NULL, 2, 'Y', 8, NULL),
	(11, 'Grup', NULL, NULL, 2, 'Y', 9, NULL),
	(12, 'Vendro', NULL, NULL, 2, 'Y', 10, NULL),
	(13, 'Work Request', NULL, NULL, 2, 'Y', 11, NULL),
	(14, 'Sumber Penyebab', NULL, NULL, 2, 'Y', 12, NULL),
	(15, 'Resepsionis', NULL, NULL, 2, 'Y', 13, NULL),
	(16, 'Transaksi', NULL, NULL, 0, 'Y', 3, 'fa-download'),
	(17, 'Safety', NULL, NULL, 16, 'Y', 1, NULL),
	(18, 'Near Miss', NULL, NULL, 16, 'Y', 2, NULL),
	(19, 'Pasal', NULL, NULL, 16, 'Y', 3, NULL),
	(20, 'Work Permit', NULL, NULL, 16, 'Y', 4, NULL),
	(21, 'Aturan Keselamatan', NULL, NULL, 16, 'Y', 5, NULL),
	(22, 'Monitoring', NULL, NULL, 0, 'Y', 4, 'fa-signal'),
	(23, 'Near Miss', NULL, NULL, 22, 'Y', 1, NULL),
	(24, 'Grafik Near Miss', NULL, NULL, 22, 'Y', 2, NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Dumping structure for table she.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table she.migrations: ~3 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2015_06_04_051925_entrust_setup_tables', 1),
	('2013_03_17_131246_verify_init', 2),
	('2013_05_11_082613_use_soft_delete', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table she.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `permissions_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table she.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- Dumping structure for table she.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table she.permission_role: ~0 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- Dumping structure for table she.receptionist_detail
DROP TABLE IF EXISTS `receptionist_detail`;
CREATE TABLE IF NOT EXISTS `receptionist_detail` (
  `id_perusahaan` varchar(8) DEFAULT '-',
  `id_detail_perusahaan` varchar(50) DEFAULT '-',
  `nama` varchar(100) DEFAULT '-',
  `posisi` varchar(50) DEFAULT '-',
  `alamat` varchar(300) DEFAULT '-',
  `phone` varchar(50) DEFAULT '-',
  `hp` varchar(50) DEFAULT '-',
  `fax` varchar(50) DEFAULT '-',
  `keterangan` varchar(300) DEFAULT '-',
  `email` varchar(100) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.receptionist_detail: ~0 rows (approximately)
DELETE FROM `receptionist_detail`;
/*!40000 ALTER TABLE `receptionist_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptionist_detail` ENABLE KEYS */;


-- Dumping structure for table she.receptionist_header
DROP TABLE IF EXISTS `receptionist_header`;
CREATE TABLE IF NOT EXISTS `receptionist_header` (
  `id_perusahaan` varchar(8) NOT NULL DEFAULT '0',
  `nama_perusahaan` varchar(50) DEFAULT '-',
  `alamat_perusahaan` varchar(200) DEFAULT '-',
  `phone_perusahaan` varchar(50) DEFAULT '-',
  `fax_perusahaan` varchar(50) DEFAULT '-',
  `keterangan_perusahaan` varchar(300) DEFAULT '-',
  `email_perusahaan` varchar(100) DEFAULT '-',
  PRIMARY KEY (`id_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.receptionist_header: ~0 rows (approximately)
DELETE FROM `receptionist_header`;
/*!40000 ALTER TABLE `receptionist_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `receptionist_header` ENABLE KEYS */;


-- Dumping structure for table she.rmap
DROP TABLE IF EXISTS `rmap`;
CREATE TABLE IF NOT EXISTS `rmap` (
  `code` varchar(3) NOT NULL,
  `aturan` varchar(100) DEFAULT '-',
  `uraian` varchar(200) DEFAULT '-',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.rmap: ~0 rows (approximately)
DELETE FROM `rmap`;
/*!40000 ALTER TABLE `rmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `rmap` ENABLE KEYS */;


-- Dumping structure for table she.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `roles_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table she.roles: ~1 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `level`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', NULL, 10, '2015-06-04 07:49:16', '2015-06-04 07:49:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table she.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `role_user_user_id_index` (`user_id`),
  KEY `role_user_role_id_index` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table she.role_user: ~1 rows (approximately)
DELETE FROM `role_user`;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2015-06-04 07:49:16', '2015-06-04 07:49:16');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;


-- Dumping structure for table she.safety_access
DROP TABLE IF EXISTS `safety_access`;
CREATE TABLE IF NOT EXISTS `safety_access` (
  `fcemployeecode` int(11) DEFAULT '0',
  `namacolumn` varchar(50) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_access: ~0 rows (approximately)
DELETE FROM `safety_access`;
/*!40000 ALTER TABLE `safety_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_access` ENABLE KEYS */;


-- Dumping structure for table she.safety_account_email
DROP TABLE IF EXISTS `safety_account_email`;
CREATE TABLE IF NOT EXISTS `safety_account_email` (
  `account` varchar(100) DEFAULT '-',
  `status` varchar(50) DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_account_email: ~0 rows (approximately)
DELETE FROM `safety_account_email`;
/*!40000 ALTER TABLE `safety_account_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_account_email` ENABLE KEYS */;


-- Dumping structure for table she.safety_anggotabadan
DROP TABLE IF EXISTS `safety_anggotabadan`;
CREATE TABLE IF NOT EXISTS `safety_anggotabadan` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rowguid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rowguid`),
  UNIQUE KEY `code_unique` (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_anggotabadan: ~29 rows (approximately)
DELETE FROM `safety_anggotabadan`;
/*!40000 ALTER TABLE `safety_anggotabadan` DISABLE KEYS */;
INSERT INTO `safety_anggotabadan` (`description`, `code`, `userupd`, `tglupd`, `rowguid`) VALUES
	('Pergelangan Tangan', 'AB3', 'admin', '2015-06-05 07:56:11', 3),
	('Tidak Cedera', 'AB4', 'admin', '2015-06-05 07:56:41', 4),
	('Lengan', 'AB5', 'admin', '2015-06-05 07:56:48', 5),
	('Punggung', 'AB6', 'admin', '2015-06-05 07:56:54', 6),
	('Telinga', 'AB7', 'admin', '2015-06-05 07:57:20', 7),
	('Siku', 'AB8', 'admin', '2015-06-05 07:57:23', 8),
	('Mata', 'AB9', 'admin', '2015-06-05 07:57:29', 9),
	('Muka', 'AB10', 'admin', '2015-06-05 07:57:31', 10),
	('Jari', 'AB11', 'admin', '2015-06-05 07:57:34', 11),
	('Kaki', 'AB12', 'admin', '2015-06-05 07:57:41', 12),
	('Tangan', 'AB13', 'admin', '2015-06-05 07:57:44', 13),
	('Kepala', 'AB14', 'admin', '2015-06-05 07:57:47', 14),
	('Organ Bagian Dalam', 'AB15', 'admin', '2015-06-05 07:57:58', 15),
	('Lutut', 'AB16', 'admin', '2015-06-05 07:58:01', 16),
	('Tungkai Bawah (Kaki)', 'AB17', 'admin', '2015-06-05 07:58:41', 17),
	('Mulut', 'AB18', 'admin', '2015-06-05 07:58:47', 18),
	('Leher', 'AB19', 'admin', '2015-06-05 07:58:50', 19),
	('Hidung', 'AB20', 'admin', '2015-06-05 07:58:54', 20),
	('Dagu', 'AB21', 'admin', '2015-06-05 07:59:06', 21),
	('Gigi', 'AB22', 'admin', '2015-06-05 07:59:08', 22),
	('Paha', 'AB23', 'admin', '2015-06-05 07:59:10', 23),
	('Batang Tubuh', 'AB24', 'admin', '2015-06-05 07:59:17', 24),
	('Ibu Jari', 'AB25', 'admin', '2015-06-05 07:59:20', 25),
	('Pergelangan', 'AB26', 'admin', '2015-06-05 07:59:26', 26),
	('Lain-lain, silahkan identifikasi di uraian', 'AB27', 'admin', '2015-06-05 07:59:46', 27),
	('Mata Kaki', 'AB28', 'admin', '2015-06-05 07:59:53', 28),
	('Tidak Diketahui', 'AB29', 'admin', '2015-06-05 07:59:57', 29),
	('Kerusakan Organ Dalam', 'AB30', 'admin', '2015-06-05 08:00:06', 30),
	('Otot Meregang dan Terkilir', 'AB31', 'admin', '2015-06-05 08:00:14', 31);
/*!40000 ALTER TABLE `safety_anggotabadan` ENABLE KEYS */;


-- Dumping structure for table she.safety_cedera
DROP TABLE IF EXISTS `safety_cedera`;
CREATE TABLE IF NOT EXISTS `safety_cedera` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rowguid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_1274565166` (`rowguid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_cedera: ~32 rows (approximately)
DELETE FROM `safety_cedera`;
/*!40000 ALTER TABLE `safety_cedera` DISABLE KEYS */;
INSERT INTO `safety_cedera` (`description`, `code`, `userupd`, `tglupd`, `rowguid`) VALUES
	('Tidak Cedera', 'CE1', 'admin', '2015-06-05 09:45:54', 1),
	('Tergilas', 'CE10', 'admin', '2015-06-05 09:49:46', 10),
	('Ketegangan yang menumpuk', 'CE11', 'admin', '2015-06-05 09:49:56', 11),
	('Terpotong atau tergores', 'CE12', 'admin', '2015-06-05 09:50:05', 12),
	('Tuli', 'CE13', 'admin', '2015-06-05 09:50:14', 13),
	('Iritasi Kulit', 'CE14', 'admin', '2015-06-05 09:50:17', 14),
	('Sendi Terlepas', 'CE15', 'admin', '2015-06-05 09:50:24', 15),
	('Kejutan Listrik', 'CE16', 'admin', '2015-06-05 09:50:30', 16),
	('Mata', 'CE17', 'admin', '2015-06-05 09:50:32', 17),
	('Bagian tubuh lainnya', 'CE18', 'admin', '2015-06-05 09:50:44', 18),
	('Retak Tulang', 'CE19', 'admin', '2015-06-05 09:50:49', 19),
	('Lecet/Barut-barut', 'CE2', 'admin', '2015-06-05 09:46:10', 2),
	('Lumpuh', 'CE20', 'admin', '2015-06-05 09:50:55', 20),
	('Gangguan Pendengaran', 'CE21', 'admin', '2015-06-05 09:51:01', 21),
	('Stress/Stroke', 'CE22', 'admin', '2015-06-05 09:51:07', 22),
	('Hernia', 'CE23', 'admin', '2015-06-05 09:51:09', 23),
	('Melepuh', 'CE24', 'admin', '2015-06-05 09:51:13', 24),
	('Lain-lain, silahkan identifikasi di uraian', 'CE25', 'admin', '2015-06-05 09:51:21', 25),
	('Tertusuk', 'CE26', 'admin', '2015-06-05 09:51:28', 26),
	('Radiasi', 'CE27', 'admin', '2015-06-05 09:51:30', 27),
	('Kerusakan Organ Dalam', 'CE28', 'admin', '2015-06-05 09:51:37', 28),
	('Otot Meregang dan Terkilir', 'CE29', 'admin', '2015-06-05 09:51:46', 29),
	('Amputasi', 'CE3', 'admin', '2015-06-05 09:46:18', 3),
	('Keracunan asap/keracunan lainnya', 'CE30', 'admin', '2015-06-05 09:51:56', 30),
	('Tidak Diketahui', 'CE31', 'admin', '2015-06-05 09:52:03', 31),
	('Hampir Cedera', 'CE33', 'admin', '2015-06-05 09:53:11', 33),
	('Tidak sadar karena kekurangan O2', 'CE4', 'admin', '2015-06-05 09:46:33', 4),
	('Bengkak', 'CE5', 'admin', '2015-06-05 09:46:40', 5),
	('Terbakar bahan kimia', 'CE6', 'admin', '2015-06-05 09:46:45', 6),
	('Terbakar karena arus listrik', 'CE7', 'admin', '2015-06-05 09:49:25', 7),
	('Terbakar karena panas', 'CE8', 'admin', '2015-06-05 09:49:32', 8),
	('Terkejut dan hilang kesadaran', 'CE9', 'admin', '2015-06-05 09:49:40', 9);
/*!40000 ALTER TABLE `safety_cedera` ENABLE KEYS */;


-- Dumping structure for table she.safety_column_view
DROP TABLE IF EXISTS `safety_column_view`;
CREATE TABLE IF NOT EXISTS `safety_column_view` (
  `description` varchar(50) DEFAULT NULL,
  `column_original` varchar(50) DEFAULT NULL,
  `table_view` varchar(50) DEFAULT 'safety_pasal_sub_detail',
  `sort` int(11) DEFAULT NULL,
  `tipe_data` varchar(50) DEFAULT 'abjad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_column_view: ~0 rows (approximately)
DELETE FROM `safety_column_view`;
/*!40000 ALTER TABLE `safety_column_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_column_view` ENABLE KEYS */;


-- Dumping structure for table she.safety_detail_wr_master
DROP TABLE IF EXISTS `safety_detail_wr_master`;
CREATE TABLE IF NOT EXISTS `safety_detail_wr_master` (
  `no_detail_wr` varchar(2) NOT NULL DEFAULT '-',
  `keterangan` varchar(100) DEFAULT '-',
  PRIMARY KEY (`no_detail_wr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_detail_wr_master: ~0 rows (approximately)
DELETE FROM `safety_detail_wr_master`;
/*!40000 ALTER TABLE `safety_detail_wr_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_detail_wr_master` ENABLE KEYS */;


-- Dumping structure for table she.safety_hubungan
DROP TABLE IF EXISTS `safety_hubungan`;
CREATE TABLE IF NOT EXISTS `safety_hubungan` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` datetime DEFAULT NULL,
  `rowguid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_1067944418` (`rowguid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_hubungan: ~5 rows (approximately)
DELETE FROM `safety_hubungan`;
/*!40000 ALTER TABLE `safety_hubungan` DISABLE KEYS */;
INSERT INTO `safety_hubungan` (`description`, `code`, `userupd`, `tglupd`, `rowguid`) VALUES
	('Sangat Terkait', 'SH1', 'admin', NULL, 1),
	('Terkait', 'SH2', 'admin', NULL, 2),
	('Mungkin Terkait', 'SH3', 'admin', NULL, 3),
	('Kecil kemungkinannya terkait', 'SH4', 'admin', NULL, 4),
	('Tidak Terkait', 'SH5', 'admin', NULL, 5);
/*!40000 ALTER TABLE `safety_hubungan` ENABLE KEYS */;


-- Dumping structure for table she.safety_jenisbahaya
DROP TABLE IF EXISTS `safety_jenisbahaya`;
CREATE TABLE IF NOT EXISTS `safety_jenisbahaya` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_971944076` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_jenisbahaya: ~0 rows (approximately)
DELETE FROM `safety_jenisbahaya`;
/*!40000 ALTER TABLE `safety_jenisbahaya` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_jenisbahaya` ENABLE KEYS */;


-- Dumping structure for table she.safety_jp
DROP TABLE IF EXISTS `safety_jp`;
CREATE TABLE IF NOT EXISTS `safety_jp` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_907943848` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Jenis Pekerjaan';

-- Dumping data for table she.safety_jp: ~0 rows (approximately)
DELETE FROM `safety_jp`;
/*!40000 ALTER TABLE `safety_jp` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_jp` ENABLE KEYS */;


-- Dumping structure for table she.safety_keadaan
DROP TABLE IF EXISTS `safety_keadaan`;
CREATE TABLE IF NOT EXISTS `safety_keadaan` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_1099944532` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_keadaan: ~0 rows (approximately)
DELETE FROM `safety_keadaan`;
/*!40000 ALTER TABLE `safety_keadaan` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_keadaan` ENABLE KEYS */;


-- Dumping structure for table she.safety_klasifikasi
DROP TABLE IF EXISTS `safety_klasifikasi`;
CREATE TABLE IF NOT EXISTS `safety_klasifikasi` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_939943962` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_klasifikasi: ~0 rows (approximately)
DELETE FROM `safety_klasifikasi`;
/*!40000 ALTER TABLE `safety_klasifikasi` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_klasifikasi` ENABLE KEYS */;


-- Dumping structure for table she.safety_menu
DROP TABLE IF EXISTS `safety_menu`;
CREATE TABLE IF NOT EXISTS `safety_menu` (
  `pilihan` tinyint(1) DEFAULT '0',
  `namacolumn` varchar(50) DEFAULT '-',
  `namaalias` varchar(50) DEFAULT '-',
  `status` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_menu: ~0 rows (approximately)
DELETE FROM `safety_menu`;
/*!40000 ALTER TABLE `safety_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_menu` ENABLE KEYS */;


-- Dumping structure for table she.safety_menu_gambar
DROP TABLE IF EXISTS `safety_menu_gambar`;
CREATE TABLE IF NOT EXISTS `safety_menu_gambar` (
  `namacolumn` varchar(50) DEFAULT NULL,
  `gambarcolumn` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_menu_gambar: ~0 rows (approximately)
DELETE FROM `safety_menu_gambar`;
/*!40000 ALTER TABLE `safety_menu_gambar` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_menu_gambar` ENABLE KEYS */;


-- Dumping structure for table she.safety_pasal
DROP TABLE IF EXISTS `safety_pasal`;
CREATE TABLE IF NOT EXISTS `safety_pasal` (
  `no_judul` varchar(4) NOT NULL,
  `judul_pasal` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`no_judul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_pasal: ~0 rows (approximately)
DELETE FROM `safety_pasal`;
/*!40000 ALTER TABLE `safety_pasal` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_pasal` ENABLE KEYS */;


-- Dumping structure for table she.safety_pasal_detail
DROP TABLE IF EXISTS `safety_pasal_detail`;
CREATE TABLE IF NOT EXISTS `safety_pasal_detail` (
  `nomor_header` varchar(10) NOT NULL DEFAULT '0',
  `nomor_detail` varchar(2) NOT NULL DEFAULT '0',
  `keterangan` varchar(1000) DEFAULT '-',
  `no_judul` varchar(4) NOT NULL DEFAULT '29',
  PRIMARY KEY (`nomor_header`,`nomor_detail`,`no_judul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_pasal_detail: ~0 rows (approximately)
DELETE FROM `safety_pasal_detail`;
/*!40000 ALTER TABLE `safety_pasal_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_pasal_detail` ENABLE KEYS */;


-- Dumping structure for table she.safety_pasal_header
DROP TABLE IF EXISTS `safety_pasal_header`;
CREATE TABLE IF NOT EXISTS `safety_pasal_header` (
  `nomor_header` varchar(10) NOT NULL DEFAULT '0',
  `pasal` varchar(50) DEFAULT 'pasal',
  `keterangan` varchar(800) DEFAULT '-',
  `no_judul` varchar(4) NOT NULL DEFAULT '29',
  PRIMARY KEY (`nomor_header`,`no_judul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_pasal_header: ~0 rows (approximately)
DELETE FROM `safety_pasal_header`;
/*!40000 ALTER TABLE `safety_pasal_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_pasal_header` ENABLE KEYS */;


-- Dumping structure for table she.safety_pasal_sub_detail
DROP TABLE IF EXISTS `safety_pasal_sub_detail`;
CREATE TABLE IF NOT EXISTS `safety_pasal_sub_detail` (
  `nomor_header` varchar(10) NOT NULL DEFAULT '0',
  `nomor_detail` varchar(2) NOT NULL DEFAULT '0',
  `nomor_sub_detail` varchar(2) NOT NULL DEFAULT '0',
  `keterangan` varchar(1000) DEFAULT '-',
  `no_judul` varchar(4) NOT NULL DEFAULT '29',
  PRIMARY KEY (`nomor_header`,`nomor_detail`,`nomor_sub_detail`,`no_judul`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_pasal_sub_detail: ~0 rows (approximately)
DELETE FROM `safety_pasal_sub_detail`;
/*!40000 ALTER TABLE `safety_pasal_sub_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_pasal_sub_detail` ENABLE KEYS */;


-- Dumping structure for table she.safety_permit
DROP TABLE IF EXISTS `safety_permit`;
CREATE TABLE IF NOT EXISTS `safety_permit` (
  `no_work_request` varchar(9) NOT NULL DEFAULT '-',
  `jenis_doc` varchar(50) DEFAULT '-',
  `judul_doc` varchar(50) DEFAULT '-',
  `no_doc` varchar(50) DEFAULT '-',
  `tanggal_permit` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tanggal_request_awal` timestamp NULL DEFAULT NULL,
  `tanggal_request_akhir` timestamp NULL DEFAULT NULL,
  `equipment` varchar(100) DEFAULT '-',
  `no_tag` varchar(50) DEFAULT '-',
  `uraian_pekerjaan` varchar(200) DEFAULT '-',
  `department` varchar(30) DEFAULT '-',
  `status` varchar(50) DEFAULT 'new',
  `tanggal_diperpanjang` timestamp NULL DEFAULT NULL,
  `prescrip_by` tinyint(1) DEFAULT '0',
  `extend_by` tinyint(1) DEFAULT '0',
  `pemberi_ijin_mulai_kerja` varchar(50) DEFAULT '-',
  `tanggal_pemberi_ijin_mulai_kerja` timestamp NULL DEFAULT NULL,
  `penerima_ijin_mulai_kerja` varchar(50) DEFAULT '-',
  `tanggal_penerima_ijin_mulai_kerja` timestamp NULL DEFAULT NULL,
  `pemberi_ijin_akhir_kerja` varchar(50) DEFAULT '-',
  `tanggal_pemberi_ijin_akhir_kerja` datetime DEFAULT NULL,
  `penerima_ijin_akhir_kerja` varchar(50) DEFAULT '-',
  `tanggal_penerima_ijin_akhir_kerja` timestamp NULL DEFAULT NULL,
  `kelengkapan` tinyint(1) DEFAULT NULL,
  `dalam_pengerjaan` tinyint(1) DEFAULT NULL,
  `kebersihan` tinyint(1) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `userupd` varchar(50) DEFAULT '-',
  `tglupd` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no_work_request`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_permit: ~0 rows (approximately)
DELETE FROM `safety_permit`;
/*!40000 ALTER TABLE `safety_permit` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_permit` ENABLE KEYS */;


-- Dumping structure for table she.safety_permit_detail
DROP TABLE IF EXISTS `safety_permit_detail`;
CREATE TABLE IF NOT EXISTS `safety_permit_detail` (
  `no_work_request` varchar(9) DEFAULT '-',
  `no_detail_work_request` varchar(2) DEFAULT '-',
  `keterangan` varchar(100) DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_permit_detail: ~0 rows (approximately)
DELETE FROM `safety_permit_detail`;
/*!40000 ALTER TABLE `safety_permit_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_permit_detail` ENABLE KEYS */;


-- Dumping structure for table she.safety_permit_sub_detail
DROP TABLE IF EXISTS `safety_permit_sub_detail`;
CREATE TABLE IF NOT EXISTS `safety_permit_sub_detail` (
  `no_work_request` varchar(9) DEFAULT NULL,
  `no_detail_work_request` varchar(2) DEFAULT NULL,
  `no_sub_detail_work_request` varchar(2) DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  `prescrip_by_supv` tinyint(1) DEFAULT '0',
  `extend_by_supv` tinyint(1) DEFAULT '0',
  `supv_sign` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_permit_sub_detail: ~0 rows (approximately)
DELETE FROM `safety_permit_sub_detail`;
/*!40000 ALTER TABLE `safety_permit_sub_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_permit_sub_detail` ENABLE KEYS */;


-- Dumping structure for table she.safety_sub_detail_wr_master
DROP TABLE IF EXISTS `safety_sub_detail_wr_master`;
CREATE TABLE IF NOT EXISTS `safety_sub_detail_wr_master` (
  `no_detail_wr` varchar(2) DEFAULT '-',
  `no_sub_detail_wr` varchar(2) DEFAULT '-',
  `keterangan` varchar(100) DEFAULT '-',
  `prescrip_by_supv` tinyint(1) DEFAULT '0',
  `extend_by_supv` tinyint(1) DEFAULT '0',
  `supv_sign` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_sub_detail_wr_master: ~0 rows (approximately)
DELETE FROM `safety_sub_detail_wr_master`;
/*!40000 ALTER TABLE `safety_sub_detail_wr_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_sub_detail_wr_master` ENABLE KEYS */;


-- Dumping structure for table she.safety_sumberp
DROP TABLE IF EXISTS `safety_sumberp`;
CREATE TABLE IF NOT EXISTS `safety_sumberp` (
  `description` varchar(150) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_1035944304` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_sumberp: ~0 rows (approximately)
DELETE FROM `safety_sumberp`;
/*!40000 ALTER TABLE `safety_sumberp` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_sumberp` ENABLE KEYS */;


-- Dumping structure for table she.safety_tglpelaporan
DROP TABLE IF EXISTS `safety_tglpelaporan`;
CREATE TABLE IF NOT EXISTS `safety_tglpelaporan` (
  `tgl` datetime DEFAULT NULL,
  `nomor` varchar(50) DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_291609669` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_tglpelaporan: ~0 rows (approximately)
DELETE FROM `safety_tglpelaporan`;
/*!40000 ALTER TABLE `safety_tglpelaporan` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_tglpelaporan` ENABLE KEYS */;


-- Dumping structure for table she.safety_trans
DROP TABLE IF EXISTS `safety_trans`;
CREATE TABLE IF NOT EXISTS `safety_trans` (
  `pilih` tinyint(1) DEFAULT '0',
  `location` varchar(50) DEFAULT '-',
  `nomor` varchar(50) NOT NULL,
  `tanggal_kecelakaan` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis_pekerjaan` varchar(150) DEFAULT '-',
  `klasifikasi` varchar(150) DEFAULT '-',
  `jenis_bahaya` varchar(150) DEFAULT '-',
  `cedera` varchar(150) DEFAULT '-',
  `anggota_badan` varchar(150) DEFAULT '-',
  `sumber_penyebab` varchar(150) DEFAULT '-',
  `hub_plantlain` varchar(150) DEFAULT '-',
  `tindakantdkaman` varchar(150) DEFAULT '-',
  `keadaantdkaman` varchar(150) DEFAULT '-',
  `status` varchar(50) DEFAULT 'open',
  `kontraktor_celaka` varchar(50) DEFAULT '-',
  `jenis_kontraktor` varchar(50) DEFAULT '-',
  `kehilanganharikerja` int(11) DEFAULT '0',
  `uraian` varchar(2000) DEFAULT '-',
  `pencegahan` varchar(2000) DEFAULT '-',
  `dilaporkanoleh` varchar(50) DEFAULT NULL,
  `userupd` varchar(50) DEFAULT NULL,
  `tglupd` timestamp NULL DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  `email` tinyint(1) DEFAULT '1',
  `koreksi` varchar(2000) DEFAULT '-',
  `koreksipic` varchar(50) DEFAULT '-',
  `koreksitgl` timestamp NULL DEFAULT NULL,
  `sms` tinyint(1) DEFAULT '0',
  `ditujuhkan` varchar(50) DEFAULT '-',
  `reminder` timestamp NULL DEFAULT NULL,
  `jumlah_reminder` varchar(4) DEFAULT '-',
  `kriteria` varchar(50) DEFAULT 'k3',
  PRIMARY KEY (`nomor`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_339609840` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_trans: ~0 rows (approximately)
DELETE FROM `safety_trans`;
/*!40000 ALTER TABLE `safety_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_trans` ENABLE KEYS */;


-- Dumping structure for table she.safety_trans_cpar
DROP TABLE IF EXISTS `safety_trans_cpar`;
CREATE TABLE IF NOT EXISTS `safety_trans_cpar` (
  `nomor` varchar(50) DEFAULT NULL,
  `tanggal_cpar` datetime DEFAULT NULL,
  `nomor_cpar` varchar(50) DEFAULT NULL,
  `originator` varchar(50) DEFAULT NULL,
  `koordinator` varchar(50) DEFAULT NULL,
  `dept_1` varchar(50) DEFAULT NULL,
  `dept_2` varchar(50) DEFAULT NULL,
  `dept_3` varchar(50) DEFAULT NULL,
  `dept_4` varchar(50) DEFAULT NULL,
  `dept_5` varchar(50) DEFAULT NULL,
  `pic_1_1` varchar(50) DEFAULT NULL,
  `pic_1_2` varchar(50) DEFAULT NULL,
  `pic_1_3` varchar(50) DEFAULT NULL,
  `pic_1_4` varchar(50) DEFAULT NULL,
  `pic_1_5` varchar(50) DEFAULT NULL,
  `pic_2_1` varchar(50) DEFAULT NULL,
  `pic_2_2` varchar(50) DEFAULT NULL,
  `pic_2_3` varchar(50) DEFAULT NULL,
  `pic_2_4` varchar(50) DEFAULT NULL,
  `pic_2_5` varchar(50) DEFAULT NULL,
  `analisa_permasalahan` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_trans_cpar: ~0 rows (approximately)
DELETE FROM `safety_trans_cpar`;
/*!40000 ALTER TABLE `safety_trans_cpar` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_trans_cpar` ENABLE KEYS */;


-- Dumping structure for table she.safety_trans_cpar_detail
DROP TABLE IF EXISTS `safety_trans_cpar_detail`;
CREATE TABLE IF NOT EXISTS `safety_trans_cpar_detail` (
  `nomor` varchar(50) DEFAULT NULL,
  `detail_tindakan` varchar(200) DEFAULT NULL,
  `perlu_tindakan` varchar(50) DEFAULT NULL,
  `pic` varchar(50) DEFAULT NULL,
  `target_penyelesaian` varchar(100) DEFAULT NULL,
  `status` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_trans_cpar_detail: ~0 rows (approximately)
DELETE FROM `safety_trans_cpar_detail`;
/*!40000 ALTER TABLE `safety_trans_cpar_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_trans_cpar_detail` ENABLE KEYS */;


-- Dumping structure for table she.safety_trans_gambar
DROP TABLE IF EXISTS `safety_trans_gambar`;
CREATE TABLE IF NOT EXISTS `safety_trans_gambar` (
  `nomor` varchar(50) DEFAULT NULL,
  `gambar_near_miss` tinyblob,
  `keterangan` varchar(50) DEFAULT 'new',
  `nomordetil` varchar(50) DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.safety_trans_gambar: ~0 rows (approximately)
DELETE FROM `safety_trans_gambar`;
/*!40000 ALTER TABLE `safety_trans_gambar` DISABLE KEYS */;
/*!40000 ALTER TABLE `safety_trans_gambar` ENABLE KEYS */;


-- Dumping structure for table she.secgroup
DROP TABLE IF EXISTS `secgroup`;
CREATE TABLE IF NOT EXISTS `secgroup` (
  `fcgroupcode` varchar(10) NOT NULL,
  `fcgroupname` varchar(30) NOT NULL,
  `fcdescription` varchar(80) NOT NULL,
  `userid` varchar(10) DEFAULT NULL,
  `upddate` datetime DEFAULT NULL,
  `ws` varchar(1) DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_1977058079` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.secgroup: ~0 rows (approximately)
DELETE FROM `secgroup`;
/*!40000 ALTER TABLE `secgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `secgroup` ENABLE KEYS */;


-- Dumping structure for table she.secuserapp
DROP TABLE IF EXISTS `secuserapp`;
CREATE TABLE IF NOT EXISTS `secuserapp` (
  `fcusercode` varchar(10) NOT NULL,
  `fcusername` varchar(50) NOT NULL,
  `fcdescription` varchar(80) DEFAULT NULL,
  `fcpassword` varchar(10) DEFAULT NULL,
  `fcgroupcode` varchar(10) NOT NULL,
  `userid` varchar(10) DEFAULT NULL,
  `upddate` datetime DEFAULT NULL,
  `ws` varchar(1) DEFAULT NULL,
  `fnlevel` varchar(2) DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  `appcso` varchar(10) DEFAULT '-',
  `confirmcso` varchar(10) DEFAULT '-',
  `minremstock` varchar(10) DEFAULT '-',
  PRIMARY KEY (`fcusercode`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_2025058250` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.secuserapp: ~0 rows (approximately)
DELETE FROM `secuserapp`;
/*!40000 ALTER TABLE `secuserapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `secuserapp` ENABLE KEYS */;


-- Dumping structure for procedure she.SP_INSERT_SAFETY_ANGGOTABADAN
DROP PROCEDURE IF EXISTS `SP_INSERT_SAFETY_ANGGOTABADAN`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SAFETY_ANGGOTABADAN`(IN `p_desc` varchar(150), IN `p_userupd` varchar(50))
begin
insert into safety_anggotabadan (description,userupd) values (p_desc,p_userupd);
select @prefix := value from constval where name= 'sf_anggotabadan_code_prefix' limit 1;
select @newid := max(rowguid) from safety_anggotabadan;
update safety_anggotabadan set code = concat(@prefix,@newid) where rowguid = @newid;
end//
DELIMITER ;


-- Dumping structure for procedure she.SP_INSERT_SAFETY_CEDERA
DROP PROCEDURE IF EXISTS `SP_INSERT_SAFETY_CEDERA`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SAFETY_CEDERA`(IN `p_desc` varchar(150), IN `p_userupd` varchar(50))
begin
insert into safety_cedera (description,userupd) values (p_desc,p_userupd);
select @prefix := value from constval where name= 'sf_cedera_code_prefix' limit 1;
select @newid := max(rowguid) from safety_cedera;
update safety_cedera set code = concat(@prefix,@newid) where rowguid = @newid;
end//
DELIMITER ;


-- Dumping structure for procedure she.SP_INSERT_SAFETY_HUBUNGAN
DROP PROCEDURE IF EXISTS `SP_INSERT_SAFETY_HUBUNGAN`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERT_SAFETY_HUBUNGAN`(IN `p_desc` varchar(150), IN `p_userupd` varchar(50))
begin
insert into safety_hubungan (description,userupd) values (p_desc,p_userupd);
select @prefix := value from constval where name= 'sf_hubungan_code_prefix' limit 1;
select @newid := max(rowguid) from safety_hubungan;
update safety_hubungan set code = concat(@prefix,@newid) where rowguid = @newid;
end//
DELIMITER ;


-- Dumping structure for table she.subdetailrmap
DROP TABLE IF EXISTS `subdetailrmap`;
CREATE TABLE IF NOT EXISTS `subdetailrmap` (
  `code` varchar(3) DEFAULT NULL,
  `detailcode` varchar(2) DEFAULT NULL,
  `subdetailcode` varchar(2) DEFAULT NULL,
  `suburaian` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.subdetailrmap: ~0 rows (approximately)
DELETE FROM `subdetailrmap`;
/*!40000 ALTER TABLE `subdetailrmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `subdetailrmap` ENABLE KEYS */;


-- Dumping structure for table she.sysdiagrams
DROP TABLE IF EXISTS `sysdiagrams`;
CREATE TABLE IF NOT EXISTS `sysdiagrams` (
  `name` varchar(160) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `uk_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.sysdiagrams: ~0 rows (approximately)
DELETE FROM `sysdiagrams`;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;


-- Dumping structure for table she.tsagama
DROP TABLE IF EXISTS `tsagama`;
CREATE TABLE IF NOT EXISTS `tsagama` (
  `fcagama` varchar(1) NOT NULL,
  `fcketerangan` varchar(15) NOT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`fcagama`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_327672215` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tsagama: ~0 rows (approximately)
DELETE FROM `tsagama`;
/*!40000 ALTER TABLE `tsagama` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsagama` ENABLE KEYS */;


-- Dumping structure for table she.tscompro
DROP TABLE IF EXISTS `tscompro`;
CREATE TABLE IF NOT EXISTS `tscompro` (
  `fccompcode` varchar(4) NOT NULL,
  `fccompname` varchar(50) NOT NULL,
  `fcdescription` varchar(100) DEFAULT NULL,
  `fcaddress` varchar(100) DEFAULT NULL,
  `userid` varchar(10) DEFAULT NULL,
  `upddate` datetime DEFAULT NULL,
  `fcphone` varchar(20) DEFAULT NULL,
  `fcfax` varchar(20) DEFAULT NULL,
  `fcfacode` int(11) DEFAULT NULL,
  `fcfaname` varchar(30) DEFAULT NULL,
  `fcprocode` int(11) DEFAULT NULL,
  `fcproname` varchar(30) DEFAULT NULL,
  `fcappcode` int(11) DEFAULT NULL,
  `fcappname` varchar(30) DEFAULT NULL,
  `lastupdate` varchar(10) DEFAULT NULL,
  `userreport` varchar(10) DEFAULT NULL,
  `statusreport` int(11) DEFAULT NULL,
  `fclocation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fccompcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tscompro: ~0 rows (approximately)
DELETE FROM `tscompro`;
/*!40000 ALTER TABLE `tscompro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tscompro` ENABLE KEYS */;


-- Dumping structure for table she.tsdepartment
DROP TABLE IF EXISTS `tsdepartment`;
CREATE TABLE IF NOT EXISTS `tsdepartment` (
  `fcdeptid` varchar(3) NOT NULL,
  `fcname` varchar(30) DEFAULT NULL,
  `fcdesc` varchar(150) DEFAULT NULL,
  `fcpic` varchar(50) DEFAULT NULL,
  `fcuserid` varchar(10) DEFAULT NULL,
  `fctglupd` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  PRIMARY KEY (`fcdeptid`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_411148510` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tsdepartment: ~0 rows (approximately)
DELETE FROM `tsdepartment`;
/*!40000 ALTER TABLE `tsdepartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsdepartment` ENABLE KEYS */;


-- Dumping structure for table she.tsemployee
DROP TABLE IF EXISTS `tsemployee`;
CREATE TABLE IF NOT EXISTS `tsemployee` (
  `fcemployeecode` int(11) NOT NULL,
  `fcemployeename` varchar(50) NOT NULL DEFAULT '-',
  `fcdescription` varchar(80) DEFAULT '-',
  `fcsex` varchar(1) DEFAULT '-',
  `fdtgllahir` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fclahir` varchar(30) DEFAULT '-',
  `fcstatus` varchar(10) DEFAULT '-',
  `fcalamat` varchar(100) DEFAULT '-',
  `fckota` varchar(30) DEFAULT '-',
  `fctelp` varchar(12) DEFAULT '-',
  `fdtglmasuk` timestamp NULL DEFAULT NULL,
  `fcpositioncode` varchar(20) DEFAULT '-',
  `fcemplevel` varchar(2) DEFAULT '-',
  `fcgroupempl` varchar(10) DEFAULT '-',
  `fcdeptcode` varchar(3) DEFAULT '-',
  `fcdivisioncode` varchar(2) DEFAULT '-',
  `userid` varchar(10) DEFAULT '-',
  `upddate` timestamp NULL DEFAULT NULL,
  `fclabelname` varchar(50) DEFAULT '-',
  `fclabeldept` varchar(30) DEFAULT '-',
  `rowguid` varchar(64) NOT NULL,
  `email` varchar(80) DEFAULT '-',
  `fcresign` varchar(10) DEFAULT '-',
  `status_safety` tinyint(1) DEFAULT '0',
  `status_nearmiss` tinyint(1) DEFAULT '0',
  `status_sms` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fcemployeecode`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_805577908` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tsemployee: ~0 rows (approximately)
DELETE FROM `tsemployee`;
/*!40000 ALTER TABLE `tsemployee` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsemployee` ENABLE KEYS */;


-- Dumping structure for table she.tssetting
DROP TABLE IF EXISTS `tssetting`;
CREATE TABLE IF NOT EXISTS `tssetting` (
  `fcemployeename` varchar(50) DEFAULT NULL,
  `background` tinyblob,
  `color_dominan` varchar(50) DEFAULT '-680618',
  `color_new` varchar(50) DEFAULT '-680618',
  `color_open` varchar(50) DEFAULT '-1237980',
  `color_close` varchar(50) DEFAULT '-6432178',
  `color_cancel` varchar(50) DEFAULT '-4754112',
  `datagrid1` varchar(50) DEFAULT '-10714188',
  `datagrid2` varchar(50) DEFAULT '-2694932',
  `opacitymain` double DEFAULT '0.9',
  `opacitysecond` double DEFAULT '0.93',
  `opacityreport` double DEFAULT '0.97'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tssetting: ~0 rows (approximately)
DELETE FROM `tssetting`;
/*!40000 ALTER TABLE `tssetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `tssetting` ENABLE KEYS */;


-- Dumping structure for table she.tssex
DROP TABLE IF EXISTS `tssex`;
CREATE TABLE IF NOT EXISTS `tssex` (
  `fcsex` varchar(1) NOT NULL,
  `fcketerangan` varchar(10) NOT NULL,
  `rowguid` varchar(64) NOT NULL,
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_343672272` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tssex: ~0 rows (approximately)
DELETE FROM `tssex`;
/*!40000 ALTER TABLE `tssex` DISABLE KEYS */;
/*!40000 ALTER TABLE `tssex` ENABLE KEYS */;


-- Dumping structure for table she.tsvendor
DROP TABLE IF EXISTS `tsvendor`;
CREATE TABLE IF NOT EXISTS `tsvendor` (
  `fcname` varchar(100) DEFAULT NULL,
  `fcdesc` varchar(50) DEFAULT NULL,
  `fccontperson` varchar(30) DEFAULT NULL,
  `fcphone` varchar(30) DEFAULT NULL,
  `fcfax` varchar(30) DEFAULT NULL,
  `fcemail` varchar(30) DEFAULT NULL,
  `fcuserid` varchar(10) DEFAULT NULL,
  `fctanggal` datetime DEFAULT NULL,
  `rowguid` varchar(64) NOT NULL,
  `fcvendorid` varchar(10) NOT NULL,
  `fcaddress` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`fcvendorid`),
  UNIQUE KEY `rowguid` (`rowguid`),
  KEY `index_1428200138` (`rowguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table she.tsvendor: ~0 rows (approximately)
DELETE FROM `tsvendor`;
/*!40000 ALTER TABLE `tsvendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsvendor` ENABLE KEYS */;


-- Dumping structure for table she.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_username_index` (`username`),
  KEY `users_password_index` (`password`),
  KEY `users_email_index` (`email`),
  KEY `users_remember_token_index` (`remember_token`),
  KEY `users_deleted_at_index` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table she.users: ~1 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `salt`, `email`, `remember_token`, `verified`, `disabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'admin', '$2a$08$Afz2r1HFDMA8cSoo6GwkCOlAQSHGMMNdO31aDenx10iUfKiANITHO', '8ba5d18b4cd2b70626a912a775f94658', 'admin@example.com', NULL, 1, 0, '2015-06-04 07:49:16', '2015-06-04 07:49:16', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
