--%%%%%%%% JOB CHE OGNI PRIMO DEL MESE CANCELLA TUTTE LE PRENOTAZIONI PRECEDENTI DI 2 MESI
BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
        job_name        => 'ELIMINA_PRENOTAZIONI_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN 
                            DELETE FROM PRENOTAZIONE
                            WHERE DATA_P<SYSDATE-60;
                            END;',
        start_date      =>  TO_DATE ('01-SET-2023','DD-MON -YYYY') ,
        repeat_interval => 'FREQ=MONTHLY',
        enabled         => TRUE,
        comments        => 'Cancellazione Vecchi dati');
END;

-- %%%%%%% CANCELLAZIONE DEL JOB ELIMINA_PRENOTAZIONI_JOB
BEGIN
DBMS_SCHEDULER.DROP_JOB ('ELIMINA_PRENOTAZIONI_JOB') ;
END ;