USE martgodb;
INSERT INTO warehouse (warehouse_id, warehouse_name, location, height, width, FAR)
VALUES (1, '서울창고', '서울특별시 강동구', 50, 100, 0.00),
       (2, '부산창고', '부산광역시 사하구', 60, 120, 0.00);
-- 섹터 테이블 (sector) 더미 데이터 (각 창고에 4개의 섹터 배정)
INSERT INTO sector (sector_id, warehouse_id, height, width, FAR, status)
VALUES
-- 창고 1 (서울창고 - 높이 50m, 너비 100m, 총 부피 5000m²)
('1A', 1, 20, 50, 0.00, '사용가능'),  -- 1000m²
('1B', 1, 10, 100, 0.00, '사용가능'), -- 1000m²
('1C', 1, 10, 100, 0.00, '사용가능'), -- 1000m²
('1D', 1, 10, 100, 0.00, '사용가능'), -- 2000m²

-- 창고 2 (부산창고 - 높이 60m, 너비 120m, 총 부피 7200m²)
('2A', 2, 30, 80, 0.00, '사용가능'),  -- 2400m²
('2B', 2, 15, 120, 0.00, '사용가능'), -- 1800m²
('2C', 2, 10, 120, 0.00, '사용가능'), -- 1200m²
('2D', 2, 5, 120, 0.00, '사용가능'); -- 1800m²

-- 비용 정보 테이블 (cost_info) 더미 데이터
INSERT INTO cost_info (warehouse_id, sector_id, period, price) VALUES
-- 창고 1 - 섹터 1A
(1, '1A', '1개월', 300000), (1, '1A', '3개월', 850000), (1, '1A', '6개월', 1600000), (1, '1A', '12개월', 3000000),
-- 창고 1 - 섹터 1B
(1, '1B', '1개월', 320000), (1, '1B', '3개월', 900000), (1, '1B', '6개월', 1700000), (1, '1B', '12개월', 3200000),
-- 창고 1 - 섹터 1C
(1, '1C', '1개월', 340000), (1, '1C', '3개월', 950000), (1, '1C', '6개월', 1800000), (1, '1C', '12개월', 3400000),
-- 창고 1 - 섹터 1D
(1, '1D', '1개월', 360000), (1, '1D', '3개월', 1000000), (1, '1D', '6개월', 1900000), (1, '1D', '12개월', 3600000),

-- 창고 2 - 섹터 2A
(2, '2A', '1개월', 400000), (2, '2A', '3개월', 1100000), (2, '2A', '6개월', 2100000), (2, '2A', '12개월', 4000000),
-- 창고 2 - 섹터 2B
(2, '2B', '1개월', 380000), (2, '2B', '3개월', 1050000), (2, '2B', '6개월', 2000000), (2, '2B', '12개월', 3800000),
-- 창고 2 - 섹터 2C
(2, '2C', '1개월', 360000), (2, '2C', '3개월', 1000000), (2, '2C', '6개월', 1900000), (2, '2C', '12개월', 3600000),
-- 창고 2 - 섹터 2D
(2, '2D', '1개월', 340000), (2, '2D', '3개월', 950000), (2, '2D', '6개월', 1800000), (2, '2D', '12개월', 3400000);

-- 총관리자 (창고당 1명)
INSERT INTO admin (admin_id, admin_name, admin_pw, phone_num, email, role, warehouse_id)
VALUES ('admin01', '김총관리', 'adminpass1', '010-1111-0001', 'admin01@test.com', '총관리자', 1),
       ('admin02', '박총관리', 'adminpass2', '010-2222-0002', 'admin02@test.com', '총관리자', 2);

-- 창고관리자 (섹터별 1명)
INSERT INTO admin (admin_id, admin_name, admin_pw, phone_num, email, role, warehouse_id) VALUES
-- 창고 1 - 섹터 1A~1D
('admin03', '이창고관리', 'adminpass3', '010-3333-0003', 'admin03@test.com', '창고관리자', 1),
('admin04', '정창고관리', 'adminpass4', '010-4444-0004', 'admin04@test.com', '창고관리자', 1),
('admin05', '최창고관리', 'adminpass5', '010-5555-0005', 'admin05@test.com', '창고관리자', 1),
('admin06', '한창고관리', 'adminpass6', '010-6666-0006', 'admin06@test.com', '창고관리자', 1),

