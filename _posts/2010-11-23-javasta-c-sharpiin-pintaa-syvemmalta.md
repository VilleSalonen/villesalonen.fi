---
layout: post
title:  "Javasta C#:iin: Erot pintaa syvemmältä (In Finnish)"
date:   2010-11-23
---

<em>Tämä essee on kirjoitettu alunperin Jyväskylän yliopiston Ohjelmointikielten periaatteet -kurssille. Päätin julkaista sen myös täällä sivuillani, ettei essee jää vain kurssinjärjestäjän pöytälaatikkoon pölyttymään.</em>

<em><strong>PÄIVITYS:</strong> Nyt sivuillani on julkaistu myös kandidaatintutkielmani <a href="/2011/03/21/javasta-c-sharpiin/"><strong>Javasta C#:iin</strong></a>.</em>

## Johdanto

Sain Vesa Lappalaiselta aiheeksi kandidaatintutkielmalleni Javan ja C#:in erojen selvittämisen. Koska tutkielman tarkoituksena oli kattaa suurin osa tavallisessa käytössä vastaan tulevista eroista, ei mihinkään yhteen tai muutamaan aiheeseen voinut tutustua erityisen tarkasti. Niinpä Ohjelmointikielten periaatteet -kurssin esseen aihetta miettiessä ajatukseni palasivat Javan ja C#:in pariin.

Esseessäni aion perehtyä neljään minua kiinnostavaan aiheeseen:

  * Anonyymit funktiot ja delegaatit. Javassa lähes kaikki ovat olioita. Tästä johtuen yksittäisten funktioiden antaminen esimerkiksi järjestelijäoliollle ei onnistu suoraan, vaan funktio on paketoitava olion metodiksi. Miksi näin on? Onko tästä etua suoritusteholle, virtuaalikoneen toteutukselle vai onko kyse vain huonosta suunnittelusta?
  * C#:in yhtenäinen tyyppijärjestelmä. Kaikki ovat C#:issa olioita: myöskin kokonais- ja liukuluvut. Javassa kokonaisluvuille on olemassa primitiivityyppi int ja oliotyyppi Integer. Tämä aiheuttaa ongelmaa esimerkiksi listoja käsitellessä, koska listat ottavat alkioikseen vain olioita, joten int-tyyppiset kokonaisluvut on paketoitava jälleen olion sisään. Miksi näin on? Häviääkö C#:in toteutusratkaisu Javalle nopeudessa?
  * Operaattoreiden ylikuormitus. Javaan ei haluttu toteuttaa operaattoreiden ylikuormitusta C++:n kanssa ilmenneiden ongelmien takia. Oliko tämä pelko perusteltua? Ilmenevätkö C++:n ongelmat myös C#:ssa?
  * Javassa poikkeuksia on kahdenlaisia: tarkistettavia ja ajonaikaisia. C#:ssa kaikki poikkeukset ovat ajonaikaisia. Mitä tämä tarkoittaa? Onko kahdenlaisista poikkeuksista hyötyä?

Tavoitteenani on, että tämä essee toimisi erinomaisena jatkoluettavana kandidaatintutkielmalleni niille, jotka haluavat perehtyä vielä tarkemmin kielten välisiin eroihin. Kandidaatintutkielma on pituudeltaan rajoitettu sellaiseksi, ettei kaikkia yksityiskohtia ole mielekästäkään käsitellä. Lisäksi käytän työelämässäni C#:ia, joten lisätutustuminen kyseiseen kieleen auttaa sekä akateemisia että työelämän tavoitteitani.

## Delegaatit ja anonyymit funktiot

Anonyymit funktiot ovat funktioita, joille ei ole määritetty tunnistetta. Anonyymit funktiot eivät ole uusi keksintö, vaan Alonzo Church esitteli ne jo 1936 kehittäessään lambda-laskennan, jossa kaikki laskenta tehdään anonyymeillä funktioilla. Ohjelmointikielissä anonyymejä funktioita käytetään etenkin funktionaalisissa ohjelmointikielissä, mutta ne löytyvät myös esimerkiksi C#:ista ja JavaScriptistä. Java ei niitä tosin tue.

