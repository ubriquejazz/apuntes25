/*!50530 SET @@SESSION.PSEUDO_SLAVE_MODE=1*/;
/*!40019 SET @@session.max_insert_delayed_threads=0*/;
/*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
DELIMITER /*!*/;
# at 4
#230322 16:56:38 server id 1  end_log_pos 256 CRC32 0xc870ec08 	Start: binlog v 4, server v 10.5.18-MariaDB-0+deb11u1-log created 230322 16:56:38 at startup
ROLLBACK/*!*/;
BINLOG '
RjMbZA8BAAAA/AAAAAABAAAAAAQAMTAuNS4xOC1NYXJpYURCLTArZGViMTF1MS1sb2cAAAAAAAAA
AAAAAAAAAAAAAAAAAABGMxtkEzgNAAgAEgAEBAQEEgAA5AAEGggAAAAICAgCAAAACgoKAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAEEwQADQgICAoKCgEI7HDI
'/*!*/;
# at 256
#230322 16:56:38 server id 1  end_log_pos 285 CRC32 0x8e924127 	Gtid list []
# at 285
#230322 16:56:38 server id 1  end_log_pos 329 CRC32 0x52e2098c 	Binlog checkpoint mysqld-bin.000002
# at 329
#230322 16:57:48 server id 1  end_log_pos 371 CRC32 0x8d3ec9f7 	GTID 0-1-1 trans
/*!100101 SET @@session.skip_parallel_replication=0*//*!*/;
/*!100001 SET @@session.gtid_domain_id=0*//*!*/;
/*!100001 SET @@session.server_id=1*//*!*/;
/*!100001 SET @@session.gtid_seq_no=1*//*!*/;
START TRANSACTION
/*!*/;
# at 371
#230322 16:57:48 server id 1  end_log_pos 515 CRC32 0x77914d70 	Query	thread_id=31	exec_time=0	error_code=0
use `coches_prueba`/*!*/;
SET TIMESTAMP=1679504268/*!*/;
SET @@session.pseudo_thread_id=31/*!*/;
SET @@session.foreign_key_checks=1, @@session.sql_auto_is_null=0, @@session.unique_checks=1, @@session.autocommit=1, @@session.check_constraint_checks=1, @@session.sql_if_exists=0, @@session.explicit_defaults_for_timestamp=0/*!*/;
SET @@session.sql_mode=1411383296/*!*/;
SET @@session.auto_increment_increment=1, @@session.auto_increment_offset=1/*!*/;
/*!\C utf8 *//*!*/;
SET @@session.character_set_client=33,@@session.collation_connection=33,@@session.collation_server=45/*!*/;
SET @@session.lc_time_names=0/*!*/;
SET @@session.collation_database=DEFAULT/*!*/;
    DELETE FROM CONCESIONARIO WHERE marca="CITROEN" AND modelo LIKE "C%"
/*!*/;
# at 515
#230322 16:57:48 server id 1  end_log_pos 546 CRC32 0x123573b1 	Xid = 62
COMMIT/*!*/;
# at 546
#230322 16:57:53 server id 1  end_log_pos 588 CRC32 0x357affb2 	GTID 0-1-2 ddl
/*!100001 SET @@session.gtid_seq_no=2*//*!*/;
# at 588
#230322 16:57:53 server id 1  end_log_pos 791 CRC32 0xc19d6d62 	Query	thread_id=31	exec_time=0	error_code=0
SET TIMESTAMP=1679504273/*!*/;
CREATE TABLE CLIENTES (
    ID_CLIENTE VARCHAR(10) PRIMARY KEY,
    NOM_CLI VARCHAR(30),
    DIRECCION VARCHAR(30),
    LOCALIDAD VARCHAR(30)
    )
/*!*/;
# at 791
#230322 17:07:48 server id 1  end_log_pos 833 CRC32 0xcd84f967 	GTID 0-1-3 ddl
/*!100001 SET @@session.gtid_seq_no=3*//*!*/;
# at 833
#230322 17:07:48 server id 1  end_log_pos 936 CRC32 0xb9bdd2d5 	Query	thread_id=33	exec_time=0	error_code=0
SET TIMESTAMP=1679504868/*!*/;
SET @@session.pseudo_thread_id=33/*!*/;
    DROP DATABASE coches_prueba
/*!*/;
# at 936
#230322 17:07:58 server id 1  end_log_pos 959 CRC32 0x82609ed3 	Stop
DELIMITER ;
# End of log file