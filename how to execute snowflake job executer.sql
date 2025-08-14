---validate all the jobs
select * from ETL.JOB_CONTROL ;

---1 scenario success all
call execute_stored_procs_sp('invoce_records_load_dev');
select * from ETL.JOB_CONTROL_EXECUTION_LOG order by 1;

---2 scenario one failed

update ETL.JOB_CONTROL set proc_name='dwh.etl.SP_LOAD_DIM_THREEE' where seq_no=301;
call execute_stored_procs_sp('invoce_records_load_dev');
select * from ETL.JOB_CONTROL_EXECUTION_LOG order by 1;