Ennen kuin perehdyn tarkemmin syihin, miksi C# tukee anonyymejä funktioita ja Java ei, on hyvä pysähtyä miettimään hetkeksi, miksi kukaan haluaisi käyttää anonyymejä funktioita moderneissa olio-ohjelmointikielissä. Esimerkiksi kokoelmien alkioiden suodattaminen ja järjestäminen on usein kätevää tehdä anonyymillä funktiolla. Javassa nykyisen käytännön mukaisesti järjestäminen muuhun kuin olioiden luonnolliseen järjestykseen hoidetaan tekemällä funktio-olio eli niin sanottu funktori, joka toteuttaa Comparator<T>-rajapinnan vaatiman järjestysmetodin. Funktori annetaan edelleen staattiselle Collections.sort-metodille, joka lopulta hoitaa järjestämisen. Mielestäni tämä kuitenkin katkaisee ikävästi luontevan ohjelmointivauhdin ja pakottaa ohjelmoijan hyppäämään päässään toiselle abstraktiotasolle. Lisäksi mielestäni funktiot, jotka tekevät usean eri abstraktiotason tehtäviä, pyrkivät piilottamaan funktion varsinaisen tarkoituksen. Kyse ei ole siis vain tarpeettomasta kosmeettisesta kikkailusta, vaan anonyymeille funktioille pystyy mielestäni tekemään selkeästi luettavampaa ohjelmakoodia.

Javassa metodiin viittaminen ei onnistu, koska kaikki muuttujat ovat joko arvomuuttujia, jotka siis sisältävät suoraan esimerkiksi kokonaisluvun, tai viitemuuttujia, jotka voivat sisältää ainoastaan viitteitä olioihin, jotka ovat luokka-, rajapinta- tai taulukkotyyppisiä [1]. Suora viittaaminen metodiin ei siis ole mahdollinen. Alunperin Java 7 -versioon oli tarkoitus tuoda tuki anonyymeille funktioille, mutta tämän toteuttaminen lykättiin versioon 8 tai myöhempään [2].

C#:ssa viitemuuttujat voivat sisältää viitteitä olioihin, jotka ovat luokka-, rajapinta- tai delegaattityyppisiä. (Erillistä taulukkotyyppistä oliota ei C#:ssa ole, koska kaikki taulukot perivät yhteisestä abstraktista kantaluokasta System.Array [3].)

Delegaatti on viitetyyppi, joka voi viitata yhteen tai useampaan nimettyyn tai anonyymiin funktioon. Ne muistuttavat osittain C:n ja C++:n funktio-osoittimia, mutta niistä poiketen ne ovat tyyppiturvallisia. [4]

Jos ohjelmoija on käyttänyt pelkästään esimerkiksi Javaa, ei hän ole välttämättä osannut edes kaivata mitään tapaa viitata suoraan funktioihin tai esitellä niitä ilman anonyymin luokan vaatimaa byrokratiaa. Omasta mielestäni funktiot ovat kuitenkin erittäin tärkeitä yksiköitä ohjelman rakentamisessa ja niiden oliopaketoinnin vaatiminen Javassa johtaa ylimääräiseen byrokratiaan. Käsittelen Javan byrokratiaa ja sen vaikutuksia lisää yhteenvedossani.

## Yhtenäinen tyyppijärjestelmä

Javassa muuttujatyypit voidaan luokitella kahteen ryhmään: arvo- ja viitemuuttujiin. Arvomuuttujiin kuuluvat boolean, char, byte, short, int, long, float ja double. Viitemuuttujat viittaavat olioihin, joiden nimet yleisen käytännön mukaan alkavat isolla alkukirjaimella: esimerkiksi String. Koska esimerkiksi kokoelmaoliot ovat kokoelmia toisista olioviitteistä, ei niihin voi sijoittaa arvomuuttujia suoraan. Siispä esimerkiksi kokonaisluvuillekin on oliovastine, Integer.

C#:ssa vastaavaa jakoa ei ole. Kaikki tyypit, myös arvotyypit, perivät object-kantaluokasta [5].

