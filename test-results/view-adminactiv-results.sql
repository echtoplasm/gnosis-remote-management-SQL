-- This is the test of my admins_to_activities view and the corresponding results.

MariaDB [gnosis_management]> select * from admins_to_activities \G
*************************** 1. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-web-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 2. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-web-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 3. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-web-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 4. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-web-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 5. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-db-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 6. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-db-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 7. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-db-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 8. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: nginx-proxy
     server_name: prod-db-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 9. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-web-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 10. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-web-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 11. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-web-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 12. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-web-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 13. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-db-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 14. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-db-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 15. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-db-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 16. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: app-backend
     server_name: prod-db-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 17. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-web-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 18. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-web-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 19. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-web-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 20. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-web-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 21. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-db-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 22. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-db-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 23. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-db-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 24. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: postgres-main
     server_name: prod-db-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 25. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-web-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 26. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-web-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 27. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-web-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 28. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-web-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 29. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-db-01
command_executed: systemctl status nginx
      time_stamp: 2024-07-29 08:30:00
          stdout: nginx.service - The nginx HTTP and reverse proxy server
   Active: active (running) since Mon 2024-07-29 08:00:01 UTC
          stderr: NULL
*************************** 30. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-db-01
command_executed: docker ps
      time_stamp: 2024-07-29 08:35:00
          stdout: CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES
     f3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy
     a1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend
          stderr: NULL
*************************** 31. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-db-01
command_executed: pg_dump -U postgres myapp > backup.sql
      time_stamp: 2024-07-29 02:15:00
          stdout: NULL
          stderr: pg_dump: error: connection to database failed: Connection refused
*************************** 32. row ***************************
        admin_id: 1
         user_id: 1
      first_name: John
       last_name: Smith
  container_name: redis-cache
     server_name: prod-db-01
command_executed: tail -f /var/log/nginx/access.log
      time_stamp: 2024-07-29 15:00:00
          stdout: 192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234
          stderr: NULL
*************************** 33. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: staging-app
     server_name: staging-web-01
command_executed: git pull origin main
      time_stamp: 2024-07-29 09:15:00
          stdout: Already up to date.
          stderr: NULL
*************************** 34. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: staging-app
     server_name: staging-web-01
command_executed: docker-compose up -d
      time_stamp: 2024-07-29 09:20:00
          stdout: Starting staging-app ... done
          stderr: NULL
*************************** 35. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: staging-app
     server_name: dev-api-01
command_executed: git pull origin main
      time_stamp: 2024-07-29 09:15:00
          stdout: Already up to date.
          stderr: NULL
*************************** 36. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: staging-app
     server_name: dev-api-01
command_executed: docker-compose up -d
      time_stamp: 2024-07-29 09:20:00
          stdout: Starting staging-app ... done
          stderr: NULL
*************************** 37. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: test-db
     server_name: staging-web-01
command_executed: git pull origin main
      time_stamp: 2024-07-29 09:15:00
          stdout: Already up to date.
          stderr: NULL
*************************** 38. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: test-db
     server_name: staging-web-01
command_executed: docker-compose up -d
      time_stamp: 2024-07-29 09:20:00
          stdout: Starting staging-app ... done
          stderr: NULL
*************************** 39. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: test-db
     server_name: dev-api-01
command_executed: git pull origin main
      time_stamp: 2024-07-29 09:15:00
          stdout: Already up to date.
          stderr: NULL
*************************** 40. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: test-db
     server_name: dev-api-01
command_executed: docker-compose up -d
      time_stamp: 2024-07-29 09:20:00
          stdout: Starting staging-app ... done
          stderr: NULL
*************************** 41. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: api-service
     server_name: staging-web-01
command_executed: git pull origin main
      time_stamp: 2024-07-29 09:15:00
          stdout: Already up to date.
          stderr: NULL
*************************** 42. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: api-service
     server_name: staging-web-01
command_executed: docker-compose up -d
      time_stamp: 2024-07-29 09:20:00
          stdout: Starting staging-app ... done
          stderr: NULL
*************************** 43. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: api-service
     server_name: dev-api-01
command_executed: git pull origin main
      time_stamp: 2024-07-29 09:15:00
          stdout: Already up to date.
          stderr: NULL
*************************** 44. row ***************************
        admin_id: 2
         user_id: 2
      first_name: Sarah
       last_name: Johnson
  container_name: api-service
     server_name: dev-api-01
command_executed: docker-compose up -d
      time_stamp: 2024-07-29 09:20:00
          stdout: Starting staging-app ... done
          stderr: NULL
*************************** 45. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: prometheus
     server_name: monitoring-01
