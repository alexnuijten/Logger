create or replace force view logger_logs_5_min as
  select
    ll.*,
    lpad(' ', greatest(nvl(call_depth,1)-1,0) * 3) ||
      case when nvl(call_depth,1) > 1 then '|-- ' end ||
      unit_name as call_tree
  from logger_logs ll
 where time_stamp > systimestamp - (5/1440)
 order by call_id, id
/