Miksi nämä kaksi samankaltaista kieltä eroavat? Äkkiseltään Javan toteutus kuulostaa tehokkaammalta. Olioiden luominen ei nimittäin ole kevyt operaatio, koska luodessa on laskettava olion tarvitsema tila, varattava muistista alue oliolle, sidottava olioon sen luokan ja mahdollisten kantaluokkien määrittelemät metodit, kutsuttava luokan ja mahdollisten kantaluokkien konstruktorimetodeja sekä luotava olioon osoittava viite. Arvomuuttujien kanssa riittää varata muistista vaadittu alue, jonka laskeminen on olion vaatiman tilan laskemiseen verrattuna triviaali, koska arvomuuttuja on vain yksi arvo, kun taas olion attribuuttien määrä joudutaan laskemaan. Lisäksi arvomuuttujan muistinkäyttö on huomattavasti pienempi. Jos ohjelmaa ajetaan 32-bittisessä käyttöjärjestelmässä, ovat myöskin olioviitteet 32-bittisiä, koska niillä pitää pystyä osoittamaan mihin päin muistiavaruutta tahansa. Siispä jos ohjelmassa käsitellään esimerkiksi 8-bittistä kokonaislukua 32-bittisessä käyttöjärjestelmässä, sen tallentaminen oliona vaatii 32 bittiä olioviitteelle, 8 bittiä varsinaiselle luvulle sekä kielestä ja olion luokasta riippuen jonkun verran lisämuistia olion muita tietoja varten. Arvomuuttujana 8-bittinen kokonaisluku sen sijaan vie vain 8 bittiä eli muistinkäytöltään kukin 8-bittinen arvomuuttuja on vähintäänkin 32 bittiä vaatimattomampi kuin vastaava kokonaislukuolio.

C#:n ratkaisu ongelmaan on matalammalla tasolla Javaa vastaavaa. Myös C# käsittelee kokonaislukuja sekä primitiiveinä että olioina. Erona Javaan on se, että C#:ssa muunnos näiden välillä tapahtuu käyttäjän huomaamatta tarpeen vaatiessa. Kun ohjelmassa esimerkiksi kokonaisluku annetaan argumentiksi metodille, joka hyväksyy object-tyyppisiä arvoja, kokonaisluku paketoidaan olioksi (engl. boxing).

Boxing- ja unboxing-toiminnot siis muuttavat arvomuuttujan oliomuuttujaksi ja takaisin. Sama löytyy myös Javasta. Erona kielten välillä on se, että Java tekee sekä boxingin että unboxingin tarpeen vaatiessa [6], kun taas C# paketoi arvomuuttujan oliomuuttujaksi implisiittisesti, mutta purkaminen takaisin arvomuuttujaksi tehdään eksplisiittisesti [7]. 

On tärkeää huomata, että jos boxing- tai unboxing-toimintoja käytetään vaativassa laskennassa, suoritusteho laskee valtavasti. Microsoftin mukaan erityisesti C#:lla ja yleisemmin kaikkien Common Language Runtimen päälle ajettavilla kielillä boxing-toiminto kestää 20 kertaa pidempään kuin viitemuuttujan asettaminen sekä unboxing-toiminto ja sen vaatima casting-operaatio kestävät 4 kertaa pidempään kuin arvon asettaminen arvomuuttujalle [8].

Suoritustehoa on yritetty paikata Javassa luomalla etukäteen joukko arvomuuttujien oliomuuttujia, jolloin boxing-operaatiot nopeutuvat huomattavasti, koska olioita ei tarvitse enää luoda tarpeen vaatiessa. Esimerkiksi boolean-arvot true ja false sekä kokonaisluvut väliltä [-128, 127] löytyvät valmiina [9]. Tästä johtuu muun muuassa minua kummastuttanut yksityiskohta, että kahden yllä mainitulta väliltä valitun kokonaislukuolion vertaaminen myös ==-operaattorilla pitää paikkaansa. Toki ==-operaattorilla ei Javassa suositella vertaamaankaan muita kuin primitiiviarvoja, mutta tämä saattaa aiheuttaa sekaannusta etenkin uusissa Java-ohjelmoijissa, jotka huomaavat tämän pitävän paikkaansa pienillä arvoilla, mutta jotka eivät huomaa testata samaa isommilla arvoilla.

