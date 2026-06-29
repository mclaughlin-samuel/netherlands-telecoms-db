CREATE TABLE operator
(operator_id SMALLINT UNSIGNED,
company_name VARCHAR(100),
parent_company VARCHAR(100),
company_type VARCHAR(20),
ownership VARCHAR(20),
headquarters VARCHAR(100),
website VARCHAR(255),
employees INTEGER,
annual_revenue DECIMAL(15,2),
last_updated DATETIME,
source VARCHAR(255),
CONSTRAINT pk_operator PRIMARY KEY (operator_id)
);
