-----------------------------------------------------------------
--------------------HOSPITALITY ANALYTICS------------------------
----------------------BY FRANCISCO CUNHA-------------------------
-----------------------------------------------------------------

-------------------------BACKGROUND ANALYTICS--------------------
-- OBJECTIVE: PROFILE THE RAW DATASET BEFORE MODELING
-- SUPPORT SILVER LAYER DESIGN DECISIONS
-----------------------------------------------------------------

--------------------------SAMPLE DATA----------------------------
-- OBJECTIVE: INSPECT RAW RECORDS AND COLUMN STRUCTURE
-- ALECRIM AO CHIADO HOTEL
-- CASA PALMELA HOTEL
-- ALFAMA YELLOW HOUSE APARTMENTS
-----------------------------------------------------------------

-----------------------GRAIN UNDERSTANDING-----------------------
-- OBJECTIVE: UNDERSTAND WHAT EACH ROW REPRESENTS
-- IDENTIFY POTENTIAL DUPLICATIONS
-----------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------


FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado

---------------------CASA PALMELA HOTEL--------------------------


FROM bronze.raw_guest_2015_2026_casa_palmela

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------


FROM bronze.raw_guest_2015_2026_alfama_yellow_house





-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT 
	reservation_id
		AS repeated_reservation_id
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
GROUP BY 1
HAVING COUNT(reservation_id) > 1

---------------------CASA PALMELA HOTEL--------------------------

SELECT 
	reservation_id
		AS repeated_reservation_id
FROM bronze.raw_guest_2015_2026_casa_palmela
GROUP BY 1
HAVING COUNT(reservation_id) > 1

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT 
	reservation_id
		AS repeated_reservation_id
FROM bronze.raw_guest_2015_2026_alfama_yellow_house
GROUP BY 1
HAVING COUNT(reservation_id) > 1


------------------------IDENTITY ANALYSIS------------------------
-- OBJECTIVE: EVALUATE GUEST IDENTIFICATION CONSISTENCY
-- ASSESS AVAILABLE IDENTIFIERS
-----------------------------------------------------------------


-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	COUNT(DISTINCT(guest_name)
	)AS guest_name_count,
	COUNT(DISTINCT(reservation_id)
	) AS reservation_id_count 
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado

---------------------CASA PALMELA HOTEL--------------------------

SELECT
	COUNT(DISTINCT(guest_name)
	)AS guest_name_count,
	COUNT(DISTINCT(reservation_id)
	) AS reservation_id_count 
FROM bronze.raw_guest_2015_2026_casa_palmela

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	COUNT(DISTINCT(guest_name)
	)AS guest_name_count,
	COUNT(DISTINCT(reservation_id)
	) AS reservation_id_count 
FROM bronze.raw_guest_2015_2026_alfama_yellow_house


