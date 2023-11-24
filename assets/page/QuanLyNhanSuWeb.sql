create database QuanLyNhanSuWedTN;

use QuanLyNhanSuWedTN

create table tb_PhongBan(
	IdPB int identity(1,1) primary key,
	TenPhongBan nvarchar(100) not null
);

create table tb_ChucVu(
	IdCV int identity(1,1) primary key,
	TenChucVu nvarchar(100) not null
);


create table tb_ThongTinNhanVien(
	IdNV int identity(1,1) primary key,
	HoKhaiSinh nvarchar(250) not null,
	HoThuongDung nvarchar(250) not null,
	TenKhaiSinh nvarchar(250) not null,
	TenThuongDung nvarchar(250) not null,
	BiDanh nvarchar(150) not null,
	CMND nvarchar(100),
	NgayCapCMND date,
	NoiCapCMND date,
	TheCanCuoc nvarchar(100) not null,
	NgayCapTheCanCuoc date not null,
	SoHoChieu nvarchar(100),
	NgayCapHoChieu date,
	GioiTinh nvarchar(10) not null,
	NgaySinh date not null,
	HinhAnh nvarchar(500) not null,
	QuocTich nvarchar(100) not null,
	DanToc nvarchar(100) not null,
	TonGiao nvarchar(100),
	ThanhPhanGiaDinh nvarchar(100) not null,
	ChieuCao int not null,
	NhanDang nvarchar(100),
	TenChucDanh nvarchar(100),
	MoTaCongViec nvarchar(250),
	BacLuong float,
	NgayNghiViec date,
	LyDoNghiViec nvarchar(250),
	QueQuanPhuongXa nvarchar(150),
	QueQuanQuanHuyen nvarchar(150),
	QueQuanThanhPho nvarchar(150),
	DienThoaiNha varchar(20),
	DTDD varchar(20) not null,
	Email varchar(50) not null,
	DiaChiThuongTru nvarchar(250) not null,
	PhuongXaThuongTru nvarchar(250) not null,
	QuanHuyenThuongTru nvarchar(250) not null,
	ThanhPhoThuongTru nvarchar(100) not null,
	DiaChiTamTru nvarchar(250) not null,
	PhuongXaTamTru nvarchar(250) not null,
	QuanHuyenTamTru nvarchar(250) not null,
	ThanhPhoTamTru nvarchar(100) not null,
	IdPB int,
	IdCV int,
	FOREIGN KEY (IdPB) REFERENCES tb_PhongBan(IdPB),
	FOREIGN KEY (IdCV) REFERENCES tb_ChucVu(IdCV)
);

create table tb_QuaTrinhDaoTao(
	Id int identity(1,1) primary key,
	TuNam date not null,
	DenNam date,
	CheDoHoc nvarchar(100) not null,
	LoaiDaoTao nvarchar(100) not null,
	TruongDaoTao nvarchar(100) not null,
	NganhDaoTao nvarchar(100),
	BangCap nvarchar(100),
	NoiDung nvarchar(500),
	KetQua nvarchar(50),
	ThoiGian date,
	ChuyenMon nvarchar(100),
	SoBang varchar(100),
	NgayCap date,
	QuocGia date,
	IdNV int,
	FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV)
);

drop table tb_ThongNgoaiNgu

create table tb_ThongTinNgoaiNgu(
	Id int identity(1,1) primary key,
	NgoaiNgu nvarchar(100),
	BangCap nvarchar(100),
	KetQua nvarchar(100),
	NgayCap date,
	KinhPhi money,
	ChinhPhu bit,
	NguonKinhPhi nvarchar(100),
	GhiChu nvarchar(250),
	IdNV int,
	FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV)
);

Create table tb_ThongTinViTinh(
Id int identity(1,1) primary key,
BangCap nvarchar(100),
SoBang nvarchar(100),
NoiDung nvarchar(250),
CheDoHoc nvarchar(100),
NgayCap date,
TuNgay date,
Denngay date,
KinhPhi money,
NguonKinhPhi nvarchar(150),
IdNV int,
FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV)
);

Create table tb_ThongTinChinhTri(
Id int identity(1,1) primary key,
TrinhDoChinhTri nvarchar(100),
CheDoHoc nvarchar(100),
TuNgay date,
DenNgay date,
KinhPhi money,
NguonKinhPhi nvarchar(100),
NgayCap date,
IdNv int,
FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV)
);

