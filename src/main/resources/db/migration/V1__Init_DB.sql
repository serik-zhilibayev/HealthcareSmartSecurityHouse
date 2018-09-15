create sequence hibernate_sequence start 1 increment 1;
create table relatives (id int8 not null, name varchar(255), phone varchar(255), user_id int8, primary key (id));
create table user_role (user_id int8 not null, roles varchar(255));
create table users (id int8 not null, activation_code varchar(255), active boolean not null, email varchar(255), password varchar(255), username varchar(255), primary key (id));
alter table if exists relatives add constraint relatives_user_fk foreign key (user_id) references users;
alter table if exists user_role add constraint user_role_fk foreign key (user_id) references users;