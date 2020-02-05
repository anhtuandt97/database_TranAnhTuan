-- task 2 --
select * from `case_study`.`nhan_vien` 
where (ho_ten like 'h%' or ho_ten like 'k%' or ho_ten like 't%') and length(ho_ten)<15;

-- task 3 --
select * from case_study.khach_hang where dia_chi in ('Da Nang' , 'Quang Tri') 
and (curdate()-ngay_sinh>(18*30*365) 
and curdate()-ngay_sinh<(50*30*365));

-- task 4 --
select khach_hang.ho_ten, count(hop_dong.id_hop_dong) as so_lan_dat_phong from khach_hang 
inner join hop_dong on khach_hang.id_khach_hang= hop_dong.id_khach_hang
inner join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
where loai_khach.ten_loai_khach= 'Diamond'
group by khach_hang.id_khach_hang order by so_lan_dat_phong;

-- task 5 --
select khach_hang.id_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach,
hop_dong.id_hop_dong, dich_vu.ten_dich_vu, hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, 
sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as tong_tien from khach_hang
left join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
group by hop_dong.id_hop_dong;

-- task 6 --
select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, 
dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu from dich_vu
inner join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
where not exists (select hop_dong.id_hop_dong from hop_dong 
where (hop_dong.ngay_lam_hop_dong between '2019/01/01' and '2019/03/31')
and hop_dong.id_dich_vu = dich_vu.id_dich_vu);

-- task 7 --
select dich_vu.id_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
inner join loai_dich_vu on dich_vu.id_loai_dich_vu = loai_dich_vu.id_loai_dich_vu
where exists(select hop_dong.id_hop_dong from hop_dong where year (hop_dong.ngay_lam_hop_dong)= '2018'
and hop_dong.id_dich_vu = dich_vu.id_dich_vu)
and not exists(select hop_dong.id_hop_dong from hop_dong where year (hop_dong.ngay_lam_hop_dong)= '2019'
and hop_dong.id_dich_vu = dich_vu.id_dich_vu);

-- task 8 --
-- cach 1 --
select khach_hang.ho_ten from khach_hang group by khach_hang.ho_ten;
-- cach 2 --
select distinct khach_hang.ho_ten from khach_hang; 
-- cach 3 --
select khach_hang.ho_ten from khach_hang union select khach_hang.ho_ten from khach_hang ;


-- task 9 --
select temp.month, count(month (hop_dong.ngay_lam_hop_dong)) as so_khach_hang_dang_ky, 
sum(hop_dong.tong_tien) as tong_tien from 
(select 1 as month
union select 2 as month
union select 3 as month
union select 4 as month
union select 5 as month
union select 6 as month
union select 7 as month
union select 8 as month
union select 9 as month
union select 10 as month
union select 11 as month
union select 12 as month) as temp 
left join hop_dong on month (hop_dong.ngay_lam_hop_dong) = temp.month
left join khach_hang on khach_hang.id_khach_hang = hop_dong.id_khach_hang
where year (hop_dong.ngay_lam_hop_dong) = '2019' or year(hop_dong.ngay_lam_hop_dong) is null 
or month(hop_dong.ngay_lam_hop_dong) is null
group by temp.month
order by temp.month;

-- task 10 --




