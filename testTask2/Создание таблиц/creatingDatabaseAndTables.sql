create schema if not exists beltelsql92 default character set utf8;
create table if not exists abon_name
(
    id_name int not null primary key,
    name    varchar(45) not null
);
create table if not exists type_phone
(
    id_type int not null primary key,
    name    enum ('Спаренный телефон', 'Таксофон', 'Отдельный телефон') null
);
create table if not exists zajavka
(
    date       datetime(6) not null,
    phone      decimal(12) not null,
    id_abonent int         not null
)
    ENGINE = ARCHIVE;

create table phone_volume
(
    phone      decimal(12) not null,
    id_abonent int         not null,
    id_name    int         not null,
    io         char(2)     not null,
    id_type    int         not null,
    constraint phone_volume_abon_name_id_name_fk
        foreign key (id_name) references abon_name (id_name),
    constraint phone_volume_type_phone_id_type_fk
        foreign key (id_type) references type_phone (id_type)
);