-- 창고 2 - 섹터 2A~2D
('admin07', '서창고관리', 'adminpass7', '010-7777-0007', 'admin07@test.com', '창고관리자', 2),
('admin08', '조창고관리', 'adminpass8', '010-8888-0008', 'admin08@test.com', '창고관리자', 2),
('admin09', '류창고관리', 'adminpass9', '010-9999-0009', 'admin09@test.com', '창고관리자', 2),
('admin10', '홍창고관리', 'adminpass10', '010-1010-0010', 'admin10@test.com', '창고관리자', 2);

-- 일반 회원 (10명 중 5명은 admin_id NULL, 5명은 창고관리자 지정)
INSERT INTO user (user_id, user_name, user_pw, phone, email, address, role, admin_id)
VALUES ('user01', '김철수', 'pass1234', '010-1111-0001', 'user01@test.com', '서울시 강남구', '회원', NULL),
       ('user02', '이영희', 'pass1234', '010-2222-0002', 'user02@test.com', '서울시 서초구', '회원', NULL),
       ('user03', '박상민', 'pass1234', '010-3333-0003', 'user03@test.com', '서울시 송파구', '회원', NULL),
       ('user04', '최진호', 'pass1234', '010-4444-0004', 'user04@test.com', '부산시 해운대구', '회원', NULL),
       ('user05', '한수진', 'pass1234', '010-5555-0005', 'user05@test.com', '대구시 수성구', '회원', NULL),
       ('user06', '이도현', 'pass1234', '010-6666-0006', 'user06@test.com', '광주시 남구', '회원', 'admin03'),  -- 창고관리자 지정
       ('user07', '조윤재', 'pass1234', '010-7777-0007', 'user07@test.com', '대전시 서구', '회원', 'admin04'),  -- 창고관리자 지정
       ('user08', '서지훈', 'pass1234', '010-8888-0008', 'user08@test.com', '수원시 장안구', '회원', 'admin05'), -- 창고관리자 지정
       ('user09', '정수빈', 'pass1234', '010-9999-0009', 'user09@test.com', '전주시 덕진구', '회원', 'admin06'), -- 창고관리자 지정
       ('user10', '류하진', 'pass1234', '010-1010-0010', 'user10@test.com', '울산시 남구', '회원', 'admin07');
-- 창고관리자 지정

-- 거래처 회원 (10명, admin_id 창고관리자 중 랜덤 배정)
INSERT INTO user (user_id, user_name, user_pw, phone, email, address, role, admin_id)
VALUES ('seller01', '강민수', 'pass1234', '010-1111-1111', 'seller01@test.com', '서울시 강동구', '거래처', 'admin03'),
       ('seller02', '배지훈', 'pass1234', '010-2222-2222', 'seller02@test.com', '서울시 중랑구', '거래처', 'admin04'),
       ('seller03', '오경태', 'pass1234', '010-3333-3333', 'seller03@test.com', '부산시 사하구', '거래처', 'admin05'),
       ('seller04', '최성호', 'pass1234', '010-4444-4444', 'seller04@test.com', '대구시 동구', '거래처', 'admin06'),
       ('seller05', '윤지환', 'pass1234', '010-5555-5555', 'seller05@test.com', '광주시 서구', '거래처', 'admin07'),
       ('seller06', '홍예린', 'pass1234', '010-6666-6666', 'seller06@test.com', '대전시 중구', '거래처', 'admin08'),
       ('seller07', '이해솔', 'pass1234', '010-7777-7777', 'seller07@test.com', '인천시 남동구', '거래처', 'admin09'),
       ('seller08', '남지훈', 'pass1234', '010-8888-8888', 'seller08@test.com', '수원시 영통구', '거래처', 'admin10'),
       ('seller09', '송지호', 'pass1234', '010-9999-9999', 'seller09@test.com', '전주시 완산구', '거래처', 'admin03'),
       ('seller10', '문유진', 'pass1234', '010-1010-1010', 'seller10@test.com', '울산시 북구', '거래처', 'admin04');

