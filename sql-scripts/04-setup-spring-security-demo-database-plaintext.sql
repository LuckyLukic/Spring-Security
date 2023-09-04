
-- Create the 'users' table
CREATE TABLE users (
  username varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  enabled smallint NOT NULL,  -- Use smallint instead of tinyint
  PRIMARY KEY (username)
);

-- Insert data into the 'users' table
INSERT INTO users 
VALUES 
('john','{noop}test123',1),
('mary','{noop}test123',1),
('susan','{noop}test123',1);

-- Create the 'authorities' table
CREATE TABLE authorities (
  username varchar(50) NOT NULL,
  authority varchar(50) NOT NULL,
  CONSTRAINT authorities_pkey PRIMARY KEY (username, authority),  -- Define primary key constraint
  CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users (username)
);

-- Insert data into the 'authorities' table
INSERT INTO authorities 
VALUES 
('john','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('susan','ROLE_EMPLOYEE'),
('susan','ROLE_MANAGER'),
('susan','ROLE_ADMIN');

-- Comment on the database
COMMENT ON DATABASE postgres
    IS 'default administrative connection database';