Erityisen ongelmalliseksi Javan tyypit osoittautuvat tilanteessa, jossa tarvitaan ennalta tuntematon määrä kokonaislukuja tai muita arvomuuttujia. Tällöin suoritusteholtaan tehokkain ratkaisu on tallentaa arvot taulukkoon, jolle varataan jonkinlainen määrä muistia. Ongelmia ilmenee kuitenkin tilanteissa, joissa taulukon kokoa kasvatetaan, jolloin aiemman taulukon arvot joudutaan kopioimaan uuteen taulukkoon, joka on sopivan verran suurempi. Mikä sitten on sopiva määrä? Mahdotonta sanoa, koska tämä riippuu aina tilanteesta. Mielestäni tämä on jälleen yksi tilanne, missä Java-ohjelmoija joutuu miettimään ongelman ratkaisemista tasolla, jolle hänen ei tarvitsisi joutua.

Myös C#:issa on alunperin ollut ongelmia suoritustehon kanssa, jos arvomuuttujia on täytynyt tallentaa kokoelmiin (System.Collection-luokasta periviin olioihin). Tilanne kuitenkin muuttui C# 2.0:n julkaisussa, kun C#:iin lisättiin tuki geneerisyydelle. Jos arvomuuttujia tallennetaan System.List<T>-luokasta periviin listoihin, ei boxing- ja unboxing-toiminnoille ole tarvetta arvomuuttujia listaan lisätessä tai niitä sieltä pois otettaessa [8]. Lisäksi geneerisyys on muutenkin suositeltavaa, jolloin ei joudu tukeutumaan cast-operaatioihin ja niistä mahdollisesti aiheutuviin poikkeuksiin, jos object-tyyppisestä kokoelmasta löytynyt olio ei ollutkaan alunperin peritty oikeasti luokasta.

Mielestäni C#:in yhtenäinen tyyppijärjestelmä on selkeä parannus Javan arvo- ja oliomuuttujiin jakamiseen verrattuna. Korkeamman tason ohjelmointikielten tavoitteena on nimenomaan vapauttaa ohjelmoija miettimästä yksityiskohtia, jotka tapahtuvat tarpeellista matalammalla abstraktiotasolla, jotta ohjelmoija voi keskittyä häntä oikeasti kiinnostavaan ongelmaan. Tietenkin abstraktiotasoissa voidaan mennä joissain tapauksissa liian pitkälle. Esimerkiksi jos kielessä ei olisi mitään mahdollisuutta tallentaa arvomuuttujia primitiiveinä, vaan kaikki tallennettaisiin olioina kuten esimerkiksi Python tekee, kärsii kyseisellä kielellä tehtyjen ohjelmien suoritusteho. Tällöin usein ohjelmoijan ainoaksi ratkaisuksi jää toteuttaa vaativa ohjelmaosuus jollain matalamman tason kielellä, jolla saadaan vaadittu suoritustehotaso. En väitä, että esimerkiksi Python olisi huono kieli, koska se näin tekee: Python on vain abstraktiotasoltaan vielä astetta Javaa ja C#:ia korkeammalla. Java ja C# sen sijaan toimivat samalla abstraktiotasolla, mutta Java pakottaa ohjelmoijan miettimään tyyppijärjestelmää mielestäni tarpeettoman matalalla tasolla muunnoskohdissa, joissa taas C# hoitaa muunnokset ilman ohjelmoijan panosta ja suoritustehoa laskematta.

## Operaattoreiden ylikuormitus

