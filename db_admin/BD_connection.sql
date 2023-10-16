-- Connection Id: 20
-- User: cesteves
-- Host: LAB-SSD
-- DB: None
-- Command: Query
-- Time: 0
-- State: executing
SELECT t.PROCESSLIST_ID,IF (NAME = 'thread/sql/event_scheduler','event_scheduler',t.PROCESSLIST_USER) 
PROCESSLIST_USER,t.PROCESSLIST_HOST,
t.PROCESSLIST_DB,t.PROCESSLIST_COMMAND,t.PROCESSLIST_TIME,
t.PROCESSLIST_STATE,t.THREAD_ID,t.TYPE,t.NAME,t.PARENT_THREAD_ID,
t.INSTRUMENTED,t.PROCESSLIST_INFO,a.ATTR_VALUE 
FROM performance_schema.threads t 
LEFT OUTER JOIN performance_schema.session_connect_attrs a ON t.processlist_id = a.processlist_id 
AND (a.attr_name IS NULL OR a.attr_name = 'program_name') WHERE t.TYPE <> 'BACKGROUND' /* statement may be truncated */
