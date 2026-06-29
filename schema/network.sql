CREATE TABLE network
(operator_id SMALLINT UNSIGNED,
technology ENUM('2G', '3G', '4G', '5G'),
launch_year YEAR,
network_vendor VARCHAR(100),
coverage_percentage DECIMAL(5,2),
CONSTRAINT pk_network PRIMARY KEY (operator_id, technology),
CONSTRAINT fk_network_operator_id FOREIGN KEY (operator_id)
REFERENCES operator (operator_id)
);