-- 일반 회원 (추가 10명 중 5명은 admin_id NULL, 5명은 창고관리자 지정)
INSERT INTO user (user_id, user_name, user_pw, phone, email, address, role, admin_id)
VALUES ('user11', '김도윤', 'pass1234', '010-1111-0011', 'user11@test.com', '서울시 성동구', '회원', NULL),
       ('user12', '이하준', 'pass1234', '010-2222-0012', 'user12@test.com', '서울시 동작구', '회원', NULL),
       ('user13', '박지훈', 'pass1234', '010-3333-0013', 'user13@test.com', '서울시 강서구', '회원', NULL),
       ('user14', '최유진', 'pass1234', '010-4444-0014', 'user14@test.com', '부산시 금정구', '회원', NULL),
       ('user15', '한지호', 'pass1234', '010-5555-0015', 'user15@test.com', '대구시 남구', '회원', NULL),
       ('user16', '이태경', 'pass1234', '010-6666-0016', 'user16@test.com', '광주시 북구', '회원', 'admin03'),  -- 창고관리자 지정
       ('user17', '조민혁', 'pass1234', '010-7777-0017', 'user17@test.com', '대전시 동구', '회원', 'admin04'),  -- 창고관리자 지정
       ('user18', '서진우', 'pass1234', '010-8888-0018', 'user18@test.com', '수원시 팔달구', '회원', 'admin05'), -- 창고관리자 지정
       ('user19', '정서연', 'pass1234', '010-9999-0019', 'user19@test.com', '전주시 완산구', '회원', 'admin06'), -- 창고관리자 지정
       ('user20', '류지안', 'pass1234', '010-1010-0020', 'user20@test.com', '울산시 중구', '회원', 'admin07');
-- 창고관리자 지정

-- 거래처 회원 (추가 10명, admin_id 창고관리자 중 랜덤 배정)
INSERT INTO user (user_id, user_name, user_pw, phone, email, address, role, admin_id)
VALUES ('seller11', '강지훈', 'pass1234', '010-1111-1112', 'seller11@test.com', '서울시 강북구', '거래처', 'admin03'),
       ('seller12', '배성현', 'pass1234', '010-2222-2223', 'seller12@test.com', '서울시 용산구', '거래처', 'admin04'),
       ('seller13', '오유진', 'pass1234', '010-3333-3334', 'seller13@test.com', '부산시 연제구', '거래처', 'admin05'),
       ('seller14', '최도윤', 'pass1234', '010-4444-4445', 'seller14@test.com', '대구시 서구', '거래처', 'admin06'),
       ('seller15', '윤민호', 'pass1234', '010-5555-5556', 'seller15@test.com', '광주시 광산구', '거래처', 'admin07'),
       ('seller16', '홍수빈', 'pass1234', '010-6666-6667', 'seller16@test.com', '대전시 서구', '거래처', 'admin08'),
       ('seller17', '이하린', 'pass1234', '010-7777-7778', 'seller17@test.com', '인천시 미추홀구', '거래처', 'admin09'),
       ('seller18', '남도경', 'pass1234', '010-8888-8889', 'seller18@test.com', '수원시 권선구', '거래처', 'admin10'),
       ('seller19', '송하은', 'pass1234', '010-9999-9990', 'seller19@test.com', '전주시 덕진구', '거래처', 'admin03'),
       ('seller20', '문세진', 'pass1234', '010-1010-1011', 'seller20@test.com', '울산시 동구', '거래처', 'admin04');