Create table tb_ThongTinDoanDang(
	IdNV int UNIQUE NOT NULL FOREIGN KEY(IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	SoTheDang int,
	NgayCapThe date,
	DaVaoDang bit,
	NgayVaoDang1 date,
	NgayChinhThuc1 date,
	NgayVaoDang2 date,
	NgayChinhThuc2 date,
	NguoiThuNhat nvarchar(100),
	ChucVu1 nvarchar(100),
	DiaChi1 nvarchar(250),
	NguoiThuHai nvarchar(100),
	ChucVu2 nvarchar(100),
	DiaChi2 nvarchar(250),
	NgayVaoDoan date,
	DaVaoDoan bit,
	NgayNhapNgu date DEFAULT null,
	NgayXuatNgu date DEFAULT null,
	QuanHamChucVuCaoNhat nvarchar(100),
	DanhHieuDuocPhong nvarchar(100),
	SoTruong nvarchar(100),
);

Create table tb_DiNuocNgoai(
	Id int identity(1,1) primary key,
	NgayDi date,
	NgayVe date,
	ThoiGian nvarchar(100),
	QuocGiaDen nvarchar(100),
	MucDich nvarchar(100),
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV)
);

drop table tb_QuaTrinhDaoTaoCu

select * from tb_QuaTrinhDaoTao

Create table tb_QuaTrinhDaoTaoCuMoi(
	Id int identity(1,1) primary key,
	KhoaHoc nvarchar(100),
	Truong_DonVi nvarchar(100),
	HoanTat bit,
	NgayBatDau date,
	NgayKetThuc date,
	SoQuyetDinh nvarchar(100),
	HinhThuc nvarchar(100),
	TenBang nvarchar(100),
	SoBang int,
	DangBang nvarchar(100),
	NgayCap date,
	HetHan date,
	LoaiDaoTao nvarchar(50),
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV)
);

create table tb_KhenThuong_KyLuat(
	Id int identity(1,1) primary key,
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	HinhThuc nvarchar(150),
	TuNgay date,
	DenNgay date,
	LyDo nvarchar(250),
	CapQuyetDinh nvarchar(150),
	SoQuyetDinh varchar(100),
	NguoiKy nvarchar(150),
	GhiChu nvarchar(250),
	DinhKem nvarchar(500),
	Loai bit
);

select * from tb_ThongTinGiaDinh

create table tb_HoSo(
	Id int identity(1,1) primary key,
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	TenHoSo nvarchar(150),
	TapTin nvarchar(500),
	LoaiHoSo bit
);

Create table tb_ThongTinGiaDinh(
	Id int identity(1,1) primary key,
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	HoTen nvarchar(250),
	QuanHe nvarchar(250),
	NgaySinh date,
	DiaChi nvarchar(250),
	Phuong nvarchar(100),
	QuanHuyen nvarchar(100),
	TinhThanh nvarchar(100),
	ConSong bit
);

Create table tb_QuaTrinhLamViecCuaThanNhan(
	Id int identity(1,1) primary key,
	IdThanNhan int FOREIGN KEY(IdThanNhan) REFERENCES tb_ThongTinGiaDinh(Id),
	TuNam date,
	DenNam date,
	CongViec nvarchar(150),
	DonVi nvarchar(150),
	CapBac nvarchar(100),
	ChucVu nvarchar(100),
	LoaiChucVu nvarchar(100),
	TrongNganh bit
);

create table tb_LichSuBanThanNhanVien(
	Id int identity(1,1) primary key,
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	TuNgay date,
	DenNgay date,
	LamGi nvarchar(250),
	ODau nvarchar(250)
);

select * from tb_ThongTinHopDongLaoDong

create table tb_ThongTinHopDongLaoDong(
	Id int identity(1,1) primary key,
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	SoHDLD varchar(50) unique,
	LoaiHopDong nvarchar(100),
	ThoiHan nvarchar(50),
	ChucDanh nvarchar(100),
	BacLuong float,
	HeSoLuong float,
	NgayKy date,
	NguoiKy nvarchar(100),
	NgayThuViec date,
	NgayChinhThuc date,
	NgayHetHan date,
	NgayGiaHan date,
	FileQuyetDinh nvarchar(500),
	FileHDLD nvarchar(500)
);

select * from tb_QuaTrinhCongTac

create table tb_QuaTrinhCongTac(
	Id int identity(1,1) primary key,
	IdNV int FOREIGN KEY (IdNV) REFERENCES tb_ThongTinNhanVien(IdNV),
	TuNgay date,
	DenNgay date,
	TenCongTy nvarchar(100),
	TenPhongBan nvarchar(100),
	TenDoi nvarchar(100),
	ChucDanh nvarchar(100),
	LyDo nvarchar(250),
	DangHoatDong bit,
	SoHDLD nvarchar(100),
	LoaiHDLD nvarchar(100),
	NgayQuyetDinh date,
	NgayHieuLuc date,
	SoQD nvarchar(100) unique,
	NguoiKy nvarchar(100),
	FileQuyetDinh nvarchar(500),
	Loai bit
);