------------------------------------------------------------------
-------------------------EMAIL ANALYSIS---------------------------
-- OBJECTIVE: EVALUATE EMAIL CONSISTENCY
-- ASSESS EMAIL IDENTIFICATION POTENTIAL
-- VALID AND INVALID COUNT
------------------------------------------------------------------
SELECT COUNT(email) 
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
WHERE NOT email LIKE ANY (
						ARRAY  [
                        '@madridandbeyond.com',
                        '@pureluxurydreams.com',
                        '@selectcollection.se',
                        '@sindipi.com.br',
                        '@tourdiez.com',
                        '@travel-tailors.com',
                        '@travelcounsellors.com',
                        '@globalia-sistemas.com',
                        '@globaltravelcollection.com',
                        '@sunhotels.net',
                        '@bpaproperty.com',
                        '@brickelltravel.com',
                        '@goglobal.travel',
                        '@hrs.com',
                        '@bguedes@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@viajessingulares.com',
                        '@1001jouets.fr',
                        '@127travel.com',
                        '@BELLSOUTH.NET',
                        '@viajan.com.br',
                        '@webbeds.com',
                        '@widetravel.pt',
                        '@xtravel.com.br',
                        '@ADVISOR.BCG.COM',
                        '@brownshotelgroup.com ',
                        '@cueproperties.com',
                        '@dynargie.com',
                        '@endutex.pt',
                        '@odisseias.com',
                        '@olx.com',
                        '@profinpartners.com ',
                        '@protravelinc.com',
                        '@pura-aventura.com',
                        '@w2m.travel',
                        '@avoyatravel.com',
                        '@brownshotelgroup.com',
                        '@brownshotelgroup.com',
                        '@hilton.com',
                        '@exclusive-escapes.com',
                        '@route-voyages.com',
                        '@grupomalasa.com',
                        '@hotelbeds.com',
						'@guestcentric.com',
						'@guestcentric.com',
            			'@guest.booking.com',
                        '@booking.com',
                        '@expedia.com',
                        '@airbnb.com',
                        '@guest.airbnb.com',
            			'@m.expediapartnercentral.com',
            			'@despegar.com',
            			'@goglobal.travel.com',
            			'@inter.net.il.com',
            			'@splendia.com',
						'@addictionjournal.org',
						'@interep.com.br',
						'@veturis.com',
						'@hrs.de',
                        '@hrs.com',
                        '@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@split_part',
                        '@libero.it',
                        '@telenet.be',
                        '@6tour.com',
                        '@abercrombiekent.es',
                        '@alletravel.co',
                        '@alletravel.com',
                        '@amplitudes.com',
                        '@atlantida.travel',
                        '@atpi.com',
                        '@atrapalo.com',
                        '@aurumtours.de',
                        '@avoristravel.com',
                        '@avilareizen.nl',
                        '@bespoketravelspain.com',
                        '@bthetravelbrand.com',
                        '@btwetravelbrand.com',
                        '@cadencetravel.com',
                        '@cassistravel.co.uk',
                        '@competitiontravel.it',
                        '@connections.be',
                        '@cxloyalty.com',
                        '@dclicktourspassion.fr',
                        '@destinia.com',
                        '@diariodebordo.tur.br',
                        '@discovertravel.co.nz',
                        '@discoverytravel.dk',
                        '@egencia.eu',
                        '@embarkbeyond.com',
                        '@emergingtravel.com',
                        '@escalabeds.com',
                        '@esky.com',
                        '@estravel.ee',
                        '@expediagroup.com',
                        '@feriasalacarte.com',
                        '@flightcentre.co.uk',
                        '@fora.travel',
                        '@frosch.com',
                        '@fvo.travel',
                        '@gattinoni.it',
                        '@geostar.pt',
                        '@globaltravelbooking.es',
                        '@h-resa.com',
                        '@happyfewvoyages.com',
                        '@hooroo.com',
                        '@hopper.com',
                        '@hrgworldwide.com',
                        '@hotel.check24.de',
                        '@hotelston.com',
                        '@hoteltravel.com',
                        '@intriqjourney.com',
                        '@italcamel.com',
                        '@jessysreisservice.nl',
                        '@jettours.com',
                        '@johnheathtravel.com',
                        '@kanguroviaggi.com',
                        '@keytravel.com',
                        '@kuoni-reisen.ch',
                        '@largaytravel.com',
                        '@lesvoyagesmv.com',
                        '@lets-travel.net',
                        '@lnltravel.com',
                        '@lucarviajes.com',
                        '@marsol.com',
                        '@matkahaukka.com',
                        '@metglobal.com',
                        '@milkandhoneytravels.com',
                        '@mycwt.com',
                        '@nmwreiselounge.de',
                        '@ontheescapetravels.com',
                        '@operativa.traveltool.es',
                        '@orinter.com.br',
                        '@orbit.co.nz',
                        '@ostrovok.ru',
                        '@papillon-travel.co.uk',
                        '@paradisreiser.no',
                        '@plantelturismo.com.br',
                        '@portugal-exclusive.com',
                        '@portugueseways.com',
                        '@prestigia.com',
                        '@quintessentiallytravel.com',
                        '@qunar.com',
                        '@reiskundig.nl',
                        '@resia.se',
                        '@rosemounttravel.co.uk',
                        '@rumbo.com',
                        '@sabre.com',
                        '@saveonresorts.com',
                        '@selectour.com',
                        '@smartflyer.com',
                        '@sportsfanatictravel.com',
                        '@stubbornmuletravel.com',
                        '@tboholidays.com',
                        '@teresaperez.com.br',
                        '@thetravelclub.nl',
                        '@titaniumtours.com',
                        '@travelcounsellors.nl',
                        '@travelsimplicity.net',
                        '@traveltino.com',
                        '@travelxperts.com',
                        '@triplink.com.br',
                        '@tripmasters.com',
                        '@true.travel',
                        '@tuifrance.com',
                        '@turitravel.com',
                        '@vanillatravel.com',
                        '@vegavigo.com',
                        '@venturionconcierge.com',
                        '@verbekereizen.be',
                        '@viajeseci.es',
                        '@viajespanorama.com',
                        '@vivereeviaggiare.it',
                        '@voyagesmalavoy.com',
                        '@westexpress.lt',
                        '@wigwam.travel',
                        '@w2m.com',
                        '@yourtravel.nl'])
						