-- 일반 회원 (추가 10명 중 5명은 admin_id NULL, 5명은 창고관리자 지정)
INSERT INTO user (user_id, user_name, user_pw, phone, email, address, role, admin_id)
VALUES ('user21', '권도현', 'pass1234', '010-1111-0021', 'user21@test.com', '서울시 강북구', '회원', NULL),
       ('user22', '박선우', 'pass1234', '010-2222-0022', 'user22@test.com', '서울시 중랑구', '회원', NULL),
       ('user23', '정태훈', 'pass1234', '010-3333-0023', 'user23@test.com', '부산시 북구', '회원', NULL),
       ('user24', '이수빈', 'pass1234', '010-4444-0024', 'user24@test.com', '대구시 수성구', '회원', NULL),
       ('user25', '조하은', 'pass1234', '010-5555-0025', 'user25@test.com', '광주시 서구', '회원', NULL),
       ('user26', '김태경', 'pass1234', '010-6666-0026', 'user26@test.com', '대전시 유성구', '회원', 'admin05'), -- 창고관리자 지정
       ('user27', '윤다온', 'pass1234', '010-7777-0027', 'user27@test.com', '울산시 남구', '회원', 'admin06'),  -- 창고관리자 지정
       ('user28', '배지훈', 'pass1234', '010-8888-0028', 'user28@test.com', '수원시 장안구', '회원', 'admin07'), -- 창고관리자 지정
       ('user29', '서주안', 'pass1234', '010-9999-0029', 'user29@test.com', '전주시 덕진구', '회원', 'admin08'), -- 창고관리자 지정
       ('user30', '오세진', 'pass1234', '010-1010-0030', 'user30@test.com', '인천시 계양구', '회원', 'admin09');
-- 창고관리자 지정

-- 거래처 회원 (추가 10명, admin_id 창고관리자 중 랜덤 배정)
INSERT INTO user (user_id, user_name, user_pw, phone, email, address, role, admin_id)
VALUES ('seller21', '이강민', 'pass1234', '010-1111-2221', 'seller21@test.com', '서울시 송파구', '거래처', 'admin05'),
       ('seller22', '조서연', 'pass1234', '010-2222-2222', 'seller22@test.com', '서울시 광진구', '거래처', 'admin06'),
       ('seller23', '한도윤', 'pass1234', '010-3333-2223', 'seller23@test.com', '부산시 남구', '거래처', 'admin07'),
       ('seller24', '배하린', 'pass1234', '010-4444-2224', 'seller24@test.com', '대구시 중구', '거래처', 'admin08'),
       ('seller25', '윤지훈', 'pass1234', '010-5555-2225', 'seller25@test.com', '광주시 동구', '거래처', 'admin09'),
       ('seller26', '김하은', 'pass1234', '010-6666-2226', 'seller26@test.com', '대전시 대덕구', '거래처', 'admin10'),
       ('seller27', '서민혁', 'pass1234', '010-7777-2227', 'seller27@test.com', '인천시 서구', '거래처', 'admin03'),
       ('seller28', '박태윤', 'pass1234', '010-8888-2228', 'seller28@test.com', '수원시 영통구', '거래처', 'admin04'),
       ('seller29', '정세진', 'pass1234', '010-9999-2229', 'seller29@test.com', '전주시 완산구', '거래처', 'admin05'),
       ('seller30', '최수빈', 'pass1234', '010-1010-2230', 'seller30@test.com', '울산시 북구', '거래처', 'admin06');

SELECT * FROM user;


INSERT INTO rent_history (sector_id, warehouse_id, user_id, rent_start_date, rent_end_date, rent_price, status,
                          admin_id)
