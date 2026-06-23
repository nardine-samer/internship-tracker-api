
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