
-- task 1--
create database case_study;
use case_study;
create table loai_khach(
id_loai_khach int auto_increment not null primary key,
ten_loai_khach varchar(45) 
);

create table vi_tri (
id_vi_tri int auto_increment not null primary key,
ten_vi_tri varchar(45)
);

create table nhan_vien(
id_nhan_vien int auto_increment not null primary key,
ho_ten varchar(45),
id_vi_tri int,
foreign key (id_vi_tri) references vi_tri(id_vi_tri),
id_trinh_do int,
foreign key (id_trinh_do) references trinh_do(id_trinh_do),
id_bo_phan int,
foreign key (id_bo_phan) references bo_phan(id_bo_phan),
ngay_sinh date,
so_cmnd varchar(45),
luong varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45)
);


create table bo_phan (
id_bo_phan int auto_increment not null primary key,
ten_bo_phan varchar(45)
);

create table trinh_do (
id_trinh_do int auto_increment not null primary key,
trinh_do varchar(45)
);

create table khach_hang (
id_khach_hang int auto_increment not null primary key,
id_loai_khach int,
foreign key (id_loai_khach) references loai_khach(id_loai_khach),
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45)
);

create table dich_vu (
id_dich_vu int auto_increment not null primary key,
ten_dich_vu varchar(45),
dien_tich int,
so_tang int,
so_nguoi_toi_da int,
chi_phi_thue int,
id_kieu_thue int,
foreign key (id_kieu_thue) references kieu_thue(id_kieu_thue),
id_loai_dich_vu int,
foreign key (id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu),
trang_thai varchar(45)
);

create table kieu_thue (
id_kieu_thue int auto_increment not null primary key,
ten_kieu_thue varchar(45),
gia int
);

create table dich_vu_di_kem (
id_dich_vu_di_kem int auto_increment not null primary key,
ten_dich_vu varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table loai_dich_vu (
id_loai_dich_vu int auto_increment not null primary key,
ten_loai_dich_vu varchar(45)
);

create table hop_dong (
id_hop_dong int auto_increment not null primary key,
id_nhan_vien int,
foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien),
id_khach_hang int,
foreign key (id_khach_hang) references khach_hang(id_khach_hang),
id_dich_vu int,
foreign key (id_dich_vu) references dich_vu(id_dich_vu),
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int,
tong_tien int
);

create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int auto_increment not null primary key,
id_hop_dong int,
foreign key (id_hop_dong) references hop_dong(id_hop_dong),
id_dich_vu_di_kem int,
foreign key (id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);
alter table hop_dong_chi_tiet
add so_luong int;

insert into bo_phan (ten_bo_phan)
values('Le tan'),( 'Sale'),( 'Quan ly'),('Phuc vu');

insert into dich_vu_di_kem (ten_dich_vu,gia,don_vi,trang_thai_kha_dung)
values( 'Thue xe',50,1, 'con xe'),
('Massage',10,3, ''), ('Thuc an',5,2, ''),( 'Do uong',5,1, ''),('Karaoke',10,1, '');

insert into trinh_do (trinh_do)
values('Cao Hoc'),('Dai hoc'), ('Cao dang'), ('Trung cap');

insert into vi_tri (ten_vi_tri)
values('Giam Doc'), ('Quan ly'),('Nhan vien'),('Hoc viec');

insert into loai_khach (ten_loai_khach)
values ('Diamond'),('Platium'),('Gold'),('Sliver'),('Member');

insert into loai_dich_vu(ten_loai_dich_vu)
values('Villa'),('House'),('Room');

insert into kieu_thue (ten_kieu_thue, gia)
values('Year',100000),('Month',10000),('Day',3000),('Hour',200);