VALUES ('1C', 1, 'user11', '2025-06-01', '2025-12-01', 560000, '대기', NULL),
       ('1D', 1, 'user12', '2025-07-01', '2026-01-01', 570000, '대기', NULL),
       ('2D', 2, 'user13', '2025-08-01', '2026-02-01', 580000, '대기', NULL),
       ('1A', 1, 'user14', '2025-09-01', '2026-03-01', 590000, '대기', NULL),
       ('1B', 1, 'user15', '2025-10-01', '2026-04-01', 600000, '대기', NULL),
       ('2C', 2, 'user21', '2025-11-01', '2026-05-01', 610000, '대기', NULL),
       ('2D', 2, 'user22', '2025-12-01', '2026-06-01', 620000, '대기', NULL),
       ('1C', 1, 'user23', '2026-01-01', '2026-07-01', 630000, '대기', NULL),
       ('1D', 1, 'user24', '2026-02-01', '2026-08-01', 640000, '대기', NULL),
       ('2A', 2, 'user25', '2026-03-01', '2026-09-01', 650000, '대기', NULL),
       ('1A', 1, 'user06', '2024-12-01', '2025-06-01', 500000, '진행중', 'admin03'),
       ('1B', 1, 'user07', '2024-12-10', '2025-06-10', 550000, '진행중', 'admin04'),
       ('2A', 2, 'user08', '2024-12-15', '2025-06-15', 520000, '진행중', 'admin05'),
       ('2B', 2, 'user09', '2024-12-20', '2025-06-20', 530000, '진행중', 'admin06'),
       ('2C', 2, 'user10', '2024-12-25', '2025-06-25', 540000, '진행중', 'admin07'),
       ('1C', 1, 'user16', '2025-01-05', '2025-07-05', 560000, '진행중', 'admin03'),
       ('1D', 1, 'user17', '2025-01-10', '2025-07-10', 570000, '진행중', 'admin04'),
       ('2D', 2, 'user18', '2025-01-15', '2025-07-15', 580000, '진행중', 'admin05'),
       ('1A', 1, 'user19', '2025-01-20', '2025-07-20', 590000, '진행중', 'admin06'),
       ('1B', 1, 'user20', '2025-01-25', '2025-07-25', 600000, '진행중', 'admin07'),
       ('2C', 2, 'user26', '2025-02-01', '2025-08-01', 610000, '진행중', 'admin05'),
       ('2D', 2, 'user27', '2025-02-10', '2025-08-10', 620000, '진행중', 'admin06'),
       ('1C', 1, 'user28', '2025-02-15', '2025-08-15', 630000, '진행중', 'admin07'),
       ('1D', 1, 'user29', '2025-02-20', '2025-08-20', 640000, '진행중', 'admin08'),
       ('2A', 2, 'user30', '2025-02-25', '2025-08-25', 650000, '진행중', 'admin09'),
       ('1A', 1, 'seller01', '2024-06-01', '2024-12-01', 500000, '완료', 'admin03'),
       ('1B', 1, 'seller02', '2024-06-10', '2024-12-10', 550000, '완료', 'admin04'),
       ('2A', 2, 'seller03', '2024-06-15', '2024-12-15', 520000, '완료', 'admin05'),
       ('2B', 2, 'seller04', '2024-06-20', '2024-12-20', 530000, '완료', 'admin06'),
       ('2C', 2, 'seller05', '2024-06-25', '2024-12-25', 540000, '완료', 'admin07'),
       ('1C', 1, 'seller06', '2024-07-05', '2025-01-05', 560000, '완료', 'admin08'),
       ('1D', 1, 'seller07', '2024-07-10', '2025-01-10', 570000, '완료', 'admin09'),
       ('2D', 2, 'seller08', '2024-07-15', '2025-01-15', 580000, '완료', 'admin10'),
       ('1A', 1, 'seller09', '2024-07-20', '2025-01-20', 590000, '완료', 'admin03'),
       ('1B', 1, 'seller10', '2024-07-25', '2025-01-25', 600000, '완료', 'admin04'),
       ('2C', 2, 'seller11', '2024-08-01', '2025-02-01', 610000, '완료', 'admin03'),
       ('2D', 2, 'seller12', '2024-08-10', '2025-02-10', 620000, '완료', 'admin04'),
       ('1C', 1, 'seller13', '2024-08-15', '2025-02-15', 630000, '완료', 'admin05'),
       ('1D', 1, 'seller14', '2024-08-20', '2025-02-20', 640000, '완료', 'admin06'),
       ('2A', 2, 'seller15', '2024-08-25', '2025-02-25', 650000, '완료', 'admin07'),
       ('1A', 1, 'seller16', '2024-09-01', '2025-03-01', 660000, '완료', 'admin08'),
       ('1B', 1, 'seller17', '2024-09-10', '2025-03-10', 670000, '완료', 'admin09'),
       ('2A', 2, 'seller18', '2024-09-15', '2025-03-15', 680000, '완료', 'admin10'),
       ('2B', 2, 'seller19', '2024-09-20', '2025-03-20', 690000, '완료', 'admin03'),
       ('2C', 2, 'seller20', '2024-09-25', '2025-03-25', 700000, '완료', 'admin04'),
       ('1C', 1, 'seller21', '2024-10-01', '2025-04-01', 710000, '완료', 'admin05'),
       ('1D', 1, 'seller22', '2024-10-10', '2025-04-10', 720000, '완료', 'admin06'),
       ('2D', 2, 'seller23', '2024-10-15', '2025-04-15', 730000, '완료', 'admin07'),
       ('1A', 1, 'seller24', '2024-10-20', '2025-04-20', 740000, '완료', 'admin08'),
       ('1B', 1, 'seller25', '2024-10-25', '2025-04-25', 750000, '완료', 'admin09'),
       ('2A', 2, 'seller26', '2024-11-01', '2025-05-01', 760000, '완료', 'admin10'),
       ('2B', 2, 'seller27', '2024-11-10', '2025-05-10', 770000, '완료', 'admin03'),
       ('2C', 2, 'seller28', '2024-11-15', '2025-05-15', 780000, '완료', 'admin04'),
       ('1C', 1, 'seller29', '2024-11-20', '2025-05-20', 790000, '완료', 'admin05'),
       ('1D', 1, 'seller30', '2024-11-25', '2025-05-25', 800000, '완료', 'admin06');

