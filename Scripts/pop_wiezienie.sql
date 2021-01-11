/****  WYPELNIENIE BAZY DANYMI PODSTAWOWYMI ****/

/* TRZY SEGMENTY Z ROZNYMI NACZELNIKAMI */
INSERT INTO wiezienie.segment VALUES (DEFAULT, 'Segment Zenski', 2);
INSERT INTO wiezienie.segment VALUES (DEFAULT, 'Segment Meski', 1);
INSERT INTO wiezienie.segment VALUES (DEFAULT, 'Segment o zaostrzonym rygorze', 3);

/* CELE */
    /*Segment męski*/
INSERT INTO wiezienie.cela VALUES (DEFAULT, 100, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 101, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 102, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 103, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 104, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 105, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 106, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 107, 2, 1, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 108, 2, 1, 'Cela zwykla');

INSERT INTO wiezienie.cela VALUES (DEFAULT, 109, 1, 1, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 110, 1, 1, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 111, 1, 1, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 112, 1, 1, 'Izolatka');

    /*Segment żeński*/
INSERT INTO wiezienie.cela VALUES (DEFAULT, 200, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 201, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 202, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 203, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 204, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 205, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 206, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 207, 2, 2, 'Cela zwykla');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 208, 2, 2, 'Cela zwykla');

INSERT INTO wiezienie.cela VALUES (DEFAULT, 209, 1, 2, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 210, 1, 2, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 211, 1, 2, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 212, 1, 2, 'Izolatka');

    /*Segment o zaostrzonym rygorze*/
INSERT INTO wiezienie.cela VALUES (DEFAULT, 300, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 301, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 302, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 303, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 304, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 305, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 306, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 307, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 308, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 309, 1, 3, 'Izolatka');
INSERT INTO wiezienie.cela VALUES (DEFAULT, 310, 1, 3, 'Izolatka');

/** ZASOBY WIEZIENNE **/
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Kajdanki', 500);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Kaftan bezpieczenstwa', 54);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Mundur strażniczy', 40);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Gaz lzawiacy', 42);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Buty', 30);

INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Woda butla', 500);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Ryz karton', 600);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Tusza cieleca kg', 60);
INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Przyprawy', 32);

INSERT INTO wiezienie.zasoby VALUES (DEFAULT, 'Akta', 500);


/** ZAWODY **/
INSERT INTO wiezienie.zawod VALUES(DEFAULT, 'Naczelnik');
INSERT INTO wiezienie.zawod VALUES(DEFAULT, 'Straznik');
INSERT INTO wiezienie.zawod VALUES(DEFAULT, 'Lekarz');
INSERT INTO wiezienie.zawod VALUES(DEFAULT, 'Personel pielegniarski');
INSERT INTO wiezienie.zawod VALUES(DEFAULT, 'Personel gastronomiczny');
INSERT INTO wiezienie.zawod VALUES(DEFAULT, 'Personel sprzatajacy');

/** DEPOZYT **/
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob naczelnika', 10);

INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob strazniczy', 1);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob strazniczy', 2);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob strazniczy', 3);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob strazniczy', 4);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob strazniczy', 5);

INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob kuchenny', 6);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob kuchenny', 7);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob kuchenny', 8);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Zasob kuchenny', 9);

