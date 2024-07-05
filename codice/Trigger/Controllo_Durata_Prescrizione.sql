CREATE OR REPLACE TRIGGER CONTROLLA_DURATA_PRESCRIZIONE
BEFORE INSERT ON PRESCRIZIONE
FOR EACH ROW
DECLARE
    DurataVisita NUMBER;
    TipoVisita VARCHAR2(25);
BEGIN
    SELECT DURATA_VISITA, TIPO_VISITA
    INTO DurataVisita, TipoVisita
    FROM VISITA_OCULISTICA
    WHERE ID_VISITA = :NEW.ID_VISITA;

    -- Verifica se la visita � di tipo "PEDIATRICA" e la durata della prescrizione � superiore a 3 mesi
    IF TipoVisita = 'PEDIATRICA' AND :NEW.DURATA_PRESCRIZIONE > 3 THEN
    --Se � vero , genera un errore
        RAISE_APPLICATION_ERROR(-20005, 'La durata della prescrizione per una visita pediatrica non pu� superare i 3 mesi.');
    END IF;
END;
