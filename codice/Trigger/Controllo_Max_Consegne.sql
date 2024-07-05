CREATE OR REPLACE TRIGGER CONTROLLA_CONSEGNE_PER_DATA
BEFORE INSERT ON CONSEGNA
FOR EACH ROW
DECLARE
    NumeroConsegne NUMBER;
    DataConsegna DATE;
BEGIN
    DataConsegna := :NEW.DATA_CONSEGNA;
    -- Conta quante consegne sono programmate per la stessa data
    SELECT COUNT(*)
    INTO NumeroConsegne
    FROM CONSEGNA
    WHERE DATA_CONSEGNA = DataConsegna;

    -- Verifica se ci sono più di 10 consegne programmate per la stessa data
    IF NumeroConsegne >= 10 THEN
    --Se è vero . genera un errore
        RAISE_APPLICATION_ERROR(-20007, 'NUMERO MASSIMO DI CONSEGNE RAGGIUNTO PER QUESTA DATA ');
    END IF;
END;
