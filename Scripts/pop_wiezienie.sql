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




/** POKOJE **/
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj naczelnika', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Kuchnia', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Kotłownia', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Piwnica', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj naczelnika', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Kuchnia', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Kotłownia', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Piwnica', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj naczelnika', 3);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 3);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 3);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj strazniczy', 3);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Kuchnia', 3);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Piwnica', 3);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj lekarski', 1);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj lekarski', 2);
INSERT INTO wiezienie.pokoj VALUES(DEFAULT, 'Pokoj lekarski', 3);

/** PRZYDZIAL DEPOZYTOW**/
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt naczelnika', 1,10);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt naczelnika', 7,10);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt naczelnika', 13,10);

INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt strazniczy', 2,1);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt strazniczy', 3,3);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt kuchenny', 4,6);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt lekarski', 19,4);

INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt strazniczy', 8,1);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt strazniczy', 9,3);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt kuchenny', 10,6);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt lekarski', 20, 4);

INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt strazniczy', 14,1);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt strazniczy', 15,3);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt kuchenny', 17,6);
INSERT INTO wiezienie.depozyt VALUES(DEFAULT, 'Depozyt lekarski', 21 ,4);

/** PRACOWNICY **/

/*Naczelnicy*/
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Jan', 'Kowalski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 1, 1, 1);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Anna', 'Kowal');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 1, 2, 7);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Adam', 'Nowak');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 1, 3, 13);

/*Straznicy*/
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Karol', 'Karolski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 4, 2);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Jan', 'Janowski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 5, 2);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Wojciech', 'Wojtanowicz');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 6, 3);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Zbigniew', 'Zibi');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 7, 8);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Andrzej', 'Andrzejski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 8, 9);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Grzegorz', 'Gregorianski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 9, 14);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Florian', 'Florianski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 10, 15);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Adam', 'Adamski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 11, 16);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Mariusz', 'Pudzianowski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 2, 12, 16);

/*Lekarze*/
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Anna', 'Chaber');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 3, 13, 19);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Zdzislaw', 'Religa');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 3, 14, 20);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Tomasz', 'Komenda');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 3, 15, 21);

/*Zespol pielegniarski*/
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Anna', 'Annowicz');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 4, 16, 19);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Janina', 'Janek');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 4, 17, 20);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Halina', 'Halinowicz');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 4, 18, 21);

/*Zespol gatronomiczny*/
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Gordon', 'Gordonowicz');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 5, 19, 4);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Pedro', 'Pascal');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 5, 20, 10);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Karol', 'Amaro');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 5, 21, 17);

/*Zespol sprzatajacy*/
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Jan', 'Niezbedny');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 6, 22, 5);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Andrzej', 'Niebylski');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 6, 23, 5);
INSERT INTO wiezienie.pracownik VALUES(DEFAULT, 'Alutka', 'Lutowicz');
INSERT INTO wiezienie.pracownik_info VALUES(DEFAULT, 6, 24, 11);

/** Wiezniowie **/

INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Tomasz', 'Karolak', '88051032171');
INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Hans', 'Landa', '20050225312');
INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Józef', 'Fritzl', '16211029712');
INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Andreas', 'Breivik', '98030606879');
INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Wojciech', 'Jaruzelski', '31030115774');
INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Jaroslaw', 'Kaczkowski', '87062616372');
INSERT INTO wiezienie.wiezien VALUES(DEFAULT, 'Jan', 'Paweł', '75082525611');