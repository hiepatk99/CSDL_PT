-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 29, 2020 lúc 12:49 AM
-- Phiên bản máy phục vụ: 8.0.17
-- Phiên bản PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `csdlpt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bang_gia`
--

CREATE TABLE `bang_gia` (
  `MA_GIA` varchar(20) COLLATE ascii_bin NOT NULL,
  `SO_TIEN` double NOT NULL,
  `NGAY_TAO` datetime NOT NULL,
  `MA_GA_DEN` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_GA_DI` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_GA` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chuyen_tau`
--

CREATE TABLE `chuyen_tau` (
  `MA_CHUYEN_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `NGAY_KH` date NOT NULL,
  `MAC_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ga`
--

CREATE TABLE `ga` (
  `MA_GA` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_GA` varchar(255) COLLATE ascii_bin NOT NULL,
  `DIA_DIEM` text COLLATE ascii_bin NOT NULL,
  `SDT` varchar(12) COLLATE ascii_bin DEFAULT NULL,
  `MA_KV` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ga_dung`
--

CREATE TABLE `ga_dung` (
  `MAC_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_GA` varchar(20) COLLATE ascii_bin NOT NULL,
  `CU_LY` double NOT NULL,
  `GIO_DUNG` time NOT NULL,
  `GIO_KET_THUC` time NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gia_toa`
--

CREATE TABLE `gia_toa` (
  `MA_GIA` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_LOAI_TOA` varchar(20) COLLATE ascii_bin NOT NULL,
  `TI_LE_GIA` double NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hop_dong`
--

CREATE TABLE `hop_dong` (
  `SO_HD` varchar(20) COLLATE ascii_bin NOT NULL,
  `SO_VE` int(11) NOT NULL,
  `TRI_GIA` double NOT NULL,
  `NGAY_TAO` datetime NOT NULL,
  `NGAY_KY` datetime DEFAULT NULL,
  `MA_NV` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_TT` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_KH` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `keo_theo`
--

CREATE TABLE `keo_theo` (
  `MA_TOA` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_CHUYEN_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `NGAY_KEO` date NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khach_hang`
--

CREATE TABLE `khach_hang` (
  `MA_KH` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_KH` varchar(50) COLLATE ascii_bin NOT NULL,
  `DIA_CHI` text COLLATE ascii_bin NOT NULL,
  `SDT` varchar(12) COLLATE ascii_bin DEFAULT NULL,
  `CCCD` varchar(12) COLLATE ascii_bin NOT NULL,
  `Email` varchar(50) COLLATE ascii_bin DEFAULT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khu_vuc`
--

CREATE TABLE `khu_vuc` (
  `Ma_KV` varchar(20) COLLATE ascii_bin NOT NULL,
  `Ten_KV` varchar(50) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `Ghi_chu` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_toa_ngoi`
--

CREATE TABLE `loai_toa_ngoi` (
  `MA_LOAI_TOA` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_LOAI_TOA` varchar(50) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_ve`
--

CREATE TABLE `loai_ve` (
  `MA_LOAI_VE` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_LOAI_VE` varchar(50) COLLATE ascii_bin NOT NULL,
  `PHAN_TRAM_GIAM` double NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mac_tau`
--

CREATE TABLE `mac_tau` (
  `MAC_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `GA_KHOI_HANH` varchar(20) COLLATE ascii_bin NOT NULL,
  `GIO_KHOI_HANH` time NOT NULL,
  `GHI_CHU` varchar(20) COLLATE ascii_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `muc_giam_tap_the`
--

CREATE TABLE `muc_giam_tap_the` (
  `MA_TT` varchar(20) COLLATE ascii_bin NOT NULL,
  `SO_VE_MIN` int(11) NOT NULL,
  `SO_VE_MAX` int(11) NOT NULL,
  `PHAN_TRAM_GIAM` double NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhan_vien`
--

CREATE TABLE `nhan_vien` (
  `MA_NV` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_NV` varchar(50) COLLATE ascii_bin NOT NULL,
  `DIA_CHI` text COLLATE ascii_bin NOT NULL,
  `SDT` varchar(12) COLLATE ascii_bin DEFAULT NULL,
  `CCCD` varchar(12) COLLATE ascii_bin NOT NULL,
  `Email` varchar(50) COLLATE ascii_bin DEFAULT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieu_thu`
--

CREATE TABLE `phieu_thu` (
  `MA_PHIEU_THU` varchar(20) COLLATE ascii_bin NOT NULL,
  `LY_DO` text COLLATE ascii_bin NOT NULL,
  `NGAY_THU` datetime NOT NULL,
  `SO_TIEN_HOAN_LAI` double NOT NULL,
  `MA_KH` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_NV` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_VE` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tau`
--

CREATE TABLE `tau` (
  `MA_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_TAU` varchar(50) COLLATE ascii_bin NOT NULL,
  `LOAI_TAU` varchar(50) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `toa`
--

CREATE TABLE `toa` (
  `MA_TOA` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_TOA` varchar(50) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin,
  `MA_LOAI_TOA` varchar(20) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trang_thai_ve`
--

CREATE TABLE `trang_thai_ve` (
  `MA_TRANG_THAI` varchar(20) COLLATE ascii_bin NOT NULL,
  `TEN_TRANG_THAI` varchar(50) COLLATE ascii_bin NOT NULL,
  `Ghi_chu` text COLLATE ascii_bin
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ve`
--

CREATE TABLE `ve` (
  `MA_VE` varchar(20) COLLATE ascii_bin NOT NULL,
  `NGAY_BAN` datetime NOT NULL,
  `GIA_TIEN` double NOT NULL,
  `GIO_KH` timestamp NOT NULL,
  `MA_GIA` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_NV` varchar(20) COLLATE ascii_bin NOT NULL,
  `SO_HD` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_GHE` varchar(20) COLLATE ascii_bin NOT NULL,
  `TRANG_THAI` varchar(20) COLLATE ascii_bin NOT NULL,
  `LOAI_VE` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_CHUYEN_TAU` varchar(20) COLLATE ascii_bin NOT NULL,
  `MA_TOA` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vi_tri_ngoi`
--

CREATE TABLE `vi_tri_ngoi` (
  `MA_GHE_NGOI` varchar(20) COLLATE ascii_bin NOT NULL,
  `GHI_CHU` text COLLATE ascii_bin NOT NULL,
  `MA_TOA` varchar(20) COLLATE ascii_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii COLLATE=ascii_bin;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bang_gia`
--
ALTER TABLE `bang_gia`
  ADD PRIMARY KEY (`MA_GIA`),
  ADD KEY `MA_GA` (`MA_GA`);

--
-- Chỉ mục cho bảng `chuyen_tau`
--
ALTER TABLE `chuyen_tau`
  ADD PRIMARY KEY (`MA_CHUYEN_TAU`),
  ADD KEY `MAC_TAU` (`MAC_TAU`),
  ADD KEY `MA_TAU` (`MA_TAU`);

--
-- Chỉ mục cho bảng `ga`
--
ALTER TABLE `ga`
  ADD PRIMARY KEY (`MA_GA`),
  ADD KEY `MA_KV` (`MA_KV`);

--
-- Chỉ mục cho bảng `ga_dung`
--
ALTER TABLE `ga_dung`
  ADD PRIMARY KEY (`MAC_TAU`,`MA_GA`),
  ADD KEY `MA_GA` (`MA_GA`);

--
-- Chỉ mục cho bảng `gia_toa`
--
ALTER TABLE `gia_toa`
  ADD PRIMARY KEY (`MA_GIA`,`MA_LOAI_TOA`),
  ADD KEY `MA_LOAI_TOA` (`MA_LOAI_TOA`);

--
-- Chỉ mục cho bảng `hop_dong`
--
ALTER TABLE `hop_dong`
  ADD PRIMARY KEY (`SO_HD`),
  ADD KEY `MA_KH` (`MA_KH`),
  ADD KEY `MA_NV` (`MA_NV`),
  ADD KEY `MA_TT` (`MA_TT`);

--
-- Chỉ mục cho bảng `keo_theo`
--
ALTER TABLE `keo_theo`
  ADD PRIMARY KEY (`MA_TOA`,`MA_CHUYEN_TAU`),
  ADD KEY `MA_CHUYEN_TAU` (`MA_CHUYEN_TAU`);

--
-- Chỉ mục cho bảng `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`MA_KH`);

--
-- Chỉ mục cho bảng `khu_vuc`
--
ALTER TABLE `khu_vuc`
  ADD PRIMARY KEY (`Ma_KV`);

--
-- Chỉ mục cho bảng `loai_toa_ngoi`
--
ALTER TABLE `loai_toa_ngoi`
  ADD PRIMARY KEY (`MA_LOAI_TOA`);

--
-- Chỉ mục cho bảng `loai_ve`
--
ALTER TABLE `loai_ve`
  ADD PRIMARY KEY (`MA_LOAI_VE`);

--
-- Chỉ mục cho bảng `mac_tau`
--
ALTER TABLE `mac_tau`
  ADD PRIMARY KEY (`MAC_TAU`);

--
-- Chỉ mục cho bảng `muc_giam_tap_the`
--
ALTER TABLE `muc_giam_tap_the`
  ADD PRIMARY KEY (`MA_TT`);

--
-- Chỉ mục cho bảng `nhan_vien`
--
ALTER TABLE `nhan_vien`
  ADD PRIMARY KEY (`MA_NV`);

--
-- Chỉ mục cho bảng `phieu_thu`
--
ALTER TABLE `phieu_thu`
  ADD PRIMARY KEY (`MA_PHIEU_THU`),
  ADD KEY `MA_KH` (`MA_KH`),
  ADD KEY `MA_NV` (`MA_NV`),
  ADD KEY `MA_VE` (`MA_VE`);

--
-- Chỉ mục cho bảng `tau`
--
ALTER TABLE `tau`
  ADD PRIMARY KEY (`MA_TAU`);

--
-- Chỉ mục cho bảng `toa`
--
ALTER TABLE `toa`
  ADD PRIMARY KEY (`MA_TOA`),
  ADD KEY `MA_LOAI_TOA` (`MA_LOAI_TOA`);

--
-- Chỉ mục cho bảng `trang_thai_ve`
--
ALTER TABLE `trang_thai_ve`
  ADD PRIMARY KEY (`MA_TRANG_THAI`);

--
-- Chỉ mục cho bảng `ve`
--
ALTER TABLE `ve`
  ADD PRIMARY KEY (`MA_VE`),
  ADD KEY `MA_CHUYEN_TAU` (`MA_CHUYEN_TAU`),
  ADD KEY `LOAI_VE` (`LOAI_VE`),
  ADD KEY `TRANG_THAI` (`TRANG_THAI`),
  ADD KEY `MA_GHE` (`MA_GHE`),
  ADD KEY `MA_TOA` (`MA_TOA`),
  ADD KEY `SO_HD` (`SO_HD`),
  ADD KEY `MA_GIA` (`MA_GIA`),
  ADD KEY `MA_NV` (`MA_NV`);

--
-- Chỉ mục cho bảng `vi_tri_ngoi`
--
ALTER TABLE `vi_tri_ngoi`
  ADD PRIMARY KEY (`MA_GHE_NGOI`,`MA_TOA`),
  ADD KEY `MA_TOA` (`MA_TOA`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bang_gia`
--
ALTER TABLE `bang_gia`
  ADD CONSTRAINT `bang_gia_ibfk_1` FOREIGN KEY (`MA_GA`) REFERENCES `ga` (`MA_GA`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `chuyen_tau`
--
ALTER TABLE `chuyen_tau`
  ADD CONSTRAINT `chuyen_tau_ibfk_1` FOREIGN KEY (`MAC_TAU`) REFERENCES `mac_tau` (`MAC_TAU`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `chuyen_tau_ibfk_2` FOREIGN KEY (`MA_TAU`) REFERENCES `tau` (`MA_TAU`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `ga`
--
ALTER TABLE `ga`
  ADD CONSTRAINT `ga_ibfk_1` FOREIGN KEY (`MA_KV`) REFERENCES `khu_vuc` (`Ma_KV`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `ga_dung`
--
ALTER TABLE `ga_dung`
  ADD CONSTRAINT `ga_dung_ibfk_1` FOREIGN KEY (`MAC_TAU`) REFERENCES `mac_tau` (`MAC_TAU`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ga_dung_ibfk_2` FOREIGN KEY (`MA_GA`) REFERENCES `ga` (`MA_GA`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `gia_toa`
--
ALTER TABLE `gia_toa`
  ADD CONSTRAINT `gia_toa_ibfk_1` FOREIGN KEY (`MA_LOAI_TOA`) REFERENCES `loai_toa_ngoi` (`MA_LOAI_TOA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `gia_toa_ibfk_2` FOREIGN KEY (`MA_GIA`) REFERENCES `bang_gia` (`MA_GIA`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `hop_dong`
--
ALTER TABLE `hop_dong`
  ADD CONSTRAINT `hop_dong_ibfk_1` FOREIGN KEY (`MA_KH`) REFERENCES `khach_hang` (`MA_KH`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `hop_dong_ibfk_2` FOREIGN KEY (`MA_NV`) REFERENCES `nhan_vien` (`MA_NV`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `hop_dong_ibfk_3` FOREIGN KEY (`MA_TT`) REFERENCES `muc_giam_tap_the` (`MA_TT`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `keo_theo`
--
ALTER TABLE `keo_theo`
  ADD CONSTRAINT `keo_theo_ibfk_1` FOREIGN KEY (`MA_TOA`) REFERENCES `toa` (`MA_TOA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `keo_theo_ibfk_2` FOREIGN KEY (`MA_CHUYEN_TAU`) REFERENCES `chuyen_tau` (`MA_CHUYEN_TAU`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `phieu_thu`
--
ALTER TABLE `phieu_thu`
  ADD CONSTRAINT `phieu_thu_ibfk_1` FOREIGN KEY (`MA_KH`) REFERENCES `khach_hang` (`MA_KH`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `phieu_thu_ibfk_2` FOREIGN KEY (`MA_NV`) REFERENCES `nhan_vien` (`MA_NV`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `phieu_thu_ibfk_3` FOREIGN KEY (`MA_VE`) REFERENCES `ve` (`MA_VE`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `toa`
--
ALTER TABLE `toa`
  ADD CONSTRAINT `toa_ibfk_1` FOREIGN KEY (`MA_LOAI_TOA`) REFERENCES `loai_toa_ngoi` (`MA_LOAI_TOA`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `ve`
--
ALTER TABLE `ve`
  ADD CONSTRAINT `ve_ibfk_1` FOREIGN KEY (`MA_CHUYEN_TAU`) REFERENCES `chuyen_tau` (`MA_CHUYEN_TAU`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_2` FOREIGN KEY (`LOAI_VE`) REFERENCES `loai_ve` (`MA_LOAI_VE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_3` FOREIGN KEY (`TRANG_THAI`) REFERENCES `trang_thai_ve` (`MA_TRANG_THAI`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_4` FOREIGN KEY (`MA_GHE`) REFERENCES `vi_tri_ngoi` (`MA_GHE_NGOI`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_5` FOREIGN KEY (`MA_TOA`) REFERENCES `toa` (`MA_TOA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_6` FOREIGN KEY (`SO_HD`) REFERENCES `hop_dong` (`SO_HD`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_8` FOREIGN KEY (`MA_GIA`) REFERENCES `bang_gia` (`MA_GIA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ve_ibfk_9` FOREIGN KEY (`MA_NV`) REFERENCES `nhan_vien` (`MA_NV`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `vi_tri_ngoi`
--
ALTER TABLE `vi_tri_ngoi`
  ADD CONSTRAINT `vi_tri_ngoi_ibfk_1` FOREIGN KEY (`MA_TOA`) REFERENCES `toa` (`MA_TOA`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
