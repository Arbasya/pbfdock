/*
 Navicat Premium Dump SQL

 Source Server         : Kelompok4_SistemTugasAkhir
 Source Server Type    : MySQL
 Source Server Version : 100420 (10.4.20-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : sistem_sidangakhir

 Target Server Type    : MySQL
 Target Server Version : 100420 (10.4.20-MariaDB)
 File Encoding         : 65001

 Date: 12/03/2025 13:59:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen`  (
  `NIDN` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_dosen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NIDN`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES ('230202029', 'Arbasya Anandito');
INSERT INTO `dosen` VALUES ('230202044', 'Shela Jaya');

-- ----------------------------
-- Table structure for hasil_sidang
-- ----------------------------
DROP TABLE IF EXISTS `hasil_sidang`;
CREATE TABLE `hasil_sidang`  (
  `id_hasil` int NOT NULL AUTO_INCREMENT,
  `id_sidang` int NOT NULL,
  `nilai` int NOT NULL,
  `catatan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_hasil`) USING BTREE,
  INDEX `id_sidang`(`id_sidang` ASC) USING BTREE,
  CONSTRAINT `hasil_sidang_ibfk_1` FOREIGN KEY (`id_sidang`) REFERENCES `sidang` (`id_sidang`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hasil_sidang
-- ----------------------------
INSERT INTO `hasil_sidang` VALUES (7, 1, 87, 'Perbaiki Font Cover dan Isi');
INSERT INTO `hasil_sidang` VALUES (8, 2, 88, 'Citation dimasukan');

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa`  (
  `NIM` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_mahasiswa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prodi` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `judul_tugasakhir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NIM`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mahasiswa
-- ----------------------------
INSERT INTO `mahasiswa` VALUES ('230202027', 'Ana Febri Salusi', 'Jalan Sadang', 'TI 2B', 'D3 Informatika', 'IOT Jaringan');
INSERT INTO `mahasiswa` VALUES ('230202031', 'Devia Kippuw', 'Jalan Tentara', 'TI 2B', 'D3 Informatika', 'Sistem Informasi');

-- ----------------------------
-- Table structure for notifikasi
-- ----------------------------
DROP TABLE IF EXISTS `notifikasi`;
CREATE TABLE `notifikasi`  (
  `id_notifikasi` int NOT NULL AUTO_INCREMENT,
  `NIM` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NIDN` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pesan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_kirim` date NOT NULL,
  PRIMARY KEY (`id_notifikasi`) USING BTREE,
  INDEX `NIM`(`NIM` ASC) USING BTREE,
  INDEX `NIDN`(`NIDN` ASC) USING BTREE,
  CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `notifikasi_ibfk_2` FOREIGN KEY (`NIDN`) REFERENCES `dosen` (`NIDN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifikasi
-- ----------------------------
INSERT INTO `notifikasi` VALUES (1, '230202031', '230202044', 'Kembali Bimbingan 21 Maret', '2025-03-20');
INSERT INTO `notifikasi` VALUES (2, '230202027', '230202029', 'Kembali Bimbingan 23 Maret', '2025-03-21');

-- ----------------------------
-- Table structure for sidang
-- ----------------------------
DROP TABLE IF EXISTS `sidang`;
CREATE TABLE `sidang`  (
  `id_sidang` int NOT NULL AUTO_INCREMENT,
  `NIM` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NIDN` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `waktu_sidang` datetime NOT NULL,
  `ruang_sidang` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_sidang`) USING BTREE,
  UNIQUE INDEX `NIM`(`NIM` ASC, `waktu_sidang` ASC) USING BTREE,
  INDEX `NIDN`(`NIDN` ASC) USING BTREE,
  CONSTRAINT `sidang_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sidang_ibfk_2` FOREIGN KEY (`NIDN`) REFERENCES `dosen` (`NIDN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sidang
-- ----------------------------
INSERT INTO `sidang` VALUES (1, '230202027', '230202029', '2025-03-13 08:00:00', 'J.5.7');
INSERT INTO `sidang` VALUES (2, '230202031', '230202044', '2025-03-14 09:00:00', 'J.5.6');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (221, 'devia01', '1111', 'devia@gmail.com', 'mahasiswa');
INSERT INTO `user` VALUES (222, 'ana02', '2222', 'ana@gmail.com', 'mahasiswa');
INSERT INTO `user` VALUES (223, 'shela03', '3333', 'shela@gmail.com', 'dosen');
INSERT INTO `user` VALUES (224, 'arbas04', '4444', 'arbas@gmail.com', 'dosen');

-- ----------------------------
-- View structure for v_jadwalsidang
-- ----------------------------
DROP VIEW IF EXISTS `v_jadwalsidang`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_jadwalsidang` AS SELECT
	mahasiswa.nama_mahasiswa, 
	mahasiswa.NIM, 
	mahasiswa.prodi, 
	dosen.nama_dosen, 
	sidang.waktu_sidang, 
	sidang.ruang_sidang
FROM
	mahasiswa,
	dosen,
	sidang
WHERE
  mahasiswa.NIM=sidang.NIM AND dosen.NIDN= sidang.NIDN ;

-- ----------------------------
-- View structure for v_nilaimahasiswa
-- ----------------------------
DROP VIEW IF EXISTS `v_nilaimahasiswa`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_nilaimahasiswa` AS SELECT
    mahasiswa.nama_mahasiswa, 
    mahasiswa.NIM,  
    hasil_sidang.nilai, 
    hasil_sidang.catatan
FROM mahasiswa
INNER JOIN sidang
INNER JOIN hasil_sidang
ON sidang.id_sidang = hasil_sidang.id_sidang
AND mahasiswa.NIM = sidang.NIM ;

SET FOREIGN_KEY_CHECKS = 1;
