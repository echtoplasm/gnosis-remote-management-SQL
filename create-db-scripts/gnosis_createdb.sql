drop database if exists gnosis_management;

create database gnosis_management;

use gnosis_management;


CREATE TABLE `users` (
    `user_id` int PRIMARY KEY auto_increment,
    `first_name` varchar(255) NOT NULL,
    `last_name` varchar(255) NOT NULL,
    `company_id` int not null,
    `phone_number` varchar(255) NOT NULL unique,
    `email` varchar(255) NOT NULL unique,
    `password` varchar(64) NOT NULL
);

create table `companies` (
    `company_id` int primary key auto_increment,
    `company_name` varchar(255) not null, 
    `street_address` varchar(255) not null,
    `city` varchar(255) not null,
    `state` varchar(2) not null, 
    `zipcode` varchar(10) not null,
    `phone_number` varchar(15) not null
);

CREATE TABLE `admins` (
    `admin_id` int PRIMARY KEY auto_increment,
    `user_id` int NOT NULL,
    `assigned_date` datetime NOT NULL,
    `permissions_access` varchar(255) DEFAULT 'admins' not null,
    `accessible_by` int not null
);

CREATE TABLE `remote_servers` (
    `server_id` int PRIMARY KEY auto_increment,
    `server_admin` int NOT NULL,
    `ipv4_address` varchar(24) NOT NULL,
    `port_number` varchar(12) NOT NULL,
    `referential_name` varchar(255),
    `description` varchar(1200),
    `permissions_access` varchar(25) default 'users',
    `accessible_by` int not null
);

CREATE TABLE `server_os_specs` (
    `spec_id` int PRIMARY KEY auto_increment,
    `server_id` int NOT NULL,
    `os_name` varchar(100) NOT NULL,
    `os_version` varchar(50) NOT NULL,
    `os_architecture` varchar(20) NOT NULL,
    `kernel_version` varchar(100),
    `last_updated` datetime DEFAULT now(),
    `permissions_access` varchar(255) DEFAULT 'users' not null,
    `accessible_by` int not null 
);

CREATE TABLE `docker_containers` (
    `container_id` int PRIMARY KEY auto_increment,
    `server_id` int NOT NULL,
    `container_admin` int NOT NULL,
    `container_name` varchar(255) NOT NULL,
    `image_path` varchar(900) NOT NULL,
    `status` enum('running', 'stopped', 'paused', 'restarting') NOT NULL,
    `creation_timestamp` datetime NOT NULL,
    `description` varchar(1200),
    `permissions_access` varchar(255) DEFAULT 'users' not null,
    `accessible_by` int not null 
);

CREATE TABLE `server_logs` (
    `server_log_id` int PRIMARY KEY auto_increment,
    `server_id` int,
    `server_log_contents` text,
    `log_date_time` datetime,
    `permissions_access` varchar(255) DEFAULT 'users' not null,
    `accessible_by` int not null
);

CREATE TABLE `container_logs` (
    `container_log_id` int PRIMARY KEY auto_increment,
    `container_id` int not null,
    `server_id` int not null,
    `container_log_contents` text,
    `log_date_time` datetime default now() not null,
    `permissions_access` varchar(255) DEFAULT 'users' not null,
    `accessible_by` int not null

);

CREATE TABLE `cve` (
    `cve_id` int PRIMARY KEY auto_increment,
    `cve_name` varchar(255) NOT NULL,
    `cve_code` varchar(20) NOT NULL unique,
    `cve_description` text NOT NULL,
    `cvss_score` decimal(10, 2) NOT NULL
);

CREATE TABLE `cve_analysis` (
    `cve_analysis_id` int PRIMARY KEY auto_increment,
    `remote_server_id` int,
    `docker_container_id` int,
    `results` text NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime,
    `permissions_access` varchar(255) DEFAULT 'admins' not null,
    `accessible_by` int not null 
);