command_executed: df -h
      time_stamp: 2024-07-29 13:05:00
          stdout: /dev/sda1       20G  17G  1.9G  90% /
          stderr: NULL
*************************** 46. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: prometheus
     server_name: monitoring-01
command_executed: rsync -av /data/ backup@backup-server:/backups/
      time_stamp: 2024-07-29 01:30:00
          stdout: sent 1,234,567 bytes  received 890 bytes
          stderr: rsync: connection timeout
*************************** 47. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: prometheus
     server_name: backup-01
command_executed: df -h
      time_stamp: 2024-07-29 13:05:00
          stdout: /dev/sda1       20G  17G  1.9G  90% /
          stderr: NULL
*************************** 48. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: prometheus
     server_name: backup-01
command_executed: rsync -av /data/ backup@backup-server:/backups/
      time_stamp: 2024-07-29 01:30:00
          stdout: sent 1,234,567 bytes  received 890 bytes
          stderr: rsync: connection timeout
*************************** 49. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: grafana
     server_name: monitoring-01
command_executed: df -h
      time_stamp: 2024-07-29 13:05:00
          stdout: /dev/sda1       20G  17G  1.9G  90% /
          stderr: NULL
*************************** 50. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: grafana
     server_name: monitoring-01
command_executed: rsync -av /data/ backup@backup-server:/backups/
      time_stamp: 2024-07-29 01:30:00
          stdout: sent 1,234,567 bytes  received 890 bytes
          stderr: rsync: connection timeout
*************************** 51. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: grafana
     server_name: backup-01
command_executed: df -h
      time_stamp: 2024-07-29 13:05:00
          stdout: /dev/sda1       20G  17G  1.9G  90% /
          stderr: NULL
*************************** 52. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: grafana
     server_name: backup-01
command_executed: rsync -av /data/ backup@backup-server:/backups/
      time_stamp: 2024-07-29 01:30:00
          stdout: sent 1,234,567 bytes  received 890 bytes
          stderr: rsync: connection timeout
*************************** 53. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: backup-agent
     server_name: monitoring-01
command_executed: df -h
      time_stamp: 2024-07-29 13:05:00
          stdout: /dev/sda1       20G  17G  1.9G  90% /
          stderr: NULL
*************************** 54. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: backup-agent
     server_name: monitoring-01
command_executed: rsync -av /data/ backup@backup-server:/backups/
      time_stamp: 2024-07-29 01:30:00
          stdout: sent 1,234,567 bytes  received 890 bytes
          stderr: rsync: connection timeout
*************************** 55. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: backup-agent
     server_name: backup-01
command_executed: df -h
      time_stamp: 2024-07-29 13:05:00
          stdout: /dev/sda1       20G  17G  1.9G  90% /
          stderr: NULL
*************************** 56. row ***************************
        admin_id: 3
         user_id: 5
      first_name: David
       last_name: Wilson
  container_name: backup-agent
     server_name: backup-01
command_executed: rsync -av /data/ backup@backup-server:/backups/
      time_stamp: 2024-07-29 01:30:00
          stdout: sent 1,234,567 bytes  received 890 bytes
          stderr: rsync: connection timeout
*************************** 57. row ***************************
        admin_id: 4
         user_id: 8
      first_name: Amanda
       last_name: Brown
  container_name: nessus-scanner
     server_name: security-scan-01
command_executed: nessus-cli --scan-start vulnerability-scan
      time_stamp: 2024-07-29 14:00:00
          stdout: Scan started successfully. Scan ID: 12345
          stderr: NULL
*************************** 58. row ***************************
        admin_id: 4
         user_id: 8
      first_name: Amanda
       last_name: Brown
  container_name: nessus-scanner
     server_name: security-scan-01
command_executed: openvas-cli -T xml -f report.xml
      time_stamp: 2024-07-29 14:30:00
          stdout: Report generated successfully
          stderr: NULL
*************************** 59. row ***************************
        admin_id: 4
         user_id: 8
      first_name: Amanda
       last_name: Brown
  container_name: openvas
     server_name: security-scan-01
command_executed: nessus-cli --scan-start vulnerability-scan
      time_stamp: 2024-07-29 14:00:00
          stdout: Scan started successfully. Scan ID: 12345
          stderr: NULL
*************************** 60. row ***************************
        admin_id: 4
         user_id: 8
      first_name: Amanda
       last_name: Brown
  container_name: openvas
     server_name: security-scan-01
command_executed: openvas-cli -T xml -f report.xml
      time_stamp: 2024-07-29 14:30:00
          stdout: Report generated successfully
          stderr: NULL
60 rows in set (0.001 sec)

