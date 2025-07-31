-- create CRUD application user 
create user 'gnosisapp'@'%' identified by 'gnosis:app,-logic';
grant all privileges on gnosis_management.* to 'gnosisapp'@'%';

-- create phpMyadmin  user for locklear
create user 'marklocklear'@'%' identified by 'gnosis:eval:abt,-2025';
grant select on gnosis_management.* to 'marklocklear'@'%';

-- db admin 
create user 'gnosisdb-admin'@'%' identified by 'Plague:9576,-';
grant all privileges on gnosis_management.* to 'gnosisdb-admin'@'%';



