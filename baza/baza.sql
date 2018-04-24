-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Gostitelj: localhost
-- Čas nastanka: 24. apr 2018 ob 14.46
-- Različica strežnika: 5.6.13
-- Različica PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Zbirka podatkov: `baza`
--
CREATE DATABASE IF NOT EXISTS `baza` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `baza`;

-- --------------------------------------------------------

--
-- Struktura tabele `naloge`
--

CREATE TABLE IF NOT EXISTS `naloge` (
  `idnaloge` int(11) NOT NULL AUTO_INCREMENT,
  `navodila` varchar(1000) DEFAULT NULL,
  `pike` int(11) DEFAULT NULL,
  `tipNaloge` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idnaloge`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Odloži podatke za tabelo `naloge`
--

INSERT INTO `naloge` (`idnaloge`, `navodila`, `pike`, `tipNaloge`) VALUES
(1, 'Napišite funkcijo izbrisiSAM(niz), ki vrne vhodni niz brez samoglasnikov.', 5, 'nizi'),
(2, 'Napišite metodo kolikoDeliteljev(N), ki izpiše koliko deliteljev ima število ki je vhodna spremenljivka.', 5, 'stevila'),
(3, 'Napišite metodo TOP3stevila(seznam), ki prejme kot vhodno spremenljivko poljuben seznam, ki vsebuje cela števila. Metoda pa naj izpiše 3 največja števila v seznamu ločena z vejicami. primer izpisa: ->111,44,20', 5, 'seznami'),
(4, 'Napišite metodo prestejCrke(NIZ), ki prejme kot vhodno spremenljivko neko besedo izpiše pa ali beseda vsebuje več soglasnikov ali samoglasnikov.', 5, 'nizi'),
(5, 'Napiši podprogram odstraniDvojneZnake(zacetniNiz), ki prejme kot vhodno spremenljivko niz, \r\nkjer je vsak znak zaporedoma dvojno zapisan. \r\nPodprogram pa odstrani dvojno pojavitev znaka na spodnji način.\r\nPrimer:\r\nzacetniNiz: ''aavvttoo'' izpis: '' avto''\r\n', 5, 'nizi'),
(6, 'Napišite metodo alijeHarshadovo(N), ki prejme kot vhodno število poljubno naravno število N, metoda pa vrne True, če je vhodno število Harshadovo, sicer vrne False. Harshadovo število je celo število, ki je deljivo z vsoto svojih števk.', 5, 'stevila'),
(7, 'Napišite rekurzivno metodo najvecjeStevilo(seznam), ki prejme kot vhodno spremenljivko poljuben seznam, ki vsebuje cela števila, metoda pa rekurzivno poišče največjega.', 5, 'seznami'),
(8, 'Napišite metodo mediana(seznam), ki prejme kot vhodno spremenljivko poljuben seznam, metoda pa vrne sredinsko število (tisto, ki je na sredini urejenega seznama). Če je seznam sode dolžine, potem je mediana povprečna vrednost dveh sredinskih elementov. Uporaba vnaprej definiranih funkcij NI dovoljena.\r\nPrimer: [5,4,1,2,3]->mediana=3\r\nPrimer 2:[4,1,2,5,6,4]->mediana=(4+4)/2=4', 5, 'seznami'),
(9, 'Napišite metodo kolikoSemStar(niz), ki prejme kot vhodno spremenljivko niz/besedilo oblike "MM-LLLL" in izračuna ter izpiše, koliko let in mesecev je stara oseba, ki je vnesla podatek. Predpostavimo, da bo uporabnik poklical podprogram v trenutnem mesecu in letu(April 2018) za izračun starosti.\r\nKolikoSemStar(09-1987) izpis: "Stari ste: 30 let in 7 mesecev".', 5, 'nizi'),
(10, 'Napišite metodo sestejStevke(stevilo), ki toliko časa sešteva števke (novonastalega števila), dokler vsota ni manjša od števila 10.\r\nPrimer: 99999995->68->14->5', 5, 'stevila'),
(11, 'Napišite metodo kolikoPrastevil(N), ki izpiše število praštevil med 1 in N številom.', 5, 'stevila'),
(12, 'Napiši podprogram najdiCrkePodniza(niz1,niz2), ki dobi niza niz1 in niz2 ter izpiše\r\nspremenjeno različico niza niz1, v katerem so nekateri znaki spremenjeni v ''-'' tako, da\r\npreostali znaki, ki niso zamenjani z ''-'' , tvorijo niz2. Predpostavimo lahko, da se vsi znaki\r\nniza niz2 zagotovo nahajajo v niz1\r\n\r\nPrimer:niz2: ''dol z vlado''\r\nniz1:  ''še  dobro,  da  lahko  z  volitvami  vplivamo  na  dobrobit  naroda'' izpis:  ''---do--------l----  z  v-l---a---------------do-------------''\r\n', 5, 'nizi'),
(13, 'Napišite metodo manjkajoceStevilo(besedilo), ki prejme kot vhodno spremenljivko besedilo,ki vsebuje števila ločena z vezajem("-"). Metoda pa naj izpiše vsa števila, hkrati pa še tista, ki manjkajo in sicer v oklepajih. Predpostavite lahko, da so vsa števila, ki jih vsebuje niz, manjša od 100.\r\nprimer: Vhodni niz: "4-5-6-7-9-10-11-17-18" izpis-> 4\r\n5\r\n6\r\n7\r\n(8)\r\n9\r\n10\r\n11\r\n(12)\r\n(13)\r\n(14)\r\n(15)\r\n(16)\r\n17\r\n18', 5, 'stevila'),
(14, 'NApNapišite metodo fakulteta, ki izračuna zmnožek prvih N števil (od 1 do N).\r\nprimer: N=5, 1*2*3*4*5=120', 5, 'stevila'),
(15, 'Napišite metodo zdrzuCrke(beseda), ki prejme kot vhodno spremenljivko besedo, izpiše pa besedo, in sicer tako da so na začetku samoglasniki, nato pa še soglasniki.\r\nPrimer: lociCrke("samokolnica") -> "aooiacnlkms"', 5, 'nizi'),
(16, 'Napišite lastno metodo zdruziCrkeNiza(beseda), ki prejme kot vhodno spremenljivko besede, pri kateri so na začetku samoglasniki nato pa soglasniki. Metoda izpiše novo besedo tako, da izmenično dodaja soglasnike (vzame od zadaj) in soglasnike (vzame od spredaj). Predpostavimo, da je enako število soglasnikov in samoglasnikov.\r\nPrimer: zdruziCrke(''ooatmp'')-> "pomota"', 5, 'nizi'),
(17, 'Napišite metodo operacijaMnozenja(M,N), samo z uporabo operacije seštevanja\r\nPrimer: M=5 N=3. Število m sešteje N krat: 5+5+5=15', 5, 'stevila'),
(18, 'NApišite metodo zlij(niz1,niz2), ki izpiše niz, ki vsebuje izmenične znake dveh nizov. Primer:\r\nniz1=lipa\r\nniz2=vrba\r\nizpis-> lvirpbaa', 5, 'nizi'),
(19, 'Napisite metodo najmanjsiskupniveckratnik, ki poisce najmanjsi skupni veckratnik izmed dveh unesenih števil.\r\nPrimer: A=21 B=14 metoda izpiše vrednost 105.', 5, 'stevila'),
(20, 'Napišite metodo dodajObrat(niz), ki nizu doda na konec njegovo obrnjeno različico.\r\nPrimer: niz="avto", izpis->"avtootva"', 5, 'nizi'),
(21, 'napišite metodo izbrisisog(niz), ki izpiše vhodni niz brez soglasnikov.', 5, 'nizi');

-- --------------------------------------------------------

--
-- Struktura tabele `resitve`
--

CREATE TABLE IF NOT EXISTS `resitve` (
  `idNaloge` int(11) NOT NULL,
  `vnos1` varchar(100) NOT NULL,
  `resitev1` varchar(100) NOT NULL,
  `vnos2` varchar(100) NOT NULL,
  `resitev2` varchar(100) NOT NULL,
  `vnos3` varchar(100) NOT NULL,
  `resitev3` varchar(100) NOT NULL,
  `vnos4` varchar(100) NOT NULL,
  `resitev4` varchar(100) NOT NULL,
  `vnos5` varchar(100) NOT NULL,
  `resitev5` varchar(100) NOT NULL,
  UNIQUE KEY `idNaloge` (`idNaloge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Odloži podatke za tabelo `resitve`
--

INSERT INTO `resitve` (`idNaloge`, `vnos1`, `resitev1`, `vnos2`, `resitev2`, `vnos3`, `resitev3`, `vnos4`, `resitev4`, `vnos5`, `resitev5`) VALUES
(1, '"rokrokaaa"', 'rkrk', '"rad programiram"', 'rd prgrmrm', '"we are gods"', 'w r gds', '"testiram nalogo"', 'tstrm nlg', '"mislim de dela"', 'mslm d dl'),
(2, '6', '4', '10', '4', '12', '6', '1', '1', '7', '2'),
(3, '[11,25,44,89,45,77,88,66]', '89,88,77', '[111,145,999,785,444]', '999,785,444', '[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]', '25,24,23', '[55,44,66,77,11,22,33,99,1]', '99,77,66', '[0,0,0,0,11,55,44,88]', '88,55,44'),
(4, '"ratatataaaaa"', 'samoglasniki', '"ttttttrttttattttetttittt"', 'soglasniki', '"avtorja"', 'soglasniki', '"testiramo"', 'soglasniki', '"šerakurok"', 'soglasniki'),
(5, '"aavvttoo"', 'avto', '"tteesstt"', 'test', '"rraakkeettaa"', 'raketa', '"ssttppss"', 'stps', '"ssaammookkoollnniiccaa"', 'samokolnica'),
(6, '10', '"true"', '20', '"true"', '23', '"false"', '60', '"true"', '91', '"false"'),
(7, '[11,44,55,88,34,67,187,5,0]', '187', '[1,2,3,4,5,6,7,8,9,10,0]', '10', '[44,55,22,66,11,2,0]', '66', '[0,1,0,1,0,1,0,1]', '1', '[55,66,0,0,0,55,100]', '100'),
(8, '[4,1,2,5,6,4]', '4', '[1,8,4,64,32]', '8', '[100,64,82,73,0]', '73', '[15,10,73,21,85,84]', '47', '[0,0,0,1,0,0,25,0]', '0'),
(9, '"09-1987"', '30 let in 7 mesecev', '"01-1999"', '19 let in 3 mesecev', '"10-1999"', '18 let in 6 mesecev', '"02-1999"', '19 let in 2 mesecev', '"01-1879"', '139 let in 3 mesecev'),
(10, '99999995', '5', '123456789', '9', '1005099', '6', '999910', '1', '887165', '8'),
(11, '10', '4', '15', '6', '20', '8', '24', '9', '50', '15'),
(12, '"dol z vlado","še  dobro,  da  lahko  z  volitvami  vplivamo  na  dobrobit  naroda"', '---do--------l----  z  v-l---a---------------do-------------', '"roki","rakov krakov ime"', 'r--o--k------i--', '"test","testiramo"', 'test-----', '"cirkus","rattatat afro cir rattat kus tatatat"', '--------------cir--------kus--------', '"dela","doma milka milke la"', 'd--------------e-la'),
(13, '"4-5-6-7-9-10-11-17-18"', '"4,5,6,7,(8),9,10,11,(12),(13),(14),(15),(16),17,18"', '"1-5"', '"1,(2),(3),(4),5"', '"1-4-8"', '"1,(2),(3),4,(5),(6),(7),8"', '"8-10-11-14-15"', '"8,(9),10,11,(12),(13),14,15"', '"1-2-5"', '"1,2,(3),(4),5"'),
(14, '5', '120', '10', '3628800', '7', '5040', '1', '1', '3', '6'),
(15, '"samokolnica"', 'aooiacnlkms', '"rok"', 'ork', '"zan"', 'azn', '"test"', 'etst', '"kolo"', 'ookl'),
(16, '"ootmp"', 'pomota', '"oakr"', 'roka', '"iazm"', 'miza', '"oagn"', 'noga', '"aanp"', 'pana'),
(17, '5,3', '15', '10,6', '60', '7,8', '56', '1,1', '1', '1,15', '15'),
(18, '"lipa","vrba"', 'lvirpbaa', '"klovn","hiska"', 'khliosvkna', '"test","test"', 'tteesstt', '"rat","tar"', 'rtaatr', '"rok","zan"', 'rzoakn'),
(19, '21,15', '105', '25,5', '25', '33,4\r\n', '132', '3,9', '9', '12,6', '12'),
(20, '"avto"', 'avtootva', '"raca"', 'racaacar', '"test"', 'testtset', '"seraku"', 'serakuukares', '"minimal"', 'minimallaminim'),
(21, '"avto"', 'ao', '"banana"', 'bnn', '"rok"', 'rk', '"zan"', 'zn', '"test"', 'tst');

-- --------------------------------------------------------

--
-- Struktura tabele `testi1`
--

CREATE TABLE IF NOT EXISTS `testi1` (
  `idTesta` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(500) NOT NULL,
  `navodila1` varchar(500) NOT NULL,
  `koda1` varchar(500) NOT NULL,
  `navodila2` varchar(500) NOT NULL,
  `koda2` varchar(500) NOT NULL,
  `navodila3` varchar(500) NOT NULL,
  `koda3` varchar(500) NOT NULL,
  `navodila4` varchar(500) NOT NULL,
  `koda4` varchar(500) NOT NULL,
  PRIMARY KEY (`idTesta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Odloži podatke za tabelo `testi1`
--

INSERT INTO `testi1` (`idTesta`, `user`, `navodila1`, `koda1`, `navodila2`, `koda2`, `navodila3`, `koda3`, `navodila4`, `koda4`) VALUES
(1, 'rok', '19', 'def najmanjsi(a,b):\n    st = 1\n    while(st % a != 0 or st % b != 0):\n        st+=1\n    print(st)\n\nnajmanjsi(21,14)', '4', 'def prestej(n):\n    sam = 0\n    sog = 0\n    for i in range(len(n)):\n        if(n[i] in "aeiuo"):\n            sam++\n        else:\n            sog++\n    if(sam >= sog):\n        print("vec soglasnikov")\n    else:\n        print("vec soglasnikov")\nprestej("beseda")', '13', 'def nalog(n):\n    print("10, 20")\n    \nnalog(n)', '16', 'def naloga(n):\n    print("pomota")\n    \nnaloga(n)'),
(2, 'rok', '18', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")', '5', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")', '1', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")', '4', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")'),
(3, 'zan', '19', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")', '13', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")', '11', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")', '8', 'def zlij(n1, n2):\n    niz = ""\n    for i in range(len(n1)):\n        niz += n1[i] + n2[i]\n    print(niz)\n    \nzlij("lipa", "vrba")'),
(4, 'zan', '11', 'def pras(n):\n    st = 0\n    for i in range(1,n+1):\n        st1 = 0\n        for j in range(1,i+1):\n            if(i % j == 0):\n                st1+=1\n        if(st1 == 2):\n            st+=1\n    print(st)\n    \npras(97)', '7', 'def pras(n):\n    st = 0\n    for i in range(1,n+1):\n        st1 = 0\n        for j in range(1,i+1):\n            if(i % j == 0):\n                st1+=1\n        if(st1 == 2):\n            st+=1\n    print(st)\n    \npras(97)', '18', 'def pras(n):\n    st = 0\n    for i in range(1,n+1):\n        st1 = 0\n        for j in range(1,i+1):\n            if(i % j == 0):\n                st1+=1\n        if(st1 == 2):\n            st+=1\n    print(st)\n    \npras(97)', '20', 'def pras(n):\n    st = 0\n    for i in range(1,n+1):\n        st1 = 0\n        for j in range(1,i+1):\n            if(i % j == 0):\n                st1+=1\n        if(st1 == 2):\n            st+=1\n    print(st)\n    \npras(97)');

-- --------------------------------------------------------

--
-- Struktura tabele `tocke`
--

CREATE TABLE IF NOT EXISTS `tocke` (
  `idTocke` int(11) NOT NULL AUTO_INCREMENT,
  `naloga1` double NOT NULL,
  `naloga2` double NOT NULL,
  `naloga3` double NOT NULL,
  `naloga4` double NOT NULL,
  `idTesta` int(11) NOT NULL,
  PRIMARY KEY (`idTocke`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Odloži podatke za tabelo `tocke`
--

INSERT INTO `tocke` (`idTocke`, `naloga1`, `naloga2`, `naloga3`, `naloga4`, `idTesta`) VALUES
(1, 1, 0, 0, 0, 36),
(2, 1, 0, 0, 0, 37),
(3, 0, 0, 0, 0, 38),
(4, 0, 0, 0, 0, 39),
(5, 0, 0, 0, 0, 40),
(6, 0, 0, 0, 0, 41),
(7, 0, 0, 0, 0, 42),
(8, 0, 0, 0, 0, 43),
(9, 0, 1, 0, 0, 44),
(10, 0, 0, 0, 0, 45),
(11, 0, 4, 0, 0, 46),
(12, 0, 0, 0, 0, 47),
(13, 5, 0, 0, 1, 1),
(14, 5, 0, 0, 0, 2),
(15, 0, 0, 0, 0, 3),
(16, 5, 0, 0, 0, 4);

-- --------------------------------------------------------

--
-- Struktura tabele `uporabniki`
--

CREATE TABLE IF NOT EXISTS `uporabniki` (
  `iduporabniki` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iduporabniki`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Odloži podatke za tabelo `uporabniki`
--

INSERT INTO `uporabniki` (`iduporabniki`, `username`, `password`) VALUES
(12, 'admin', 'admin'),
(13, 'rok', 'rok'),
(14, 'zan', 'zan');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
