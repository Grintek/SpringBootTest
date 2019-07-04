insert into usr (id, username, password, active)
value (2, 'admin', '123', true);

insert into user_role (user_id, roles) value (2, 'USER'), (2, 'ADMIN');