-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT COUNT(email) 
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
WHERE NOT email LIKE ANY (
						ARRAY  [
                        '@madridandbeyond.com',
                        '@pureluxurydreams.com',
                        '@selectcollection.se',
                        '@sindipi.com.br',
                        '@tourdiez.com',
                        '@travel-tailors.com',
                        '@travelcounsellors.com',
                        '@globalia-sistemas.com',
                        '@globaltravelcollection.com',
                        '@sunhotels.net',
                        '@bpaproperty.com',
                        '@brickelltravel.com',
                        '@goglobal.travel',
                        '@hrs.com',
                        '@bguedes@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@viajessingulares.com',
                        '@1001jouets.fr',
                        '@127travel.com',
                        '@BELLSOUTH.NET',
                        '@viajan.com.br',
                        '@webbeds.com',
                        '@widetravel.pt',
                        '@xtravel.com.br',
                        '@ADVISOR.BCG.COM',
                        '@brownshotelgroup.com ',
                        '@cueproperties.com',
                        '@dynargie.com',
                        '@endutex.pt',
                        '@odisseias.com',
                        '@olx.com',
                        '@profinpartners.com ',
                        '@protravelinc.com',
                        '@pura-aventura.com',
                        '@w2m.travel',
                        '@avoyatravel.com',
                        '@brownshotelgroup.com',
                        '@brownshotelgroup.com',
                        '@hilton.com',
                        '@exclusive-escapes.com',
                        '@route-voyages.com',
                        '@grupomalasa.com',
                        '@hotelbeds.com',
						'@guestcentric.com',
						'@guestcentric.com',
            			'@guest.booking.com',
                        '@booking.com',
                        '@expedia.com',
                        '@airbnb.com',
                        '@guest.airbnb.com',
            			'@m.expediapartnercentral.com',
            			'@despegar.com',
            			'@goglobal.travel.com',
            			'@inter.net.il.com',
            			'@splendia.com',
						'@addictionjournal.org',
						'@interep.com.br',
						'@veturis.com',
						'@hrs.de',
                        '@hrs.com',
                        '@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@split_part',
                        '@libero.it',
                        '@telenet.be',
                        '@6tour.com',
                        '@abercrombiekent.es',
                        '@alletravel.co',
                        '@alletravel.com',
                        '@amplitudes.com',
                        '@atlantida.travel',
                        '@atpi.com',
                        '@atrapalo.com',
                        '@aurumtours.de',
                        '@avoristravel.com',
                        '@avilareizen.nl',
                        '@bespoketravelspain.com',
                        '@bthetravelbrand.com',
                        '@btwetravelbrand.com',
                        '@cadencetravel.com',
                        '@cassistravel.co.uk',
                        '@competitiontravel.it',
                        '@connections.be',
                        '@cxloyalty.com',
                        '@dclicktourspassion.fr',
                        '@destinia.com',
                        '@diariodebordo.tur.br',
                        '@discovertravel.co.nz',
                        '@discoverytravel.dk',
                        '@egencia.eu',
                        '@embarkbeyond.com',
                        '@emergingtravel.com',
                        '@escalabeds.com',
                        '@esky.com',
                        '@estravel.ee',
                        '@expediagroup.com',
                        '@feriasalacarte.com',
                        '@flightcentre.co.uk',
                        '@fora.travel',
                        '@frosch.com',
                        '@fvo.travel',
                        '@gattinoni.it',
                        '@geostar.pt',
                        '@globaltravelbooking.es',
                        '@h-resa.com',
                        '@happyfewvoyages.com',
                        '@hooroo.com',
                        '@hopper.com',
                        '@hrgworldwide.com',
                        '@hotel.check24.de',
                        '@hotelston.com',
                        '@hoteltravel.com',
                        '@intriqjourney.com',
                        '@italcamel.com',
                        '@jessysreisservice.nl',
                        '@jettours.com',
                        '@johnheathtravel.com',
                        '@kanguroviaggi.com',
                        '@keytravel.com',
                        '@kuoni-reisen.ch',
                        '@largaytravel.com',
                        '@lesvoyagesmv.com',
                        '@lets-travel.net',
                        '@lnltravel.com',
                        '@lucarviajes.com',
                        '@marsol.com',
                        '@matkahaukka.com',
                        '@metglobal.com',
                        '@milkandhoneytravels.com',
                        '@mycwt.com',
                        '@nmwreiselounge.de',
                        '@ontheescapetravels.com',
                        '@operativa.traveltool.es',
                        '@orinter.com.br',
                        '@orbit.co.nz',
                        '@ostrovok.ru',
                        '@papillon-travel.co.uk',
                        '@paradisreiser.no',
                        '@plantelturismo.com.br',
                        '@portugal-exclusive.com',
                        '@portugueseways.com',
                        '@prestigia.com',
                        '@quintessentiallytravel.com',
                        '@qunar.com',
                        '@reiskundig.nl',
                        '@resia.se',
                        '@rosemounttravel.co.uk',
                        '@rumbo.com',
                        '@sabre.com',
                        '@saveonresorts.com',
                        '@selectour.com',
                        '@smartflyer.com',
                        '@sportsfanatictravel.com',
                        '@stubbornmuletravel.com',
                        '@tboholidays.com',
                        '@teresaperez.com.br',
                        '@thetravelclub.nl',
                        '@titaniumtours.com',
                        '@travelcounsellors.nl',
                        '@travelsimplicity.net',
                        '@traveltino.com',
                        '@travelxperts.com',
                        '@triplink.com.br',
                        '@tripmasters.com',
                        '@true.travel',
                        '@tuifrance.com',
                        '@turitravel.com',
                        '@vanillatravel.com',
                        '@vegavigo.com',
                        '@venturionconcierge.com',
                        '@verbekereizen.be',
                        '@viajeseci.es',
                        '@viajespanorama.com',
                        '@vivereeviaggiare.it',
                        '@voyagesmalavoy.com',
                        '@westexpress.lt',
                        '@wigwam.travel',
                        '@w2m.com',
                        '@yourtravel.nl'])

---------------------CASA PALMELA HOTEL--------------------------

