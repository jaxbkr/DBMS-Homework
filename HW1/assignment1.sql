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

-- Insert customers
INSERT INTO Customers VALUES (1, 'Alice', '479-123-4567', 'alice@mail.com');
INSERT INTO Customers VALUES (2, 'Bob', '479-234-5678', 'bob@mail.com');
INSERT INTO Customers VALUES (3, 'Carol', '479-345-6789', 'carol@mail.com');
-- Insert furniture
INSERT INTO Furniture VALUES (101, 'Chair', 'modern', 49.99);
INSERT INTO Furniture VALUES (102, 'Table', 'rustic', 199.50);
INSERT INTO Furniture VALUES (103, 'Sofa', 'traditional', 599.00);
-- Insert rentals 
INSERT INTO Rentals VALUES (1, 101, TO_DATE('2025-06-20', 'YYYY-MM-DD'), SYSDATE);
INSERT INTO Rentals VALUES (2, 102, TO_DATE('2025-08-02', 'YYYY-MM-DD'), TO_DATE('2025-09-02', 'YYYY-MM-DD'));
INSERT INTO Rentals VALUES (3, 103, SYSDATE, NULL);  

-- Format

column owner format a12
column table_name format a12
column foreign_key format a12
column primary_key format a12
column referring_table format a15
column search_condition format a45

-- Spool + tasks

spool asgn1

Select * from cat;

desc Customers
desc Furniture
desc Rentals

select a.owner, a.table_name, column_name primary_key,
a.constraint_name
from user_cons_columns a, user_constraints b
where a.constraint_name = b.constraint_name and
constraint_type = 'P';


select a.owner, a.table_name, a.column_name foreign_key,
b.table_name Referring_table, b.column_name
Primary_key
from user_cons_columns a, user_cons_columns b,
user_constraints c
where a.constraint_name = c.constraint_name and
c.r_constraint_name = b.constraint_name;

select owner, table_name, search_condition from
user_constraints where search_condition is not null;

select * from Customers;
select * from Furniture;
select * from Rentals;


spool off

exit
