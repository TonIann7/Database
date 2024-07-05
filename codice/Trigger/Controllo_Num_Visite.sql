CREATE OR REPLACE TRIGGER ControlloNumeroVisite
BEFORE INSERT ON Prenotazione
FOR EACH ROW
DECLARE
    v_NumVisite NUMBER;
BEGIN
    -- Conta il numero di visite già prenotate per la data in cui si sta cercando di inserire la nuova prenotazione.
    SELECT COUNT(*)
    INTO v_NumVisite
    FROM Prenotazione
    WHERE TRUNC(DATA_V) = TRUNC(:NEW.DATA_V);

    -- Se ci sono già 7 visite prenotate per la stessa data, genera un errore.
    IF v_NumVisite >= 7 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Numero massimo di visite per questa data raggiunto. Impossibile prenotarne altre.');
    END IF;
END;