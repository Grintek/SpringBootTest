create sequence hibernate_sequence start 1 increment 1;

create table channel
(
    id      int8 not null,
    chn_url varchar(255),
    name    varchar(255),
    user_id int8,
    primary key (id)
);

create table message
(
    id       int8 not null,
    filename varchar(255),
    tag      varchar(255),
    text     varchar(2048) not null,
    user_id  int8,
    primary key (id)
);

create table user_role
(
    user_id int8 not null,
    roles   varchar(255)
);

create table usr
(
    id       int8    not null,
    activate varchar(255),
    active   boolean not null,
    email    varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists channel
    add constraint channel_ch_fk foreign key (user_id) references usr;
alter table if exists message
    add constraint message_us_fk foreign key (user_id) references usr;
alter table if exists user_role
    add constraint user_role_fk foreign key (user_id) references usr;