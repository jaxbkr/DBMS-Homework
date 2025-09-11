-- DROP TABLES FOR CLEAN REBUILDS

DROP TABLE Rentals CASCADE CONSTRAINTS;
DROP TABLE Furniture CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;
PURGE RECYCLEBIN;
-- Create Furniture Table

CREATE TABLE Furniture (
  f_id NUMBER PRIMARY KEY,
  category VARCHAR2(20) NOT NULL,
  style VARCHAR2(15) 
    CONSTRAINT chk_style CHECK (style IN ('modern', 'rustic', 'traditional')),
  price NUMBER(5, 2) NOT NULL
);
-- Create Customers Table

CREATE TABLE Customers (
  c_id NUMBER PRIMARY KEY,
  name VARCHAR2(10) NOT NULL,
  phone VARCHAR2(13),
  email VARCHAR2(15)
);

-- Create Rentals Table

CREATE TABLE Rentals (
  c_id NUMBER,
  f_id NUMBER,
  ck_out_date DATE NOT NULL,
  ret_date DATE,
  CONSTRAINT fk_customer FOREIGN KEY (c_id)
  REFERENCES Customers(c_id),
  CONSTRAINT fk_furniture FOREIGN KEY (f_id)
  REFERENCES Furniture(f_id)
);