SELECT COUNT(email) 
FROM bronze.raw_guest_2015_2026_casa_palmela
WHERE NOT email LIKE ANY (
						ARRAY  [
                        '@madridandbeyond.com',
                        '@pureluxurydreams.com',
                        '@selectcollection.se',
                        '@sindipi.com.br',
                        '@tourdiez.com',
                        '@travel-tailors.com',
                        '@travelcounsellors.com',
                        '@globalia-sistemas.com',
                        '@globaltravelcollection.com',
                        '@sunhotels.net',
                        '@bpaproperty.com',
                        '@brickelltravel.com',
                        '@goglobal.travel',
                        '@hrs.com',
                        '@bguedes@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@viajessingulares.com',
                        '@1001jouets.fr',
                        '@127travel.com',
                        '@BELLSOUTH.NET',
                        '@viajan.com.br',
                        '@webbeds.com',
                        '@widetravel.pt',
                        '@xtravel.com.br',
                        '@ADVISOR.BCG.COM',
                        '@brownshotelgroup.com ',
                        '@cueproperties.com',
                        '@dynargie.com',
                        '@endutex.pt',
                        '@odisseias.com',
                        '@olx.com',
                        '@profinpartners.com ',
                        '@protravelinc.com',
                        '@pura-aventura.com',
                        '@w2m.travel',
                        '@avoyatravel.com',
                        '@brownshotelgroup.com',
                        '@brownshotelgroup.com',
                        '@hilton.com',
                        '@exclusive-escapes.com',
                        '@route-voyages.com',
                        '@grupomalasa.com',
                        '@hotelbeds.com',
						'@guestcentric.com',
						'@guestcentric.com',
            			'@guest.booking.com',
                        '@booking.com',
                        '@expedia.com',
                        '@airbnb.com',
                        '@guest.airbnb.com',
            			'@m.expediapartnercentral.com',
            			'@despegar.com',
            			'@goglobal.travel.com',
            			'@inter.net.il.com',
            			'@splendia.com',
						'@addictionjournal.org',
						'@interep.com.br',
						'@veturis.com',
						'@hrs.de',
                        '@hrs.com',
                        '@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@split_part',
                        '@libero.it',
                        '@telenet.be',
                        '@6tour.com',
                        '@abercrombiekent.es',
                        '@alletravel.co',
                        '@alletravel.com',
                        '@amplitudes.com',
                        '@atlantida.travel',
                        '@atpi.com',
                        '@atrapalo.com',
                        '@aurumtours.de',
                        '@avoristravel.com',
                        '@avilareizen.nl',
                        '@bespoketravelspain.com',
                        '@bthetravelbrand.com',
                        '@btwetravelbrand.com',
                        '@cadencetravel.com',
                        '@cassistravel.co.uk',
                        '@competitiontravel.it',
                        '@connections.be',
                        '@cxloyalty.com',
                        '@dclicktourspassion.fr',
                        '@destinia.com',
                        '@diariodebordo.tur.br',
                        '@discovertravel.co.nz',
                        '@discoverytravel.dk',
                        '@egencia.eu',
                        '@embarkbeyond.com',
                        '@emergingtravel.com',
                        '@escalabeds.com',
                        '@esky.com',
                        '@estravel.ee',
                        '@expediagroup.com',
                        '@feriasalacarte.com',
                        '@flightcentre.co.uk',
                        '@fora.travel',
                        '@frosch.com',
                        '@fvo.travel',
                        '@gattinoni.it',
                        '@geostar.pt',
                        '@globaltravelbooking.es',
                        '@h-resa.com',
                        '@happyfewvoyages.com',
                        '@hooroo.com',
                        '@hopper.com',
                        '@hrgworldwide.com',
                        '@hotel.check24.de',
                        '@hotelston.com',
                        '@hoteltravel.com',
                        '@intriqjourney.com',
                        '@italcamel.com',
                        '@jessysreisservice.nl',
                        '@jettours.com',
                        '@johnheathtravel.com',
                        '@kanguroviaggi.com',
                        '@keytravel.com',
                        '@kuoni-reisen.ch',
                        '@largaytravel.com',
                        '@lesvoyagesmv.com',
                        '@lets-travel.net',
                        '@lnltravel.com',
                        '@lucarviajes.com',
                        '@marsol.com',
                        '@matkahaukka.com',
                        '@metglobal.com',
                        '@milkandhoneytravels.com',
                        '@mycwt.com',
                        '@nmwreiselounge.de',
                        '@ontheescapetravels.com',
                        '@operativa.traveltool.es',
                        '@orinter.com.br',
                        '@orbit.co.nz',
                        '@ostrovok.ru',
                        '@papillon-travel.co.uk',
                        '@paradisreiser.no',
                        '@plantelturismo.com.br',
                        '@portugal-exclusive.com',
                        '@portugueseways.com',
                        '@prestigia.com',
                        '@quintessentiallytravel.com',
                        '@qunar.com',
                        '@reiskundig.nl',
                        '@resia.se',
                        '@rosemounttravel.co.uk',
                        '@rumbo.com',
                        '@sabre.com',
                        '@saveonresorts.com',
                        '@selectour.com',
                        '@smartflyer.com',
                        '@sportsfanatictravel.com',
                        '@stubbornmuletravel.com',
                        '@tboholidays.com',
                        '@teresaperez.com.br',
                        '@thetravelclub.nl',
                        '@titaniumtours.com',
                        '@travelcounsellors.nl',
                        '@travelsimplicity.net',
                        '@traveltino.com',
                        '@travelxperts.com',
                        '@triplink.com.br',
                        '@tripmasters.com',
                        '@true.travel',
                        '@tuifrance.com',
                        '@turitravel.com',
                        '@vanillatravel.com',
                        '@vegavigo.com',
                        '@venturionconcierge.com',
                        '@verbekereizen.be',
                        '@viajeseci.es',
                        '@viajespanorama.com',
                        '@vivereeviaggiare.it',
                        '@voyagesmalavoy.com',
                        '@westexpress.lt',
                        '@wigwam.travel',
                        '@w2m.com',
                        '@yourtravel.nl'])

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT COUNT(email) 
FROM bronze.raw_guest_2015_2026_alfama_yellow_house
WHERE NOT email LIKE ANY (
						ARRAY  [
                        '@madridandbeyond.com',
                        '@pureluxurydreams.com',
                        '@selectcollection.se',
                        '@sindipi.com.br',
                        '@tourdiez.com',
                        '@travel-tailors.com',
                        '@travelcounsellors.com',
                        '@globalia-sistemas.com',
                        '@globaltravelcollection.com',
                        '@sunhotels.net',
                        '@bpaproperty.com',
                        '@brickelltravel.com',
                        '@goglobal.travel',
                        '@hrs.com',
                        '@bguedes@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@viajessingulares.com',
                        '@1001jouets.fr',
                        '@127travel.com',
                        '@BELLSOUTH.NET',
                        '@viajan.com.br',
                        '@webbeds.com',
                        '@widetravel.pt',
                        '@xtravel.com.br',
                        '@ADVISOR.BCG.COM',
                        '@brownshotelgroup.com ',
                        '@cueproperties.com',
                        '@dynargie.com',
                        '@endutex.pt',
                        '@odisseias.com',
                        '@olx.com',
                        '@profinpartners.com ',
                        '@protravelinc.com',
                        '@pura-aventura.com',
                        '@w2m.travel',
                        '@avoyatravel.com',
                        '@brownshotelgroup.com',
                        '@brownshotelgroup.com',
                        '@hilton.com',
                        '@exclusive-escapes.com',
                        '@route-voyages.com',
                        '@grupomalasa.com',
                        '@hotelbeds.com',
						'@guestcentric.com',
						'@guestcentric.com',
            			'@guest.booking.com',
                        '@booking.com',
                        '@expedia.com',
                        '@airbnb.com',
                        '@guest.airbnb.com',
            			'@m.expediapartnercentral.com',
            			'@despegar.com',
            			'@goglobal.travel.com',
            			'@inter.net.il.com',
            			'@splendia.com',
						'@addictionjournal.org',
						'@interep.com.br',
						'@veturis.com',
						'@hrs.de',
                        '@hrs.com',
                        '@ouh.pt',
                        '@sunhotels.com',
                        '@6tour.com',
                        '@michaelhatton.com',
                        '@inter.net.il',
                        '@planet.nl',
                        '@split_part',
                        '@libero.it',
                        '@telenet.be',
                        '@6tour.com',
                        '@abercrombiekent.es',
                        '@alletravel.co',
                        '@alletravel.com',
                        '@amplitudes.com',
                        '@atlantida.travel',
                        '@atpi.com',
                        '@atrapalo.com',
                        '@aurumtours.de',
                        '@avoristravel.com',
                        '@avilareizen.nl',
                        '@bespoketravelspain.com',
                        '@bthetravelbrand.com',
                        '@btwetravelbrand.com',
                        '@cadencetravel.com',
                        '@cassistravel.co.uk',
                        '@competitiontravel.it',
                        '@connections.be',
                        '@cxloyalty.com',
                        '@dclicktourspassion.fr',
                        '@destinia.com',
                        '@diariodebordo.tur.br',
                        '@discovertravel.co.nz',
                        '@discoverytravel.dk',
                        '@egencia.eu',
                        '@embarkbeyond.com',
                        '@emergingtravel.com',
                        '@escalabeds.com',
                        '@esky.com',
                        '@estravel.ee',
                        '@expediagroup.com',
                        '@feriasalacarte.com',
                        '@flightcentre.co.uk',
                        '@fora.travel',
                        '@frosch.com',
                        '@fvo.travel',
                        '@gattinoni.it',
                        '@geostar.pt',
                        '@globaltravelbooking.es',
                        '@h-resa.com',
                        '@happyfewvoyages.com',
                        '@hooroo.com',
                        '@hopper.com',
                        '@hrgworldwide.com',
                        '@hotel.check24.de',
                        '@hotelston.com',
                        '@hoteltravel.com',
                        '@intriqjourney.com',
                        '@italcamel.com',
                        '@jessysreisservice.nl',
                        '@jettours.com',
                        '@johnheathtravel.com',
                        '@kanguroviaggi.com',
                        '@keytravel.com',
                        '@kuoni-reisen.ch',
                        '@largaytravel.com',
                        '@lesvoyagesmv.com',
                        '@lets-travel.net',
                        '@lnltravel.com',
                        '@lucarviajes.com',
                        '@marsol.com',
                        '@matkahaukka.com',
                        '@metglobal.com',
                        '@milkandhoneytravels.com',
                        '@mycwt.com',
                        '@nmwreiselounge.de',
                        '@ontheescapetravels.com',
                        '@operativa.traveltool.es',
                        '@orinter.com.br',
                        '@orbit.co.nz',
                        '@ostrovok.ru',
                        '@papillon-travel.co.uk',
                        '@paradisreiser.no',
                        '@plantelturismo.com.br',
                        '@portugal-exclusive.com',
                        '@portugueseways.com',
                        '@prestigia.com',
                        '@quintessentiallytravel.com',
                        '@qunar.com',
                        '@reiskundig.nl',
                        '@resia.se',
                        '@rosemounttravel.co.uk',
                        '@rumbo.com',
                        '@sabre.com',
                        '@saveonresorts.com',
                        '@selectour.com',
                        '@smartflyer.com',
                        '@sportsfanatictravel.com',
                        '@stubbornmuletravel.com',
                        '@tboholidays.com',
                        '@teresaperez.com.br',
                        '@thetravelclub.nl',
                        '@titaniumtours.com',
                        '@travelcounsellors.nl',
                        '@travelsimplicity.net',
                        '@traveltino.com',
                        '@travelxperts.com',
                        '@triplink.com.br',
                        '@tripmasters.com',
                        '@true.travel',
                        '@tuifrance.com',
                        '@turitravel.com',
                        '@vanillatravel.com',
                        '@vegavigo.com',
                        '@venturionconcierge.com',
                        '@verbekereizen.be',
                        '@viajeseci.es',
                        '@viajespanorama.com',
                        '@vivereeviaggiare.it',
                        '@voyagesmalavoy.com',
                        '@westexpress.lt',
                        '@wigwam.travel',
                        '@w2m.com',
                        '@yourtravel.nl'])

