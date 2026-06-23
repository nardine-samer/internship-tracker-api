
USE internship_tracker;
CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    industry VARCHAR(50),
    location VARCHAR(100),
    website VARCHAR(150)
);
CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    position_title VARCHAR(100) NOT NULL,
    application_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    notes VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);
CREATE TABLE status_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    application_id INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    changed_at DATETIME NOT NULL,
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);
CREATE TABLE refrence (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(100),
    email VARCHAR(150),
    linkedin_url VARCHAR(200),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);
INSERT INTO companies (name, industry, location, website) VALUES
('Siemens Egypt', 'Engineering', 'Cairo', 'https://www.siemens.com/eg'),
('SAP Egypt', 'Software', 'Cairo', 'https://www.sap.com/eg'),
('Valeo Egypt', 'Automotive', 'Cairo', 'https://www.valeo.com');

INSERT INTO applications (company_id, position_title, application_date, status, notes) VALUES
(1, 'Software Engineering Intern', '2026-05-10', 'Applied', 'Found via career fair'),
(2, 'Backend Developer Intern', '2026-05-15', 'Under Review', 'Referred by contact'),
(3, 'Embedded Systems Intern', '2026-06-01', 'Rejected', 'No response after 3 weeks');

INSERT INTO status_history (application_id, status, changed_at) VALUES
(1, 'Applied', '2026-05-10 09:00:00'),
(2, 'Applied', '2026-05-15 10:30:00'),
(2, 'Under Review', '2026-05-20 14:00:00'),
(3, 'Applied', '2026-06-01 11:00:00'),
(3, 'Rejected', '2026-06-15 16:45:00');

INSERT INTO refrence (company_id, name, role, email, linkedin_url) VALUES
(1, 'Anna Müller', 'HR Recruiter', 'anna.mueller@siemens.com', 'https://linkedin.com/in/example1'),
(2, 'Karim Hassan', 'Engineering Manager', 'karim.hassan@sap.com', 'https://linkedin.com/in/example2'),
(3, 'Lea Becker', 'Talent Acquisition', 'lea.becker@valeo.com', 'https://linkedin.com/in/example3');

SELECT a.application_id, c.name AS company_name, a.position_title, a.status, a.application_date
FROM applications a
JOIN companies c USING (company_id) ;

SELECT status, COUNT(*) AS total
FROM applications
GROUP BY status;

SELECT  c.name, AVG(DATEDIFF(sh.changed_at, a.application_date)) AS avg_days
FROM applications a
JOIN companies c USING (company_id)
JOIN status_history sh ON a.application_id = sh.application_id
GROUP BY c.name