CREATE TABLE `cve_analysis_findings` (
    `finding_id` int PRIMARY KEY auto_increment,
    `analysis_id` int NOT NULL,
    `cve_id` int NOT NULL,
    `affected_package` varchar(100) NOT NULL,
    `discovered_date` datetime,
    `permissions_access` varchar(255) DEFAULT 'admins' not null,
    `accessible_by` int not null 
);

CREATE TABLE `ssh_sessions` (
    `command_id` int primary key auto_increment,
    `session_id` int not null,
    `admin_id` int NOT NULL,
    `server_id` int NOT NULL,
    `command_executed` varchar(500) NOT NULL,
    `time_stamp` datetime NOT NULL default now(),
    `stdout` text,
    `stderr` text,
    `permissions_access` varchar(255) DEFAULT 'admins' not null,
    `accessible_by` int not null
);


-- check constraints

ALTER TABLE `remote_servers` ADD CONSTRAINT `check_port_range` CHECK (CAST(`port_number` as UNSIGNED) between 1 and 65535);

ALTER TABLE `cve` ADD CONSTRAINT `check_cvss_score` CHECK (`cvss_score` >= 0.0 and `cvss_score` <= 10.0);

ALTER TABLE `cve` ADD CONSTRAINT `check_cve_code_format` CHECK (`cve_code` REGEXP '^CVE-[0-9]{4}-[0-9]{4,7}$');

-- Foreign Keys 
ALTER TABLE `server_os_specs` ADD FOREIGN KEY (`server_id`) REFERENCES `remote_servers` (`server_id`);

ALTER TABLE `server_logs` ADD FOREIGN KEY (`server_id`) REFERENCES `remote_servers` (`server_id`);

ALTER TABLE `container_logs` ADD FOREIGN KEY (`server_id`) REFERENCES `remote_servers` (`server_id`);

ALTER TABLE `container_logs` ADD FOREIGN KEY (`container_id`) REFERENCES `docker_containers` (`container_id`);

ALTER TABLE `cve_analysis` ADD FOREIGN KEY (`remote_server_id`) REFERENCES `remote_servers` (`server_id`);

ALTER TABLE `cve_analysis` ADD FOREIGN KEY (`docker_container_id`) REFERENCES `docker_containers` (`container_id`);