Jo Javan kehityksen alkuvaiheissa päätettiin, ettei kieleen tule tukea operaattoreiden ylikuormitukselle, eikä kantaa olla muutettu kielen myöhemmissäkään versioissa. Kielen alkuperäinen kehittäjä James Gosling tosin myöntää jälkikäteen epäilevänsä ratkaisun pätevyyttä ja kertoo poisjättämisen syyksi hänen kohdallaan olleen huonot kokemukset C++-kielestä, jolla ohjelmoijat "väärinkäyttivät" operaattoreiden ylikuormitusta [10]. Myöskin comp.lang.java-uutisryhmän Usein kysytyt kysymykset -sivu listaa yhdeksi syyksi C++:n osoittaneen esimerkillään, että operaattoreiden ylikuormitus tekee ohjelmakoodista lähes ylläpitokelvotonta. Samainen vastaus mainitsee, että myöskään metodien ylikuormittaminen aiottiin jättää pois kielestä, mutta esimerkiksi tulostusmetodien kohdalla ylikuormittaminen auttoi niin paljon, ettei ominaisuutta lopulta jätetty pois. [11]

Väite on mielestäni erikoinen, koska esimerkiksi C#-yhteisöstä ei ole tullut vastustusta operaattoreiden ylikuormittamiselle eivätkä C#-kielellä tehdyt ohjelmat ole osoittautuneet ylläpitokelvottomiksi.

Javan kehittäjät väittivät, että kaiken, mitä operaattoreiden ylikuormituksella pystyy tekemään, pystyy aivan yhtä hyvin tekemään metodeilla ja attribuuteilla. Lisäksi operaattoreiden ylikuormittamisen poistaminen tekee koodista huomattavasti yksinkertaisempaa. [12] On totta, että teknisesti kaiken saman pystyy tekemään ilmankin ylikuormitusta. On myöskin totta, että esimerkiksi matriisiluokkia käsiteltäessä on huomattavasti yksinkertaisempaa kirjoittaa

<code>result = (matrix1 + matrix2 - matrix3) * matrix4;</code>

kuin

