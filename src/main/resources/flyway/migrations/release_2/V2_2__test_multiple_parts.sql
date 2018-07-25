-- create table (DDL)
CREATE TABLE table_22(
  id INTEGER,
  value VARCHAR(255),
  PRIMARY KEY(id)
);

-- insert some data (DML)
INSERT INTO public.table_22 (id, value) VALUES (1, 'test -- 1') ;
INSERT INTO public.table_22 (id, value) VALUES (2, 'test -- 2') ;

-- insert more data (DML)
INSERT INTO public.table_22 (id, value) VALUES (3, 'test -- 3') ;
INSERT INTO public.table_22 (id, value) VALUES (4, 'test -- 4') ;
