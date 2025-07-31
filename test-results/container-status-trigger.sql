MariaDB [gnosis_management]> select * from docker_containers
    -> where container_id = 1 \G
*************************** 1. row ***************************
      container_id: 1
         server_id: 1
   container_admin: 1
    container_name: nginx-proxy
        image_path: nginx:1.21-alpine
            status: running
creation_timestamp: 2024-01-20 10:00:00
       description: Nginx reverse proxy for load balancing
permissions_access: users
     accessible_by: 1
1 row in set (0.001 sec)

MariaDB [gnosis_management]> insert into `container_logs` (`container_id`, `server_id`, `container_log_contents`, `log_date_time`, `accessible_by`)
    -> values
    ->     (1, 1, "container stopped", now(), 1);
Query OK, 1 row affected (0.027 sec)

MariaDB [gnosis_management]> select
    ->     container_id,
    ->     container_name,
    ->     status,
    ->     description
    -> from docker_containers
    -> where container_id = 1 \G
*************************** 1. row ***************************
  container_id: 1
container_name: nginx-proxy
        status: stopped
   description: Nginx reverse proxy for load balancing
1 row in set (0.001 sec)

MariaDB [gnosis_management]>
