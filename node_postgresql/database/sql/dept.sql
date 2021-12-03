drop table if exists dept cascade;

create table dept(
    dept_no SERIAL not null,
    dept_name varchar(14),
    dept_loc varchar(14),
    PRIMARY KEY (dept_no)
);