USE [Dbadmin]
GO

/****** Object:  StoredProcedure [dbo].[USP_ACTIVE]    Script Date: 6/10/2018 11:28:00 AM ******/
DROP PROCEDURE [dbo].[USP_ACTIVE]
GO

/****** Object:  StoredProcedure [dbo].[USP_ACTIVE]    Script Date: 6/10/2018 11:28:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_ACTIVE] AS  

SELECT r.session_id, r.start_time,  datediff(mi, r.start_time, getdate()) [minutes], R.Status, R.Command, DatabaseName = DB_NAME(R.database_id)   

      , R.cpu_time, R.total_elapsed_time, R.percent_complete, 'kill '+ CONVERT(VARCHAR,R.session_id) , R.blocking_session_id, T.text  

 FROM   sys.dm_exec_requests R   

      CROSS APPLY sys.dm_exec_sql_text(R.sql_handle) T   

WHERE r.session_id <>  @@SPID  

--ORDER BY r.cpu_time DESC  

ORDER BY r.start_time desc
GO

