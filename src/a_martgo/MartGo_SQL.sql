

DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS sector;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS incoming;
DROP TABLE IF EXISTS rent_history;
DROP TABLE IF EXISTS stock_history;
DROP TABLE IF EXISTS outgoing;
DROP TABLE IF EXISTS warehouse;
DROP TABLE IF EXISTS cost_info;
DROP TABLE IF EXISTS user;

-- 테이블 생성
CREATE TABLE stock
(
    stock_num    INTEGER      NOT NULL AUTO_INCREMENT,
    `count`      INTEGER      NOT NULL,
    total_price  INTEGER      NOT NULL,
    user_id      varchar(100) NOT NULL,
    product_id   VARCHAR(100) NOT NULL,
    sector_id    CHAR(3)      NOT NULL,
    warehouse_id INTEGER      NOT NULL,
    PRIMARY KEY (stock_num)
);

CREATE TABLE admin
(
    admin_id     VARCHAR(100)          NOT NULL,
    admin_name   VARCHAR(100)          NOT NULL,
    admin_pw     VARCHAR(100)          NOT NULL,
    phone_num    VARCHAR(100)          NOT NULL,
    email        VARCHAR(100),
    role         ENUM ('총관리자','창고관리자') NOT NULL DEFAULT '창고관리자' COMMENT '총관리자, 창고관리자 중 하나여야 함',
    warehouse_id INTEGER               NOT NULL,
    PRIMARY KEY (admin_id)
);

CREATE TABLE sector
(
    sector_id    CHAR(3)              NOT NULL,
    warehouse_id INTEGER              NOT NULL,
    height       INTEGER              NOT NULL,
    width        INTEGER              NOT NULL,
    FAR          DECIMAL(6, 2)        NOT NULL,
    status       ENUM ('사용가능','사용불가') NOT NULL DEFAULT '사용가능' COMMENT '사용가능,사용불가 중 하나여야 함',
    PRIMARY KEY (sector_id, warehouse_id)
);

CREATE TABLE product
(
    product_id   VARCHAR(100) NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category     VARCHAR(100) NOT NULL,
    height       INTEGER      NOT NULL,
    width        INTEGER      NOT NULL,
    price        INTEGER      NOT NULL,
    manufacturer VARCHAR(100),
    user_id      varchar(100) NOT NULL COMMENT '입력받은 ID를 저장',
    PRIMARY KEY (product_id)
);

CREATE TABLE incoming
(
    incoming_num  INTEGER                NOT NULL AUTO_INCREMENT,
    `count`       INTEGER                NOT NULL,
    incoming_date DATE                   NOT NULL,
    status        ENUM ('대기','진행중','완료') NOT NULL DEFAULT '대기' COMMENT '대기,진행중,완료 중 하나여야함',
    product_id    VARCHAR(100)           NOT NULL,
    user_id       varchar(100)           NOT NULL COMMENT '입력받은 ID를 저장',
    PRIMARY KEY (incoming_num)
);

CREATE TABLE rent_history
(
    rent_num        INTEGER                NOT NULL AUTO_INCREMENT,
    sector_id       CHAR(3)                NOT NULL,
    warehouse_id    INTEGER                NOT NULL,
    user_id         varchar(100)           NOT NULL COMMENT '입력받은 ID를 저장',
    rent_start_date DATE                   NOT NULL,
    rent_end_date   DATE                   NOT NULL,
    rent_price      INTEGER                NOT NULL,
    approve_date    DATE,
    status          ENUM ('대기','진행중','완료') NOT NULL DEFAULT '대기' COMMENT '대기,진행중,완료 중 하나여야함',
    admin_id        varchar(100) COMMENT '상태를 진행중으로 변경한 관리자 아이디',
    PRIMARY KEY (rent_num, sector_id, warehouse_id, user_id)
);

CREATE TABLE stock_history
(
    history_num INTEGER      NOT NULL AUTO_INCREMENT,
    product_id  VARCHAR(100) NOT NULL,
    sector_id   CHAR(3)      NOT NULL,
    `count`     INTEGER      NOT NULL,
    change_date DATE         NOT NULL,
    change_type VARCHAR(100) NOT NULL,
    admin_id    varchar(100) NOT NULL,
    stock_num   INTEGER      NOT NULL,
    incoming_num INTEGER      NULL,
    outgoing_num INTEGER      NULL,
    PRIMARY KEY (history_num)
);

CREATE TABLE warehouse
(
    warehouse_id   INTEGER       NOT NULL AUTO_INCREMENT,
    warehouse_name VARCHAR(100)  NOT NULL,
    location       VARCHAR(100)  NOT NULL,
    height         INTEGER       NOT NULL,
    width          INTEGER       NOT NULL,
    FAR            DECIMAL(6, 2) NOT NULL,
    PRIMARY KEY (warehouse_id)
);

CREATE TABLE cost_info
(
    price_num    INTEGER      NOT NULL AUTO_INCREMENT,
    warehouse_id INTEGER      NOT NULL,
    sector_id    CHAR(3)      NOT NULL,
    `period`     VARCHAR(100) NOT NULL,
    price        INTEGER      NOT NULL,
    PRIMARY KEY (price_num, warehouse_id, sector_id)
);

CREATE TABLE outgoing
(
    outgoing_num  INTEGER                NOT NULL AUTO_INCREMENT,
    `count`       INTEGER                NOT NULL,
    outgoing_date DATE                   NOT NULL,
    status        ENUM ('대기','진행중','완료') NOT NULL DEFAULT '대기' COMMENT '대기,진행중,완료 중 하나여야함',
    user_id       VARCHAR(100) NOT NULL,
    stock_num     INTEGER                NOT NULL,
    PRIMARY KEY (outgoing_num)
);

CREATE TABLE `user`
(
    user_id   VARCHAR(100)      NOT NULL COMMENT '입력받은 ID를 저장',
    user_name VARCHAR(100)      NOT NULL,
    user_pw   VARCHAR(100)      NOT NULL,
    phone     VARCHAR(100)      NOT NULL,
    email     VARCHAR(100),
    address   VARCHAR(100)      NOT NULL,
    role      ENUM ('회원','거래처') NOT NULL DEFAULT '회원' COMMENT '회원 또는 거래처',
    admin_id  varchar(100),
    PRIMARY KEY (user_id)
);

-- 외래키 제약조건 추가
ALTER TABLE sector
    ADD CONSTRAINT fk_warehouse_to_sector FOREIGN KEY (warehouse_id)
        REFERENCES warehouse (warehouse_id);

ALTER TABLE rent_history
    ADD CONSTRAINT fk_sector_to_rent_history FOREIGN KEY (sector_id, warehouse_id)
        REFERENCES sector (sector_id, warehouse_id);

ALTER TABLE rent_history
    ADD CONSTRAINT fk_user_to_rent_history FOREIGN KEY (user_id)
        REFERENCES user (user_id);

ALTER TABLE cost_info
    ADD CONSTRAINT fk_sector_to_cost_info FOREIGN KEY (sector_id, warehouse_id)
        REFERENCES sector (sector_id, warehouse_id);