--------------------------NULLS COUNT----------------------------
-- OBJECTIVE: ASSESS DATA COMPLETENESS
-- IDENTIFY MISSING VALUES ACROSS COLUMNS
-----------------------------------------------------------------


-------------------ALECRIM AO CHIADO HOTEL-----------------------

WITH nulls_count AS (
	SELECT
		SUM(CASE WHEN guest_name IS NULL THEN 1 ELSE 0 END) AS nulls_guest_name_count,
		SUM(CASE WHEN is_group IS NULL THEN 1 ELSE 0 END) AS nulls_is_group_count,
		SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS nulls_age_count,
		SUM(CASE WHEN birth_date IS NULL THEN 1 ELSE 0 END) AS nulls_birth_date_count,
		SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS nulls_gender_count,
		SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS nulls_country_count,
		SUM(CASE WHEN check_in_date IS NULL THEN 1 ELSE 0 END) AS nulls_check_in_date_count,
		SUM(CASE WHEN check_out_date IS NULL THEN 1 ELSE 0 END) AS nulls_check_out_date_count,
		SUM(CASE WHEN room_number IS NULL THEN 1 ELSE 0 END) AS nulls_room_number_count,
		SUM(CASE WHEN room_category IS NULL THEN 1 ELSE 0 END) AS nulls_room_category_count,
		SUM(CASE WHEN source_company IS NULL THEN 1 ELSE 0 END) AS nulls_source_company_count,
		SUM(CASE WHEN is_bed_and_breakfast IS NULL THEN 1 ELSE 0 END) AS nulls_is_bed_and_breakfast_count,
		SUM(CASE WHEN pax IS NULL THEN 1 ELSE 0 END) AS nulls_pax_count,
		SUM(CASE WHEN room_tariff IS NULL THEN 1 ELSE 0 END) AS nulls_room_tariff_count,
		SUM(CASE WHEN stay_status IS NULL THEN 1 ELSE 0 END) AS nulls_stay_status_count,
		SUM(CASE WHEN reservation_status IS NULL THEN 1 ELSE 0 END) AS nulls_reservation_status_count,
		SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS nulls_email_count
	FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
)