INSERT INTO product (product_id, product_name, category, height, width, price, manufacturer, user_id)
VALUES
-- seller01 (거래처) 제품 3개
('P001', '스마트 TV', '가전제품', 80, 120, 1500000, '삼성전자', 'seller01'),
('P002', '냉장고', '가전제품', 180, 80, 2200000, 'LG전자', 'seller01'),
('P003', '세탁기', '가전제품', 90, 70, 1800000, '삼성전자', 'seller01'),

-- seller03 (거래처) 제품 3개
('P004', '노트북', 'IT기기', 2, 35, 1400000, 'Apple', 'seller03'),
('P005', '데스크탑 PC', 'IT기기', 40, 20, 2200000, 'LG전자', 'seller03'),
('P006', '모니터', 'IT기기', 50, 70, 500000, '삼성전자', 'seller03'),

-- seller05 (거래처) 제품 3개
('P007', '공기청정기', '생활가전', 50, 40, 400000, '다이슨', 'seller05'),
('P008', '전자레인지', '주방가전', 40, 30, 300000, 'LG전자', 'seller05'),
('P009', '커피머신', '주방가전', 35, 25, 350000, '네스프레소', 'seller05'),

-- seller07 (거래처) 제품 3개
('P010', '스마트폰', 'IT기기', 1, 8, 1200000, '삼성전자', 'seller07'),
('P011', '태블릿', 'IT기기', 1, 10, 800000, 'Apple', 'seller07'),
('P012', '스마트워치', 'IT기기', 1, 5, 400000, '삼성전자', 'seller07'),

-- seller09 (거래처) 제품 3개
('P013', '전기자전거', '교통수단', 120, 40, 2500000, '알톤스포츠', 'seller09'),
('P014', '킥보드', '교통수단', 110, 30, 1200000, '나인봇', 'seller09'),
('P015', '전동휠', '교통수단', 100, 50, 1800000, '샤오미', 'seller09'),

