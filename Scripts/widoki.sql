
/*SPIS WSZYSTKICH WIEZNIOW Z WYROKIEM (imie, nazwisko, wyrok) */
CREATE VIEW wszyscy_wiezniowie AS SELECT w.imie, w.nazwisko, wy.nazwa_wyroku as wyrok FROM 
wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia and wi.id_wyroku = wy.id_wyroku;

/*SPIS WIEZNIOW Z DOZYWOTNIM WYROKIEM (imie, nazwisko, wyrok) */
CREATE VIEW dozywotni_wiezniowie AS SELECT w.imie, w.nazwisko, wy.nazwa_wyroku as wyrok FROM 
wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia and wi.id_wyroku = wy.id_wyroku and wy.data_zakonczenia IS NULL;

/*SPIS PRACOWNIKOW (imie, naziwsko, zawod, pokoj, segment) */
CREATE VIEW wszyscy_pracownicy AS SELECT p.imie, p.nazwisko, z.nazwa as zawod, po.nazwa_pokoju as pokoj, s.nazwa_segmentu as segment FROM
wiezienie.pracownik p, wiezienie.pracownik_info pi, wiezienie.zawod z, wiezienie.pokoj po, wiezienie.segment s WHERE
p.id_pracownika = pi.id_pracownika and pi.id_zawodu = z.id_zawodu and pi.id_pokoju = po.id_pokoju and po.id_segmentu = s.id_segmentu
ORDER BY s.id_segmentu;

/*SPIS RZECZY NALEZACYCH DO WIEZNIOW (imie, naziwsko, nazwa przedmiotu, ilość) */
CREATE VIEW depozyt_wiezniow AS SELECT  w.imie, w.nazwisko, z.nazwa, z.ilosc FROM wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.depozyt d, wiezienie.zasoby z WHERE
w.id_wieznia = wi.id_wieznia AND wi.id_depozytu = d.id_depozytu AND d.id_zasobu = z.id_zasobu;

/*SPIS DOSTEPNYCH CEL (numer celi, ilośc dostępnych miejsc, typ celi, nazwa segmentu) */
CREATE VIEW wszystkie_dostepne_cele AS SELECT c.nr_celi, c.ilosc_miejsc, c.typ_celi, s.nazwa_segmentu FROM wiezienie.cela c, wiezienie.segment s WHERE 
c.ilosc_miejsc > 0 AND c.id_segmentu = s.id_segmentu ORDER BY c.nr_celi;

/*SPIS POKOI (numer pokoju, nazwa pokoju, nazwa segmentu)*/
CREATE VIEW wszystkie_pokoje AS SELECT p.nr_pokoju, p.nazwa_pokoju, s.nazwa_segmentu FROM wiezienie.pokoj p, wiezienie.segment s WHERE 
p.id_segmentu = s.id_segmentu ORDER BY p.nr_pokoju;

/*SPIS POKOI Z DEPOZYTEM* (numer pokoju, nazwa pokoju, typ depozytu, nazwa przedmiotu, ilość)*/
CREATE VIEW wszystkie_pokoje_depozyt AS SELECT p.nr_pokoju, p.nazwa_pokoju, d.nazwa as typ_depozytu , z.nazwa as zasob, z.ilosc FROM wiezienie.pokoj p, wiezienie.depozyt d, wiezienie.zasoby z WHERE
p.id_pokoju = d.id_pokoju AND d.id_zasobu = z.id_zasobu ORDER BY p.nr_pokoju;

/* SPIS WIEZNIOW Z POZOSTALYM WYROKIEM - nie obejmuje więźniów z dożywotnim wyrokiem (imie, nazwisko, data zakończenia wyroku) */
CREATE VIEW wiezniowie_wyrok AS SELECT w.imie, w.nazwisko, wy.data_zakonczenia FROM wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.wyrok wy WHERE
w.id_wieznia = wi.id_wieznia AND wi.id_wyroku = wy.id_wyroku AND wy.data_zakonczenia IS NOT NULL ORDER BY wy.data_zakonczenia;

/*SPIS WIEZNIOW WRAZ Z CELAMI (imie, nazwisko, numer celi, nazwa segmentu)*/
CREATE VIEW wiezniowie_cele AS SELECT w.imie, w.nazwisko, c.nr_celi, s.nazwa_segmentu FROM wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.cela c , wiezienie.segment s WHERE
w.id_wieznia = wi.id_wieznia AND wi.id_celi = c.id_celi AND c.id_segmentu = s.id_segmentu ORDER BY c.nr_celi;

/*SPIS DEPOZYTU WIEZNIOW WRAZ Z POKOJAMI W KTORYCH SIE ZNAJDUJE (imie, nazwisko, nazwa przedmiotu, numer pokoju)*/
CREATE VIEW wiezniowie_depozyt_pokoj AS SELECT w.imie, w.nazwisko, z.nazwa, p.nr_pokoju FROM wiezienie.wiezien w, wiezienie.wiezien_info wi, wiezienie.pokoj p, wiezienie.depozyt d, wiezienie.zasoby z WHERE
w.id_wieznia = wi.id_wieznia AND wi.id_depozytu = d.id_depozytu AND d.id_pokoju = p.id_pokoju AND d.id_zasobu = z.id_zasobu ORDER BY p.nr_pokoju;