SELECT *
FROM nulls_count;

---------------------CASA PALMELA HOTEL--------------------------

WITH nulls_count AS (
	SELECT
		SUM(CASE WHEN guest_name IS NULL THEN 1 ELSE 0 END) AS nulls_guest_name_count,
		SUM(CASE WHEN is_group IS NULL THEN 1 ELSE 0 END) AS nulls_is_group_count,
		SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS nulls_age_count,
		SUM(CASE WHEN birth_date IS NULL THEN 1 ELSE 0 END) AS nulls_birth_date_count,
		SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS nulls_gender_count,
		SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS nulls_country_count,
		SUM(CASE WHEN check_in_date IS NULL THEN 1 ELSE 0 END) AS nulls_check_in_date_count,
		SUM(CASE WHEN check_out_date IS NULL THEN 1 ELSE 0 END) AS nulls_check_out_date_count,
		SUM(CASE WHEN room_number IS NULL THEN 1 ELSE 0 END) AS nulls_room_number_count,
		SUM(CASE WHEN room_category IS NULL THEN 1 ELSE 0 END) AS nulls_room_category_count,
		SUM(CASE WHEN source_company IS NULL THEN 1 ELSE 0 END) AS nulls_source_company_count,
		SUM(CASE WHEN is_bed_and_breakfast IS NULL THEN 1 ELSE 0 END) AS nulls_is_bed_and_breakfast_count,
		SUM(CASE WHEN pax IS NULL THEN 1 ELSE 0 END) AS nulls_pax_count,
		SUM(CASE WHEN room_tariff IS NULL THEN 1 ELSE 0 END) AS nulls_room_tariff_count,
		SUM(CASE WHEN stay_status IS NULL THEN 1 ELSE 0 END) AS nulls_stay_status_count,
		SUM(CASE WHEN reservation_status IS NULL THEN 1 ELSE 0 END) AS nulls_reservation_status_count,
		SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS nulls_email_count
	FROM bronze.raw_guest_2015_2026_casa_palmela
)

SELECT *
FROM nulls_count;

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

WITH nulls_count AS (
	SELECT
		SUM(CASE WHEN guest_name IS NULL THEN 1 ELSE 0 END) AS nulls_guest_name_count,
		SUM(CASE WHEN is_group IS NULL THEN 1 ELSE 0 END) AS nulls_is_group_count,
		SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS nulls_age_count,
		SUM(CASE WHEN birth_date IS NULL THEN 1 ELSE 0 END) AS nulls_birth_date_count,
		SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS nulls_gender_count,
		SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS nulls_country_count,
		SUM(CASE WHEN check_in_date IS NULL THEN 1 ELSE 0 END) AS nulls_check_in_date_count,
		SUM(CASE WHEN check_out_date IS NULL THEN 1 ELSE 0 END) AS nulls_check_out_date_count,
		SUM(CASE WHEN room_number IS NULL THEN 1 ELSE 0 END) AS nulls_room_number_count,
		SUM(CASE WHEN room_category IS NULL THEN 1 ELSE 0 END) AS nulls_room_category_count,
		SUM(CASE WHEN source_company IS NULL THEN 1 ELSE 0 END) AS nulls_source_company_count,
		SUM(CASE WHEN is_bed_and_breakfast IS NULL THEN 1 ELSE 0 END) AS nulls_is_bed_and_breakfast_count,
		SUM(CASE WHEN pax IS NULL THEN 1 ELSE 0 END) AS nulls_pax_count,
		SUM(CASE WHEN room_tariff IS NULL THEN 1 ELSE 0 END) AS nulls_room_tariff_count,
		SUM(CASE WHEN stay_status IS NULL THEN 1 ELSE 0 END) AS nulls_stay_status_count,
		SUM(CASE WHEN reservation_status IS NULL THEN 1 ELSE 0 END) AS nulls_reservation_status_count,
		SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS nulls_email_count
	FROM bronze.raw_guest_2015_2026_alfama_yellow_house
)

