
CREATE USER amministratoreOttiglass IDENTIFIED BY OptiVision;

GRANT CREATE ANY VIEW TO amministratoreOttiglass;

GRANT CREATE ANY PROCEDURE TO amministratoreOttiglass;

-- Assegnazione dei privilegi all'utente amministratore
GRANT ALL PRIVILEGES TO amministratoreOttiglass;


-- Creazione dell'utente impiegato del reparto vendite
CREATE USER impiegato_vendite IDENTIFIED BY reparto_vendite;

-- Assegnazione dei privilegi all'utente impiegato del reparto vendite
GRANT SELECT, INSERT, UPDATE ON Fornitura TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON Fornitura_Industriale TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON Prodotto_industriale TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON ordine TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON Cliente TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON Prenotazione TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON Consegna TO impiegato_vendite;

GRANT SELECT, INSERT, UPDATE ON corriere TO impiegato_vendite;

GRANT EXECUTE ON Nuova_Consegna TO impiegato_vendite;

GRANT EXECUTE ON Info_Prodotto TO impiegato_vendite;

GRANT SELECT ON Vista_Consegne_Per_Cliente TO impiegato_vendite;

GRANT SELECT ON Vista_Corrieri_e_Consegne TO impiegato_vendite;

GRANT SELECT ON Vista_Ordini_Per_Cliente TO impiegato_vendite;

GRANT SELECT ON Vista_Prenotazioni_e_Visite TO impiegato_vendite;

GRANT EXECUTE ON Assegna_Turno TO impiegato_vendite;

GRANT EXECUTE ON Disponibilita_Corriere TO impiegato_vendite;



-- Creazione dell'utente impiegato del reparto laboratorio
CREATE USER impiegato_laboratorio IDENTIFIED BY reparto_laboratorio;



-- Assegnazione dei privilegi all'utente impiegato del reparto laboratorio
GRANT SELECT, INSERT, UPDATE ON Fornitura TO impiegato_laboratorio;

GRANT SELECT, INSERT, UPDATE ON Fornitura_Lenti TO impiegato_laboratorio;

GRANT SELECT, INSERT, UPDATE ON Lente_Finita TO impiegato_laboratorio;

GRANT SELECT ON Cliente TO impiegato_laboratorio;

GRANT SELECT, INSERT, UPDATE ON Visita_oculistica TO impiegato_laboratorio;

GRANT SELECT, INSERT, UPDATE ON Prescrizione TO impiegato_laboratorio;

GRANT SELECT, INSERT, UPDATE ON Condizione_visiva TO impiegato_laboratorio;

GRANT EXECUTE ON Info_Prodotto TO impiegato_laboratorio;

GRANT EXECUTE ON VISUALIZZA_DATA_VISITA TO impiegato_laboratorio;

GRANT EXECUTE ON RICETTA_PRESCRIZIONE TO impiegato_laboratorio;

GRANT SELECT ON Vista_Prenotazioni_e_Visite TO impiegato_laboratorio;



--Creazione dell'utente oculista 
CREATE USER oculista IDENTIFIED BY user_oculista;




--Assegnazione dei privilegi all'utente oculista
GRANT SELECT, INSERT, UPDATE ON Visita_oculistica TO oculista;

GRANT SELECT, INSERT, UPDATE  ON Prescrizione TO oculista;

GRANT SELECT, INSERT, UPDATE ON Condizione_visiva TO oculista;

GRANT EXECUTE ON RICETTA_PRESCRIZIONE TO oculista;

GRANT EXECUTE ON VISUALIZZA_DATA_VISITA TO oculista;

GRANT SELECT ON Vista_Prenotazioni_e_Visite TO oculista;


--Creazione dell'utente Cliente
CREATE USER opticlient IDENTIFIED BY clientottica;


--Assegnazione dei privilegi all'utente cliente
GRANT EXECUTE ON VISUALIZZA_DATA_VISITA TO opticlient;

GRANT EXECUTE ON RICETTA_PRESCRIZIONE TO opticlient;