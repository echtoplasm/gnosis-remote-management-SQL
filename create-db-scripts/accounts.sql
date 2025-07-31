-- create CRUD application user 
create user 'gnosisapp'@'%' identified by [readacted];
grant all privileges on gnosis_management.* to 'gnosisapp'@'%';

-- create phpMyadmin  user for locklear
create user 'marklocklear'@'%' identified by [redacted];
grant select on gnosis_management.* to 'marklocklear'@'%';

-- db admin 
create user 'gnosisdb-admin'@'%' identified by [redacted];
grant all privileges on gnosis_management.* to 'gnosisdb-admin'@'%';