SELECT *
FROM nulls_count;

-----------------------DEMOGRAPHIC ANALYSIS----------------------
-- OBJECTIVE: UNDERSTAND GUEST DEMOGRAPHIC PROFILE
-----------------------------------------------------------------


------------------------------------------------------------------
----------------------BIRTH DATE DISTRIBUTION---------------------
-- OBJECTIVE: ASSESS BIRTH DATE AVAILABILITY
-- IDENTIFY DATE OF BIRTH PATTERNS
------------------------------------------------------------------
-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(birth_date)
		AS birth_date_count
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado;

---------------------CASA PALMELA HOTEL--------------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(birth_date)
		AS birth_date_count
FROM bronze.raw_guest_2015_2026_casa_palmela;



-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(birth_date)
		AS birth_date_count
FROM bronze.raw_guest_2015_2026_alfama_yellow_house;


------------------------------------------------------------------
------------------------AGE DISTRIBUTION--------------------------
-- OBJECTIVE: UNDERSTAND GUEST AGE PROFILE
-- IDENTIFY AGE POPULATION PATTERNS
------------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(age)
		AS age_count
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado;


---------------------CASA PALMELA HOTEL--------------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(age)
		AS age_count
FROM bronze.raw_guest_2015_2026_casa_palmela;


-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(age)
		AS age_count
FROM bronze.raw_guest_2015_2026_alfama_yellow_house;
------------------------------------------------------------------
----------------------GENDER DISTRIBUTION-------------------------
-- OBJECTIVE: UNDERSTAND GENDER REPRESENTATION
-- IDENTIFY GENDER POPULATION PATTERNS
------------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(gender)
		AS age_count
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado;


---------------------CASA PALMELA HOTEL--------------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(gender)
		AS age_count
FROM bronze.raw_guest_2015_2026_casa_palmela;


-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(gender)
		AS age_count
FROM bronze.raw_guest_2015_2026SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(gender)
		AS age_count
FROM bronze.raw_guest_2015_2026SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(gender)
		AS age_count
FROM bronze.raw_guest_2015_2026_alfama_yellow_house;


-----------------------GEOGRAPHIC ANALYSIS-----------------------
-- OBJECTIVE: UNDERSTAND GUEST ORIGIN PROFILE
-----------------------------------------------------------------

------------------------------------------------------------------
----------------------COUNTRY DISTRIBUTION------------------------
-- OBJECTIVE: IDENTIFY COUNTRY REPRESENTATION
-- UNDERSTAND GEOGRAPHIC DISTRIBUTION
------------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(country)
		AS age_count
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado;

---------------------CASA PALMELA HOTEL--------------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(country)
		AS age_count
FROM bronze.raw_guest_2015_2026_casa_palmela;


-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	COUNT(DISTINCT(guest_name))
		AS guest_name_count,
	COUNT(country)
		AS age_count
FROM bronze.raw_guest_2015_2026_alfama_yellow_house;

------------------------------------------------------------------
-------------------------TOP COUNTRIES----------------------------
-- OBJECTIVE: IDENTIFY PRIMARY SOURCE MARKETS
-- RANK COUNTRIES BY GUEST VOLUME
------------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	country,
	COUNT(*)
		AS guests_count
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
GROUP BY country
HAVING country IS NOT NULL
ORDER BY guests_count DESC
LIMIT 10;

---------------------CASA PALMELA HOTEL--------------------------

SELECT
	country,
	COUNT(*)
		AS guests_count
FROM bronze.raw_guest_2015_2026_casa_palmela
GROUP BY country
HAVING country IS NOT NULL
ORDER BY guests_count DESC
LIMIT 10;

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	country,
	COUNT(*)
		AS guests_count
FROM bronze.raw_guest_2015_2026_alfama_yellow_house
GROUP BY country
HAVING country IS NOT NULL
ORDER BY guests_count DESC
LIMIT 10;


------------------------------------------------------------------
----------------------COUNTRY COMPLETENESS------------------------
-- OBJECTIVE: ASSESS COUNTRY DATA COVERAGE
-- MEASURE GEOGRAPHIC DATA COMPLETENESS
------------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------


WITH country_distribution AS (

	SELECT
		COUNT(country)
			AS countries_distribution_count,
		COUNT(guest_name)
			AS guests_count
	FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado
	WHERE country IS NOT NULL	
)
SELECT
	guests_count,
	countries_distribution_count,
	ROUND(
	countries_distribution_count * 100.0 
	/ guests_count,
	2
	) AS country_completeness_rate
FROM country_distribution;

---------------------CASA PALMELA HOTEL--------------------------


WITH country_distribution AS (

	SELECT
		COUNT(country)
			AS countries_distribution_count,
		COUNT(guest_name)
			AS guests_count
	FROM bronze.raw_guest_2015_2026_casa_palmela
	WHERE country IS NOT NULL	
)
SELECT
	guests_count,
	countries_distribution_count,
	ROUND(
	countries_distribution_count * 100.0 
	/ guests_count,
	2
	) AS country_completeness_rate
FROM country_distribution;


-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