-- seller11 (거래처) 제품 3개
('P016', '청소기', '생활가전', 60, 30, 600000, '다이슨', 'seller11'),
('P017', '로봇청소기', '생활가전', 35, 35, 700000, '삼성전자', 'seller11'),
('P018', '스팀다리미', '생활가전', 25, 20, 300000, 'LG전자', 'seller11'),

-- seller13 (거래처) 제품 3개
('P019', '전자책 리더기', 'IT기기', 1, 10, 200000, 'Amazon', 'seller13'),
('P020', '프린터', '사무기기', 30, 40, 350000, 'HP', 'seller13'),
('P021', '스캐너', '사무기기', 20, 30, 300000, 'Canon', 'seller13'),

-- seller15 (거래처) 제품 3개
('P022', '가습기', '생활가전', 50, 50, 500000, '샤오미', 'seller15'),
('P023', '에어컨', '가전제품', 180, 70, 2500000, '삼성전자', 'seller15'),
('P024', '선풍기', '가전제품', 130, 50, 150000, 'LG전자', 'seller15'),

-- seller17 (거래처) 제품 3개
('P025', '전기오븐', '주방가전', 60, 50, 800000, '쿠쿠', 'seller17'),
('P026', '인덕션', '주방가전', 10, 40, 700000, 'LG전자', 'seller17'),
('P027', '토스터기', '주방가전', 20, 30, 200000, '브레드맨', 'seller17'),

-- seller19 (거래처) 제품 3개
('P028', '게이밍 키보드', 'IT기기', 5, 45, 300000, 'Razer', 'seller19'),
('P029', '게이밍 마우스', 'IT기기', 3, 10, 200000, 'Logitech', 'seller19'),
('P030', '게이밍 헤드셋', 'IT기기', 20, 15, 400000, 'SteelSeries', 'seller19');

INSERT INTO incoming (count, incoming_date, status, product_id, user_id)
VALUES
-- 대기 상태 (10개)
(10, '2025-03-20', '대기', 'P001', 'seller01'),
(15, '2025-03-21', '대기', 'P002', 'seller01'),
(8, '2025-03-22', '대기', 'P007', 'seller03'),
(12, '2025-03-22', '대기', 'P008', 'seller03'),
(9, '2025-03-21', '대기', 'P010', 'seller05'),
(6, '2025-03-23', '대기', 'P011', 'seller05'),
(14, '2025-03-20', '대기', 'P019', 'seller07'),
(11, '2025-03-21', '대기', 'P020', 'seller07'),
(5, '2025-03-22', '대기', 'P022', 'seller09'),
(7, '2025-03-23', '대기', 'P023', 'seller09'),

-- 진행중 상태 (10개)
(13, '2025-03-18', '진행중', 'P025', 'seller11'),
(17, '2025-03-19', '진행중', 'P026', 'seller11'),
(5, '2025-03-18', '진행중', 'P019', 'seller13'),
(9, '2025-03-19', '진행중', 'P020', 'seller13'),
(8, '2025-03-17', '진행중', 'P030', 'seller15'),
(6, '2025-03-17', '진행중', 'P028', 'seller15'),
(15, '2025-03-16', '진행중', 'P012', 'seller17'),
(12, '2025-03-16', '진행중', 'P013', 'seller17'),
(7, '2025-03-15', '진행중', 'P015', 'seller19'),
(10, '2025-03-15', '진행중', 'P016', 'seller19'),

-- 완료 상태 (10개)
(20, '2025-03-10', '완료', 'P005', 'seller01'),
(18, '2025-03-11', '완료', 'P006', 'seller01'),
(7, '2025-03-12', '완료', 'P009', 'seller03'),
(9, '2025-03-12', '완료', 'P010', 'seller03'),
(6, '2025-03-13', '완료', 'P018', 'seller05'),
(15, '2025-03-14', '완료', 'P017', 'seller05'),
(14, '2025-03-11', '완료', 'P029', 'seller07'),
(12, '2025-03-11', '완료', 'P027', 'seller07'),
(10, '2025-03-10', '완료', 'P014', 'seller09'),
(5, '2025-03-10', '완료', 'P021', 'seller09');