<code>result = ((matrix1.sum(matrix2)).subtract(matrix3).multiply(matrix4);</code>

Eräs usein kuulemani perustelu pelkillä metodeilla kirjoitetun koodin paremmuudelle on, että silloin metodin nimestä näkee suoraan, mitä metodi aikoo tehdä. Tämä ei kuitenkaan ole valitettavasti näin yksinkertaista. Hyvin usein metodeilla saattaa olla yllättäviä sivuvaikutuksia kuten esimerkiksi jostain lähteestä JDK:n BufferedReader-olion readLine-metodilla seuraava lukukohta siirtyykin luetun rivin verran eteenpäin [13]. Tämä ei todellakaan ilmene metodin nimestä, vaan ohjelmoijan on tiedettävä tämä muista lähteistä. Itse asiassa tämä ei ilmene myöskään metodin dokumentoinnista.

Kenties dokumentointi olisi hyvä kieltää kielen seuraavasta versiosta, koska se voi johtaa epäselviin tilanteisiin?

Javassa on valitettavan epäselvä tapa vertailla muuttujien samanarvoisuutta. Uuden ohjelmoijan aloittaessa Javan opettelun, näytetään hänelle usein esimerkkejä kokonaisluvuilla laskemisesta ja niiden vertailusta ==-operaattorilla. Olioiden kanssa kyseistä vertailua kuitenkin varoitetaan käyttämästä. Tämä johtuu siitä, että Javassa olioiden kanssa ==-operaattori vertaakin olioviitteiden samanarvoisuutta. Siispä esimerkiksi ohjelmakoodissa

<code>
String a = "merkkijono";<br />
String b = "merkkijono";<br />
bool vertailu = a == b;
</code>

vertailu saa arvokseen <code>false</code>. Tai ehkä <code>true</code>. Jos kääntäjä on huomannut, että kahta String-oliota yritetään luoda samalla merkkijonolla, se saattaakin luoda vain yhden String-olion, johon tässä tapauksessa sekä a- että b-muuttujat osoittavat. Jos halutaan vertailla olioiden yhtäsuuruutta, on käytettävä equals-metodia. Tämä yhtäsuuruusvertailujen tekeminen kahdella eri tavalla on mielestäni tarpeettoman monimutkaista ja on omien kokemuksieni perusteella johtanut lukuisiin virhetilanteisiin aloittelevien ja kokeneempienkin Java-koodaajien kohdalla. Aivot mieltävät olioidenkin vertailun ==-operaattorilla helposti oikeaksi toimenpiteeksi, koska pitäähän se paikkaansa myöskin primiitivien vertailun kohdalla.

Mielestäni Javan linja operaattoreiden ylikuormituksen kieltämiseen on paitsi perustelematonta myös tekopyhää. Mitenkäs Javassa yhdistetäänkään kaksi merkkijonoa yhteen? Aivan: <code>"+" + "-" + "operaattorilla"</code>. Tässä tilanteessa +-operaattorin ylikuormittaminen onkin ollut hyvä idea, mutta ilmeisesti mitään muuta mahdollista tilannetta ei heidän mielestään ole.

Ymmärrän hyvin Javan kehittäjien alkuperäisen tavoitteen luoda kieli niin, että sillä olisi vaikeampi kirjoittaa epäselvää ohjelmakoodia. On totta, että on epäselvää, mitä esimerkiksi matriisiluokan ylikuormitettu bitshift-operaattori << tarkoittaisi? Kuitenkaan viisas ohjelmoija ei tällaista koskaan kirjoittaisi, jos se ei olisi mielekästä. On valitettava tosiasia, ettei ohjelmointikieli pysty suojelemaan ohjelmoijaa hänen omalta tyhmyydeltään Välillä ohjelmoijat tekevät virheitä ja epäselvällä operaattoreiden ylikuormittamisella saavat aikaan epäselvää ohjelmakoodia. Tämä kuitenkin pitää paikkaansa kaikilla kielillä - myös Javalla. Tehokkaan työkalun poistaminen kokonaan kielestä sen takia, että epäselvää koodia tuottavat ohjelmoijat voisivat tehdä sillä epäselvää koodia, on huono syy, koska samaisella työkalulla on lukuisissa tilanteissa osoitettu pystyvän tuottamaan luettavampaa ohjelmakoodia.

## Poikkeukset

Ennen kuin tarkastelen enemmän poikkeuksia, puutun heti Javan poikkeusten nimeämiseen. Javan virallinen dokumentaatio jakaa poikkeukset tarkistettaviin (engl. checked) ja ajonaikaisiin (engl. runtime). Tämä on kuitenkin hämäävä tapa nimetä, koska eiväthän tarkistettavatkaan poikkeukset aiheudu muulloin kuin ajon aikana. Nimi juontaakin juurensa siihen, että käännön aikana voidaan huomata, mistä kohti tarkistettavia poikkeuksia voi aiheutua, kun taas ajonaikaisia poikkeuksia ei voida huomata etukäteen.

Olennaisin ero ohjelmoijalle tarkistettavien ja ajonaikaisten poikkeusten välillä on se, että kaikki metodin mahdolliset heittämät tarkistettavat poikkeukset on ilmoitettava metodin esittelyssä. Tarkistettavien poikkeuksien listauksessa on sekä hyviä että huonoja puolia. Hyvänä puolena on mielestäni se, että metodia käyttävät ohjelmoija tietää suoraan, mitä (tarkistettavia) poikkeuksia metodi voi heittää ja osaa varautua näihin joko käsittelemällä ne itse tai päästää ne oman kutsujametodinsa käsiteltäväksi. Huonona puolena on se, että kaikkien mahdollisten poikkeusten listaaminen on usein työlästä ja monitasoisessa ohjelmistoarkkitehtuurissa ylempien tasojen metodien poikkeuslistat venyvät helposti valtavan pitkiksi. Tästä johtuen tarkistettavia poikkeuksia käsiteltäessä onkin usein tapana paketoida ne omiin poikkeusolioihin, jolloin esimerkiksi asiakkaita käsittelevä CustomerRegister-olio voi heittää ainoastaan CustomerRegisterException-tyyppisiä poikkeuksia. Tämä johtaa kuitenkin siihen, että tasoja ylöspäin noustaessa oikeat poikkeukset saattavat löytyä todella monen erillisen poikkeusolion sisältä. Tällöin oikean ongelman löytäminen ja alempien tasojen vain tietynlaisiin poikkeuksiin reagointiin on hyvin työlästä.

Valitettavasti myöskin tarkistettavien poikkeusten hyvät puolet ovat täysin turhia, koska metodit voivat aina heittää ajonaikaisia poikkeuksia, joita ei ole pakko luetella metodin esittelyssä. Täten metodia käyttävä ohjelmoija osaa varautua vain osaan poikkeuksista, eikä hän voi koskaan täysin varmistua siitä, että kaikki mahdolliset poikkeukset olisivat hänen tiedossaan. Tämä johtaa omien kokemusteni perusteella kahdenlaisiin ongelmiin.

Ensimmäisenä ongelmana on se, että ohjelmoijalla jää valheellinen turvallisuuden tunne, kun reagoituaan tarkistettaviin poikkeuksiin hän kuvittelee poikkeustilanteiden olevan hallinnassa. Näin helposti unohdetaan kattavalla yksikkötestauksella tai muilla testaustyökaluilla varmistaa metodin toimiminen erilaisissa ongelmatilanteissa.

Toisena ongelmana on se, että ohjelmoija helposti varmistaa kaikkien poikkeusten käsittelyn ottamalla suoraan kiinni kaikki Exception-kantaluokasta perivät poikkeukset. Näin oikeat ongelmat kuitenkin jäävätkin alempien tasojen metodien syövereihin ja ylemmiltä tasoilta ongelmat ilmenevät vain ohjelmiston käsittämättömällä toiminnalla, jonka tunnistaminen ei tyypillisillä virheenkäsittelytavoilla onnistu mitenkään.

Omien kokemusten perusteella tarkistettavista poikkeuksista aiheutuvia haittoja paikataan usein paketoimalla kaikki mahdolliset poikkeukset ajonaikaisten poikkeusten kantaluokasta periviin poikkeusolioihin, jolloin niitä ei tarvitse enää esitellä kunkin metodin kohdalla.

Tiivistettynä siis Javan poikkeusjaottelut johtavat siihen, että kaikki tarkistettavat poikkeukset on ilmoitettava, jotta metodia käyttävä ohjelmoija osaisi niihin reagoida, mutta metodista saattaa lentää ajonaikaisia poikkeuksia, joista hän on onnellisen tietämätön. Eli siis byrokratiaa, joka ei lopulta ratkaise ongelmaa, vaan kannustaa ohjelmoijia huonoihin käytänteisiin.

C#:in kanssa poikkeuksia on ainoastaan yhdenlaisia eikä niitä tarvitse metodien esittelyssä listata. Aivan ongelmatonta ei ole toki tämäkään. Nyt ohjelmoijan tehtäväksi jää selvittää kaikki mahdolliset poikkeukset joko lukemalla metodin dokumentaatiota tai sen ollessa puutteellista, kirjoitettava kattavat automatisoitavat yksikkötestit tai muut vastaavat työkalut, joilla hän voi varmistua metodien odotetunlaisesta toiminnasta. Tämä kuitenkin on jo itsessään erittäin arvokasta ohjelmiston jatkokehityksen kannalta, joten poikkeusten esittelemättömyys ei sinänsä johdakaan huonompaan koodiin, vaan parempaan.

## Yhteenveto

Jo kandidaatintutkielmaa kirjoittaessani huomasin, että Javan ja C#:in eroja vertaillessa en löytänyt mielestäni yhtäkään kohtaa, jossa Javan ratkaisu olisi osoittautunut paremmaksi. Näin kävi myös esseeseen valitsemieni erojen syitä selvitellessä.

Kenties on epäreilua vertaillakaan Javaa ja C#:ia näin suoraan, koska C# on tehty monta vuotta Javan jälkeen ja yksi sen suunnitteluun eniten vaikuttanut kieli onkin juuri Java. Täten C#:in kehittäjät ovat voineet katsoa, missä Java meni vikaan ja korjata ongelman. Javassa useat muutokset olisi vaikeaa tai jopa mahdotonta toteuttaa, koska kieli on ollut jo pidempään käytössä ja kaikki muutosehdotukset joutuvat tarkan kritiikin ja usein kovan muutosvastarinnan kohteeksi.

Mielestäni on ollut mielenkiintoista tutkia näiden kahden kielen eroja, koska sinänsä ne ovat niin lähellä toisiaan, mutta monissa yksityiskohdissa eroavat niin paljon toisistaan. Vertailujen aikana olen uudella tavalla oppinut arvostamaan kielensuunnittelun yksityiskohtien huomiota ja niiden vaikutusta kielellä toteuttaviin ohjelmistoihin pitkälläkin aikavälillä.

Olen työskennellyt molempien ohjelmointikielien kanssa. Javasta minulla on reilun kahden vuoden ja C#:ista noin kahdeksan kuukauden ammatillinen kokemus. Työskennellessäni Javan kanssa huomasin lähes päivittäin, miten kieli osoittautui työtä hidastavaksi tekijäksi. Pahimmillaan kielen puutteet tekivät joistain ratkaisuista todella vaikeita toteuttaa, mutta parhaimmillaankin ongelmat tekivät ohjelmakoodin kirjoittamisesta vähemmän mielekästä. Lisäksi huomasin oman luovuteni ja inspiraationi kärsivän joutuessani käyttämään työkalua, joka niin monesta kohdasta tuntui kankealta ja mielikuvituksettomalta. C#:in kanssa en ole huomannut vielä kertaakaan miettiväni, miten helppoa ohjelman toteuttaminen olisi toisella kielellä. Tämä on parantanut huomattavasti työmotivaatiotani. Onkin hyvä muistaa, että ohjelmakielten puutteet eivät aiheuta vain teknisiä, vaan myös henkisiä ongelmia.

## Lähteet

[1] [Sun Microsystems Inc., Java Language Specification, 3rd Edition](http://java.sun.com/docs/books/jls/third_edition/html/typesValues.html), haettu 22.11.2010.

[2] [Oracle Corporation, JDK 7 Features](http://openjdk.java.net/projects/jdk7/features/), haettu 22.11.2010.

[3] [Microsoft Corporation, Arrays Tutorial](http://msdn.microsoft.com/en-us/library/aa288453(VS.71).aspx), haettu 22.11.2010.

[4] [Microsoft Corporation, Using Delegates (C# Programming Guide)](http://msdn.microsoft.com/en-us/library/ms173172(v=VS.80).aspx), haettu 22.11.2010.

[5] [Microsoft Corporation, Type System Unification](http://msdn.microsoft.com/en-us/library/aa664638(VS.71).aspx), haettu 23.11.2010.

[6] [Oracle Corporation, Autoboxing](http://download.oracle.com/javase/1.5.0/docs/guide/language/autoboxing.html), haettu 23.11.2010.

[7] [Microsoft Corporation, Boxing and Unboxing](http://msdn.microsoft.com/en-us/library/yz2be5wk.aspx), haettu 23.11.2010.

[8] [Microsoft Corporation, Performance](http://msdn.microsoft.com/en-us/library/ms173196.aspx), haettu 23.11.2010.

[9] [Sun Microsystems, Conversions and Promotions](http://java.sun.com/docs/books/jls/third_edition/html/conversions.html#5.1.7), haettu 23.11.2010.

[10] [The C Family of Languages: Interview with Dennis Ritchie, Bjarne Stroustrup, and James Gosling](http://www.gotw.ca/publications/c_family_interview.htm), haettu 23.11.2010.

[11] [The comp.lang.java FAQ List](http://www.cafeaulait.org/javafaq.html#xtocid1902938), haettu 23.11.2010.

[12] [The Java Language Environment](http://java.sun.com/docs/white/langenv/Simple.doc2.html), haettu 23.11.2010.

[13] [BufferedReader (Java 2 Platform SE 5.0)](http://download.oracle.com/javase/1.5.0/docs/api/java/io/BufferedReader.html#readLine()), haettu 23.11.2010.