WITH country_distribution AS (

	SELECT
		COUNT(country)
			AS countries_distribution_count,
		COUNT(guest_name)
			AS guests_count
	FROM bronze.raw_guest_2015_2026_alfama_yellow_house
	WHERE country IS NOT NULL	
)
SELECT
	guests_count,
	countries_distribution_count,
	ROUND(
	countries_distribution_count * 100.0 
	/ guests_count,
	2
	) AS country_completeness_rate
FROM country_distribution;


------------------------------------------------------------------
--------------------COMPOSITE KEY EVALUATION----------------------
-- OBJECTIVE: IDENTIFY ALTERNATIVE KEY STRATEGIES
-- EVALUATE MULTI-ATTRIBUTE IDENTIFICATION
------------------------------------------------------------------

-------------------ALECRIM AO CHIADO HOTEL-----------------------

SELECT
	COUNT(guest_name)
		AS guest_with_repetition_count,
	COUNT(DISTINCT(guest_name))
		AS guest_unique_count,
	COUNT(DISTINCT(reservation_id))
		AS reservation_id_unique_count,
	COUNT(reservation_id)
		AS reservation_with_repetition_count	
FROM bronze.raw_guest_2015_2026_alecrim_ao_chiado;


---------------------CASA PALMELA HOTEL--------------------------

SELECT
	COUNT(guest_name)
		AS guest_with_repetition_count,
	COUNT(DISTINCT(guest_name))
		AS guest_unique_count,
	COUNT(DISTINCT(reservation_id))
		AS reservation_id_unique_count,
	COUNT(reservation_id)
		AS reservation_with_repetition_count	
FROM bronze.raw_guest_2015_2026_casa_palmela;

-----------------ALFAMA YELLOW HOUSE APARTMENTS------------------

SELECT
	COUNT(guest_name)
		AS guest_with_repetition_count,
	COUNT(DISTINCT(guest_name))
		AS guest_unique_count,
	COUNT(DISTINCT(reservation_id))
		AS reservation_id_unique_count,
	COUNT(reservation_id)
		AS reservation_with_repetition_count		
FROM bronze.raw_guest_2015_2026_alfama_yellow_house;

--------------------PROFILING CONCLUSIONS------------------------
-- OBJECTIVE: DOCUMENT PROFILING FINDINGS
-- DEFINE TRANSFORMATION REQUIREMENTS FOR SILVER
-----------------------------------------------------------------

------------------------------------------------------------------
-----------------------IDENTIFIED GRAIN---------------------------
-- OBJECTIVE: DEFINE DATASET GRANULARITY
-- DOCUMENT OBSERVED BUSINESS ENTITY
------------------------------------------------------------------

-- One row represents a guest profile record extracted from the operational
--hospitality system.
-- The dataset does not represent a unique guest entity.
-- Multiple records may exist for the same guest due to repeated stays.
-- The current grain is best described as guest profile records rather
--than consolidated guest entities.

------------------------------------------------------------------
----------------------DATA QUALITY--------------------------
-- OBJECTIVE: SUMMARIZE IDENTIFIED FACTS
-- DOCUMENT DATA QUALITY CONCERNS
------------------------------------------------------------------

-- Guest duplication is present across the dataset.
-- Reservation ID coverage is full.
-- Age is null
-- Email addresses include OTA-generated domains and intermediary addresses.

------------------------------------------------------------------
--------------------BUSINESS KEY CANDIDATE------------------------
-- OBJECTIVE: SELECT THE BEST IDENTIFIER
-- SUPPORT SILVER ENTITY DESIGN
------------------------------------------------------------------

-- Guest Name presents duplication.
-- Reservation ID provides strong identification quality and
--full coverage.
-- Email provide broader coverage but insufficient
--uniqueness.
-- No surrogate Guest Key is needed for Silver Layer implementation.

------------------------------------------------------------------
--------------------DEDUPLICATION STRATEGY------------------------
-- OBJECTIVE: DEFINE RECORD MATCHING RULES
-- DOCUMENT DEDUPLICATION APPROACH
------------------------------------------------------------------

-- Primary Matching Attributes:
-- Reservation ID
-- Guest name
--
-- Secondary Matching Attributes:
-- Email
-- 
--
-- Fallback Matching Attributes:
-- Guest Name + Country
-- Guest Name + Birth Date
-- Guest + Country + Birth Date
--

------------------------------------------------------------------
----------------STANDARDIZATION REQUIREMENTS----------------------
-- OBJECTIVE: DEFINE CLEANING REQUIREMENTS
-- DOCUMENT STANDARDIZATION RULES
------------------------------------------------------------------

-- Standardize Customer Name formatting.
-- Normalize Email values using LOWER and TRIM operations.
-- Separate OTA-generated emails from direct guest emails.
-- Validate Birth Date consistency.
-- Standardize Country values.
-- Standardize Tariff
-- Create reusable identity normalization rules for future hotel datasets.

------------------------------------------------------------------
-----------------SILVER LAYER RECOMMENDATIONS---------------------
-- OBJECTIVE: SUPPORT SILVER MODEL DESIGN
-- DOCUMENT TRANSFORMATION RECOMMENDATIONS
------------------------------------------------------------------
	
-- Create a consolidated Guest Entity table with all datasets
-- Store raw and standardized versions of identity fields.
-- Create standardized email attributes.
-- Implement guest deduplication prior to dimensional modeling.
-- Prepare the Silver Layer to support future multi-property guest
--consolidation.
-- Separate operational identifiers from analytical identifiers.
-- Use reservation_id as the primary key

