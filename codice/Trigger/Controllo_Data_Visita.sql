CREATE OR REPLACE TRIGGER CONTROLLA_DATA_VISITA
AFTER INSERT ON PRENOTAZIONE
FOR EACH ROW
DECLARE
    Data_Prenotazione DATE;
BEGIN
    SELECT :NEW.DATA_P
    INTO DATA_PRENOTAZIONE
    FROM PRENOTAZIONE
    WHERE ID_PRENOTAZIONE = :NEW.ID_PRENOTAZIONE;
--Controlla se la data in cui deve essere effettuata la visita risulta precedente alla data in cui la visita è stata prenotata
    IF (:NEW.DATA_V <= DATA_PRENOTAZIONE) THEN
    --Se è vero , genera un errore
        RAISE_APPLICATION_ERROR(-20003, 'La data della visita deve essere successiva alla data di prenotazione.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004, 'ID_PRENOTAZIONE non valido.');
END;