ALTER TABLE `ssh_sessions` ADD FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`);

ALTER TABLE `ssh_sessions` ADD FOREIGN KEY (`server_id`) REFERENCES `remote_servers` (`server_id`);

ALTER TABLE `cve_analysis_findings` ADD FOREIGN KEY (`analysis_id`) REFERENCES `cve_analysis` (`cve_analysis_id`);

ALTER TABLE `cve_analysis_findings` ADD FOREIGN KEY (`cve_id`) REFERENCES `cve` (`cve_id`);

ALTER TABLE `admins` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `docker_containers` ADD FOREIGN KEY (`server_id`) REFERENCES `remote_servers` (`server_id`);

ALTER TABLE `docker_containers` ADD FOREIGN KEY (`container_admin`) REFERENCES `admins` (`admin_id`);

ALTER TABLE `remote_servers` ADD FOREIGN KEY (`server_admin`) REFERENCES `admins` (`admin_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`);

ALTER TABLE `admins` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `remote_servers` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `server_os_specs` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `docker_containers` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `server_logs` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `container_logs` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `cve_analysis` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `cve_analysis_findings` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);

ALTER TABLE `ssh_sessions` ADD FOREIGN KEY (`accessible_by`) REFERENCES `companies` (`company_id`);


-- INSERT STATEMENTS 

INSERT INTO `companies` (`company_name`, `street_address`, `city`, `state`, `zipcode`, `phone_number`) VALUES
    ('TechCorp Inc', '123 Technology Drive', 'San Francisco', 'CA', '94105', '415-555-TECH'),
    ('DevOps Solutions', '456 Development Ave', 'Austin', 'TX', '73301', '512-555-DEVS'),
    ('CloudFirst Ltd', '789 Cloud Boulevard', 'Seattle', 'WA', '98101', '206-555-CLOU'),
    ('SecureNet Corp', '321 Security Street', 'New York', 'NY', '10001', '212-555-SECR'),
    ('InfraTech Systems', '654 Infrastructure Way', 'Denver', 'CO', '80202', '303-555-INFR'),
    ('ContainerCorp', '987 Container Circle', 'Portland', 'OR', '97201', '503-555-CONT'),
    ('ServerSolutions', '147 Server Lane', 'Chicago', 'IL', '60601', '312-555-SERV'),
    ('TechGuard LLC', '258 Guard Plaza', 'Boston', 'MA', '02101', '617-555-GUAR');

-- Insert Users (passwords are SHA256 hashed)
INSERT INTO `users` (`first_name`, `last_name`, `company_id`, `phone_number`, `email`, `password`) VALUES
    ('John', 'Smith', 1, '+1-555-0101', 'john.smith@techcorp.com', SHA2('password123', 256)),
    ('Sarah', 'Johnson', 2, '+1-555-0102', 'sarah.johnson@devops.com', SHA2('securepass456', 256)),
    ('Michael', 'Chen', 3, '+1-555-0103', 'michael.chen@cloudfirst.com', SHA2('mypassword789', 256)),
    ('Emily', 'Rodriguez', 4, '+1-555-0104', 'emily.rodriguez@snet.com', SHA2('strongpass321', 256)),
    ('David', 'Wilson', 5, '+1-555-0105', 'david.wilson@infratech.com', SHA2('adminpass654', 256)),
    ('Lisa', 'Anderson', 6, '+1-555-0106', 'lisa.anderson@containercorp.com', SHA2('userpass987', 256)),
    ('Robert', 'Taylor', 7, '+1-555-0107', 'robert.taylor@serversol.com', SHA2('passw0rd123', 256)),
    ('Amanda', 'Brown', 8, '+1-555-0108', 'amanda.brown@techguard.com', SHA2('secur3pass', 256));

-- Insert Admins (using company_id for accessible_by)
INSERT INTO `admins` (`user_id`, `assigned_date`, `accessible_by`) VALUES
    (1, '2024-01-15 09:00:00', 1), -- John Smith - TechCorp admin
    (2, '2024-02-01 10:30:00', 2), -- Sarah Johnson - DevOps admin
    (5, '2024-02-15 14:20:00', 5), -- David Wilson - InfraTech admin
    (8, '2024-03-01 11:45:00', 8); -- Amanda Brown - TechGuard admin

-- Insert Remote Servers (using company_id for accessible_by)
INSERT INTO `remote_servers` (`server_admin`, `ipv4_address`, `port_number`, `referential_name`, `description`, `accessible_by`) VALUES
    (1, '192.168.1.100', '22', 'prod-web-01', 'Production web server hosting main application', 1), -- TechCorp
    (1, '192.168.1.101', '22', 'prod-db-01', 'Primary database server for production environment', 1), -- TechCorp
    (2, '192.168.1.102', '2222', 'staging-web-01', 'Staging environment for testing new features', 2), -- DevOps
    (2, '10.0.1.50', '22', 'dev-api-01', 'Development API server for internal testing', 2), -- DevOps
    (3, '10.0.1.51', '22', 'monitoring-01', 'Monitoring and logging server with Prometheus and Grafana', 5), -- InfraTech
    (3, '172.16.0.10', '22', 'backup-01', 'Backup server for data redundancy and disaster recovery', 5), -- InfraTech
    (4, '172.16.0.11', '22', 'security-scan-01', 'Security scanning and vulnerability assessment server', 8); -- TechGuard

-- Insert Server OS Specifications (using company_id for accessible_by)
INSERT INTO `server_os_specs` (`server_id`, `os_name`, `os_version`, `os_architecture`, `kernel_version`, `last_updated`, `accessible_by`) VALUES
    (1, 'Ubuntu Server', '22.04.3 LTS', 'x86_64', '5.15.0-78-generic', '2024-07-15 10:30:00', 1), -- TechCorp
    (2, 'Ubuntu Server', '20.04.6 LTS', 'x86_64', '5.4.0-150-generic', '2024-07-10 14:20:00', 1), -- TechCorp
    (3, 'CentOS Stream', '9', 'x86_64', '5.14.0-362.24.1.el9_3.x86_64', '2024-07-20 09:45:00', 2), -- DevOps
    (4, 'Debian', '12.1', 'x86_64', '6.1.0-10-amd64', '2024-07-25 16:15:00', 2), -- DevOps
    (5, 'Red Hat Enterprise Linux', '9.2', 'x86_64', '5.14.0-284.25.1.el9_2.x86_64', '2024-07-18 11:30:00', 5), -- InfraTech
    (6, 'Ubuntu Server', '22.04.3 LTS', 'arm64', '5.15.0-78-generic', '2024-07-12 13:45:00', 5), -- InfraTech
    (7, 'Alpine Linux', '3.18.3', 'x86_64', '6.1.38-0-lts', '2024-07-22 08:20:00', 8); -- TechGuard

-- Insert Docker Containers (using company_id for accessible_by)
INSERT INTO `docker_containers` (`server_id`, `container_admin`, `container_name`, `image_path`, `status`, `creation_timestamp`, `description`, `accessible_by`) VALUES
    (1, 1, 'nginx-proxy', 'nginx:1.21-alpine', 'running', '2024-01-20 10:00:00', 'Nginx reverse proxy for load balancing', 1), -- TechCorp
    (1, 1, 'app-backend', 'node:18-alpine', 'running', '2024-01-20 10:15:00', 'Main application backend service', 1), -- TechCorp
    (2, 1, 'postgres-main', 'postgres:14.9', 'running', '2024-01-22 09:30:00', 'Primary PostgreSQL database instance', 1), -- TechCorp
    (2, 1, 'redis-cache', 'redis:7.0-alpine', 'running', '2024-01-22 09:45:00', 'Redis cache for session management', 1), -- TechCorp
    (3, 2, 'staging-app', 'node:18-alpine', 'running', '2024-02-01 14:00:00', 'Staging version of main application', 2), -- DevOps
    (3, 2, 'test-db', 'postgres:14.9', 'stopped', '2024-02-01 14:15:00', 'Testing database for staging environment', 2), -- DevOps
    (4, 2, 'api-service', 'python:3.11-slim', 'running', '2024-02-10 11:20:00', 'REST API service for mobile applications', 2), -- DevOps
    (5, 3, 'prometheus', 'prom/prometheus:latest', 'running', '2024-02-15 16:30:00', 'Prometheus monitoring service', 5), -- InfraTech
    (5, 3, 'grafana', 'grafana/grafana:latest', 'running', '2024-02-15 16:45:00', 'Grafana dashboard for metrics visualization', 5), -- InfraTech
    (6, 3, 'backup-agent', 'alpine:latest', 'paused', '2024-03-01 08:00:00', 'Automated backup service agent', 5), -- InfraTech
    (7, 4, 'nessus-scanner', 'tenable/nessus:latest', 'running', '2024-03-05 12:00:00', 'Nessus vulnerability scanner', 8), -- TechGuard
    (7, 4, 'openvas', 'mikesplain/openvas:latest', 'stopped', '2024-03-05 12:30:00', 'OpenVAS security scanner', 8); -- TechGuard

-- Insert Server Logs (using company_id for accessible_by)
INSERT INTO `server_logs` (`server_id`, `server_log_contents`, `log_date_time`, `accessible_by`) VALUES
    (1, '[INFO] Server started successfully on port 80', '2024-07-29 08:00:00', 1), -- TechCorp
    (1, '[WARNING] High CPU usage detected: 85%', '2024-07-29 10:30:00', 1), -- TechCorp
    (1, '[INFO] SSL certificate renewed successfully', '2024-07-29 12:15:00', 1), -- TechCorp
    (2, '[INFO] Database backup completed successfully', '2024-07-29 02:00:00', 1), -- TechCorp
    (2, '[ERROR] Connection timeout to backup server', '2024-07-29 02:30:00', 1), -- TechCorp
    (3, '[INFO] Staging deployment completed', '2024-07-29 09:45:00', 2), -- DevOps
    (4, '[INFO] API rate limiting enabled', '2024-07-29 11:20:00', 2), -- DevOps
    (5, '[WARNING] Disk space running low: 15% remaining', '2024-07-29 13:00:00', 5), -- InfraTech
    (6, '[INFO] Backup process initiated', '2024-07-29 01:00:00', 5), -- InfraTech
    (7, '[INFO] Security scan completed - 3 vulnerabilities found', '2024-07-29 14:30:00', 8); -- TechGuard

-- Insert Container Logs (using company_id for accessible_by)
INSERT INTO `container_logs` (`container_id`, `server_id`, `container_log_contents`, `log_date_time`, `accessible_by`) VALUES
    (1, 1, 'nginx: [info] server started on port 80', '2024-07-29 08:05:00', 1), -- TechCorp
    (1, 1, 'nginx: [warn] worker process exited on signal 15', '2024-07-29 10:45:00', 1), -- TechCorp
    (2, 1, 'Node.js app listening on port 3000', '2024-07-29 08:10:00', 1), -- TechCorp
    (2, 1, 'Express server error: ECONNREFUSED database connection', '2024-07-29 11:20:00', 1), -- TechCorp
    (3, 2, 'PostgreSQL database system is ready to accept connections', '2024-07-29 08:15:00', 1), -- TechCorp
    (3, 2, 'LOG: checkpoint complete: wrote 1247 buffers', '2024-07-29 12:00:00', 1), -- TechCorp
    (4, 2, 'Redis server started, version 7.0.12', '2024-07-29 08:20:00', 1), -- TechCorp
    (5, 3, 'Staging app started successfully', '2024-07-29 09:50:00', 2), -- DevOps
    (7, 4, 'API service initialized with rate limiting', '2024-07-29 11:25:00', 2), -- DevOps
    (8, 5, 'Prometheus server started on port 9090', '2024-07-29 16:35:00', 5), -- InfraTech
    (9, 5, 'Grafana server started on port 3000', '2024-07-29 16:50:00', 5), -- InfraTech
    (11, 7, 'Nessus scanner initialized - plugin update complete', '2024-07-29 12:10:00', 8); -- TechGuard


-- Insert CVE Data (CVEs are universal, no company restriction needed)
-- Note: Removed accessible_by field since CVEs should be global data
INSERT INTO `cve` (`cve_name`, `cve_code`, `cve_description`, `cvss_score`) VALUES
    ('Apache HTTP Server Path Traversal', 'CVE-2021-41773', 
    'A flaw was found in a change made to path normalization in Apache HTTP Server 2.4.49. An attacker could use a path traversal attack to map URLs to files outside the directories configured by Alias-like directives.', 
    7.5),

    ('Node.js HTTP Request Smuggling', 'CVE-2022-32213', 
    'The llhttp parser in Node.js versions before 16.17.1, 18.9.1, and 19.0.0 ignores chunk extensions when parsing the body of chunked requests. This can lead to HTTP Request Smuggling.', 
     6.8),
    
    ('PostgreSQL Memory Disclosure', 'CVE-2023-2454', 
     'PostgreSQL before 15.3, 14.8, 13.11, 12.15, and 11.20 has a vulnerability that can disclose arbitrary bytes of server memory.', 
    4.3),
    
    ('Redis Command Injection', 'CVE-2022-0543',
    'Redis before 6.2.7 and 7.x before 7.0.0-RC1 allows a replica to cause an assertion failure in a primary, for a generic setup where an attacker has no access to the configuration.',
    8.8),

    ('Nginx HTTP Request Smuggling', 'CVE-2019-20372',
    'NGINX before 1.17.7, with certain error_page configurations, allows HTTP request smuggling, as demonstrated by the ability to use a malformed URI to access the TCP stream with an arbitrary target.', 
    5.3),
    
    ('Docker Engine Container Escape', 'CVE-2022-24769',
    'Moby is an open-source project created by Docker to enable and accelerate software containerization. A bug was found in Moby (Docker Engine) where attempting to copy files using docker cp into a specially-crafted container can result in Unix file permission changes for existing files in the hosts filesystem.', 
    5.9);

-- Insert CVE Analysis (using company_id for accessible_by)
INSERT INTO `cve_analysis` (`remote_server_id`, `docker_container_id`, `results`, `created_at`, `updated_at`, `accessible_by`) VALUES
    (1, 1, 'Nginx version 1.21 is vulnerable to CVE-2019-20372. Upgrade recommended to version 1.22 or later. No active exploitation detected.', '2024-07-28 10:00:00', '2024-07-28 15:30:00', 1), -- TechCorp

    (1, 2, 'Node.js version 18 contains vulnerability CVE-2022-32213. Application appears to be using HTTP/1.1 only, risk is medium. Update to Node.js 18.9.1+ recommended.', '2024-07-28 11:15:00', NULL, 1), -- TechCorp

    (2, 3, 'PostgreSQL 14.9 is affected by CVE-2023-2454. Memory disclosure vulnerability detected. Immediate patching to version 14.10+ required.', '2024-07-28 12:30:00', '2024-07-29 09:00:00', 1), -- TechCorp

    (2, 4, 'Redis 7.0 vulnerable to CVE-2022-0543. Command injection possible through replica configuration. Update to 7.0.1+ and review replica settings.', '2024-07-28 13:45:00', NULL, 1), -- TechCorp

    (7, 11, 'Nessus scanner container analysis complete. Docker Engine version vulnerable to CVE-2022-24769. Container escape possible. Update Docker Engine immediately.', '2024-07-29 14:45:00', NULL, 8); -- TechGuard

-- Insert CVE Analysis Findings (using company_id for accessible_by)
INSERT INTO `cve_analysis_findings` (`analysis_id`, `cve_id`, `affected_package`, `discovered_date`, `accessible_by`) VALUES
    (1, 5, 'nginx/1.21-alpine', '2024-07-28 10:00:00', 1), -- TechCorp
    (2, 2, 'node:18-alpine', '2024-07-28 11:15:00', 1), -- TechCorp
    (3, 3, 'postgres:14.9', '2024-07-28 12:30:00', 1), -- TechCorp
    (4, 4, 'redis:7.0-alpine', '2024-07-28 13:45:00', 1), -- TechCorp
    (5, 6, 'docker-engine', '2024-07-29 14:45:00', 8); -- TechGuard

-- Insert SSH Sessions (using company_id for accessible_by)
INSERT INTO `ssh_sessions` (`session_id`, `admin_id`, `server_id`, `command_executed`, `time_stamp`, `stdout`, `stderr`, `accessible_by`) VALUES

    (1001, 1, 1, 'systemctl status nginx', '2024-07-29 08:30:00', 
    'nginx.service - The nginx HTTP and reverse proxy server\n   Active: active (running) since Mon 2024-07-29 08:00:01 UTC', 
     NULL, 1), -- TechCorp

    (1001, 1, 1, 'docker ps', '2024-07-29 08:35:00', 
    'CONTAINER ID   IMAGE               COMMAND                  CREATED        STATUS       PORTS                    NAMES\nf3b2c1d4e5a6   nginx:1.21-alpine   "/docker-entrypoint.…"   8 hours ago    Up 8 hours   0.0.0.0:80->80/tcp      nginx-proxy\na1b2c3d4e5f6   node:18-alpine      "docker-entrypoint.s…"   8 hours ago    Up 8 hours   0.0.0.0:3000->3000/tcp  app-backend', 
    NULL, 1), -- TechCorp

    (1002, 2, 3, 'git pull origin main', '2024-07-29 09:15:00', 'Already up to date.', NULL, 2), -- DevOps

    (1002, 2, 3, 'docker-compose up -d', '2024-07-29 09:20:00', 'Starting staging-app ... done', NULL, 2), -- DevOps

    (1003, 1, 2, 'pg_dump -U postgres myapp > backup.sql', '2024-07-29 02:15:00', NULL, 'pg_dump: error: connection to database failed: Connection refused', 1), -- TechCorp

    (1004, 3, 5, 'df -h', '2024-07-29 13:05:00', '/dev/sda1       20G  17G  1.9G  90% /', NULL, 5), -- InfraTech

    (1005, 4, 7, 'nessus-cli --scan-start vulnerability-scan', '2024-07-29 14:00:00', 'Scan started successfully. Scan ID: 12345', NULL, 8), -- TechGuard

    (1006, 3, 6, 'rsync -av /data/ backup@backup-server:/backups/', '2024-07-29 01:30:00', 'sent 1,234,567 bytes  received 890 bytes', 'rsync: connection timeout', 5), -- InfraTech

    (1007, 1, 1, 'tail -f /var/log/nginx/access.log', '2024-07-29 15:00:00', '192.168.1.50 - - [29/Jul/2024:15:00:01 +0000] "GET / HTTP/1.1" 200 1234', NULL, 1), -- TechCorp

    (1008, 4, 7, 'openvas-cli -T xml -f report.xml', '2024-07-29 14:30:00', 'Report generated successfully', NULL, 8); -- TechGuard   


-- View to track admin activities  
-- the results for this view are included in the test-results dir
-- test-results/view-adminactiv-results.sql

create view admins_to_activities as 
select 
    a.admin_id, 
    a.user_id,
    u.first_name, 
    u.last_name,
    dc.container_name,
    rs.referential_name as server_name,
    ss.command_executed,
    ss.time_stamp,
    ss.stdout,
    ss.stderr
from 
    admins a 
inner join 
    users u on a.user_id = u.user_id
left join 
    docker_containers dc on a.admin_id = dc.container_admin
left join 
    remote_servers rs on a.admin_id = rs.server_admin 
left join 
    ssh_sessions ss on rs.server_admin = ss.admin_id;

-- Trigger for updating container status based on logs 

delimiter $$

create trigger update_container_status
after insert on container_logs
for each row
begin
    if LOWER(NEW.container_log_contents) like '%container stopped%' OR 
       LOWER(NEW.container_log_contents) like '%shutting down%' OR
       LOWER(NEW.container_log_contents) like '%exit code%' THEN
        update docker_containers 
        set status = 'stopped' 
        where container_id = NEW.container_id;
        
    elseif NEW.container_log_contents like '%container started%' or
           NEW.container_log_contents like '%Ready to accept connections%' or
           NEW.container_log_contents like '%application started%' then
                update docker_containers 
                set status = 'running' 
                where container_id = NEW.container_id;
        
    elseif NEW.container_log_contents LIKE '%container paused%' OR
           NEW.container_log_contents LIKE '%pausing%' THEN
                update docker_containers 
                set status = 'paused' 
                where container_id = NEW.container_id;
        
    elseif NEW.container_log_contents LIKE '%restarting%' OR
           NEW.container_log_contents LIKE '%restart%' THEN
                update docker_containers 
                set status = 'restarting' 
                where container_id = NEW.container_id;
    end if;

end$$

delimiter ;


/*
======== Test Queries =====
I have included a directory called 'test-results' that includes
the results from running these queries
*/


-- vertical select statements for data baseline
select * from admins \G 

select * from companies \G 

select * from container_logs \G 

select * from cve \G 

select * from cve_analysis_findings \G 

select * from docker_containers \G  

select * from remote_servers \G 

select *  from server_logs \G 

select * from server_os_specs \G 

select * from ssh_sessions \G 

select * from users \G 


-- Foreign key data visualization
SELECT
    table_name,
    column_name,
    constraint_name,
    referenced_table_name,
    referenced_column_name
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    REFERENCED_TABLE_SCHEMA = 'gnosis_management'
    AND REFERENCED_TABLE_NAME IS NOT NULL \G 



/* ----  Testing the container status update trigger ----  */


-- select a docker container instance 
select * from docker_containers 
where container_id = 1 \G

-- insert data with container stopped contents
insert into `container_logs` (`container_id`, `server_id`, `container_log_contents`, `log_date_time`, `accessible_by`)
values 
    (1, 1, "container stopped", now(), 1);
    
-- verify the trigger worked 
select 
    container_id, 
    container_name, 
    status, 
    description
from docker_containers
where container_id = 1 \G