INSERT INTO stock (count, total_price, user_id, product_id, sector_id, warehouse_id)
VALUES
-- seller01
(12, 400000, 'seller01', 'P005', '1A', 1),
(18, 360000, 'seller01', 'P006', '1A', 1),

-- seller03
(1, 140000, 'seller03', 'P009', '2A', 2),
(9, 180000, 'seller03', 'P010', '2A', 2),

-- seller05
(1, 120000, 'seller05', 'P018', '2C', 2),
(15, 300000, 'seller05', 'P017', '2C', 2),

-- seller07
(7, 280000, 'seller07', 'P029', '1D', 1),
(12, 240000, 'seller07', 'P027', '1D', 1),

-- seller09
(7, 200000, 'seller09', 'P014', '1A', 1),
(5, 100000, 'seller09', 'P021', '1A', 1);

INSERT INTO outgoing (count, outgoing_date, status, user_id, stock_num)
VALUES
-- 대기 상태 (5건)
(5, '2025-03-10', '대기', 'seller01', 1),
(3, '2025-03-12', '대기', 'seller03', 3),
(4, '2025-03-15', '대기', 'seller05', 5),
(2, '2025-03-18', '대기', 'seller07', 7),
(6, '2025-03-20', '대기', 'seller09', 9),

-- 진행중 상태 (5건)
(7, '2025-03-08', '진행중', 'seller01', 2),
(5, '2025-03-14', '진행중', 'seller03', 4),
(3, '2025-03-17', '진행중', 'seller05', 6),
(6, '2025-03-21', '진행중', 'seller07', 8),
(4, '2025-03-22', '진행중', 'seller09', 10),

-- 완료 상태 (5건)
(8, '2025-03-05', '완료', 'seller01', 1),
(6, '2025-03-07', '완료', 'seller03', 3),
(5, '2025-03-11', '완료', 'seller05', 5),
(7, '2025-03-16', '완료', 'seller07', 7),
(3, '2025-03-19', '완료', 'seller09', 9);

INSERT INTO stock_history (product_id, sector_id, count, change_date, change_type, admin_id, stock_num, incoming_num, outgoing_num)
VALUES
-- ✅ 입고 이력 (incoming 테이블에서 status = 완료인 것)
('P005', '1A', 20, '2025-03-10', 'INCOMING', 'admin03', 1, 1, NULL),
('P006', '1A', 18, '2025-03-11', 'INCOMING', 'admin03', 2, 2, NULL),
('P009', '1B', 7, '2025-03-12', 'INCOMING', 'admin04', 3, 3, NULL),
('P010', '1B', 9, '2025-03-12', 'INCOMING', 'admin04', 4, 4, NULL),
('P018', '2A', 6, '2025-03-13', 'INCOMING', 'admin05', 5, 5, NULL),
('P017', '2A', 15, '2025-03-14', 'INCOMING', 'admin05', 6, 6, NULL),
('P029', '2B', 14, '2025-03-11', 'INCOMING', 'admin06', 7, 7, NULL),
('P027', '2B', 12, '2025-03-11', 'INCOMING', 'admin06', 8, 8, NULL),
('P014', '3A', 10, '2025-03-10', 'INCOMING', 'admin07', 9, 9, NULL),
('P021', '3A', 5, '2025-03-10', 'INCOMING', 'admin07', 10, 10, NULL),

-- ✅ 출고 이력 (outgoing 테이블에서 status = 완료인 것)
('P005', '1A', 8, '2025-03-05', 'OUTGOING', 'admin03', 1, NULL, 1),
('P009', '1B', 6, '2025-03-07', 'OUTGOING', 'admin04', 3, NULL, 3),
('P017', '2A', 5, '2025-03-11', 'OUTGOING', 'admin05', 5, NULL, 5),
('P029', '2B', 7, '2025-03-16', 'OUTGOING', 'admin06', 7, NULL, 7),
('P014', '3A', 3, '2025-03-19', 'OUTGOING', 'admin07', 9, NULL, 9);
