drop table if exists job cascade;

create table job(
    job_no SERIAL not null,
    job_name varchar(32),
    PRIMARY KEY (job_no)
);