ALTER TABLE GIOHANG ADD UNIQUE `unique_index`(`SANPHAM`, `MAKH`);
ALTER TABLE CTDDH ADD UNIQUE (`MADDH`, `SANPHAM`);
ALTER TABLE CTPN ADD UNIQUE (`MAPN`, `SANPHAM`);
ALTER TABLE CTPX ADD UNIQUE (`MAPX`, `SANPHAM`);
ALTER TABLE NHAN_SANPHAM ADD UNIQUE (`NHAN_ID`, `SANPHAM_ID`);
ALTER TABLE TUKHOA_NHAN ADD UNIQUE (`NHAN_ID`, `TUKHOA_ID`);