insert into khach_hang (id_loai_khach,ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
values(1,'Tran Van Trung',12/12/1997,'12345678','098635353535','vantrung@gmail.com','Da Nang'),
(2,'Ho Van Huynh',08/03/1987,'12345578','098335353535','vanhuynh@gmail.com','Hue'),
(3,'Truong Van Hau',11/10/1995,'122345678','098635322835','vanhau@gmail.com','Quang Nam'),
(4,'Nguyen Huu Hien',24/06/1998,'12343348','09863828282','huuhien@gmail.com','Quang Nam'),
(5,'Nguyen Hong Son',12/12/1997,'123467467','098635351234','hongson@gmail.com','Quang Tri');

insert into dich_vu (ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
values('Dam cuoi',200,2,1000,20000,3,1,'con cho'),
('Nghi Mat',50,1,5,10000,2,2,'con cho');

insert into nhan_vien ( ho_ten,id_vi_tri,id_trinh_do,id_bo_phan, ngay_sinh,so_cmnd, luong, sdt,email,dia_chi)
values('Tran Quang',3,2,2,'1999/12/12','12345678', 300, '1234567','tranquang@gmail.com','Ha Tinh');

update `case_study`.`khach_hang` 
set ngay_sinh ='1997-12-05'
where id_khach_hang = 1;
update `case_study`.`khach_hang` 
set ngay_sinh = '1989-03-11'
where id_khach_hang = 2;
update `case_study`.`khach_hang` 
set ngay_sinh = '2000-05-18'
where id_khach_hang = 3;
update `case_study`.`khach_hang` 
set ngay_sinh = '1999-03-22'
where id_khach_hang = 4;
update `case_study`.`khach_hang` 
set ngay_sinh = '2003-11-19'
where id_khach_hang = 5;

insert into khach_hang (id_loai_khach,ho_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
values(1,'Tran Van Trung',12/12/1997,'12345678','098635353535','vantrung@gmail.com','Da Nang'),
(2,'Ho Van Huynh',08/03/1987,'12345578','098335353535','vanhuynh@gmail.com','Hue'),
(3,'Truong Van Hau',11/10/1995,'122345678','098635322835','vanhau@gmail.com','Quang Nam'),
(4,'Nguyen Huu Hien',24/06/1998,'12343348','09863828282','huuhien@gmail.com','Quang Nam'),
(5,'Nguyen Hong Son',12/12/1997,'123467467','098635351234','hongson@gmail.com','Quang Tri');

insert into `case_study`.`nhan_vien` 
values (2,'Tu Dang',2,2,2,'1997/05/13','0837334', 200, '1234567','tudang@gmail.com','Ha Noi');
insert into `case_study`.`nhan_vien` 
values (3,'Anh Tuan',1,2,2,'1996/12/22','0234678', 100, '1234567','anhtuan@gmail.com','Thanh Hoa');
insert into `case_study`.`nhan_vien` 
values (4,'Huy Hoang',2,2,3,'1995/05/20','235544', 300, '1234567','huyhoang@gmail.com','Quang Nam');
insert into `case_study`.`nhan_vien` 
values (5,'Huu Kien',2,1,2,'1997/05/13','8373046', 300, '1234567','kien234@gmail.com','Da Nang');
insert into `case_study`.`nhan_vien` 
values (6,'Thanh Loan',3,2,2,'1999/06/02','369373', 200, '1234567','loan123@gmail.com','Lao Cai');

insert into `case_study`.`hop_dong`(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
values(1,1,1,'2019/12/15','2020/01/15',1000,2000),
(2,2,2,'2019/12/20','2020/01/20',2000,3000);
insert into hop_dong
values(5,3,3,2,'2018/11/15','2020/01/15',1000,2000);
insert into hop_dong
values(6,3,3,2,'2018/02/15','2018/12/15',1000,2000);
insert into hop_dong
values(7,3,3,2,'2018/09/15','2018/12/15',1000,2000);


insert into `case_study`.`hop_dong_chi_tiet`(id_hop_dong,id_dich_vu_di_kem)
values (1,1),(2,2);
update hop_dong_chi_tiet 
set so_luong = 1
where id_hop_dong_chi_tiet = 1;
update hop_dong_chi_tiet 
set so_luong = 1
where id_hop_dong_chi_tiet = 2;










