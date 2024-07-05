CREATE OR REPLACE TRIGGER ControlloTurni
BEFORE INSERT ON Turno
FOR EACH ROW
DECLARE
    v_NumTurni NUMBER;
BEGIN
    -- Conta il numero di turni già pianificati per lo stesso impiegato nella stessa data.
    SELECT COUNT(*)
    INTO v_NumTurni
    FROM Turno
    WHERE ID_CARTELLINO = :NEW.ID_CARTELLINO
      AND TRUNC(DATA_TURNO) = TRUNC(:NEW.DATA_TURNO);

    -- Se esistono già turni per lo stesso impiegato nella stessa data, genera un errore.
    IF v_NumTurni > 0 THEN
        RAISE_APPLICATION_ERROR(-20010, 'Questo impiegato ha già un turno nella stessa data.');
    END IF;
END;