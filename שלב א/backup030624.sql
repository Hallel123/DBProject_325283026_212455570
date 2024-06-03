prompt PL/SQL Developer Export Tables for user SYSTEM@XE
prompt Created by halel on יום שני 03 יוני 2024
set feedback off
set define off

prompt Creating PERSON...
create table PERSON
(
  address   VARCHAR2(40) not null,
  mail      VARCHAR2(30) not null,
  mainphone VARCHAR2(10) not null,
  age       INTEGER not null,
  pname     VARCHAR2(30) not null
)
;
alter table PERSON
  add primary key (MAINPHONE);

prompt Creating ACTIVITYOPERATOR...
create table ACTIVITYOPERATOR
(
  ocost     NUMBER(8,2) not null,
  expertise VARCHAR2(40) not null,
  gender    VARCHAR2(15) not null,
  mainphone VARCHAR2(10) not null
)
;
alter table ACTIVITYOPERATOR
  add primary key (MAINPHONE);
alter table ACTIVITYOPERATOR
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Creating HALL...
create table HALL
(
  hname    VARCHAR2(15) not null,
  place    VARCHAR2(40) not null,
  hid      INTEGER not null,
  capacity INTEGER not null
)
;
alter table HALL
  add primary key (HID);

prompt Creating MANAGER...
create table MANAGER
(
  mrole     VARCHAR2(20) not null,
  seniority INTEGER not null,
  mainphone VARCHAR2(10) not null
)
;
alter table MANAGER
  add primary key (MAINPHONE);
alter table MANAGER
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Creating EVENT...
create table EVENT
(
  edate     DATE not null,
  etime     NUMBER(4) not null,
  audience  VARCHAR2(30) not null,
  ecategory VARCHAR2(40) not null,
  activityd VARCHAR2(300) not null,
  price     NUMBER(6,2) not null,
  duration  INTEGER not null,
  eid       INTEGER not null,
  hid       INTEGER not null,
  mainphone VARCHAR2(10) not null
)
;
alter table EVENT
  add primary key (EID);
alter table EVENT
  add foreign key (HID)
  references HALL (HID);
alter table EVENT
  add foreign key (MAINPHONE)
  references MANAGER (MAINPHONE);

prompt Creating EVENT_OPERATOR...
create table EVENT_OPERATOR
(
  eid       INTEGER not null,
  mainphone VARCHAR2(10) not null
)
;
alter table EVENT_OPERATOR
  add primary key (EID, MAINPHONE);
alter table EVENT_OPERATOR
  add foreign key (EID)
  references EVENT (EID);
alter table EVENT_OPERATOR
  add foreign key (MAINPHONE)
  references ACTIVITYOPERATOR (MAINPHONE);

prompt Creating PARTICIPANT...
create table PARTICIPANT
(
  username  VARCHAR2(40),
  ppassword INTEGER,
  ptype     VARCHAR2(30) not null,
  mainphone VARCHAR2(10) not null
)
;
alter table PARTICIPANT
  add primary key (MAINPHONE);
alter table PARTICIPANT
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Creating EVENT_PARTICIPANT...
create table EVENT_PARTICIPANT
(
  review     INTEGER not null,
  seatnumber INTEGER not null,
  cardnum    INTEGER not null,
  signupdate DATE not null,
  eid        INTEGER not null,
  mainphone  VARCHAR2(10) not null
)
;
alter table EVENT_PARTICIPANT
  add primary key (EID, MAINPHONE);
alter table EVENT_PARTICIPANT
  add foreign key (EID)
  references EVENT (EID);
alter table EVENT_PARTICIPANT
  add foreign key (MAINPHONE)
  references PARTICIPANT (MAINPHONE);

prompt Creating MANAGER_WORKING_DAYS...
create table MANAGER_WORKING_DAYS
(
  working_days VARCHAR2(10) not null,
  mainphone    VARCHAR2(10) not null
)
;
alter table MANAGER_WORKING_DAYS
  add primary key (WORKING_DAYS, MAINPHONE);
alter table MANAGER_WORKING_DAYS
  add foreign key (MAINPHONE)
  references MANAGER (MAINPHONE);

prompt Creating PERSON_MORE_PHONE...
create table PERSON_MORE_PHONE
(
  more_phone VARCHAR2(10) not null,
  mainphone  VARCHAR2(10) not null
)
;
alter table PERSON_MORE_PHONE
  add primary key (MORE_PHONE, MAINPHONE);
alter table PERSON_MORE_PHONE
  add foreign key (MAINPHONE)
  references PERSON (MAINPHONE);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR disable all triggers;
prompt Disabling triggers for HALL...
alter table HALL disable all triggers;
prompt Disabling triggers for MANAGER...
alter table MANAGER disable all triggers;
prompt Disabling triggers for EVENT...
alter table EVENT disable all triggers;
prompt Disabling triggers for EVENT_OPERATOR...
alter table EVENT_OPERATOR disable all triggers;
prompt Disabling triggers for PARTICIPANT...
alter table PARTICIPANT disable all triggers;
prompt Disabling triggers for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT disable all triggers;
prompt Disabling triggers for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS disable all triggers;
prompt Disabling triggers for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE disable all triggers;
prompt Disabling foreign key constraints for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR disable constraint SYS_C0010363;
prompt Disabling foreign key constraints for MANAGER...
alter table MANAGER disable constraint SYS_C0010357;
prompt Disabling foreign key constraints for EVENT...
alter table EVENT disable constraint SYS_C0010387;
alter table EVENT disable constraint SYS_C0010388;
prompt Disabling foreign key constraints for EVENT_OPERATOR...
alter table EVENT_OPERATOR disable constraint SYS_C0010392;
alter table EVENT_OPERATOR disable constraint SYS_C0010393;
prompt Disabling foreign key constraints for PARTICIPANT...
alter table PARTICIPANT disable constraint SYS_C0010367;
prompt Disabling foreign key constraints for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT disable constraint SYS_C0010401;
alter table EVENT_PARTICIPANT disable constraint SYS_C0010402;
prompt Disabling foreign key constraints for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS disable constraint SYS_C0010375;
prompt Disabling foreign key constraints for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE disable constraint SYS_C0010371;
prompt Deleting PERSON_MORE_PHONE...
delete from PERSON_MORE_PHONE;
commit;
prompt Deleting MANAGER_WORKING_DAYS...
delete from MANAGER_WORKING_DAYS;
commit;
prompt Deleting EVENT_PARTICIPANT...
delete from EVENT_PARTICIPANT;
commit;
prompt Deleting PARTICIPANT...
delete from PARTICIPANT;
commit;
prompt Deleting EVENT_OPERATOR...
delete from EVENT_OPERATOR;
commit;
prompt Deleting EVENT...
delete from EVENT;
commit;
prompt Deleting MANAGER...
delete from MANAGER;
commit;
prompt Deleting HALL...
delete from HALL;
commit;
prompt Deleting ACTIVITYOPERATOR...
delete from ACTIVITYOPERATOR;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Mattea Drive', 'katrin.f@envisiontelephony.com', '0557707249', 7, 'Katrin  Fehr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Ruth Street', 'curt.r@mai.de', '0500497642', 67, 'Curt  Richards');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Ulsteinvik', 'denny.burstyn@larkinenterprise', '0508589973', 46, 'Denny  Burstyn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Allison Blvd', 'isaact@glaxosmithkline.de', '0520232774', 86, 'Isaac  Tucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Mclean Ave', 'sigourney@tilsonhr.com', '0534688047', 17, 'Sigourney  Pantoliano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('643 Finn Ave', 'larenz.alexander@gillani.br', '0502938640', 79, 'Larenz  Alexander');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Baltimore Street', 'helen.mcnarland@capitalautomot', '0583324755', 51, 'Helen  McNarland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('771 Sewell Drive', 'nikki.shaw@scjohnson.com', '0520189608', 83, 'Nikki  Shaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('367 Gracie Drive', 'helen.marsden@ezecastlesoftwar', '0551327444', 79, 'Helen  Marsden');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Mito Road', 'charlie.sobieski@aci.com', '0537268248', 60, 'Charlie  Sobieski');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Beatty Road', 'christine.s@bristolmyers.ca', '0574664073', 77, 'Christine  Stone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Redwood City Street', 'ike@aco.py', '0534881136', 67, 'Ike  Gyllenhaal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13rd Street', 'frankw@seafoxboat.ca', '0539686928', 28, 'Frank  Wopat');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Liotta', 'christian.garfunkel@wendysinte', '0561112519', 51, 'Christian  Garfunkel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Dreieich Road', 'brad.nicks@telwares.com', '0524790357', 23, 'Brad  Nicks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Julianne Street', 'rueben.keeslar@pioneerdatasyst', '0517679723', 17, 'Rueben  Keeslar');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Lili Road', 'ellen.r@speakeasy.com', '0580852480', 62, 'Ellen  Ribisi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Mel Drive', 'stockardf@diamondtechnologies.', '0521036197', 80, 'Stockard  Fierstein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Pleasence Drive', 'jackie.rauhofer@denaliventures', '0593313177', 34, 'Jackie  Rauhofer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'quentin.serbedzija@lynksystems', '0584811055', 59, 'Quentin  Serbedzija');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Greg Street', 'domingos@grayhawksystems.uk', '0562377443', 42, 'Domingo  Schiff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('713 urban Drive', 'suzy.tolkan@epiqsystems.es', '0521795585', 44, 'Suzy  Tolkan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Union Ave', 'wade.austin@bestever.com', '0590115268', 44, 'Wade  Austin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('544 Jeff Ave', 'xanderb@trm.uk', '0531635860', 85, 'Xander  Bening');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Rod Street', 'a.ward@advertisingventures.uk', '0513390767', 56, 'April  Ward');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Wuerzburg Road', 'giancarlo.armatrading@shufflem', '0513338215', 84, 'Giancarlo  Armatrading');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Venice Drive', 'marisa.coyote@pscinfogroup.com', '0562033925', 43, 'Marisa  Coyote');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Hunter', 'marty@officedepot.uk', '0546932842', 17, 'Marty  Lightfoot');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Carrington Road', 'w.torino@terrafirma.com', '0565968517', 88, 'Wendy  Torino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('630 Keener Ave', 'hilary.henstridge@fns.nl', '0570028133', 40, 'Hilary  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'boz.rush@capitalautomotive.com', '0597766259', 50, 'Boz  Rush');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Madonna Drive', 'doug.mckellen@actechnologies.c', '0506259273', 56, 'Doug  McKellen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Bobby Street', 'gaby.mcpherson@sis.at', '0598815278', 80, 'Gaby  McPherson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('403 Herndon Street', 'richie.jay@pharmafab.com', '0533138647', 62, 'Richie  Jay');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Jacksonville', 'talvin.dunn@ibm.com', '0526347006', 69, 'Talvin  Dunn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('407 Botti Street', 'delbert.osment@calence.br', '0546937935', 15, 'Delbert  Osment');
insert into PERSON (address, mail, mainphone, age, pname)
values ('929 Herne Ave', 'lauren.cantrell@smartronix.de', '0511534711', 25, 'Lauren  Cantrell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Cruise Drive', 'aduchovny@fsffinancial.com', '0514312666', 71, 'Angela  Duchovny');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Thompson Drive', 'holland.donofrio@visionarysyst', '0555493632', 17, 'Holland  D''Onofrio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('205 Larenz Street', 'stephenj@kroger.au', '0538243316', 48, 'Stephen  Jones');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 McIntyre Blvd', 'rachel@envisiontelephony.ca', '0590302911', 26, 'Rachel  Parsons');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Butner', 'lance.b@hardwoodwholesalers.co', '0500630946', 73, 'Lance  Bradford');
insert into PERSON (address, mail, mainphone, age, pname)
values ('875 Silverdale Ave', 'delroy.epps@dcgroup.com', '0593215466', 65, 'Delroy  Epps');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Athens Drive', 'peter.fraser@aristotle.com', '0576717798', 90, 'Peter  Fraser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('996 Williams Street', 's.vaughn@ads.com', '0590530612', 85, 'Sal  Vaughn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Wilson Road', 'harrison@kingland.fi', '0593918778', 21, 'Harrison  Sartain');
insert into PERSON (address, mail, mainphone, age, pname)
values ('854 Hookah Road', 'larry.rebhorn@fns.uk', '0588630773', 69, 'Larry  Rebhorn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'carrieanne.furay@gha.com', '0526843229', 56, 'Carrie-Anne  Furay');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Ronnie Blvd', 'hharry@comnetinternational.jp', '0524281442', 51, 'Henry  Harry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Glendale Road', 'lucindan@newviewgifts.in', '0591658574', 88, 'Lucinda  Neill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 McCoy Blvd', 'bradley.finney@bigyanksports.c', '0577808997', 17, 'Bradley  Finney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Andre Street', 'marybeth@atlanticnet.com', '0520592794', 84, 'Mary Beth  Melvin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Waldorf Street', 'ashton.crystal@bps.ch', '0512182893', 84, 'Ashton  Crystal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Spiner Street', 'emmylou.reynolds@authoria.com', '0554309626', 29, 'Emmylou  Reynolds');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Solido', 'maureen.price@jcpenney.com', '0574953015', 61, 'Maureen  Price');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 McNarland Ave', 'natacha@anheuserbusch.com', '0591899816', 81, 'Natacha  Torino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Tillis Drive', 'b.warren@hersheyfoods.hk', '0503485000', 7, 'Bobbi  Warren');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'dionne.randal@idas.com', '0564503705', 43, 'Dionne  Randal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Scott Street', 'tori.red@operationaltechnologi', '0569937375', 66, 'Tori  Red');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Farnham Drive', 'ernest.schwimmer@conquest.dk', '0513044507', 18, 'Ernest  Schwimmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Gailard Road', 'albertina.whitmore@speakeasy.i', '0510263759', 72, 'Albertina  Whitmore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Richmond Hill Road', 'leonardo.raitt@aquascapedesign', '0548486021', 13, 'Leonardo  Raitt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'kennethm@universalsolutions.co', '0521889795', 87, 'Kenneth  McGregor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Boothe Drive', 'rbaranski@gentrasystems.com', '0567502169', 89, 'Rhett  Baranski');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Cheadle Road', 'miko@linersdirect.jp', '0557863783', 36, 'Miko  Santa Rosa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('253 Tustin Street', 'charlton.makowicz@linersdirect', '0528102573', 66, 'Charlton  Makowicz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Lübeck Ave', 'joaquim.c@kiamotors.com', '0531507564', 13, 'Joaquim  Chestnut');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Earl Ave', 'vin.m@microtek.dk', '0505798712', 7, 'Vin  Miles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Shoreline Street', 'howardg@oneidafinancial.com', '0544199054', 32, 'Howard  Gershon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'leelee@csi.au', '0588577293', 36, 'Leelee  Williams');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Jeff Street', 'spike.vannelli@softworld.cl', '0566733215', 47, 'Spike  Vannelli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Webb Blvd', 'willie.rapaport@deutscheteleko', '0595066999', 16, 'Willie  Rapaport');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 O''Neill Drive', 'renee.s@networkdisplay.com', '0578375057', 89, 'Renee  Shaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 MacLachlan Street', 'nicole.d@fetchlogistics.com', '0546354667', 84, 'Nicole  Diddley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Todd Street', 'j.laurie@aquickdelivery.de', '0560888649', 87, 'Jeffrey  Laurie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'lgaines@jewettcameron.au', '0581940945', 37, 'Larenz  Gaines');
insert into PERSON (address, mail, mainphone, age, pname)
values ('931 Kris Road', 'nathan.bloch@denaliventures.fr', '0501854592', 41, 'Nathan  Bloch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33rd Street', 'jeanclaude@pepsico.nz', '0506622466', 60, 'Jean-Claude  Rankin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'cary@ufs.com', '0529974011', 60, 'Cary  Leguizamo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('863 Trumbull Road', 'buffy@flavorx.be', '0598893373', 89, 'Buffy  Vicious');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Gelsenkirchen Ave', 'kazemm@its.com', '0512876990', 87, 'Kazem  McElhone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Woody Drive', 'ceili.weiland@mqsoftware.com', '0548729179', 84, 'Ceili  Weiland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('230 Shaye Street', 'a.forrest@qls.com', '0536987418', 58, 'Armin  Forrest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Breda Blvd', 'rolandog@stmaryland.uk', '0519618590', 11, 'Rolando  Garber');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Tony Road', 'cevin.barry@bioreference.de', '0511271389', 89, 'Cevin  Barry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('299 Phifer Blvd', 'thomas.clooney@diageo.com', '0586473713', 68, 'Thomas  Clooney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Cliff', 'rita.redgrave@manhattanassocia', '0505344246', 88, 'Rita  Redgrave');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Peter Road', 'amy@softworld.mx', '0585938946', 40, 'Amy  Askew');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Union Drive', 'joan.davis@horizon.com', '0560192317', 85, 'Joan  Davis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Monk Road', 'angie@swi.com', '0578635534', 67, 'Angie  Rickles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Tours Street', 'diane.vinton@investmentscoreca', '0503892731', 71, 'Diane  Vinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Varzea grande Ave', 'arturo.mitchell@cocacola.com', '0526662562', 65, 'Arturo  Mitchell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Channing Street', 'linda.kinnear@hotmail.br', '0594579714', 65, 'Linda  Kinnear');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Oklahoma city Road', 'rassante@pfizer.nc', '0511338139', 52, 'Rose  Assante');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 University Blvd', 'laurie.l@ahl.com', '0503564809', 30, 'Laurie  Lerner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Rhys Street', 'winona.t@microsoft.fr', '0541970273', 69, 'Winona  Tierney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('144 Alcobendas Street', 'rblige@benecongroup.com', '0573308991', 38, 'Rhona  Blige');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Grand-mere Road', 'nwitherspoon@jlphor.com', '0543185060', 28, 'Neneh  Witherspoon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Randal Blvd', 'fats.wills@myricom.com', '0519211681', 26, 'Fats  Wills');
insert into PERSON (address, mail, mainphone, age, pname)
values ('803 Dreyfuss Road', 'famke.pacino@nestle.it', '0557354517', 55, 'Famke  Pacino');
commit;
prompt 100 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('737 Levin Street', 'demi.b@officedepot.ar', '0581568582', 84, 'Demi  Bonham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Mitchell Road', 'jpresley@tmaresources.com', '0597992618', 30, 'Jennifer  Presley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'robbie.whitman@target.dk', '0579022455', 71, 'Robbie  Whitman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Chely Street', 'delroy.roundtree@supplycorecom', '0595233459', 64, 'Delroy  Roundtree');
insert into PERSON (address, mail, mainphone, age, pname)
values ('76 King Street', 'nick.gore@safehomesecurity.com', '0503530360', 81, 'Nick  Gore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Cedar Park Street', 'ali.cheadle@max.com', '0582900098', 44, 'Ali  Cheadle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Gilberto Street', 'alfie.dourif@aci.com', '0537739716', 44, 'Alfie  Dourif');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Hanover Street', 'dorry.hayek@mms.com', '0535499232', 23, 'Dorry  Hayek');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 CeCe Drive', 'ronny.plummer@progressivemedic', '0585294922', 7, 'Ronny  Plummer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Bob Road', 'gwyneth.neill@kelmooreinvestme', '0557093193', 14, 'Gwyneth  Neill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Glenn Drive', 'm.hauser@captechventures.com', '0554113426', 12, 'Morgan  Hauser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Mahoney Drive', 'michael.r@deutschetelekom.de', '0589447308', 78, 'Michael  Rubinek');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'geena.zevon@fflcbancorp.de', '0536438278', 13, 'Geena  Zevon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Isabella', 'lucinda.z@pacificdatadesigns.f', '0576710420', 67, 'Lucinda  Zeta-Jones');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Rodriguez Drive', 'robert.b@mindworks.com', '0556763849', 83, 'Robert  Berkoff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Valentin Street', 'jay.watley@bestbuy.in', '0510317336', 13, 'Jay  Watley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('922 Mills Street', 'raymond.hubbard@linersdirect.c', '0518432457', 32, 'Raymond  Hubbard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Winter Road', 'b.elizabeth@totalentertainment', '0556105240', 76, 'Bonnie  Elizabeth');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Grand-mere Street', 'h.foxx@waltdisney.com', '0566515727', 75, 'Henry  Foxx');
insert into PERSON (address, mail, mainphone, age, pname)
values ('468 Sophie Blvd', 'henry.trejo@smi.com', '0537095578', 76, 'Henry  Trejo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Swank Road', 'r.gallant@ccb.fr', '0542688933', 46, 'Ronny  Gallant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'sinead.fraser@dell.com', '0575008809', 58, 'Sinead  Fraser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('244 Judy Drive', 'thomas@gulfmarkoffshore.com', '0591952966', 66, 'Thomas  Snider');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Soest Road', 'angelah@eagleone.uk', '0569177132', 55, 'Angela  Hagar');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Bassett Street', 'charlie.allen@sm.com', '0599611863', 53, 'Charlie  Allen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Kopavogur Road', 'gavin@dps.com', '0546142962', 63, 'Gavin  Smith');
insert into PERSON (address, mail, mainphone, age, pname)
values ('368 Spring Valley Drive', 'harold.slater@uem.uk', '0501432940', 47, 'Harold  Slater');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Kopavogur', 'mnicks@younginnovations.com', '0564591647', 48, 'Morris  Nicks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Marlon Ave', 'm.kelly@glmt.com', '0539290960', 46, 'Marina  Kelly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Davidtz Road', 'v.soul@hatworld.com', '0599960605', 29, 'Vertical  Soul');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Hughes Street', 'dustin@bigdoughcom.com', '0514708634', 23, 'Dustin  Holmes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'belinda.r@sds.ch', '0567886597', 89, 'Belinda  Ramirez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Dearborn', 'alan.mcbride@vesta.com', '0572798055', 70, 'Alan  McBride');
insert into PERSON (address, mail, mainphone, age, pname)
values ('434 Lloyd Street', 'pierce@dvdt.com', '0526896250', 67, 'Pierce  Dunn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Javon Drive', 'cthornton@gdi.jp', '0501193938', 82, 'Cameron  Thornton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Whitaker Road', 'b.payne@yashtechnologies.it', '0542839481', 7, 'Betty  Payne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Farrow Street', 'carol.diffie@tilia.it', '0580352389', 30, 'Carol  Diffie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 durham Street', 'anthony.fehr@kmart.jp', '0583559618', 74, 'Anthony  Fehr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'sylvesterm@digitalmotorworks.c', '0535747771', 25, 'Sylvester  Martinez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Fort Saskatchewan Drive', 'ramsey.kapanka@astute.de', '0564567343', 73, 'Ramsey  Kapanka');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Tah Road', 'ndafoe@visionarysystems.br', '0534088376', 40, 'Night  Dafoe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Green', 'sophie.carradine@keith.br', '0516056811', 25, 'Sophie  Carradine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('415 Frakes Ave', 'clea.diehl@midwestmedia.com', '0514819778', 76, 'Clea  Diehl');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Bentley Road', 'lili.tolkan@fab.com', '0593816573', 85, 'Lili  Tolkan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('106 Dave Street', 'albert.gere@investorstitle.se', '0581508023', 42, 'Albert  Gere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Cervine Street', 'lena.tucker@nexxtworks.fr', '0528950917', 41, 'Lena  Tucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Richardson Drive', 'mos.cocker@simplycertificates.', '0594944968', 21, 'Mos  Cocker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53rd Street', 'amyk@ntas.com', '0510217105', 34, 'Amy  Krieger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Rene Drive', 'sheryl.w@daimlerchrysler.com', '0564714035', 39, 'Sheryl  Wainwright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Patrick Drive', 'victor.haysbert@ass.com', '0568526327', 84, 'Victor  Haysbert');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Guest Road', 'merrilee.balk@abatix.com', '0539610354', 75, 'Merrilee  Balk');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Affleck', 'first.d@captechventures.nl', '0521055638', 68, 'First  Duchovny');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Whitley Road', 'cyndi@pis.ee', '0506345335', 61, 'Cyndi  Bragg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 McIntyre Street', 'harvey@epiqsystems.de', '0549377200', 46, 'Harvey  Ratzenberger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 O''Neal Road', 'c.molina@ssi.com', '0505528150', 16, 'Casey  Molina');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Redhill Blvd', 'j.connick@eastmankodak.de', '0520460860', 22, 'Judge  Connick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('241 Coe', 'miguel.napolitano@aoltimewarne', '0544166787', 17, 'Miguel  Napolitano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('999 Radney Street', 'victoria@marriottinternational', '0539484418', 75, 'Victoria  Hauser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Tallahassee Drive', 'dquatro@greenmountain.com', '0518917016', 8, 'Drew  Quatro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'albert.stormare@marketbased.co', '0578704415', 30, 'Albert  Stormare');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Hikaru Road', 'leo.henstridge@johnkeeler.com', '0553633895', 30, 'Leo  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Sellers Drive', 'rwhite@authoria.fr', '0592050053', 54, 'Randall  White');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 'rspacey@microsoft.com', '0546101500', 45, 'Russell  Spacey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Sammy Road', 'burt.maclachlan@coldstonecream', '0532968343', 28, 'Burt  MacLachlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('932 Brody Road', 'judd.chandler@hfn.com', '0585000866', 43, 'Judd  Chandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'avenged@ogi.de', '0509043539', 29, 'Avenged  Potter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Franz Blvd', 'bebe.beck@commworks.ie', '0500286837', 23, 'Bebe  Beck');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Darius Drive', 'kimberly.woodward@alternativet', '0540183260', 61, 'Kimberly  Woodward');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Harary Drive', 'oro.stuart@quakercitybancorp.d', '0552925526', 47, 'Oro  Stuart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Hidalgo Road', 'a.belle@visionarysystems.com', '0510556271', 56, 'Ani  Belle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Brad Drive', 's.weaving@hitechpharmacal.com', '0550776802', 18, 'Selma  Weaving');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Saxon Drive', 'chaka.bruce@ogi.com', '0534680711', 83, 'Chaka  Bruce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('542 Diesel Street', 'carlas@floorgraphics.uk', '0599687457', 13, 'Carla  Sharp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Prowse Drive', 'francek@connected.br', '0587676181', 73, 'France  Kristofferson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Farrell Road', 'faye.horton@fab.fr', '0589020755', 28, 'Faye  Horton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Myles Drive', 'randall.ermey@heritagemicrofil', '0502812779', 55, 'Randall  Ermey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 MacLachlan Street', 'edgar.weaving@greenmountain.co', '0576731225', 12, 'Edgar  Weaving');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Leawood Ave', 'nancy.macneil@randomwalk.com', '0504353524', 18, 'Nancy  MacNeil');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Dourif Road', 'geoff.k@electricalsolutions.at', '0539591584', 76, 'Geoff  Kravitz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('344 Coleman Road', 'mykelti@owm.ch', '0584572126', 11, 'Mykelti  Flack');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'tcheky.mould@bmm.de', '0516940381', 33, 'Tcheky  Mould');
insert into PERSON (address, mail, mainphone, age, pname)
values ('793 Getty Road', 'george@solutionbuilders.de', '0580265923', 45, 'George  Sarsgaard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Cliff Road', 'vertical.n@fflcbancorp.com', '0530702515', 20, 'Vertical  Navarro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('10 Hopper Drive', 'jimmy.conlee@gci.fr', '0593597055', 71, 'Jimmy  Conlee');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Lucy Street', 'f.prinze@medamicus.jp', '0590848304', 67, 'Famke  Prinze');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Anjelica Street', 'reese.edmunds@als.br', '0508501950', 10, 'Reese  Edmunds');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 McDonald Street', 'kevin.donovan@canterburypark.c', '0537863884', 7, 'Kevin  Donovan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'mdiaz@calence.uk', '0531171109', 73, 'Mary  Diaz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53rd Street', 'f.lattimore@hiltonhotels.com', '0511317538', 7, 'Franco  Lattimore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Bell Road', 'davy.dysart@canterburypark.za', '0538644364', 29, 'Davy  Dysart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Bradford Road', 'rhys@prahs.uk', '0594894111', 60, 'Rhys  Hannah');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Daejeon Road', 'rogerh@gateway.de', '0519303303', 38, 'Roger  Holland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Richards Street', 'winona.lynch@lydiantrust.com', '0532415008', 16, 'Winona  Lynch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Frankie', 'eellis@scripnet.ar', '0585748285', 53, 'Emily  Ellis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12nd Street', 'powersd@profitline.com', '0511764671', 16, 'Powers  Driver');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Ulsteinvik Road', 'ann.bergen@proclarity.ch', '0548325334', 68, 'Ann  Bergen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Shoreline Street', 'carrieanne.h@codykramerimports', '0503550006', 58, 'Carrie-Anne  Hutton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Clea Ave', 'alana.breslin@wlt.fr', '0558450444', 28, 'Alana  Breslin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Pryce Blvd', 'dylan@hersheyfoods.it', '0598456956', 79, 'Dylan  Dourif');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Sutherland Ave', 'phoebe.f@ipsadvisory.de', '0586284343', 56, 'Phoebe  Francis');
commit;
prompt 200 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Paxton Road', 'pierce.dempsey@meghasystems.co', '0563366374', 48, 'Pierce  Dempsey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51st Street', 'junior.todd@nhr.de', '0553090407', 34, 'Junior  Todd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Hackman Drive', 'rupert.rains@stonebrewing.com', '0594835754', 46, 'Rupert  Rains');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Udine Road', 'geoffrey@sps.au', '0533921371', 67, 'Geoffrey  Hingle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Belinda Road', 'c.niven@captechventures.dk', '0525828269', 79, 'Cyndi  Niven');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Buffy Drive', 'maxa@shufflemaster.pl', '0525273822', 26, 'Max  Almond');
insert into PERSON (address, mail, mainphone, age, pname)
values ('185 Carl Street', 'aida.r@navigatorsystems.jp', '0503627425', 57, 'Aida  Rivers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Leguizamo', 'leonardoc@conagra.de', '0512838383', 54, 'Leonardo  Coyote');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Dillane Street', 'rod@mathis.de', '0507511795', 69, 'Rod  Shannon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Callow Street', 'cherry.thornton@uem.za', '0508508720', 40, 'Cherry  Thornton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Posener', 'ice@signalperfection.it', '0508464360', 10, 'Ice  Schwimmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Byrd', 'elias@glaxosmithkline.uk', '0549451329', 48, 'Elias  Thompson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21st Street', 'laurie.f@hencie.de', '0550051323', 24, 'Laurie  Fonda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Omar Street', 'jean.s@computersource.de', '0570485357', 29, 'Jean  Sossamon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Curry Blvd', 'ccross@hencie.com', '0546343616', 17, 'Cliff  Cross');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Helsinki', 'maggie.imbruglia@ceom.com', '0548602272', 21, 'Maggie  Imbruglia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Hagar Road', 'sfrancis@escalade.com', '0503101104', 59, 'Sander  Francis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'curtis.squier@hardwoodwholesal', '0513109709', 62, 'Curtis  Squier');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Allen', 'winona.arnold@hersheyfoods.com', '0594498711', 39, 'Winona  Arnold');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Johnson Drive', 'ggiamatti@dancor.au', '0567026383', 57, 'Garland  Giamatti');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Rhea', 'chuck.hersh@magnet.ch', '0511387288', 82, 'Chuck  Hersh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('94 Lorenz', 'e.berenger@generalelectric.se', '0550317294', 32, 'Eddie  Berenger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11st Street', 'ralph.skarsgard@safeway.no', '0522444828', 45, 'Ralph  Skarsgard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Blacksburg Ave', 'gslater@nsd.es', '0566474743', 64, 'Goran  Slater');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Chung Drive', 'rob.saintemarie@investorstitle', '0597307316', 69, 'Rob  Sainte-Marie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Adrien', 'm.rifkin@atxforms.pl', '0543585977', 71, 'Molly  Rifkin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Lennox Street', 'colinr@dcgroup.tw', '0567299811', 89, 'Colin  Robbins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Nicholas Blvd', 'gerald.borgnine@ctg.ca', '0512308721', 46, 'Gerald  Borgnine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Del Toro Drive', 'celia.kirshner@arkidata.com', '0519811382', 35, 'Celia  Kirshner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Pretoria Street', 'colm.fichtner@codykramerimport', '0574107038', 62, 'Colm  Fichtner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Dunn loring Drive', 'juan.sisto@grayhawksystems.dk', '0579332086', 40, 'Juan  Sisto');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Lengdorf Road', 'burt.detmer@vspan.com', '0509694473', 33, 'Burt  Detmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 McGinley Drive', 'gloria.cooper@mss.de', '0596390768', 24, 'Gloria  Cooper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Shatner Drive', 'merrilee.stowe@contract.uk', '0522421340', 79, 'Merrilee  Stowe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Ward Road', 'h.amos@providentbancorp.jp', '0540775948', 86, 'Hugo  Amos');
insert into PERSON (address, mail, mainphone, age, pname)
values ('935 Helen Street', 'juliette.mcintosh@pulaskifinan', '0534094104', 20, 'Juliette  McIntosh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Somerset Drive', 'jeffery.paymer@bigyanksports.a', '0567138369', 45, 'Jeffery  Paymer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Westfield Street', 'solomon.zellweger@epiqsystems.', '0589374244', 11, 'Solomon  Zellweger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Isaacs Street', 'oliver.r@scooterstore.br', '0575409528', 46, 'Oliver  Rhys-Davies');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Davidson', 'b.dealmeida@spenser.jp', '0554333345', 59, 'Bette  De Almeida');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Verdun Drive', 'toni@ahl.com', '0510087703', 9, 'Toni  Duncan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Nancy Drive', 'lstowe@efcbancorp.nl', '0521079325', 29, 'Leon  Stowe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Posey Drive', 'lennies@circuitcitystores.com', '0508640173', 46, 'Lennie  Secada');
insert into PERSON (address, mail, mainphone, age, pname)
values ('106 Mraz Road', 'v.buscemi@bis.com', '0509755517', 10, 'Vern  Buscemi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Victor Road', 'glen.lauper@softworld.de', '0547319975', 26, 'Glen  Lauper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Duschel Road', 'colm@terrafirma.com', '0538243599', 12, 'Colm  Crouch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Horace Blvd', 'jude.serbedzija@axis.br', '0519439926', 16, 'Jude  Serbedzija');
insert into PERSON (address, mail, mainphone, age, pname)
values ('289 Gaynor Road', 'adina.manning@sfmai.it', '0544479475', 43, 'Adina  Manning');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Altamonte Springs Street', 'garth.davison@kramontrealty.co', '0575549482', 56, 'Garth  Davison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('724 Wally Road', 'celia.gaynor@morganresearch.co', '0540110136', 37, 'Celia  Gaynor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('555 Cardiff Ave', 'lauren.prinze@cis.dk', '0583734767', 33, 'Lauren  Prinze');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Brando Street', 'laurie.mcfadden@fmt.com', '0578537869', 49, 'Laurie  McFadden');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Arnold', 'chad.janssen@nmr.za', '0552118370', 71, 'Chad  Janssen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Lloyd Drive', 'torit@cendant.jp', '0582203614', 59, 'Tori  Travolta');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Blades', 'fats.thornton@ach.com', '0503432094', 48, 'Fats  Thornton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Sally', 'ned.wahlberg@mitsubishimotors.', '0522974518', 35, 'Ned  Wahlberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Holden Drive', 'brothers.mcintosh@pis.jp', '0529227456', 30, 'Brothers  McIntosh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('813 Emerson Street', 'eileen.s@oneidafinancial.com', '0519708237', 19, 'Eileen  Sinatra');
insert into PERSON (address, mail, mainphone, age, pname)
values ('681 Sartain Ave', 'glen.arkenstone@nlx.cy', '0599346865', 17, 'Glen  Arkenstone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Ceasar', 'davy.ticotin@gltg.com', '0507234732', 77, 'Davy  Ticotin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Kilmer Road', 'beverley.klein@fra.no', '0585745777', 71, 'Beverley  Klein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('924 Coquitlam Blvd', 'bryan.englund@bigdoughcom.com', '0584289871', 34, 'Bryan  Englund');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Randal Road', 'lois.b@primussoftware.ec', '0501334287', 66, 'Lois  Busey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('248 Reynolds Blvd', 'buddy.rauhofer@printtech.uk', '0579187030', 15, 'Buddy  Rauhofer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41st Street', 'thora.orton@marketfirst.com', '0523870921', 28, 'Thora  Orton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Kathy Road', 'rory.d@providenceservice.dk', '0506239202', 63, 'Rory  Dysart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Mint', 'kieran.eatworld@astute.com', '0539389305', 26, 'Kieran  Eat World');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Andre Street', 't.hatfield@mds.ch', '0543819549', 81, 'Trace  Hatfield');
insert into PERSON (address, mail, mainphone, age, pname)
values ('647 Ponce Street', 'g.bracco@speakeasy.uk', '0515265698', 47, 'Gaby  Bracco');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Gaynor Road', 'sophie.pantoliano@techrx.dk', '0504363962', 12, 'Sophie  Pantoliano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'meryl.benoit@tlsservicebureau.', '0553348479', 8, 'Meryl  Benoit');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Khan Drive', 'phoebe.nivola@oriservices.com', '0510359446', 12, 'Phoebe  Nivola');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Hohenfels Road', 'samuel.gough@interfacesoftware', '0525978794', 42, 'Samuel  Gough');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Schlieren Drive', 'celiam@pacificdatadesigns.com', '0509992753', 19, 'Celia  McClinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Edenbridge Drive', 'janice.craddock@datawarehouse.', '0571739539', 78, 'Janice  Craddock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Burwood East Drive', 'nina@kelmooreinvestment.ch', '0564117696', 68, 'Nina  Koteas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('482 Hartnett Road', 'sinead.mahood@wav.uk', '0541370338', 58, 'Sinead  Mahood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Shue Street', 'matt.s@smartronix.com', '0588066007', 78, 'Matt  Strong');
insert into PERSON (address, mail, mainphone, age, pname)
values ('102 Carlene Blvd', 'dave.weiss@glacierbancorp.de', '0555813256', 58, 'Dave  Weiss');
insert into PERSON (address, mail, mainphone, age, pname)
values ('690 Tal Street', 'terri@credopetroleum.com', '0577900749', 71, 'Terri  Nicholson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Lyonne Street', 'andie.lawrence@lms.com', '0533046837', 76, 'Andie  Lawrence');
insert into PERSON (address, mail, mainphone, age, pname)
values ('784 Juliana Blvd', 'gwyneth.sartain@bis.pt', '0561122443', 27, 'Gwyneth  Sartain');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33rd Street', 'chloeb@saksinc.com', '0536642831', 66, 'Chloe  Biggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Mortensen Blvd', 'vincent.prowse@fnb.jp', '0502430929', 44, 'Vincent  Prowse');
insert into PERSON (address, mail, mainphone, age, pname)
values ('390 Hal Street', 'cbentley@clubone.au', '0506026595', 10, 'CeCe  Bentley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Elwes Street', 'seth.underwood@fmt.com', '0583656086', 16, 'Seth  Underwood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Horton Ave', 'king.kimball@gentrasystems.br', '0585712714', 83, 'King  Kimball');
insert into PERSON (address, mail, mainphone, age, pname)
values ('450 Giraldo Road', 'tim.patrick@printingforlesscom', '0550698004', 70, 'Tim  Patrick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Adam Street', 'lorraine.kapanka@trinityhomeca', '0571183944', 89, 'Lorraine  Kapanka');
insert into PERSON (address, mail, mainphone, age, pname)
values ('463 Singapore Road', 'milla.rawls@printcafesoftware.', '0562317521', 60, 'Milla  Rawls');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Rizzo Blvd', 'kenneth.blossoms@ads.it', '0532516511', 20, 'Kenneth  Blossoms');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Budapest Drive', 'c.wells@accuship.uk', '0529435216', 52, 'Clive  Wells');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Houston Drive', 'isabella.bedelia@coadvantagere', '0541824219', 59, 'Isabella  Bedelia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Coslada Street', 'giovanni.faithfull@jollyenterp', '0591020249', 36, 'Giovanni  Faithfull');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Taha Drive', 'j.hornsby@sourcegear.com', '0597296185', 22, 'Javon  Hornsby');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Ford Street', 'lisa.devine@pepsico.com', '0551118318', 59, 'Lisa  Devine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Columbia Drive', 'aandrews@bluffcitysteel.ch', '0582119918', 76, 'Anna  Andrews');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Li Street', 'ecrosby@capitalautomotive.com', '0508625403', 32, 'Emm  Crosby');
insert into PERSON (address, mail, mainphone, age, pname)
values ('671 Spring City Drive', 'freddie.p@montpelierplastics.i', '0537241221', 9, 'Freddie  Paxton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'ndayne@scheringplough.com', '0562435584', 8, 'Nanci  Dayne');
commit;
prompt 300 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Brasília Blvd', 'jodie.aiken@accessus.es', '0554731443', 38, 'Jodie  Aiken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Mark Street', 'rade.whitwam@inzone.com', '0593083669', 66, 'Rade  Whitwam');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Cleary Street', 'brooke.u@denaliventures.com', '0544867922', 70, 'Brooke  urban');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Donna Street', 'kurtwood.lewis@qls.jp', '0512235238', 86, 'Kurtwood  Lewis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'nlunch@trx.au', '0588583669', 21, 'Nils  Lunch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('572 Caan Street', 'woody.c@oriservices.nz', '0599794085', 80, 'Woody  Cochran');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Brendan Blvd', 'dom.salt@bioreference.com', '0576329977', 85, 'Dom  Salt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Javon Street', 'bebe.gold@base.br', '0580340247', 77, 'Bebe  Gold');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Lara', 'lorraine.tsettos@savela.mx', '0520458230', 13, 'Lorraine  Tsettos');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Duesseldorf', 'dustin.ruffalo@mitsubishimotor', '0574211067', 26, 'Dustin  Ruffalo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('591 Austin Road', 'busta.krieger@ibm.jp', '0518337460', 59, 'Busta  Krieger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('345 Balk', 'marybeth@tripwire.br', '0547702639', 46, 'Mary Beth  Fox');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11st Street', 'delbert.m@lindin.ch', '0583773968', 10, 'Delbert  McKellen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Womack Drive', 'hugh.flemyng@healthscribe.com', '0517945438', 35, 'Hugh  Flemyng');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Elisabeth', 'christmas.matarazzo@alohanysys', '0512059305', 33, 'Christmas  Matarazzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Tcheky Street', 'isaiah.k@glaxosmithkline.com', '0554507123', 20, 'Isaiah  Keaton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Rachael Drive', 'gabys@ass.com', '0506170828', 61, 'Gaby  Skerritt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Bay Shore', 'neneh@elite.br', '0556326933', 66, 'Neneh  Hirsch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Celia Road', 'saustin@seafoxboat.au', '0544426706', 19, 'Shannon  Austin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('778 Norton Drive', 'winona.c@virbac.za', '0571816829', 88, 'Winona  Carr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Fraser Road', 'nickel@air.pt', '0568196519', 22, 'Nickel  Watley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Snipes Ave', 'ted.mulroney@investmentscoreca', '0511901124', 11, 'Ted  Mulroney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('660 Mexico City Drive', 'bernard.h@americanexpress.ch', '0585571834', 32, 'Bernard  Holden');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Harrelson Street', 'johnette.carrington@oneidafina', '0582589624', 53, 'Johnette  Carrington');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Embeth Drive', 'eweaver@mathis.com', '0526010284', 11, 'Eliza  Weaver');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Dalton Road', 'vince.estevez@cima.com', '0587689272', 81, 'Vince  Estevez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'renee.rodriguez@midwestmedia.c', '0521277638', 15, 'Renee  Rodriguez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Aiken Road', 'debbie@signalperfection.de', '0582556077', 40, 'Debbie  Bacon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62nd Street', 'roddy.garofalo@progressivemedi', '0562180244', 10, 'Roddy  Garofalo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Minneapolis Ave', 'wrydell@captechventures.mx', '0562412336', 38, 'Winona  Rydell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Fierstein', 'gabrielle.p@monarchcasino.com', '0538158764', 28, 'Gabrielle  Pearce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Schock Street', 'm.wainwright@vesta.ca', '0572043963', 61, 'Matt  Wainwright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Glen Street', 'jaffleck@mercantilebank.com', '0534504508', 84, 'Juliana  Affleck');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Ricci Street', 'rolando.pride@refinery.ch', '0568532597', 87, 'Rolando  Pride');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Jena Street', 'austin.garr@sds.com', '0594843927', 88, 'Austin  Garr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Brisbane Blvd', 'regina.gayle@comglobalsystems.', '0505575181', 59, 'Regina  Gayle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Salem Drive', 'afranklin@horizonorganic.com', '0562445041', 69, 'Andrew  Franklin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Lane Drive', 'kirk.hutch@shufflemaster.ch', '0516827250', 88, 'Kirk  Hutch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Owen Road', 'emerson.skaggs@bowman.com', '0574008574', 18, 'Emerson  Skaggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('669 Hart Drive', 'henry.p@atlanticcredit.com', '0578430058', 85, 'Henry  Price');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Rhona Road', 'kiefer.chandler@prosperitybanc', '0519585348', 45, 'Kiefer  Chandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Hartnett Road', 'cliff.c@avr.com', '0544099085', 30, 'Cliff  Cage');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Khan Blvd', 'austin.rains@otbd.com', '0528086324', 88, 'Austin  Rains');
insert into PERSON (address, mail, mainphone, age, pname)
values ('904 Carnes Street', 'rawlins.pitney@taycorfinancial', '0555309155', 15, 'Rawlins  Pitney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Lin Road', 'caryl@unit.dk', '0587661760', 83, 'Cary  Leto');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Suwon Road', 'vern.fichtner@tripwire.it', '0526088200', 63, 'Vern  Fichtner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('359 Costello Drive', 'cece.tolkan@anheuserbusch.uk', '0563492072', 30, 'CeCe  Tolkan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Maura Street', 'lynette.macht@fiberlink.it', '0566308995', 43, 'Lynette  Macht');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Blackmore Road', 'ving.maguire@streetglow.br', '0580482345', 13, 'Ving  Maguire');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Thörishaus Street', 'embeth.daniels@directdata.uk', '0532089288', 42, 'Embeth  Daniels');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Flemyng Blvd', 'mac.charles@bioanalytical.za', '0538233833', 56, 'Mac  Charles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Orange Drive', 'sonny.p@ghrsystems.com', '0561101970', 88, 'Sonny  Palin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Netanya', 'okeen@businessplus.de', '0550970920', 44, 'Olympia  Keen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Thalwil Road', 'paula.wahlberg@noodles.com', '0514958495', 90, 'Paula  Wahlberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Springfield Road', 'jude.d@curagroup.be', '0547770046', 83, 'Jude  Dayne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'fairuza.niven@cimalabs.ca', '0519137863', 13, 'Fairuza  Niven');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Rankin Street', 'emmylou.mann@conquest.com', '0575357488', 39, 'Emmylou  Mann');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Coltrane Drive', 'gwyneth.c@alternativetechnolog', '0571444030', 67, 'Gwyneth  Carrey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Reid Road', 'bridget.curtis@visionarysystem', '0507030013', 74, 'Bridget  Curtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'wendy.masur@jlphor.com', '0572915813', 70, 'Wendy  Masur');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12nd Street', 'hilarym@jlphor.de', '0500311798', 10, 'Hilary  May');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Himmelman Ave', 'rcooper@fmi.com', '0533096673', 55, 'Regina  Cooper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('555 Frederiksberg Drive', 'sylvester.gibson@pioneerdatasy', '0546888058', 46, 'Sylvester  Gibson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('651 Matsue Drive', 'delbert@mission.ca', '0501050305', 32, 'Delbert  Rudd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'roberta.m@clubone.ca', '0525603811', 87, 'Roberta  McLachlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('998 Rio Road', 'fiona.hopkins@procurementcentr', '0569464555', 10, 'Fiona  Hopkins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'andie.parish@medsource.com', '0578293517', 40, 'Andie  Parish');
insert into PERSON (address, mail, mainphone, age, pname)
values ('976 Lynn Street', 'mili@bristolmyers.se', '0580733510', 22, 'Mili  Shaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Chambers Road', 'nikkit@contract.de', '0561360263', 26, 'Nikki  Tanon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('495 Odense Road', 'antonio.collie@qestrel.at', '0573073062', 81, 'Antonio  Collie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('800 Jim', 'anih@als.com', '0547797090', 85, 'Ani  Harary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('125 Giancarlo Ave', 'f.lane@ungertechnologies.in', '0595535243', 46, 'France  Lane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Westerberg Street', 'devon.conley@solutionbuilders.', '0529485334', 25, 'Devon  Conley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Swank Road', 'burton@doctorsassociates.fi', '0558031018', 77, 'Burton  Marshall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Biehn Road', 'tmacpherson@aoe.uk', '0507193642', 33, 'Taryn  MacPherson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 'martyf@its.it', '0554923177', 43, 'Marty  Fehr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Halfway house Road', 'patrick@vitacostcom.ca', '0564474356', 84, 'Patrick  Davies');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Jude Street', 'terry.latifah@idas.com', '0555638079', 51, 'Terry  Latifah');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Holy Road', 'julie@mqsoftware.it', '0563453847', 49, 'Julie  Diesel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Leelee Street', 'w.rains@adeasolutions.au', '0570026771', 33, 'Wallace  Rains');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Karachi Drive', 'liquid.spine@directdata.com', '0587861653', 67, 'Liquid  Spine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'percy.meyer@montpelierplastics', '0521662454', 28, 'Percy  Meyer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Mirren Drive', 'rupert.blair@oss.no', '0573024015', 66, 'Rupert  Blair');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Gunton', 'taniston@gdatechnologies.de', '0556483883', 7, 'Tanya  Aniston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Joaquin Street', 'jonathan.michael@sds.com', '0529569517', 63, 'Jonathan  Michael');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Lauren Ave', 'quentin.eder@diageo.it', '0599947268', 17, 'Quentin  Eder');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Jackson Blvd', 'trick.t@ris.ca', '0558118082', 15, 'Trick  Tucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Kattan Drive', 'rcurfman@sps.uk', '0524093670', 70, 'Rowan  Curfman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Irati Ave', 'elias.deschanel@faef.fr', '0501717471', 14, 'Elias  Deschanel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'queen.feuerstein@simplycertifi', '0572574241', 32, 'Queen  Feuerstein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Rich', 'epreston@worldcom.uk', '0535531873', 47, 'Ethan  Preston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Udo Road', 'andrew.stallone@timevision.com', '0522355522', 15, 'Andrew  Stallone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Sedaka Road', 'dylan@spectrum.ch', '0540721463', 43, 'Dylan  Supernaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 South Hadley Drive', 'anjelica.crewson@calence.de', '0502447756', 71, 'Anjelica  Crewson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Downey Road', 'willie.flatts@talx.uk', '0531509736', 28, 'Willie  Flatts');
insert into PERSON (address, mail, mainphone, age, pname)
values ('113 Craig Blvd', 'vondie.p@cws.uk', '0591946782', 67, 'Vondie  Page');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Borger Road', 'herbie.downie@ctg.uk', '0551127903', 67, 'Herbie  Downie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('978 Nile', 'avril.mcnarland@parksite.com', '0576241402', 66, 'Avril  McNarland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Machine Ave', 'pamela.elliott@aventis.com', '0588696385', 50, 'Pamela  Elliott');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Steenburgen Street', 'jarvisv@3tsystems.ca', '0515367991', 17, 'Jarvis  Van Damme');
commit;
prompt 400 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'sarah.mcferrin@benecongroup.jp', '0508334359', 25, 'Sarah  McFerrin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Ramirez Blvd', 'carolyn.coyote@royalgold.com', '0576923186', 67, 'Carolyn  Coyote');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 McDowell Drive', 'davey.quinlan@simplycertificat', '0518946930', 89, 'Davey  Quinlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Singletary Road', 'elizaf@hitechpharmacal.com', '0514235565', 33, 'Eliza  Fraser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 De Niro Blvd', 'tiglesias@chhc.com', '0515290021', 29, 'Trick  Iglesias');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Bonnie Road', 'd.henriksen@wci.de', '0557443266', 38, 'David  Henriksen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'mingnab@wyeth.ca', '0562874167', 21, 'Ming-Na  Berry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Tah Street', 'petula.hingle@processplus.za', '0586739024', 41, 'Petula  Hingle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Tierney', 'awoodward@woronocobancorp.com', '0581721598', 26, 'April  Woodward');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Katie Street', 'kazem.badalucco@hcoa.nl', '0545969840', 58, 'Kazem  Badalucco');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Joaquin Ave', 'ossieh@jewettcameron.ch', '0540078214', 33, 'Ossie  Hunter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Rotterdam', 'marty@tilsonlandscape.au', '0555970106', 87, 'Marty  Atkinson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Patty Road', 'saul.brolin@trc.si', '0544210018', 22, 'Saul  Brolin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Elias Blvd', 'ivan.peterson@linersdirect.com', '0503629325', 68, 'Ivan  Peterson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21st Street', 'chad.c@gsat.ch', '0508243434', 23, 'Chad  Charles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Orbit Street', 'jakej@unilever.com', '0564106804', 30, 'Jake  Jordan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Pearce Blvd', 'lydia.osborne@anworthmortgage.', '0592296354', 82, 'Lydia  Osborne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Blades Street', 'e.bacharach@astafunding.au', '0540761780', 58, 'Elvis  Bacharach');
insert into PERSON (address, mail, mainphone, age, pname)
values ('957 Chur Road', 'e.seagal@walmartstores.com', '0574646176', 84, 'Elizabeth  Seagal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Victor', 'buddy.sevenfold@navigatorsyste', '0550060959', 87, 'Buddy  Sevenfold');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61st Street', 'rhona.tanon@accurateautobody.c', '0533769909', 55, 'Rhona  Tanon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Vaduz Blvd', 'sam.hidalgo@hospitalsolutions.', '0534001522', 69, 'Sam  Hidalgo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Holderbank Road', 'gilbertr@flavorx.com', '0548241287', 14, 'Gilbert  Rucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Nantes Road', 'cate.carradine@americanexpress', '0585435867', 57, 'Cate  Carradine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Dunst', 'angelinac@zoneperfectnutrition', '0524258385', 55, 'Angelina  Cetera');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Gabrielle Road', 'j.jamal@jcpenney.com', '0521658484', 29, 'Janice  Jamal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('724 Oldman Street', 'wendy.furtado@sunstream.com', '0559479517', 15, 'Wendy  Furtado');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71st Street', 'anjelica.w@arkidata.li', '0500433048', 54, 'Anjelica  Waits');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Sainte-Marie Blvd', 'vivica.lizzy@bigdoughcom.com', '0542988174', 37, 'Vivica  Lizzy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Helsingborg Street', 'rachael.begley@pis.com', '0504451723', 64, 'Rachael  Begley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Leachman Street', 'tara.tate@grs.com', '0564619708', 19, 'Tara  Tate');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Tim Drive', 'jaime.armstrong@midwestmedia.c', '0544274569', 68, 'Jaime  Armstrong');
insert into PERSON (address, mail, mainphone, age, pname)
values ('124 Espoo Street', 'natlas@chhc.uk', '0581190718', 73, 'Nickel  Atlas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83rd Street', 'giovanni.m@kwraf.ch', '0533826049', 25, 'Giovanni  Matarazzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Moscow Blvd', 'thin.lorenz@nhhc.cl', '0501194171', 65, 'Thin  Lorenz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Guy Road', 'gclinton@pioneermortgage.jp', '0545473905', 15, 'Gates  Clinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Talvin Road', 'l.yulin@telepoint.de', '0577478634', 27, 'Lloyd  Yulin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Austin Drive', 'kasey@clorox.uk', '0565183036', 67, 'Kasey  Wen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Carrington', 'wesley.ruffalo@walmartstores.l', '0566795113', 33, 'Wesley  Ruffalo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Hopper Road', 'hector.s@ultimus.com', '0524773854', 36, 'Hector  Sylvian');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 San Diego', 'chad@avs.uk', '0506525198', 58, 'Chad  Dickinson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Broadbent Street', 'lionel.bergen@educationaldevel', '0520071603', 14, 'Lionel  Bergen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Tampa Ave', 'latin.collette@northhighland.c', '0500826585', 13, 'Latin  Collette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Llewelyn Street', 'powers.gano@sbc.uk', '0575761737', 73, 'Powers  Gano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Goldblum Drive', 'roberta.gordon@campbellsoup.jp', '0542159338', 53, 'Roberta  Gordon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Stampley Drive', 'dabney.balin@gcd.com', '0562075105', 39, 'Dabney  Balin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Dave', 'lynetter@carteretmortgage.nz', '0576973467', 11, 'Lynette  Rea');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Deejay Blvd', 'hvince@microsoft.com', '0570832109', 51, 'Hank  Vince');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 O''Neal Road', 'wally.m@alternativetechnology.', '0566116662', 45, 'Wally  Marsden');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Fambach Drive', 'shannon.ball@solutionbuilders.', '0576184662', 82, 'Shannon  Ball');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Roger Ave', 'cole.stigers@savela.uk', '0528836738', 17, 'Cole  Stigers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Franco Street', 'hhorton@fflcbancorp.jp', '0520721761', 74, 'Holland  Horton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Brian Street', 'j.nivola@epiqsystems.com', '0596659954', 22, 'Jay  Nivola');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Conley Blvd', 'carlene.neill@tilia.de', '0521202539', 71, 'Carlene  Neill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('711 Wilkinson Road', 'dan.rourke@spd.de', '0573708240', 83, 'Dan  Rourke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Geoffrey Ave', 'boz.singletary@pds.de', '0544165196', 21, 'Boz  Singletary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('975 Manning Blvd', 'emmylou.gates@mitsubishimotors', '0596416460', 63, 'Emmylou  Gates');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Hjallerup Road', 'lskarsgard@catamount.com', '0566343621', 57, 'Leonardo  Skarsgard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 David Street', 's.mitra@streetglow.cr', '0575186709', 59, 'Steven  Mitra');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Morris Drive', 'glen.d@aventis.com', '0545297235', 57, 'Glen  Damon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Rydell Road', 'johnnie.gill@newviewgifts.de', '0527921856', 19, 'Johnnie  Gill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Blair Road', 'junior.damon@bioreliance.uk', '0543202091', 29, 'Junior  Damon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Chuck Road', 'rueben.barrymore@streetglow.co', '0507505612', 61, 'Rueben  Barrymore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Coburg Street', 'lalbright@bluffcitysteel.jp', '0543106186', 42, 'Lili  Albright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Daniels Road', 'mae.spine@spinnakerexploration', '0586736939', 7, 'Mae  Spine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71st Street', 'marc.torino@fpf.com', '0551908086', 45, 'Marc  Torino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Katie Drive', 'annetteb@peerlessmanufacturing', '0598690854', 35, 'Annette  Bell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Driver Road', 'c.chan@mse.com', '0535608360', 59, 'Cheryl  Chan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Addy Road', 'tramaine.jeter@ait.uk', '0592116994', 44, 'Tramaine  Jeter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Addy Ave', 'orlando.t@trc.jp', '0500055352', 85, 'Orlando  Travolta');
insert into PERSON (address, mail, mainphone, age, pname)
values ('348 Jay Ave', 'kevn@linksys.uk', '0578198461', 79, 'Kevn  Witt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Santa Clarita Road', 'stephen@componentgraphics.com', '0539028067', 33, 'Stephen  Sweeney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('863 Field Road', 'nickel.field@avs.com', '0506502189', 20, 'Nickel  Field');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Patrick Drive', 'sylvestero@sensortechnologies.', '0578993788', 40, 'Sylvester  Osmond');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Wesley Street', 'rita.burton@banfeproducts.com', '0545919599', 31, 'Rita  Burton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Durning Road', 'milla.imperioli@officedepot.il', '0529671920', 54, 'Milla  Imperioli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('786 Ashland Road', 'johnette.shandling@providentba', '0555116882', 79, 'Johnette  Shandling');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Brookfield Street', 'casey.supernaw@bat.hu', '0554595594', 75, 'Casey  Supernaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Trento Drive', 'judge.carlyle@benecongroup.fi', '0554199406', 13, 'Judge  Carlyle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Solomon Drive', 'bette.aiken@daimlerchrysler.co', '0536093940', 7, 'Bette  Aiken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'bradley.sample@progressivemedi', '0559874976', 73, 'Bradley  Sample');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Lynne Ave', 'harold.scott@multimedialive.co', '0589639305', 37, 'Harold  Scott');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Dukakis Blvd', 'millie.trejo@toyotamotor.uk', '0573222797', 17, 'Millie  Trejo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Withers', 'kirk@cooktek.uk', '0591408672', 55, 'Kirk  Fisher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Shawn Street', 'javon.duvall@baesch.br', '0580312222', 38, 'Javon  Duvall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Reading Drive', 'sona.cronin@gcd.com', '0527144872', 70, 'Sona  Cronin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Mahoney Street', 'mary.diffie@quakercitybancorp.', '0567352595', 33, 'Mary  Diffie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Faithfull Street', 'albertt@ahl.jp', '0560680486', 20, 'Albert  Tah');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Biel Drive', 'juliannas@base.uk', '0553855788', 67, 'Julianna  Shearer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33rd Street', 'tcheky.h@abatix.lk', '0584151025', 39, 'Tcheky  Holm');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Pelvic Street', 'adam.ness@microsoft.de', '0501200707', 87, 'Adam  Ness');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Stamp', 'humberto.n@americanhealthways.', '0553672507', 13, 'Humberto  Nicks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Pretoria Blvd', 'jbuckingham@smg.nl', '0565899890', 53, 'Jimmie  Buckingham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'emm.guinness@slt.es', '0555665593', 20, 'Emm  Guinness');
insert into PERSON (address, mail, mainphone, age, pname)
values ('348 Shatner Street', 'kirk.l@stm.com', '0532152363', 89, 'Kirk  Lipnicki');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Laurel Road', 'diane@mwh.com', '0520695920', 53, 'Diane  Crouch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('194 Clint Drive', 'danny.francis@blueoceansoftwar', '0567908267', 10, 'Danny  Francis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21st Street', 'sarah.hawke@homedepot.dk', '0580321637', 33, 'Sarah  Hawke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Holiday Street', 'iann@codykramerimports.com', '0569913037', 86, 'Ian  Newton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Klein Road', 'rlonsdale@horizonorganic.com', '0579602281', 20, 'Rebeka  Lonsdale');
commit;
prompt 500 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Peebles Drive', 'alana.coyote@tripwire.com', '0570208285', 59, 'Alana  Coyote');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Schiff Road', 'rcrow@savela.de', '0552736660', 44, 'Robin  Crow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13rd Street', 'zooey@mavericktechnologies.de', '0596527177', 23, 'Zooey  Torres');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Arturo Street', 'esedgwick@esteelauder.is', '0567390343', 7, 'Elias  Sedgwick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('483 Avril Ave', 'harris.ponce@mds.it', '0518905802', 49, 'Harris  Ponce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Harris Ave', 'richard.winter@staffone.au', '0518989712', 59, 'Richard  Winter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Gatlin Road', 'maggie@teoco.uk', '0535202590', 45, 'Maggie  Allison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Woodward Street', 'a.herrmann@cendant.za', '0549350445', 40, 'Anita  Herrmann');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21st Street', 'bonnie.affleck@curagroup.be', '0586953094', 77, 'Bonnie  Affleck');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Slough Drive', 'l.ryan@swi.fi', '0563192682', 14, 'Lionel  Ryan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Hopkins Street', 'jim.hawn@wci.com', '0549751262', 33, 'Jim  Hawn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('76 Gauteng Street', 'ani.c@heritagemicrofilm.ve', '0513396514', 74, 'Ani  Coyote');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Marisa Road', 'andrea.loeb@directdata.com', '0520181879', 30, 'Andrea  Loeb');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Ann Arbor Drive', 't.sellers@americanvanguard.es', '0500237442', 57, 'Terri  Sellers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('369 Li Street', 'mint.almond@socketinternet.nl', '0552323962', 48, 'Mint  Almond');
insert into PERSON (address, mail, mainphone, age, pname)
values ('197 Mueller-Stahl Blvd', 'n.affleck@hudsonriverbancorp.c', '0534805825', 69, 'Nikka  Affleck');
insert into PERSON (address, mail, mainphone, age, pname)
values ('511 Northam Street', 'stewart.b@wci.com', '0509807420', 75, 'Stewart  Byrd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('302 Fred', 'nicky.ammons@ibm.ie', '0522872927', 85, 'Nicky  Ammons');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Neuquen Street', 'oro.ranger@nissanmotor.com', '0579936562', 32, 'Oro  Ranger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('759 Soda Drive', 'bret@fds.ca', '0519658918', 81, 'Bret  Steagall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Bozeman Drive', 'freddie.gore@lydiantrust.com', '0536038978', 90, 'Freddie  Gore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Rydell Drive', 'a.langella@mwp.uk', '0554759785', 45, 'Anjelica  Langella');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Madeleine Street', 'debbie.davidson@stiknowledge.f', '0598570593', 90, 'Debbie  Davidson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Melvin Road', 'wallacec@saralee.fr', '0511912542', 44, 'Wallace  Cobbs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 King of Prussia Road', 'hhewitt@prosperitybancshares.u', '0546220811', 32, 'Heather  Hewitt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('946 Harriet Road', 'alex.imbruglia@hencie.de', '0516999870', 54, 'Alex  Imbruglia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'spike.porter@meritagetechnolog', '0575093744', 7, 'Spike  Porter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'ellen.tierney@esteelauder.gr', '0590918086', 32, 'Ellen  Tierney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Willis Street', 'dylan.russell@coridiantechnolo', '0589706433', 82, 'Dylan  Russell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 McGriff Road', 'jay.kahn@toyotamotor.com', '0577695823', 59, 'Jay  Kahn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'freda.boone@pis.pe', '0508030202', 61, 'Freda  Boone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Sharon Street', 'ritchie.doucette@morganresearc', '0537700660', 15, 'Ritchie  Doucette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Melba Road', 'darius.s@air.uk', '0579486069', 86, 'Darius  Schwarzenegger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Grand-mere Road', 'faye.steiger@stiknowledge.br', '0574612753', 31, 'Faye  Steiger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Presley Blvd', 'natasha@trinityhomecare.za', '0578808509', 13, 'Natasha  Newton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('199 Maintenon Street', 'barryh@kitba.ca', '0535406668', 16, 'Barry  Harary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Ball Drive', 'debbie.mahoney@totalentertainm', '0531324145', 35, 'Debbie  Mahoney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Cohn Road', 'v.spacey@securitycheck.ca', '0539709035', 69, 'Vin  Spacey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'ernie.skaggs@paintedword.uk', '0503550405', 70, 'Ernie  Skaggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Nash Road', 'jeanclaudeb@smartdrawcom.com', '0524642699', 72, 'Jean-Claude  Brando');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Saxon Street', 'kazem.sample@glaxosmithkline.c', '0580423252', 79, 'Kazem  Sample');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Kyra Road', 'jarvis.h@stonetechprofessional', '0528291399', 78, 'Jarvis  Holiday');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Emily Street', 'tramaine.duncan@stonebrewing.c', '0566688568', 21, 'Tramaine  Duncan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Hohenfels', 'walter.palin@americanmegacom.u', '0530127339', 47, 'Walter  Palin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Philip Street', 'cmurray@extremepizza.com', '0558622022', 85, 'Clarence  Murray');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Mary Drive', 'phoebe@lydiantrust.com', '0561114292', 69, 'Phoebe  LaBelle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Lehi Street', 'tyrone.metcalf@linersdirect.za', '0516484369', 22, 'Tyrone  Metcalf');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63rd Street', 'jimmie.vinton@mitsubishimotors', '0581136088', 28, 'Jimmie  Vinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Tlalpan Drive', 'zooey.pearce@ibm.es', '0510615273', 14, 'Zooey  Pearce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Marie Street', 'lee.streep@bayer.dk', '0536153004', 77, 'Lee  Streep');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Quinones Road', 'parker@bashen.au', '0578723446', 81, 'Parker  May');
insert into PERSON (address, mail, mainphone, age, pname)
values ('10 Lewin', 'diamond@trainersoft.uk', '0510405589', 19, 'Diamond  Wiest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Gordie Road', 'shannon.vai@hencie.de', '0586782213', 70, 'Shannon  Vai');
insert into PERSON (address, mail, mainphone, age, pname)
values ('848 Dickinson Street', 'm.lemmon@innovateecommerce.com', '0514938011', 83, 'Miko  Lemmon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Gambon Street', 'rhenstridge@alogent.com', '0544888336', 47, 'Ronnie  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'joanna.zappacosta@quicksilverr', '0552298926', 30, 'Joanna  Zappacosta');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Schreiber', 'uma.paxton@staffforce.il', '0555593226', 44, 'Uma  Paxton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Elche Drive', 'hector.carrere@ufs.com', '0576801411', 27, 'Hector  Carrere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Annette', 'giovanni.shocked@socketinterne', '0532031018', 61, 'Giovanni  Shocked');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Supernaw Road', 'aadams@nlx.com', '0517847220', 41, 'Andre  Adams');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Shannon Road', 'rene.tennison@coridiantechnolo', '0576325175', 65, 'Rene  Tennison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Marianne Blvd', 'eliza.houston@learningvoyage.d', '0503800168', 62, 'Eliza  Houston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Isaak Drive', 'jmattea@gulfmarkoffshore.br', '0590081008', 90, 'Jackson  Mattea');
insert into PERSON (address, mail, mainphone, age, pname)
values ('817 Ewan Street', 'jonatha.b@atxforms.com', '0563006540', 11, 'Jonatha  Bedelia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Daniels Drive', 'val.polley@componentgraphics.c', '0598917495', 18, 'Val  Polley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Sheffield Ave', 'petula.dafoe@pra.jp', '0500884148', 67, 'Petula  Dafoe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('634 Folds Ave', 'dom.winstone@progressivemedica', '0554845814', 15, 'Dom  Winstone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Gordie Road', 'veruca.h@atg.au', '0583851628', 14, 'Veruca  Hanley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Cube Drive', 'mbrolin@toyotamotor.br', '0502061771', 41, 'Michelle  Brolin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Bonneville Road', 'dave.holeman@ibm.com', '0569800902', 31, 'Dave  Holeman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Tilly Street', 'buddy.krumholtz@jma.be', '0551558301', 35, 'Buddy  Krumholtz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('758 Postlethwaite Drive', 'wallace.fogerty@acsis.com', '0576504473', 26, 'Wallace  Fogerty');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Guzman Road', 'heather.dillon@hotmail.uk', '0505261561', 75, 'Heather  Dillon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 McGill Street', 'randall.brooks@simplycertifica', '0524538303', 8, 'Randall  Brooks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('679 Cusack Blvd', 'billy.gatlin@dcgroup.de', '0544571829', 54, 'Billy  Gatlin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Ludbreg Drive', 'lynn.carlton@columbiabancorp.b', '0549027814', 51, 'Lynn  Carlton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Hector Road', 'howie.heald@esteelauder.de', '0595709048', 76, 'Howie  Heald');
insert into PERSON (address, mail, mainphone, age, pname)
values ('408 Mt. Laurel', 'al.gallagher@credopetroleum.co', '0576193712', 72, 'Al  Gallagher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Page Drive', 'bhidalgo@wellsfinancial.com', '0513201607', 32, 'Burton  Hidalgo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('663 Merchant Ave', 'jmcdonald@nlx.com', '0583291236', 15, 'Janeane  McDonald');
insert into PERSON (address, mail, mainphone, age, pname)
values ('305 Tillis Drive', 'talvin.cleary@northhighland.co', '0554962706', 24, 'Talvin  Cleary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('688 Guadalajara Road', 'johnnie.rippy@columbiabancorp.', '0551688545', 40, 'Johnnie  Rippy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Mint Drive', 'sophie.gilley@ssci.com', '0599400640', 25, 'Sophie  Gilley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Dortmund Blvd', 'colinp@sfb.be', '0523809063', 46, 'Colin  Peebles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Springville Road', 'vendetta@advancedneuromodulati', '0574534288', 47, 'Vendetta  Torres');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Oxford Road', 'ralph.makowicz@hcoa.com', '0503941198', 25, 'Ralph  Makowicz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('325 Echirolles Road', 'boz.wells@meridiangold.com', '0575518351', 53, 'Boz  Wells');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Oszajca Drive', 'm.tucker@questarcapital.com', '0534444595', 21, 'Mary-Louise  Tucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Cottbus Road', 's.spall@inzone.com', '0584022555', 12, 'Spike  Spall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Mac', 'reese.huston@manhattanassociat', '0517017524', 43, 'Reese  Huston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 North Sydney Ave', 'kjanssen@sourcegear.br', '0520434190', 32, 'Kurt  Janssen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'bebe.shearer@ctg.ca', '0563849581', 50, 'Bebe  Shearer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('374 Kahn Street', 'crystal@3tsystems.com', '0528709917', 27, 'Crystal  Reinhold');
insert into PERSON (address, mail, mainphone, age, pname)
values ('771 Martha Blvd', 'rascal@providenceservice.com', '0549215065', 54, 'Rascal  Dzundza');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Kadison Drive', 'davis@appriss.jp', '0508851191', 36, 'Davis  Pepper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Aaron Blvd', 'denzel.jessee@stm.ca', '0578619490', 81, 'Denzel  Jessee');
insert into PERSON (address, mail, mainphone, age, pname)
values ('192 Sainte-Marie Street', 'will.pryce@shar.lk', '0591601993', 16, 'Will  Pryce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Sheryl Street', 'taylor@noodles.com', '0541766966', 56, 'Taylor  Trejo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Nathan Ave', 'kmorales@tracertechnologies.no', '0544068548', 57, 'Kieran  Morales');
insert into PERSON (address, mail, mainphone, age, pname)
values ('897 Numan Ave', 'gilbert.robinson@campbellsoup.', '0594616523', 33, 'Gilbert  Robinson');
commit;
prompt 600 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Larry Street', 'jeanluc.neuwirth@hfn.com', '0565474757', 88, 'Jean-Luc  Neuwirth');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Matthau Blvd', 'chloe.whitford@aoe.de', '0529458493', 43, 'Chloe  Whitford');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Dickinson Street', 'n.lemmon@toyotamotor.at', '0561320638', 73, 'Nik  Lemmon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Kaysville Street', 'jarvis.cheadle@onesourceprinti', '0580373266', 64, 'Jarvis  Cheadle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51st Street', 'carla.close@teoco.com', '0573836703', 17, 'Carla  Close');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Marisa Street', 'louise@diageo.com', '0517656196', 74, 'Louise  Lovitz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Bretzfeld-Waldbach Road', 'bebe.h@unilever.mx', '0584532557', 31, 'Bebe  Hawke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Gibson Street', 'andie.meniketti@generalelectri', '0522166236', 27, 'Andie  Meniketti');
insert into PERSON (address, mail, mainphone, age, pname)
values ('920 Shoreline Drive', 'rebeka.crow@glmt.fi', '0567059018', 62, 'Rebeka  Crow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'elisabeth.cheadle@ksj.de', '0521294781', 35, 'Elisabeth  Cheadle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Waltham Road', 'rachael.collins@sis.com', '0524106540', 66, 'Rachael  Collins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Rutger Street', 'hookah.c@spinnakerexploration.', '0589262650', 86, 'Hookah  Clinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Duisburg Street', 'vtolkan@coadvantageresources.b', '0535425043', 40, 'Vin  Tolkan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 San Mateo Blvd', 'brittany.fiennes@ccfholding.de', '0599018664', 33, 'Brittany  Fiennes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Callow Street', 'woody.bancroft@valleyoaksystem', '0534201997', 66, 'Woody  Bancroft');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Ruiz Street', 'michael.loring@shufflemaster.c', '0546267936', 17, 'Michael  Loring');
insert into PERSON (address, mail, mainphone, age, pname)
values ('556 Arjona Road', 'vpearce@terrafirma.my', '0501034809', 85, 'Ving  Pearce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Rancho Palos Verdes Street', 'emilyh@fmb.de', '0512592752', 60, 'Emily  Hershey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('196 Maxwell Road', 'bonnie.vonsydow@idlabel.de', '0567087919', 23, 'Bonnie  von Sydow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 Mary Road', 'annette@ungertechnologies.nc', '0528225807', 14, 'Annette  McCain');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62nd Street', 'chaka.janssen@isd.br', '0562748523', 31, 'Chaka  Janssen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Duluth Road', 'fiona.wolf@gillette.uk', '0596377511', 55, 'Fiona  Wolf');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Jackson Drive', 'mtomlin@venoco.uk', '0574509645', 75, 'Mira  Tomlin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Cuenca', 'steven.dzundza@contract.com', '0514474086', 69, 'Steven  Dzundza');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Maureen Road', 'illeana.danes@visionarysystems', '0589661346', 42, 'Illeana  Danes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Trento Road', 'alfie.leto@jewettcameron.uk', '0519049163', 40, 'Alfie  Leto');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Woodbridge Drive', 'andrea.mckean@exinomtechnologi', '0592988124', 68, 'Andrea  McKean');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Applegate Road', 'gaby@gra.za', '0508884481', 47, 'Gaby  Forster');
insert into PERSON (address, mail, mainphone, age, pname)
values ('923 Tea Road', 'ediep@vitacostcom.com', '0582881688', 22, 'Edie  Polito');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Marlboro Blvd', 'howard.oldman@credopetroleum.n', '0509693825', 81, 'Howard  Oldman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Cornell Drive', 'lin.c@generalmills.za', '0575441910', 41, 'Lin  Camp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Bønes Drive', 'nickel.haslam@actechnologies.c', '0540939645', 84, 'Nickel  Haslam');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 New Hope Road', 'alec.walken@infinity.com', '0509297759', 59, 'Alec  Walken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Rosanna Road', 'kiefer.wood@parker.com', '0510594048', 37, 'Kiefer  Wood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Stockholm Road', 'christine.steiger@asa.com', '0543517052', 26, 'Christine  Steiger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Larnelle Road', 'charlie@hardwoodwholesalers.co', '0548528731', 57, 'Charlie  Ferrer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Beaverton Road', 'gin.amos@bluffcitysteel.ch', '0551428246', 84, 'Gin  Amos');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Lynn Street', 'gordon.l@ecopy.de', '0533561612', 44, 'Gordon  Levert');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Nina Road', 'lois.platt@magnet.au', '0545464410', 27, 'Lois  Platt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Oszajca Drive', 'dennis@sandyspringbancorp.za', '0540063616', 31, 'Dennis  Roundtree');
insert into PERSON (address, mail, mainphone, age, pname)
values ('493 Pamela Drive', 'ricardo.zappacosta@curagroup.d', '0552127026', 10, 'Ricardo  Zappacosta');
insert into PERSON (address, mail, mainphone, age, pname)
values ('439 Weisberg Ave', 'donna.krieger@chipssolutions.j', '0514087479', 87, 'Donna  Krieger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('942 Patty', 'mike.klein@mainstreetbanks.de', '0598579195', 74, 'Mike  Klein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('661 Singapore Drive', 'cheryl.berkeley@taycorfinancia', '0597280011', 20, 'Cheryl  Berkeley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Gooding Drive', 'fairuza.donofrio@spd.it', '0559060901', 42, 'Fairuza  D''Onofrio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Suvari Blvd', 'ty.richardson@staffforce.de', '0512763980', 70, 'Ty  Richardson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Sisto Street', 'gord@pulaskifinancial.com', '0555245616', 67, 'Gord  MacPherson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Donal Drive', 'alec.steenburgen@nsd.au', '0525954920', 79, 'Alec  Steenburgen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('770 Snow Street', 'norm@inspirationsoftware.ca', '0541096515', 16, 'Norm  Culkin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('420 Niles Ave', 'courtney@curagroup.de', '0583559384', 48, 'Courtney  Dorn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Fox Street', 'gil.negbaur@uem.jp', '0596189033', 9, 'Gil  Negbaur');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Long Island City', 'avril.barkin@oriservices.com', '0589967425', 66, 'Avril  Barkin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Jane Street', 'cherry.jeffreys@asapstaffing.c', '0538596012', 16, 'Cherry  Jeffreys');
insert into PERSON (address, mail, mainphone, age, pname)
values ('375 Juice Road', 'blair.crudup@dcgroup.uk', '0573556437', 48, 'Blair  Crudup');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Torres Street', 'kristin.davidson@conagra.com', '0562922131', 86, 'Kristin  Davidson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Gin Road', 'brittany.white@heartlab.nl', '0551247362', 52, 'Brittany  White');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 'suzanne@pib.fr', '0507847718', 16, 'Suzanne  Domino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Taoyuan Ave', 'dmoss@onesourceprinting.com', '0594048250', 20, 'Debra  Moss');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Fender Ave', 'drew@merck.it', '0528874977', 75, 'Drew  Close');
insert into PERSON (address, mail, mainphone, age, pname)
values ('682 Wang Drive', 'phil.magnuson@wyeth.de', '0548892561', 13, 'Phil  Magnuson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Rik Street', 'darius.shatner@y2marketing.com', '0502527840', 10, 'Darius  Shatner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Ammons Road', 'jack@blueoceansoftware.fr', '0581812792', 67, 'Jack  Kudrow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('485 Patty Road', 'elizabeth@refinery.com', '0568591784', 30, 'Elizabeth  Sutherland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Adams Ave', 'gran@typhoon.hu', '0563629776', 29, 'Gran  Sample');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Uggams Street', 'jake.spader@wav.com', '0572124731', 74, 'Jake  Spader');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Cassel Drive', 'r.rizzo@jsa.com', '0516221965', 76, 'Rosanne  Rizzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('997 Lindsey', 's.myles@morganresearch.uk', '0581746680', 61, 'Steven  Myles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Rivers Road', 'marybeth.mccoy@techrx.com', '0540204789', 19, 'Mary Beth  McCoy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Conlee Ave', 'ekline@cascadebancorp.com', '0583331407', 13, 'Earl  Kline');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Dorry Road', 'candice.craven@fmb.uk', '0552187987', 39, 'Candice  Craven');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Shearer Street', 'roger.tobolowsky@sears.de', '0574586960', 45, 'Roger  Tobolowsky');
insert into PERSON (address, mail, mainphone, age, pname)
values ('808 Valencia Road', 'gene.fonda@gra.de', '0524005338', 24, 'Gene  Fonda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('281 Krabbe Drive', 'sheryl.daniels@dbprofessionals', '0560278444', 69, 'Sheryl  Daniels');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Horton', 'bustap@clorox.ca', '0552217986', 38, 'Busta  Paltrow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Luongo Street', 'garry@balchem.com', '0599092022', 63, 'Garry  Esposito');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Glenn Road', 'trini.elizondo@sm.com', '0597156735', 11, 'Trini  Elizondo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Ellen Blvd', 'andrae.k@hencie.ch', '0500234962', 67, 'Andrae  Kennedy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Goteborg Street', 'nik.applegate@qas.ch', '0558491298', 71, 'Nik  Applegate');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Brent Street', 'mira.calle@newtoninteractive.g', '0508152158', 54, 'Mira  Calle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'leonardo@ctg.com', '0509954523', 38, 'Leonardo  Reno');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Fairview Heights Road', 'maureen@spenser.de', '0575117229', 49, 'Maureen  Rooker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Delafield Road', 'b.johnson@marriottinternationa', '0549641223', 31, 'Brenda  Johnson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('712 Fort Saskatchewan Road', 'max.rebhorn@privatebancorp.com', '0532775819', 90, 'Max  Rebhorn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Turner Road', 'k.cockburn@ubp.de', '0558256451', 17, 'Kirk  Cockburn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Creek Street', 'ike.dorn@viacom.at', '0513424470', 19, 'Ike  Dorn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('994 Selma Road', 'howard@exinomtechnologies.com', '0550911879', 36, 'Howard  Jenkins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Allen Street', 'garland.greenwood@networkdispl', '0591051704', 42, 'Garland  Greenwood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('616 Natasha Drive', 'burton.mclachlan@abs.com', '0562312561', 58, 'Burton  McLachlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'gran.c@ipsadvisory.com', '0571803422', 28, 'Gran  Cale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Nicholas Drive', 'frankies@unilever.hu', '0540519724', 15, 'Frankie  Studi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('76 Meyer Street', 'sigourney@tilsonhr.com', '0515938589', 81, 'Sigourney  Englund');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53rd Street', 'cesarf@travizon.de', '0579597190', 27, 'Cesar  Farina');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'freddie@microtek.jp', '0584029480', 65, 'Freddie  Sawa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Newbury Drive', 'mike.garfunkel@telesynthesis.c', '0520516674', 34, 'Mike  Garfunkel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Scott', 's.harary@talx.com', '0595296967', 68, 'Saffron  Harary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Powell River Street', 'emerson.hawke@ois.com', '0510972867', 47, 'Emerson  Hawke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Plimpton Blvd', 'kurt.mattea@datawarehouse.com', '0553225887', 37, 'Kurt  Mattea');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Ed Drive', 'javonb@faef.es', '0501464988', 69, 'Javon  Buckingham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63rd Street', 'lydia.eastwood@bigyanksports.c', '0514596993', 87, 'Lydia  Eastwood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Cape town', 'n.mcdowell@csi.com', '0576894710', 27, 'Nelly  McDowell');
commit;
prompt 700 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Jennifer', 'jaimes@infopros.de', '0524205337', 28, 'Jaime  Schwarzenegger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Harry Drive', 'fnortham@primussoftware.li', '0503525885', 49, 'France  Northam');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'rolando.cassidy@pis.com', '0508092702', 87, 'Rolando  Cassidy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Lerner Ave', 'cloggins@larkinenterprises.fr', '0579031316', 37, 'Chrissie  Loggins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Reisterstown Road', 'colm.fox@learningvoyage.hu', '0528829612', 46, 'Colm  Fox');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Streep Street', 'brothers.frost@marriottinterna', '0503066383', 25, 'Brothers  Frost');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Epps Road', 'jeroen.rucker@gltg.com', '0592522051', 65, 'Jeroen  Rucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Burke Street', 'barry.lillard@gulfmarkoffshore', '0571838230', 39, 'Barry  Lillard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Sparrows Point Road', 'ronnie.w@technica.it', '0562247352', 11, 'Ronnie  Webb');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Farris', 'chubby.pacino@comglobalsystems', '0542853203', 10, 'Chubby  Pacino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Sutton Road', 'allan.douglas@accurateautobody', '0528631460', 58, 'Allan  Douglas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('466 Garcia Ave', 'barbara@jcpenney.de', '0582570661', 65, 'Barbara  Mazar');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Tyler Street', 'gates.donovan@signalperfection', '0599710225', 50, 'Gates  Donovan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Davies Ave', 'debby@anworthmortgage.nc', '0577758689', 77, 'Debby  Soul');
insert into PERSON (address, mail, mainphone, age, pname)
values ('257 Bailey Drive', 'ernie.irving@qas.au', '0530465873', 56, 'Ernie  Irving');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Curt', 'emm.gilley@stiknowledge.com', '0559320340', 71, 'Emm  Gilley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'trick.raybon@isd.br', '0523476937', 58, 'Trick  Raybon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Bello Blvd', 'rita.bosco@saralee.com', '0545530750', 45, 'Rita  Bosco');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Scott Ave', 'crichardson@mattel.com', '0520488915', 20, 'Colleen  Richardson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Herford Road', 'lloyd@genextechnologies.mx', '0596351958', 63, 'Lloyd  Cazale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Willard', 'lea.c@formatech.de', '0543413397', 49, 'Lea  Crowe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Mount Olive Drive', 'tramainec@dell.de', '0574906697', 90, 'Tramaine  Carnes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Johnson Street', 'rosco.dunst@deutschetelekom.hk', '0575296500', 37, 'Rosco  Dunst');
insert into PERSON (address, mail, mainphone, age, pname)
values ('459 Grand Rapids Street', 'caroline.zahn@hotmail.de', '0503999075', 38, 'Caroline  Zahn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('439 Gooding Road', 'meryl@its.com', '0559448244', 37, 'Meryl  Lapointe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62nd Street', 'pete.chapman@glmt.in', '0554898210', 32, 'Pete  Chapman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Roscoe', 'cledus@bioanalytical.mx', '0578227685', 12, 'Cledus  Doucette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Sherman Street', 'latin.paige@codykramerimports.', '0558704438', 22, 'Latin  Paige');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'kitty.kline@dearbornbancorp.my', '0522760069', 9, 'Kitty  Kline');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Field Street', 'joseph.santana@elite.com', '0528670758', 58, 'Joseph  Santana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Draper', 'rade.lindo@pfizer.be', '0580877090', 80, 'Rade  Lindo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Aaron Drive', 'c.palmer@gateway.za', '0550582716', 87, 'Cuba  Palmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Eldard Street', 'roryb@midwestmedia.uk', '0577877385', 68, 'Rory  Berry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Gano Street', 'terence.kennedy@bioanalytical.', '0596755516', 41, 'Terence  Kennedy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Guinness Drive', 'sberkeley@peerlessmanufacturin', '0572657786', 45, 'Spike  Berkeley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('10 Vega Ave', 'christine.chaykin@spotfirehold', '0565497840', 82, 'Christine  Chaykin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('615 Hannover Street', 'mira.flatts@socketinternet.it', '0590267661', 23, 'Mira  Flatts');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Lopez Road', 'joel@nestle.ch', '0523970504', 37, 'Joe  Lindley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'lily.cumming@inspirationsoftwa', '0599222124', 89, 'Lily  Cumming');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Spiner Drive', 'ewan.mcdormand@kelmooreinvestm', '0585336833', 16, 'Ewan  McDormand');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Ashdod Street', 'miguel.peebles@johnson.pt', '0546533308', 72, 'Miguel  Peebles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Dukakis Road', 'waymanr@gci.se', '0532074703', 51, 'Wayman  Randal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('572 Lara Street', 'vonda.hyde@voicelog.com', '0504748822', 33, 'Vonda  Hyde');
insert into PERSON (address, mail, mainphone, age, pname)
values ('882 Douglas Road', 'petula@ams.com', '0561338343', 9, 'Petula  Weisberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('180 Weston Street', 'albert@scripnet.uk', '0505567930', 22, 'Albert  Owen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Goiania Drive', 'aimee@limitedbrands.cn', '0590201292', 52, 'Aimee  Mohr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Vienna Blvd', 'clay.r@idlabel.com', '0507320576', 68, 'Clay  Rock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Takamatsu Blvd', 'rhysg@paintedword.com', '0506205095', 84, 'Rhys  Gere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Sawa Street', 'carl@terrafirma.uk', '0509072047', 43, 'Carl  Singh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('382 Pelvic Drive', 'morris@acsis.de', '0515899814', 70, 'Morris  Rudd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Jonny Road', 'roger.bates@pearllawgroup.nl', '0586272827', 74, 'Roger  Bates');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Amarillo Road', 'don.curtishall@hotmail.it', '0512226967', 15, 'Don  Curtis-Hall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Chaplin Drive', 'hal.ledger@newhorizons.jp', '0515087619', 7, 'Hal  Ledger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Framingham Street', 'maury.michael@newmedia.ca', '0502776079', 64, 'Maury  Michael');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Walnut Creek Street', 'giovanni.santarosa@kramontreal', '0537278302', 17, 'Giovanni  Santa Rosa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'ronnie@ads.de', '0587867493', 68, 'Ronnie  Reiner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 DiCaprio Road', 'rbarnett@firstsouthbancorp.com', '0560337677', 56, 'Roscoe  Barnett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Yankovic Road', 'marylouise.carmen@bestever.com', '0595355245', 39, 'Mary-Louise  Carmen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Molina Street', 'ihurt@lms.com', '0554627156', 64, 'Isabella  Hurt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Carrack Drive', 'b.cruise@gentrasystems.de', '0588080910', 67, 'Bobby  Cruise');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Dorval Road', 'thora@taycorfinancial.com', '0547468642', 75, 'Thora  Jovovich');
insert into PERSON (address, mail, mainphone, age, pname)
values ('263 Cole Ave', 'fats@kelmooreinvestment.uk', '0576096374', 47, 'Fats  Strathairn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Shue Street', 's.lindo@mainstreetbanks.com', '0594508912', 66, 'Sydney  Lindo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Burton Road', 'balthazarm@bedfordbancshares.a', '0533810156', 18, 'Balthazar  Myles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Mazzello Street', 'sander.cobbs@viacom.il', '0571681099', 59, 'Sander  Cobbs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Schreiber Road', 'mgoldblum@hondamotor.com', '0513004744', 51, 'Mitchell  Goldblum');
insert into PERSON (address, mail, mainphone, age, pname)
values ('789 Murdock Street', 'julianna.vandamme@sps.it', '0531228073', 38, 'Julianna  Van Damme');
insert into PERSON (address, mail, mainphone, age, pname)
values ('919 Bridget Blvd', 'carlosm@ataservices.id', '0558664403', 29, 'Carlos  Maxwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Mito Drive', 'blynskey@owm.no', '0594830574', 26, 'Bernard  Lynskey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Van Shelton Street', 'elias.lapointe@epiqsystems.ar', '0561507428', 62, 'Elias  Lapointe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('576 LaMond', 'willie.l@shirtfactory.com', '0517628405', 23, 'Willie  Lawrence');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Chely Street', 'b.forster@stm.ie', '0539782447', 35, 'Billy  Forster');
insert into PERSON (address, mail, mainphone, age, pname)
values ('269 Byrne Street', 'joshua.hatfield@investorstitle', '0556136503', 81, 'Joshua  Hatfield');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Schock Road', 'anna.braugher@qssgroup.com', '0555122558', 47, 'Anna  Braugher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Banderas', 'kurtwood.busey@unit.ca', '0562932003', 53, 'Kurtwood  Busey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Rob Street', 'elle.brando@merck.br', '0522131213', 13, 'Elle  Brando');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Robert Street', 'anjelica.marin@onesourceprinti', '0568674775', 20, 'Anjelica  Marin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('912 Lightfoot Road', 'talvin.garfunkel@dearbornbanco', '0570355788', 61, 'Talvin  Garfunkel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Donelly Street', 'harrisc@conagra.ar', '0512725036', 40, 'Harris  Channing');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Nick Ave', 'sophie.reilly@fiberlink.br', '0579600814', 86, 'Sophie  Reilly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Burton Street', 'embeth.sherman@genextechnologi', '0521206960', 26, 'Embeth  Sherman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Geneva Street', 'albert.lang@nmr.com', '0583817251', 75, 'Albert  Lang');
insert into PERSON (address, mail, mainphone, age, pname)
values ('571 Luzern Street', 'charlton.tate@ppr.li', '0544524116', 22, 'Charlton  Tate');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Patrick Road', 'mae.vince@surmodics.de', '0514891833', 35, 'Mae  Vince');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12nd Street', 'marc.berkoff@priorityexpress.c', '0526057408', 54, 'Marc  Berkoff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('740 Pirmasens Blvd', 'ashleyt@pds.uk', '0537878633', 26, 'Ashley  Tate');
insert into PERSON (address, mail, mainphone, age, pname)
values ('891 Andrew Street', 'w.carrey@linacsystems.no', '0520635318', 78, 'Wally  Carrey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Nicolas Street', 'davis.haynes@ois.de', '0566939169', 60, 'Davis  Haynes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Evans Street', 'loretta.vinton@americanmegacom', '0595887819', 22, 'Loretta  Vinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Protvino Ave', 'chet.depp@vms.ca', '0539862173', 55, 'Chet  Depp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Abraham Street', 'bryan.r@gci.uk', '0569254186', 24, 'Bryan  Renfro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Stevenson Drive', 'vienna@denaliventures.com', '0549028902', 85, 'Vienna  Reinhold');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'queeng@freedommedical.com', '0546650647', 78, 'Queen  Gryner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61st Street', 'pablol@oneidafinancial.jp', '0587517709', 10, 'Pablo  Leary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Kinnear Road', 'stockardg@ivci.at', '0527427600', 15, 'Stockard  Gaynor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Kelly Ave', 'mingna.palminteri@investmentsc', '0505607425', 35, 'Ming-Na  Palminteri');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Orlando Street', 's.forrest@fpf.com', '0519325346', 24, 'Seann  Forrest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Shannyn Road', 'jennifer.eatworld@seafoxboat.d', '0569748750', 86, 'Jennifer  Eat World');
insert into PERSON (address, mail, mainphone, age, pname)
values ('746 Manchester Road', 'terence.bugnon@telesynthesis.b', '0551304402', 32, 'Terence  Bugnon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('326 Elizabeth Street', 'kruffalo@hps.de', '0557577939', 89, 'Kyle  Ruffalo');
commit;
prompt 800 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'stanley.apple@linacsystems.au', '0589180000', 76, 'Stanley  Apple');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Vickie', 'reese.nelligan@iss.br', '0514654972', 42, 'Reese  Nelligan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('345 Marin Street', 'j.stowe@genextechnologies.nl', '0527464157', 18, 'Jake  Stowe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Manaus Street', 'howie@diageo.dk', '0593311899', 34, 'Howie  Colin Young');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Garcia', 'arturo.p@calence.uk', '0548045492', 72, 'Arturo  Playboys');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Johnson Road', 'debby.lightfoot@mls.com', '0532956656', 53, 'Debby  Lightfoot');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Howard Road', 'fats.pesci@cynergydata.com', '0593580942', 76, 'Fats  Pesci');
insert into PERSON (address, mail, mainphone, age, pname)
values ('186 Liam Drive', 'kelli.r@conagra.it', '0502995366', 16, 'Kelli  Rizzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Affleck Drive', 'toshiro.w@ibfh.com', '0557948814', 70, 'Toshiro  Whitford');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71st Street', 'hclark@linersdirect.br', '0553616105', 84, 'Harris  Clark');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Dooley Blvd', 'ralph.vega@operationaltechnolo', '0583609743', 88, 'Ralph  Vega');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Tbilisi', 'maureen@accucode.br', '0546311833', 55, 'Maureen  Ferrell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Lindsey Drive', 'blarter@bayer.pl', '0504878828', 31, 'Bonnie  Larter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Armstrong Blvd', 'todd.henriksen@bps.ca', '0597214515', 51, 'Todd  Henriksen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Mt. Laurel Blvd', 'elisabeth.vannelli@usgovernmen', '0532653801', 90, 'Elisabeth  Vannelli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Thame Drive', 'eleigh@dbprofessionals.com', '0557764999', 38, 'Eileen  Leigh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Burrows Street', 'olympia.santana@trafficmanagem', '0585825902', 69, 'Olympia  Santana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Ruth Street', 'angelak@sfb.de', '0578524283', 69, 'Angela  Kristofferson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('10 Tilda Street', 'beth@hardwoodwholesalers.com', '0581423288', 76, 'Beth  Tate');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Shalhoub Blvd', 'vonda@bedfordbancshares.com', '0558423346', 35, 'Vonda  Steenburgen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Haverhill Road', 'katrin@swp.fr', '0516884247', 58, 'Katrin  Kinney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Harmon Road', 'mchaplin@shot.de', '0543630505', 17, 'Mekhi  Chaplin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Irving Road', 'ryan.deschanel@sony.uk', '0511424571', 46, 'Ryan  Deschanel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 Cottbus', 'edgar.caldwell@kelmooreinvestm', '0578650827', 17, 'Edgar  Caldwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Dawson Street', 'buffy.franklin@max.com', '0587201180', 42, 'Buffy  Franklin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Winger Road', 'charles.stuermer@adeasolutions', '0598390461', 52, 'Charles  Stuermer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Kingston Drive', 'carrie.n@eastmankodak.de', '0559353891', 42, 'Carrie  Nightingale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Massagno Road', 'cesar.kleinenberg@procurementc', '0560193589', 48, 'Cesar  Kleinenberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Alfie Ave', 'gerald.mcbride@callhenry.com', '0564933858', 32, 'Gerald  McBride');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'corey.mcintyre@saksinc.dk', '0529941536', 31, 'Corey  McIntyre');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'pelvic.grier@kwraf.com', '0522638087', 45, 'Pelvic  Grier');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Joaquin Street', 'trace@exinomtechnologies.it', '0571086012', 78, 'Trace  Gallant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('975 MacDowell Blvd', 'kurtwood.senior@monitronicsint', '0509367037', 16, 'Kurtwood  Senior');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Framingaham Street', 'wayman@priorityleasing.fr', '0596821215', 51, 'Wayman  Freeman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Love Ave', 'laurenceo@hardwoodwholesalers.', '0588687796', 7, 'Laurence  Oszajca');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'armin.coleman@tps.be', '0516525981', 55, 'Armin  Coleman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('963 McGovern Road', 'fwiest@newmedia.com', '0525842681', 90, 'Freddie  Wiest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Kravitz Ave', 'radney.r@owm.com', '0577661021', 47, 'Radney  Ruffalo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Ronstadt Drive', 'levar.dayne@wellsfinancial.za', '0526705144', 17, 'LeVar  Dayne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Winona Road', 'freddy@dillards.il', '0541336153', 7, 'Freddy  Getty');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Wayne Road', 'adetmer@loreal.jp', '0521952008', 48, 'Anjelica  Detmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('163 Harry Blvd', 'robby.hauser@wlt.de', '0554355767', 49, 'Robby  Hauser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Singh Street', 'merrill.hersh@zaiqtechnologies', '0506802989', 50, 'Merrill  Hersh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Cornell Road', 'miki.folds@digitalmotorworks.d', '0543868187', 63, 'Miki  Folds');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Sawa Drive', 'todd.bugnon@cascadebancorp.com', '0538382644', 30, 'Todd  Bugnon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71st Street', 'd.reubens@tracertechnologies.c', '0560617077', 31, 'Debra  Reubens');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Lofgren Street', 'mickey@restaurantpartners.de', '0594593851', 22, 'Mickey  Vance');
insert into PERSON (address, mail, mainphone, age, pname)
values ('744 Cantrell Road', 'kelly@atlanticnet.com', '0580892877', 81, 'Kelly  Faithfull');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'jimmie.m@clorox.ca', '0504702313', 72, 'Jimmie  Mars');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 McFadden Street', 'matt.heslov@priorityleasing.in', '0583096283', 71, 'Matt  Heslov');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Guest Street', 'd.lynch@gbas.ch', '0541059876', 70, 'Denis  Lynch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Barcelona Drive', 'rosario.diddley@staffone.com', '0549670849', 61, 'Rosario  Diddley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Crow Street', 'wperlman@aoltimewarner.ca', '0552437082', 69, 'Winona  Perlman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51st Street', 'roy.n@ach.ca', '0526776184', 41, 'Roy  Napolitano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Ness Road', 'swoosie.l@aci.com', '0522778032', 20, 'Swoosie  Lattimore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Cevin Ave', 'jean.blanchett@mission.com', '0558684577', 8, 'Jean  Blanchett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Norm Road', 'mwolf@clorox.com', '0510012715', 15, 'Mika  Wolf');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Jeter Road', 'merrilee@ptg.hk', '0509398922', 8, 'Merrilee  Evett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Juan Ave', 'm.sepulveda@sht.br', '0578965979', 81, 'Moe  Sepulveda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 LaBelle Road', 'lin.sledge@lloydgroup.com', '0580807423', 19, 'Lin  Sledge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'jill.cassidy@toyotamotor.com', '0579073484', 35, 'Jill  Cassidy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Madeleine Drive', 'nbanderas@ivci.com', '0540664848', 14, 'Natalie  Banderas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Logue Street', 'tommy.sedaka@dis.com', '0598759179', 74, 'Tommy  Sedaka');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Salisbury Road', 'grace.fishburne@parksite.fr', '0591599824', 46, 'Grace  Fishburne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Broza', 'jamie.hauser@cendant.jp', '0544960010', 48, 'Jamie  Hauser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('229 Martha Road', 'tzi@lemproducts.com', '0539297754', 27, 'Tzi  Mulroney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Bogguss Street', 'goneal@hardwoodwholesalers.com', '0556435094', 50, 'Gabriel  O''Neal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Reilly Drive', 'f.walker@diageo.sg', '0511359015', 48, 'Fionnula  Walker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('598 Adkins Street', 'tea@innovativelighting.uk', '0509920179', 12, 'Tea  Carrey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Mandy Road', 'franco.dooley@tilia.fr', '0505386651', 49, 'Franco  Dooley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Fort worth Road', 'lesley.jeter@scripnet.de', '0506994224', 35, 'Lesley  Jeter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12nd Street', 'tyrone@target.com', '0506737474', 70, 'Tyrone  Whitmore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Bautzen', 'james.s@freedommedical.com', '0540469018', 61, 'James  Shalhoub');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Vicious Drive', 'barry.edmunds@diamondgroup.br', '0513464986', 11, 'Barry  Edmunds');
insert into PERSON (address, mail, mainphone, age, pname)
values ('343 Fremont Drive', 'tamala.tyson@wlt.de', '0510392833', 69, 'Tamala  Tyson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Spader Street', 'jefferyd@gillette.fr', '0529488499', 32, 'Jeffery  Diehl');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Athens Drive', 'mili.clark@restaurantpartners.', '0588644207', 7, 'Mili  Clark');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Paige', 'alan.viterelli@pinnaclestaffin', '0582038256', 53, 'Alan  Viterelli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Samrand Drive', 'michelle.paquin@globalwireless', '0581967855', 38, 'Michelle  Paquin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('814 Cedar Park Ave', 'uma.richards@columbiabancorp.a', '0566932078', 36, 'Uma  Richards');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61st Street', 'abelles@mastercardinternationa', '0594279631', 63, 'Allison  Belles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'sylvester.orbit@spotfireholdin', '0550035618', 31, 'Sylvester  Orbit');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Elche Blvd', 'colleen.m@vivendiuniversal.com', '0524180227', 71, 'Colleen  McGill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Berkley Road', 'joely.downie@capitolbancorp.co', '0524238325', 68, 'Joely  Downie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Sobieski Road', 'uma@hotmail.com', '0577403215', 11, 'Uma  Collette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Jake Road', 'franz.imperioli@mavericktechno', '0581054377', 45, 'Franz  Imperioli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Glendale Street', 'emm.begley@tilia.com', '0543230800', 45, 'Emm  Begley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Hutch Road', 'cliff.ryan@pacificdatadesigns.', '0577866639', 76, 'Cliff  Ryan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41st Street', 'kittyc@whitewave.com', '0502435296', 52, 'Kitty  Cronin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Michendorf Street', 'p.kelly@dis.de', '0507664837', 58, 'Patty  Kelly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Olyphant Blvd', 'linda.sanchez@gci.com', '0550946122', 78, 'Linda  Sanchez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Payne Street', 'sheryl.satriani@ceo.fr', '0500076402', 73, 'Sheryl  Satriani');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Estevez Street', 'shawn.saintemarie@owm.ch', '0581986210', 16, 'Shawn  Sainte-Marie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Leslie Drive', 'jonathan@prosum.com', '0520477258', 68, 'Jonathan  Logue');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Raul Street', 'karon.rhames@activeservices.co', '0506669892', 12, 'Karon  Rhames');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Bell Road', 'trini.weisberg@teoco.jp', '0598954668', 70, 'Trini  Weisberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Würzburg Road', 'arturo.molina@lydiantrust.ie', '0569109676', 81, 'Arturo  Molina');
insert into PERSON (address, mail, mainphone, age, pname)
values ('676 Redford', 'sam.sheen@webgroup.com', '0548321261', 25, 'Sam  Sheen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Vertical Street', 'joaquim.mccormack@shufflemaste', '0535044870', 18, 'Joaquim  McCormack');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Krabbe Ave', 'pablo.romijnstamos@base.tr', '0583141260', 66, 'Pablo  Romijn-Stamos');
commit;
prompt 900 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Jimmie Street', 'judd@conagra.com', '0511244575', 41, 'Judd  urban');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Aberdeen Road', 'ethan.dalton@genextechnologies', '0552260583', 58, 'Ethan  Dalton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Donna', 'crispin.scorsese@banfeproducts', '0509360897', 18, 'Crispin  Scorsese');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Bradford Drive', 'raul@ass.com', '0523973870', 20, 'Raul  Meniketti');
insert into PERSON (address, mail, mainphone, age, pname)
values ('393 Oakenfold Drive', 'srauhofer@clorox.com', '0549062422', 67, 'Solomon  Rauhofer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('296 Brittany Street', 'carl.easton@totalentertainment', '0529389597', 62, 'Carl  Easton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Def Ave', 'jeanclaude.anderson@portageenv', '0546345940', 40, 'Jean-Claude  Anderson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Goldwyn Road', 'angie.belle@caliber.de', '0565163964', 83, 'Angie  Belle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Alfie', 'rhea.tolkan@fpf.com', '0560517567', 35, 'Rhea  Tolkan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Evans Street', 'molin@universalsolutions.de', '0557623695', 87, 'Marley  Olin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Sampson Street', 'richard.faithfull@tarragonreal', '0523829296', 43, 'Richard  Faithfull');
insert into PERSON (address, mail, mainphone, age, pname)
values ('779 Ronstadt Street', 'jack.i@hcoa.jp', '0541576942', 33, 'Jack  Imperioli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('150 Ewan Ave', 'alex.c@benecongroup.ca', '0569518851', 74, 'Alex  Cantrell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Doucette Road', 'judd.crudup@airmethods.com', '0562702162', 73, 'Judd  Crudup');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Potter Street', 'juliana.milsap@cooktek.com', '0547167096', 43, 'Juliana  Milsap');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Trumbull Road', 'spike@tps.com', '0580732232', 60, 'Spike  Burke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Rhys-Davies Drive', 's.barkin@aci.com', '0531058922', 88, 'Sona  Barkin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Vince', 'robin.mcgriff@gsat.com', '0505779526', 39, 'Robin  McGriff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Angie Street', 'campbell.hingle@y2marketing.co', '0585538030', 10, 'Campbell  Hingle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Sorocaba Drive', 'beth@powerlight.ca', '0578244803', 58, 'Beth  Purefoy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Fairview Heights Blvd', 'wbedelia@mattel.com', '0505277047', 62, 'Will  Bedelia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Michael Blvd', 'alannah.nakai@gha.com', '0536314280', 84, 'Alannah  Nakai');
insert into PERSON (address, mail, mainphone, age, pname)
values ('136 Stone Blvd', 'ned.m@tastefullysimple.de', '0579022894', 33, 'Ned  Marshall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('419 Matt Street', 'wes@mre.com', '0596690164', 73, 'Wes  Winans');
insert into PERSON (address, mail, mainphone, age, pname)
values ('985 Joshua Road', 'percy.schwimmer@usgovernment.c', '0505085584', 62, 'Percy  Schwimmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Hanks Drive', 'vivicah@gagwear.dk', '0556295664', 54, 'Vivica  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'goran.squier@capitalautomotive', '0514591560', 42, 'Goran  Squier');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Archer Ave', 'trick@telecheminternational.de', '0572510783', 83, 'Trick  Whitwam');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Collin Drive', 'c.cusack@larkinenterprises.com', '0528313806', 40, 'Cate  Cusack');
insert into PERSON (address, mail, mainphone, age, pname)
values ('645 Hamburg', 'geraldined@aoe.no', '0596290610', 80, 'Geraldine  Donelly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Fender Road', 'ving.garza@boldtechsystems.com', '0513860435', 63, 'Ving  Garza');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Liev Drive', 'sonny@irissoftware.com', '0545566598', 30, 'Sonny  Leachman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Syracuse Road', 'jared.walsh@ivorysystems.com', '0511069445', 41, 'Jared  Walsh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Shorter Drive', 'machine.taylor@generalmills.fr', '0526111872', 30, 'Machine  Taylor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 LuPone Street', 'carlos@trafficmanagement.fr', '0592169196', 88, 'Carlos  Parm');
insert into PERSON (address, mail, mainphone, age, pname)
values ('341 Leelee Ave', 'arnold.ward@wellsfinancial.il', '0552786778', 34, 'Arnold  Ward');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Reubens Street', 'geggy.shearer@mls.com', '0587561178', 37, 'Geggy  Shearer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Cameron Street', 'belinda@anworthmortgage.com', '0582571701', 25, 'Belinda  Foster');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'h.travolta@trusecure.com', '0556990071', 74, 'Hugh  Travolta');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Lydia Road', 'jeroen.beckinsale@priorityleas', '0521079976', 54, 'Jeroen  Beckinsale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('775 Odense Road', 'rosario@totalentertainment.ch', '0521558639', 73, 'Rosario  Tsettos');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Lucinda Drive', 'salma@networkdisplay.it', '0512826130', 61, 'Salma  Bachman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Leoni Drive', 'l.parish@bis.com', '0593469147', 84, 'Loreena  Parish');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Hugo', 'maryb@trekequipment.dk', '0538567428', 26, 'Mary  Bacharach');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Dublin', 'julianne.driver@lifelinesystem', '0534391633', 44, 'Julianne  Driver');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Gilbert Drive', 'alfred.dunn@qestrel.com', '0573213228', 7, 'Alfred  Dunn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Daniel Drive', 'chloe.u@mai.com', '0566399657', 64, 'Chloe  Underwood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Glover Street', 'proberts@north.de', '0554018074', 26, 'Penelope  Roberts');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Malkovich Drive', 'eileen.forrest@infopros.dk', '0549839333', 46, 'Eileen  Forrest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Jeffrey Street', 'alannah.f@younginnovations.it', '0517968550', 35, 'Alannah  Fogerty');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Katt Road', 'jeroenm@fmt.com', '0513469381', 88, 'Jeroen  Merchant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Crouch Street', 'd.cole@avs.com', '0589321735', 53, 'Debby  Cole');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Crowell Blvd', 'cavalon@newviewgifts.jp', '0554272966', 49, 'Casey  Avalon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'gina.parish@sfb.com', '0588366163', 44, 'Gina  Parish');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Alana Ave', 'gorant@actechnologies.com', '0599227907', 20, 'Goran  Taylor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Coppell Street', 'charlize.idle@boldtechsystems.', '0599832953', 59, 'Charlize  Idle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Oklahoma city Drive', 'azucar@americanpan.it', '0530392320', 31, 'Azucar  MacIsaac');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Paltrow Street', 'robbyk@sms.br', '0590194583', 28, 'Robby  Keener');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Vaughan Blvd', 'grace.p@signature.uk', '0583831770', 64, 'Grace  Posey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Glen Cove Drive', 'milla.matarazzo@fmt.br', '0500995288', 68, 'Milla  Matarazzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'marlon.p@limitedbrands.au', '0545007956', 29, 'Marlon  Pfeiffer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Hilversum', 'gene@slt.nz', '0580248754', 24, 'Gene  Quinlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Copenhagen', 'buddy@oriservices.de', '0540359704', 49, 'Buddy  Reid');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Natacha Drive', 'rickie.chesnutt@scheringplough', '0504925694', 37, 'Rickie  Chesnutt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Waits Street', 'nick.oldman@wav.es', '0516118529', 11, 'Nick  Oldman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('450 Suzanne Blvd', 'natacha.c@atlanticcredit.uk', '0515978803', 40, 'Natacha  Condition');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Gabrielle Street', 'fisher.neil@balchem.ca', '0556134391', 58, 'Fisher  Neil');
insert into PERSON (address, mail, mainphone, age, pname)
values ('384 Lili Ave', 'miguel.sheen@spectrum.com', '0519814891', 27, 'Miguel  Sheen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Gene Drive', 'ricky.skaggs@wav.com', '0541314302', 20, 'Ricky  Skaggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('884 Lynskey', 'king.harnes@staffforce.com', '0592277154', 82, 'King  Harnes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Lithgow Drive', 'rich.robards@officedepot.de', '0565581113', 27, 'Rich  Robards');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Goodall Drive', 'earl.w@mainstreetbanks.com', '0579153961', 69, 'Earl  Walsh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Dionne Ave', 'lea@ibm.uk', '0550226706', 64, 'Lea  Stiller');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Frances Road', 'meg.crouse@nhhc.pl', '0563699174', 58, 'Meg  Crouse');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 MacPherson Ave', 'rachidm@kimberlyclark.se', '0501248907', 69, 'Rachid  Minogue');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Connick Ave', 'dbaldwin@perfectorder.jp', '0538350997', 80, 'Denzel  Baldwin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Waite Park Street', 'teena.byrne@y2marketing.at', '0524060739', 31, 'Teena  Byrne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Calle Drive', 'emily.r@pacificdatadesigns.com', '0575568714', 67, 'Emily  Rio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Naestved Road', 'tamala.o@yumbrands.br', '0526319624', 35, 'Tamala  O''Keefe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Echirolles Road', 'rhona.leguizamo@avs.com', '0567645076', 11, 'Rhona  Leguizamo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Botti Street', 'willem@generalmotors.com', '0586116571', 63, 'Willem  Nielsen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Newman Road', 'nikki.t@benecongroup.ca', '0579029101', 90, 'Nikki  Torn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Peebles Street', 'glen.moss@appriss.de', '0562822519', 47, 'Glen  Moss');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Bacon Road', 'tyrone.fonda@actechnologies.co', '0508908589', 18, 'Tyrone  Fonda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Seongnam-si Ave', 'chloe@commworks.br', '0534952967', 46, 'Chloe  Murphy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Bean Street', 'eugene.moffat@priorityleasing.', '0543736137', 58, 'Eugene  Moffat');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Colman Drive', 'vanessa@hewlettpackard.com', '0504683078', 38, 'Vanessa  Vince');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 MacLachlan Street', 'hal.gere@bowman.com', '0567216609', 71, 'Hal  Gere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Perez Ave', 'h.head@trx.com', '0531248552', 56, 'Hilton  Head');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Coley Street', 'prhysdavies@primussoftware.ch', '0521135218', 85, 'Powers  Rhys-Davies');
insert into PERSON (address, mail, mainphone, age, pname)
values ('185 Joshua Street', 'efiorentino@restaurantpartners', '0524912831', 28, 'Emma  Fiorentino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Los Angeles Blvd', 'humberto.bandy@actechnologies.', '0562382074', 29, 'Humberto  Bandy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Fats Road', 'val@nlx.ch', '0593841329', 34, 'Val  Mars');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'cameron.wiest@abs.com', '0570328299', 79, 'Cameron  Wiest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61st Street', 'powers.nugent@max.com', '0558851508', 50, 'Powers  Nugent');
insert into PERSON (address, mail, mainphone, age, pname)
values ('113 Fiorentino Ave', 'jeremy@callhenry.com', '0537595640', 31, 'Jeremy  Platt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Sedaka', 'andie@jlphor.mx', '0569981160', 77, 'Andie  Hirsch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Sant Cugat Del Valle Drive', 'alannah.keener@gcd.ar', '0535268135', 44, 'Alannah  Keener');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Payne Street', 'millie.benson@limitedbrands.jp', '0517303523', 60, 'Millie  Benson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('235 Oklahoma city Drive', 'maureen.dawson@pfizer.dk', '0506683518', 53, 'Maureen  Dawson');
commit;
prompt 1000 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('62nd Street', 'c.cocker@max.com', '0571591241', 64, 'Carl  Cocker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Lipnicki Street', 'wayne.grant@spenser.com', '0550237594', 65, 'Wayne  Grant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Madonna Ave', 'roses@lydiantrust.com', '0578280633', 9, 'Rose  Shue');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Zooey Street', 'mandy.nivola@typhoon.be', '0561804941', 84, 'Mandy  Nivola');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Carlyle Blvd', 'spikek@slt.ch', '0547034435', 23, 'Spike  Klugh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Diesel Blvd', 'jay.m@astute.dk', '0592245587', 17, 'Jay  McDonald');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Tambor', 'vincent.depp@catamount.com', '0595711168', 78, 'Vincent  Depp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Battle Creek Ave', 'bradley.rea@wyeth.de', '0504768092', 41, 'Bradley  Rea');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 McNeice Blvd', 'curtis.mahoney@staffforce.is', '0503988367', 8, 'Curtis  Mahoney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Denis Road', 'l.foxx@hatworld.com', '0589566689', 23, 'Lindsay  Foxx');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Englewood Blvd', 'caroline.p@sci.br', '0518556127', 32, 'Caroline  Polito');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Quinones Ave', 'jarvis.davidson@wrgservices.co', '0509916824', 61, 'Jarvis  Davidson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 DeLuise Blvd', 'claude.shawn@spenser.com', '0540169478', 38, 'Claude  Shawn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Hugo Drive', 'carlos.hanks@viacell.com', '0592396997', 83, 'Carlos  Hanks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('452 Azucar Road', 'rhys.leigh@msdw.de', '0587083367', 22, 'Rhys  Leigh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Bright', 'suzy.feuerstein@ghrsystems.at', '0576457274', 16, 'Suzy  Feuerstein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Sobieski Street', 'c.hall@trinityhomecare.com', '0535071583', 70, 'Chris  Hall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'katrin.connery@diamondtechnolo', '0540146203', 34, 'Katrin  Connery');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Lea Drive', 'ceili@heritagemicrofilm.il', '0539412887', 54, 'Ceili  Newton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('614 Reynolds Drive', 'rosco.jeter@career.com', '0522670596', 83, 'Rosco  Jeter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Stoneham Road', 'm.dorn@pra.ch', '0586121888', 20, 'Miki  Dorn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('464 LuPone', 'natasha.coolidge@extremepizza.', '0503848324', 16, 'Natasha  Coolidge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Brookfield Blvd', 'sonak@carboceramics.com', '0550562109', 46, 'Sona  Kapanka');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Almond Road', 'd.pleasure@calence.se', '0594913266', 38, 'Domingo  Pleasure');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Adrien Street', 'hilary.rodriguez@campbellsoup.', '0550854782', 51, 'Hilary  Rodriguez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('316 Firenze Street', 'david.whitmore@insurmark.dk', '0507026782', 10, 'David  Whitmore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11st Street', 'kmargolyes@sfb.uk', '0595642935', 39, 'Kieran  Margolyes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('94 Brittany Street', 'lalbright@peerlessmanufacturin', '0508474101', 32, 'Lindsey  Albright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Omar Road', 'julie.vince@owm.com', '0539207757', 8, 'Julie  Vince');
insert into PERSON (address, mail, mainphone, age, pname)
values ('339 Chan Road', 'eddie.potter@teamstudio.uk', '0510576838', 42, 'Eddie  Potter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Lizzy Road', 'gilberton@scooterstore.uk', '0546480823', 89, 'Gilberto  Newman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Law Drive', 'tramaine.cornell@drinkmorewate', '0568819541', 56, 'Tramaine  Cornell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Buffalo Street', 'o.vonsydow@nexxtworks.uk', '0555201497', 49, 'Oliver  von Sydow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('10 Darren Road', 'king@drinkmorewater.it', '0577955022', 56, 'King  Johansen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Ruiz Drive', 'rhona.giannini@epiqsystems.com', '0585023714', 9, 'Rhona  Giannini');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Guy Street', 'thomas.dafoe@trainersoft.com', '0580244698', 63, 'Thomas  Dafoe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Duvall Drive', 'christina.marx@bigyanksports.c', '0582657283', 21, 'Christina  Marx');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Berlin Road', 'christine.zevon@democracydata.', '0509185682', 30, 'Christine  Zevon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Chaplin', 'e.collette@aquascapedesigns.co', '0551328598', 77, 'Eliza  Collette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62nd Street', 'mikor@wav.nl', '0595314419', 85, 'Miko  Rawls');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Eat World Street', 'horace.cassidy@sfgo.at', '0521445290', 41, 'Horace  Cassidy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82 Woodard Blvd', 'jessica.w@callhenry.sg', '0534661698', 16, 'Jessica  Weir');
insert into PERSON (address, mail, mainphone, age, pname)
values ('531 Princeton Blvd', 'kasey.busey@tmt.de', '0574909052', 78, 'Kasey  Busey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Owen Street', 'tilda.mcfadden@nha.pl', '0501059090', 25, 'Tilda  McFadden');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Krumholtz', 'wkoyana@pragmatechsoftware.fi', '0573478949', 9, 'Wendy  Koyana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Bkk Road', 'alec.gagnon@north.com', '0572497900', 79, 'Alec  Gagnon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Carrack Drive', 'f.mcnarland@perfectorder.in', '0549664624', 55, 'Franz  McNarland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Hyderabad Street', 'stephen.griffiths@royalgold.uk', '0503059053', 41, 'Stephen  Griffiths');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Pacino Street', 'maxine@airmethods.com', '0599928540', 46, 'Maxine  Farrow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Wageningen', 'c.oneal@terrafirma.uk', '0592948508', 66, 'Chuck  O''Neal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Shelby', 'harold@cardinalcartridge.com', '0538862037', 83, 'Harold  David');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Christine Road', 'srucker@ppr.br', '0531593482', 84, 'Sophie  Rucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Saint Paul Street', 'cgary@veritekinternational.com', '0517951142', 21, 'Candice  Gary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Michaels Ave', 'natascha.h@sysconmedia.com', '0524508219', 68, 'Natascha  Hunter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Art Road', 'moe.e@mastercardinternational.', '0501015255', 37, 'Moe  Esposito');
insert into PERSON (address, mail, mainphone, age, pname)
values ('367 Coyote Road', 'natalie.palmieri@taycorfinanci', '0553376099', 28, 'Natalie  Palmieri');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Kramer Road', 'angie.isaak@apexsystems.au', '0528988721', 80, 'Angie  Isaak');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Giannini Road', 'cledus@webgroup.com', '0514597751', 57, 'Cledus  Chilton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Gore Street', 'billym@pacificdatadesigns.com', '0597697549', 28, 'Billy  Mellencamp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Head Drive', 'gates.li@asapstaffing.com', '0577539321', 46, 'Gates  Li');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Buffalo Grove Street', 'radney.zane@slt.br', '0527220559', 53, 'Radney  Zane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Numan Road', 'cece.stewart@nlx.com', '0517043030', 68, 'CeCe  Stewart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Popper Blvd', 'micky.costner@apexsystems.jp', '0525566654', 41, 'Micky  Costner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Ali Road', 'clauder@infinity.com', '0587119186', 82, 'Claude  Reeve');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Derek Drive', 'gran@contract.de', '0576966237', 13, 'Gran  Sinatra');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Woods', 'ttyler@pinnaclestaffing.be', '0502200972', 45, 'Tea  Tyler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Judi Road', 'vmelvin@americanexpress.com', '0577086371', 18, 'Vanessa  Melvin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Hatchet Road', 'colleen.hagar@integramedameric', '0570816314', 22, 'Colleen  Hagar');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 O''Keefe Road', 'jeffery@chipssolutions.com', '0592460002', 80, 'Jeffery  Clayton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('312 Helsingborg Drive', 'gavin.wheel@ssci.de', '0550391210', 58, 'Gavin  Wheel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Craven Road', 'kchaykin@techbooks.com', '0524927249', 11, 'Kristin  Chaykin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Keith Road', 'rickie@mosaic.de', '0575003422', 47, 'Rickie  Khan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Vinton', 'd.bergen@staffone.com', '0518951361', 24, 'Derek  Bergen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Thompson Street', 'donna.k@boldtechsystems.ch', '0555941407', 84, 'Donna  Kennedy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Duncan Ave', 'lionelw@pharmafab.com', '0510497674', 79, 'Lionel  Weisberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Zeta-Jones Street', 'malcolm.satriani@vesta.de', '0512495200', 67, 'Malcolm  Satriani');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Russell Road', 'anjelica.loggins@hfg.com', '0567823237', 59, 'Anjelica  Loggins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Quinlan Road', 'lindsey@ultimus.ch', '0528919251', 28, 'Lindsey  Barry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Witherspoon', 'judy.herndon@naturescure.com', '0544123195', 44, 'Judy  Herndon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Lavigne Road', 'gilberto.pesci@primussoftware.', '0528375970', 79, 'Gilberto  Pesci');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Lewin Ave', 'eliasp@solutionbuilders.com', '0572467524', 19, 'Elias  Peniston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Lang Ave', 'rmargulies@dvdt.com', '0573909285', 52, 'Raul  Margulies');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Adrien Drive', 'a.bachman@fam.jp', '0585084978', 18, 'Azucar  Bachman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Lynne Road', 'alec.klugh@hersheyfoods.com', '0523069973', 84, 'Alec  Klugh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Steven', 'alan.hewett@spotfireholdings.c', '0559336913', 29, 'Alan  Hewett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Reiner Ave', 'g.bright@techbooks.ca', '0502917695', 15, 'Garth  Bright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Waite Road', 'a.cockburn@streetglow.de', '0558027286', 23, 'Anna  Cockburn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('190 Collins Drive', 'harold.utada@greenmountain.com', '0589315017', 79, 'Harold  Utada');
insert into PERSON (address, mail, mainphone, age, pname)
values ('202 Griffin Road', 'forest.bachman@ecopy.se', '0589283325', 9, 'Forest  Bachman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('887 Halle Street', 't.galecki@learningvoyage.com', '0597153435', 40, 'Thomas  Galecki');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Cottbus', 'katie.makowicz@asa.ie', '0570299680', 71, 'Katie  Makowicz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Miller Ave', 'r.woods@spectrum.com', '0546806730', 70, 'Roscoe  Woods');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Van Damme Street', 'sanderr@gagwear.ch', '0568308811', 73, 'Sander  Rickles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('943 Brno Street', 'cathy.holeman@efcbancorp.it', '0583702153', 35, 'Cathy  Holeman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Murdock Ave', 'kay.union@diamondtechnologies.', '0541748264', 42, 'Kay  Union');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Vertical Road', 'dom.mccormack@trinityhomecare.', '0592248811', 71, 'Dom  McCormack');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Murray Street', 'sonny@diversitech.uk', '0583484173', 17, 'Sonny  Lopez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Shawn Road', 'courtney@technica.com', '0587468780', 26, 'Courtney  Graham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Kingsley', 'shelbyw@gha.com', '0572968981', 81, 'Shelby  Warburton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41st Street', 'judgep@pulaskifinancial.at', '0544435470', 63, 'Judge  Pollack');
commit;
prompt 1100 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Stone Road', 'bob.stowe@astafunding.com', '0530896148', 9, 'Bob  Stowe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Hohenfels Road', 'm.perry@sears.com', '0507964266', 8, 'Miles  Perry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Renfro Street', 'talvin@millersystems.fr', '0588498526', 51, 'Talvin  Callow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Coimbra Road', 'rosie.kutcher@connected.com', '0582435705', 61, 'Rosie  Kutcher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Shaw Street', 'pbruce@enterprise.com', '0559765443', 27, 'Pat  Bruce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Monroe Drive', 'joe.sirtis@tps.uk', '0505401392', 38, 'Joe  Sirtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Christian Road', 'lari.cotton@eagleone.es', '0549103769', 30, 'Lari  Cotton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('474 Murphy Blvd', 'jessica.ticotin@pinnaclestaffi', '0509934289', 12, 'Jessica  Ticotin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Stanley Street', 'jon@americanland.com', '0585482927', 71, 'Jon  Laurie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Tulsa Road', 'bo.shannon@aldensystems.com', '0544110481', 64, 'Bo  Shannon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Tobey Ave', 'spencer@fmb.cl', '0570485156', 42, 'Spencer  Navarro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('655 Warszawa Street', 'belinda.saxon@cis.br', '0551000200', 18, 'Belinda  Saxon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Caan Drive', 'v.miles@qssgroup.com', '0544492653', 20, 'Vickie  Miles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Vienna Drive', 'cledus.h@dancor.com', '0572724864', 30, 'Cledus  Heald');
insert into PERSON (address, mail, mainphone, age, pname)
values ('523 Pete Road', 'allan.hopkins@esoftsolutions.n', '0502999601', 13, 'Allan  Hopkins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Mirren Street', 'sydney@tlsservicebureau.com', '0528874568', 16, 'Sydney  Jordan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Jamal Road', 'g.kinney@kimberlyclark.com', '0518165645', 81, 'Gates  Kinney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 McGowan Street', 'jeremy.wheel@meridiangold.com', '0589150113', 75, 'Jeremy  Wheel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Donelly Street', 'roger.jolie@globalwireless.be', '0583909593', 55, 'Roger  Jolie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Scottsdale Blvd', 'william.caan@pinnaclestaffing.', '0522722396', 28, 'William  Caan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Atkinson Drive', 'elijah.e@sms.ca', '0559322753', 59, 'Elijah  England');
insert into PERSON (address, mail, mainphone, age, pname)
values ('310 Mandrell Drive', 'woody@aoltimewarner.com', '0523213548', 33, 'Woody  Paymer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Leeds Road', 'shelby@zoneperfectnutrition.co', '0574106254', 20, 'Shelby  Koyana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Seatle Road', 'edwin.winslet@credopetroleum.c', '0503160585', 40, 'Edwin  Winslet');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Phil Drive', 'lucinda.forster@tastefullysimp', '0593971688', 52, 'Lucinda  Forster');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Stans Street', 'chalee.presley@fmi.br', '0501457574', 13, 'Chalee  Presley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Yavne Road', 'danni.atkinson@zaiqtechnologie', '0508326097', 52, 'Danni  Atkinson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Malone Road', 'nicole.r@priorityleasing.com', '0591082024', 22, 'Nicole  Reilly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Gyllenhaal', 'brenda.p@whitewave.pk', '0560571341', 30, 'Brenda  Penders');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'lynn.spall@sis.it', '0538315198', 31, 'Lynn  Spall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('486 Nile Drive', 'b.bell@mastercardinternational', '0550274513', 84, 'Barry  Bell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Caroline', 'orlandot@cis.ca', '0518608035', 30, 'Orlando  Tyler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Tamala Street', 'king.playboys@philipmorris.au', '0554913630', 30, 'King  Playboys');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Shenzhen Street', 'jeroen.m@axis.com', '0505939805', 23, 'Jeroen  Mahoney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('154 Dan Street', 'illeana.loveless@veritekintern', '0557800973', 16, 'Illeana  Loveless');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Jimmy Ave', 'dustin.henstridge@vms.ca', '0585028666', 72, 'Dustin  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Atlas Street', 'dianne.w@arkidata.com', '0552761746', 90, 'Dianne  Whitley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Zuerich Street', 'casey.h@wyeth.com', '0521550100', 80, 'Casey  Holeman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Jean-Claude Drive', 'sophiek@capitalautomotive.de', '0576493261', 16, 'Sophie  Kimball');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Martin Street', 'richc@unica.gr', '0539361373', 14, 'Rich  Conway');
insert into PERSON (address, mail, mainphone, age, pname)
values ('381 Holbrook Blvd', 'marie@cardinalcartridge.au', '0538900053', 84, 'Marie  Yulin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'alicia.irons@profitline.nc', '0543195030', 68, 'Alicia  Irons');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Saxon', 'janice.h@labradanutrition.com', '0528083623', 29, 'Janice  Henriksen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('802 Tanon Drive', 'bette.pastore@stonebrewing.com', '0565219854', 18, 'Bette  Pastore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Charlize Road', 'g.lerner@sprint.uk', '0531407673', 13, 'Gordie  Lerner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Aykroyd Road', 'quentin.n@hardwoodwholesalers.', '0580282230', 45, 'Quentin  Navarro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Winstone Road', 'debra.copeland@saralee.ca', '0526525570', 23, 'Debra  Copeland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Pesci Ave', 'jhubbard@daimlerchrysler.ch', '0578936530', 35, 'Joely  Hubbard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Wiedlin Blvd', 'donals@atlanticnet.com', '0537100214', 52, 'Donal  Stone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63rd Street', 'suzi.tisdale@anworthmortgage.c', '0501667138', 29, 'Suzi  Tisdale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 David Blvd', 'sheena@marathonheater.com', '0598553290', 25, 'Sheena  Fiorentino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Ponce Road', 'kid.clarkson@generalelectric.i', '0545524960', 33, 'Kid  Clarkson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Braugher Drive', 'forestv@nbs.de', '0525321159', 59, 'Forest  Viterelli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Thornton Ave', 'desmond.child@hotmail.com', '0508890461', 69, 'Desmond  Child');
insert into PERSON (address, mail, mainphone, age, pname)
values ('552 Stevenson Ave', 'mmahoney@teoco.com', '0506792949', 14, 'Marc  Mahoney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Matarazzo Road', 'woody.dillane@lloydgroup.uk', '0557702023', 32, 'Woody  Dillane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'elias.a@hondamotor.com', '0515943261', 60, 'Elias  Armatrading');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Giovanni Street', 'tilda.schiff@procurementcentre', '0566203471', 86, 'Tilda  Schiff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Herford Ave', 'ethan@pfizer.nl', '0513274372', 17, 'Ethan  Burton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Embeth Street', 'p.cassel@usainstruments.de', '0590386286', 78, 'Paul  Cassel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 DeVita Road', 'tal.shaw@ass.de', '0563665182', 47, 'Tal  Shaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('556 Griggs Ave', 'coley.rea@bigyanksports.uk', '0562938318', 26, 'Coley  Rea');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Van Shelton Road', 'avril.gibson@portosan.com', '0558040859', 59, 'Avril  Gibson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('182 Blossoms', 'carlos.m@tarragonrealty.com', '0569183023', 43, 'Carlos  MacNeil');
insert into PERSON (address, mail, mainphone, age, pname)
values ('182 Barnegat Drive', 'jasonh@dearbornbancorp.dk', '0587926864', 69, 'Jason  Holiday');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Belle Blvd', 'stewart.rodgers@contract.com', '0571385000', 89, 'Stewart  Rodgers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('310 San Ramon Road', 'kazem.byrd@smg.com', '0539566345', 45, 'Kazem  Byrd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('443 Red Road', 'joanna.silverman@timevision.de', '0541900669', 14, 'Joanna  Silverman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Branagh', 'oliverw@nissanmotor.com', '0582347599', 77, 'Oliver  Weaver');
insert into PERSON (address, mail, mainphone, age, pname)
values ('501 Hagerty', 'elizabeth.d@wrgservices.uk', '0525042915', 77, 'Elizabeth  DeLuise');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Carlyle Street', 'lily.gugino@gtp.com', '0518306472', 23, 'Lily  Gugino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'kaiken@stm.ca', '0540052613', 80, 'Kasey  Aiken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Buckingham Drive', 'karon@deutschetelekom.jp', '0501985881', 49, 'Karon  Salonga');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'rachidm@scripnet.au', '0530225886', 43, 'Rachid  Mulroney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Sheena Road', 'hookah.spine@mathis.de', '0569139556', 31, 'Hookah  Spine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53rd Street', 'n.street@globalwireless.au', '0579370417', 62, 'Nile  Street');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Courtney Road', 'miam@perfectorder.ie', '0563808753', 64, 'Mia  MacDonald');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'curt.mcdowall@spenser.com', '0565263605', 31, 'Curt  McDowall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Nanci Blvd', 'alessandro.masur@trx.com', '0524063712', 42, 'Alessandro  Masur');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Suwon Drive', 'victor.johnson@aoltimewarner.b', '0591491809', 77, 'Victor  Johnson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Salvador Road', 'boyd.lineback@ufs.com', '0511360655', 32, 'Boyd  Lineback');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Kista Street', 'ryan@directdata.br', '0578754849', 12, 'Ryan  Pryce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Wheel Street', 's.price@granitesystems.com', '0557742192', 56, 'Steven  Price');
insert into PERSON (address, mail, mainphone, age, pname)
values ('188 Coltrane Street', 'seth.lasalle@bioanalytical.com', '0513021014', 31, 'Seth  LaSalle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Night Street', 'aaron.holiday@bayer.ca', '0583210305', 37, 'Aaron  Holiday');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Ben Road', 'lee.soul@monitronicsinternatio', '0592719496', 22, 'Lee  Soul');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Child Blvd', 'gwyneth.rock@pharmacia.ar', '0531775431', 48, 'Gwyneth  Rock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'aliciam@mindworks.nl', '0596273264', 14, 'Alicia  Margolyes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71st Street', 'e.imbruglia@carboceramics.de', '0507473966', 17, 'Emm  Imbruglia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Crystal Road', 'spencer.wagner@sds.jp', '0541363018', 27, 'Spencer  Wagner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Redwood Shores Drive', 'geoffrey@north.de', '0588143349', 55, 'Geoffrey  Depp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12nd Street', 'joey.sewell@medamicus.it', '0561556185', 84, 'Joey  Sewell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Carrie-Anne Drive', 'tomg@linersdirect.com', '0524226288', 80, 'Tom  Garfunkel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Spears Road', 'peabo@taycorfinancial.br', '0518266693', 83, 'Peabo  Esposito');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Ashland Ave', 'delbert.zevon@genextechnologie', '0528044413', 35, 'Delbert  Zevon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Montreal Street', 'anne.bello@visionarysystems.dk', '0549316523', 83, 'Anne  Bello');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Douglas Road', 'daryle.aykroyd@fab.be', '0577329849', 25, 'Daryle  Aykroyd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Gugino', 'bridgette.kane@circuitcitystor', '0517686361', 52, 'Bridgette  Kane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Tierney Road', 'freddie.renfro@mls.com', '0594317775', 16, 'Freddie  Renfro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'rhysc@mss.com', '0537983999', 76, 'Rhys  Chan');
commit;
prompt 1200 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'vickie@gulfmarkoffshore.uk', '0582401507', 34, 'Vickie  Ryan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Reeve', 'lokeefe@asa.ch', '0599150812', 34, 'Liv  O''Keefe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Apple Road', 'solomon.pepper@hcoa.il', '0547752542', 45, 'Solomon  Pepper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Diggs Road', 'tshandling@inzone.com', '0578794894', 73, 'Teri  Shandling');
insert into PERSON (address, mail, mainphone, age, pname)
values ('76 Ralph Road', 'larin@nrae.hk', '0514971724', 70, 'Lari  Neill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('539 Page Drive', 'miriam.phillippe@softworld.au', '0573600029', 56, 'Miriam  Phillippe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('557 Paal Beringen Street', 'night.armatrading@investorstit', '0576816738', 84, 'Night  Armatrading');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'maria.chesnutt@mms.za', '0535017772', 82, 'Maria  Chesnutt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Tadley Street', 'aaron.goldberg@dillards.ca', '0598995582', 7, 'Aaron  Goldberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Lynn Ave', 'breckin.carrere@carteretmortga', '0535805943', 16, 'Breckin  Carrere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Mohr Drive', 'teri.c@diamondtechnologies.de', '0511573736', 27, 'Teri  Coughlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Curtis Road', 'nanci.bedelia@processplus.it', '0543019689', 63, 'Nanci  Bedelia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Framingaham Street', 'd.rodgers@telesynthesis.com', '0547592987', 51, 'Delbert  Rodgers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Chaplin Road', 'vincen@supplycorecom.ar', '0568811749', 9, 'Vince  Neill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Frost Road', 'sean.tyson@smi.it', '0539347618', 55, 'Sean  Tyson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('181 Faye', 'burton@hardwoodwholesalers.br', '0511652001', 66, 'Burton  Lane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 McLachlan', 'richard.stuart@fiberlink.fr', '0574836981', 67, 'Richard  Stuart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 LaMond Street', 'lead@providentbancorp.com', '0504944897', 87, 'Lea  Dayne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 McBride Road', 'lily@serentec.com', '0502582602', 68, 'Lily  Preston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Pétion-ville Road', 'richard.mcanally@diversitech.c', '0522126708', 49, 'Richard  McAnally');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Turku Blvd', 'breckin.sandler@ungertechnolog', '0596268403', 25, 'Breckin  Sandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Singletary Street', 'alfred.diddley@nike.pl', '0507359226', 20, 'Alfred  Diddley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'joseph.hyde@bigyanksports.au', '0524285517', 71, 'Joseph  Hyde');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Lee Road', 'sydney.snipes@bat.com', '0517497248', 11, 'Sydney  Snipes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Ittigen Drive', 'cthornton@webgroup.jp', '0534526818', 67, 'Claude  Thornton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'russells@bristolmyers.com', '0564042954', 20, 'Russell  Simpson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Derek Street', 'q.stormare@kwraf.br', '0577909781', 31, 'Queen  Stormare');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Vega Street', 'john.crow@staffforce.jp', '0593335194', 85, 'John  Crow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Downey Street', 'bernard.b@chipssolutions.com', '0503210263', 14, 'Bernard  Borgnine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'loreena.preston@cendant.ca', '0526374882', 24, 'Loreena  Preston');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Mollard Road', 'dick.ruiz@wyeth.dk', '0575424293', 12, 'Dick  Ruiz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Jon Road', 'stephen.weaver@questarcapital.', '0564321892', 74, 'Stephen  Weaver');
insert into PERSON (address, mail, mainphone, age, pname)
values ('433 Crete Road', 'julianna.d@sci.de', '0514630130', 26, 'Julianna  DeGraw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Bugnon Street', 'al.sanders@printtech.com', '0505343777', 40, 'Al  Sanders');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Mena Ave', 'famke@quakercitybancorp.es', '0534769167', 58, 'Famke  Vaughn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('379 Wavre Street', 'armin.karyo@callhenry.cn', '0573358678', 52, 'Armin  Karyo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Cobbs Drive', 'alfie.quaid@iss.uk', '0591698950', 11, 'Alfie  Quaid');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Freising Street', 'chuck.giannini@medsource.ch', '0510910746', 54, 'Chuck  Giannini');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Ticotin Blvd', 'horace.glover@infinity.com', '0586950873', 41, 'Horace  Glover');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Armin Drive', 'pablo.wahlberg@healthscribe.jp', '0526813005', 77, 'Pablo  Wahlberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Franz Blvd', 'gord.elsaher@biosite.fr', '0594904747', 28, 'Gord  El-Saher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Charleston Blvd', 'pat.torres@aquascapedesigns.fr', '0530698232', 10, 'Pat  Torres');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Thessaloniki Blvd', 'larnelle.green@marketfirst.dk', '0535215553', 82, 'Larnelle  Green');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Remy Blvd', 'lucy.gray@vesta.dk', '0571329971', 11, 'Lucy  Gray');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Gerald Ave', 'salma.levert@wellsfinancial.de', '0594807564', 89, 'Salma  Levert');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Seagal Street', 'ruth.k@woronocobancorp.de', '0574945318', 72, 'Ruth  Keen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('803 Lisa Street', 'avril.dale@comnetinternational', '0557926273', 89, 'Avril  Dale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Cumming Ave', 'lindsayr@apexsystems.yu', '0514110655', 85, 'Lindsay  Ricci');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Algermissen Street', 'rosanne.lonsdale@whitewave.pl', '0508452551', 34, 'Rosanne  Lonsdale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Batavia Road', 'david.cheadle@benecongroup.com', '0587191728', 25, 'David  Cheadle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('785 Hunt Valley Street', 'm.kapanka@amerisourcefunding.c', '0504391808', 53, 'Millie  Kapanka');
insert into PERSON (address, mail, mainphone, age, pname)
values ('401 Mount Laurel Drive', 's.flemyng@capstone.za', '0589194981', 69, 'Samantha  Flemyng');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Johnson Blvd', 'kitty.c@aco.com', '0573585596', 75, 'Kitty  Clinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Crimson Street', 'miko.detmer@nuinfosystems.de', '0561407477', 65, 'Miko  Detmer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Rodriguez Drive', 'barbaraw@grt.br', '0566707125', 28, 'Barbara  White');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Rachael Street', 'anjelica.connelly@amerisourcef', '0509754573', 34, 'Anjelica  Connelly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'al.anderson@daimlerchrysler.co', '0566568076', 8, 'Al  Anderson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Randal Drive', 'mekhi@loreal.de', '0576378811', 74, 'Mekhi  Burmester');
insert into PERSON (address, mail, mainphone, age, pname)
values ('750 Amarillo Drive', 'ccamp@alohanysystems.au', '0518169431', 37, 'Clay  Camp');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 San Jose Road', 'f.latifah@mse.ch', '0561981808', 78, 'Fred  Latifah');
insert into PERSON (address, mail, mainphone, age, pname)
values ('228 Crowell Drive', 'keanu@timevision.com', '0521035039', 25, 'Keanu  Carrere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 durham Ave', 'darius.sayer@sis.com', '0570589333', 86, 'Darius  Sayer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Chestnut Ave', 'sandra.gill@tastefullysimple.i', '0565284816', 39, 'Sandra  Gill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'carl.burns@aci.de', '0571263441', 89, 'Carl  Burns');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Benoit Street', 'wes.nielsen@curagroup.com', '0568512693', 22, 'Wes  Nielsen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'laura.brosnan@angieslist.com', '0575242763', 75, 'Laura  Brosnan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Schwimmer', 'johnb@scripnet.ca', '0509563165', 86, 'John  Bullock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Stigers Ave', 'brendan@vspan.lk', '0532728421', 90, 'Brendan  Cale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Shocked Road', 'orlando.conley@kis.dk', '0545486830', 16, 'Orlando  Conley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Paymer Blvd', 'jaddy@sci.jp', '0542155256', 73, 'Jessica  Addy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Nashua Street', 'tamala.conley@oneidafinancial.', '0524569869', 36, 'Tamala  Conley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Athens Street', 'albert.getty@shot.de', '0505292273', 68, 'Albert  Getty');
insert into PERSON (address, mail, mainphone, age, pname)
values ('410 McCann Street', 'avenged.springfield@multimedia', '0594738667', 32, 'Avenged  Springfield');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'rfarrell@generalmills.at', '0599690689', 46, 'Regina  Farrell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Elkins Park Road', 'harrison.kirkwood@bioreference', '0543227853', 41, 'Harrison  Kirkwood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Jimmy Street', 'cece@eagleone.com', '0545681953', 26, 'CeCe  Ford');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Brolin Road', 'suzi@navigatorsystems.com', '0576621676', 25, 'Suzi  Cazale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Guadalajara Street', 'miles.hawn@ufs.br', '0584763434', 64, 'Miles  Hawn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('646 Epps Road', 'chuck.law@fmb.com', '0568997242', 64, 'Chuck  Law');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'harvey.b@scriptsave.com', '0515235827', 36, 'Harvey  Buckingham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Gil Street', 'nathan@catamount.de', '0550367583', 37, 'Nathan  Frost');
insert into PERSON (address, mail, mainphone, age, pname)
values ('303 Darius Road', 'kenny.caviezel@invisioncom.dk', '0571153176', 7, 'Kenny  Caviezel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Shand Blvd', 'merillee.wen@lfg.pl', '0523955419', 44, 'Merillee  Wen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('55 Todd Blvd', 'domingo.teng@fds.com', '0526531825', 31, 'Domingo  Teng');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Perth Road', 'laura.easton@sfb.com', '0589860279', 82, 'Laura  Easton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Yucca Road', 'kevnb@glacierbancorp.com', '0551128004', 46, 'Kevn  Bedelia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Josh Drive', 's.waite@wlt.uk', '0503213186', 42, 'Sharon  Waite');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Richmond Street', 'sandra.linney@ccb.dk', '0586350954', 35, 'Sandra  Linney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Scarlett Drive', 't.pleasence@nhhc.com', '0501262046', 75, 'Thora  Pleasence');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Buffalo Street', 'coleyb@priorityleasing.ch', '0527918792', 79, 'Coley  Black');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Delbert Road', 'desmond.meniketti@learningvoya', '0540832348', 79, 'Desmond  Meniketti');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Carla Blvd', 's.bean@extremepizza.de', '0514319582', 57, 'Solomon  Bean');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Kristiansand Street', 'ray.curtis@usphysicaltherapy.c', '0510987929', 57, 'Ray  Curtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('471 Mablethorpe Street', 'terence.blair@employerservices', '0573125118', 10, 'Terence  Blair');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'connie.hauer@nlx.uk', '0542739904', 34, 'Connie  Hauer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('340 Oshkosh Street', 'holland.ryan@diageo.com', '0526816296', 20, 'Holland  Ryan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Courtney Road', 'carrie.nelson@alternativetechn', '0575655796', 61, 'Carrie  Nelson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'bridget@cmi.ch', '0525711624', 41, 'Bridget  Costa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Getty Road', 'harrison@parker.com', '0559895612', 87, 'Harrison  Holmes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Lange Road', 'e.ticotin@ipsadvisory.nl', '0531008871', 60, 'Ellen  Ticotin');
commit;
prompt 1300 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 McCain Road', 'jeffrey.donovan@pearllawgroup.', '0575806175', 18, 'Jeffrey  Donovan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Kadison Road', 'keanu@prosum.pt', '0551709176', 64, 'Keanu  Spall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'jody@kitba.com', '0518718822', 13, 'Jody  Karyo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Laguna Bbeach Street', 'geraldine.mcintyre@techbooks.a', '0567257883', 71, 'Geraldine  McIntyre');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Fairuza Ave', 'marina.unger@nlx.tw', '0569558610', 57, 'Marina  Unger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('245 McFadden Road', 'ccostner@ibm.it', '0502514800', 54, 'Carla  Costner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Fort Lee Street', 'l.ramis@ris.com', '0544924838', 76, 'Laurence  Ramis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Forest Street', 'andrea.carradine@pulaskifinanc', '0592474032', 52, 'Andrea  Carradine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'juice.green@solipsys.nl', '0547664287', 23, 'Juice  Green');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Domino Ave', 'terri.c@kingland.com', '0566308373', 17, 'Terri  Channing');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 's.puckett@gulfmarkoffshore.com', '0563694653', 84, 'Sara  Puckett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Sirtis Blvd', 'lily.sevigny@multimedialive.br', '0523038018', 30, 'Lily  Sevigny');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Rip Road', 'mena.breslin@csi.br', '0599087527', 69, 'Mena  Breslin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Springfield Road', 'azucar.w@vertexsolutions.ca', '0597799239', 41, 'Azucar  Weiss');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Dean Road', 'harveyb@priorityleasing.com', '0539842539', 76, 'Harvey  Broderick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Olympia Drive', 'jason@generalmills.com', '0528537385', 74, 'Jason  Abraham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Mazar Blvd', 'trick.daniels@wrgservices.br', '0595384820', 26, 'Trick  Daniels');
insert into PERSON (address, mail, mainphone, age, pname)
values ('103 English Street', 'mekhi.bracco@codykramerimports', '0525815220', 85, 'Mekhi  Bracco');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Getty Drive', 'pamela.griffiths@banfeproducts', '0570727585', 51, 'Pamela  Griffiths');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Dartmouth Drive', 'mark.m@mai.de', '0553509838', 74, 'Mark  Moraz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Garry Blvd', 'anthony.skaggs@nbs.com', '0547471031', 86, 'Anthony  Skaggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Bønes Road', 'sigourney.c@dbprofessionals.co', '0578622510', 54, 'Sigourney  Costa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Ferrell Street', 'suzy.keener@dearbornbancorp.uk', '0583555831', 50, 'Suzy  Keener');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Dawson', 'natalie.w@parksite.jp', '0595916114', 54, 'Natalie  Wincott');
insert into PERSON (address, mail, mainphone, age, pname)
values ('306 Zevon', 'aburns@bristolmyers.com', '0555145660', 84, 'Aidan  Burns');
insert into PERSON (address, mail, mainphone, age, pname)
values ('631 Olga Road', 'avenged.w@webgroup.com', '0535730828', 8, 'Avenged  Warden');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Karlsruhe Street', 'linda.l@tigris.au', '0589448833', 23, 'Linda  Lachey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('344 Steagall Blvd', 'thomas.paymer@nexxtworks.com', '0568659801', 89, 'Thomas  Paymer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('595 Goodall Ave', 'gavin.brothers@parker.nl', '0581234609', 63, 'Gavin  Brothers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Crewson Blvd', 'vern.m@sht.com', '0599637996', 56, 'Vern  Molina');
insert into PERSON (address, mail, mainphone, age, pname)
values ('359 Raitt Ave', 'bridgette.branagh@providencese', '0517146164', 67, 'Bridgette  Branagh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 New orleans Road', 'sinead.postlethwaite@capitolba', '0549389987', 44, 'Sinead  Postlethwaite');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Kutcher Blvd', 'h.ledger@tropicaloasis.com', '0598800052', 77, 'Helen  Ledger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Dennis Blvd', 'cate.biehn@kelmooreinvestment.', '0534719703', 14, 'Cate  Biehn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41st Street', 'loreena@unilever.uk', '0549510332', 77, 'Loreena  Chesnutt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91st Street', 'harvey.rhymes@oneidafinancial.', '0514157538', 9, 'Harvey  Rhymes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Judd Street', 'sandrab@investmentscorecard.uk', '0543607476', 77, 'Sandra  Basinger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('516 Dench Road', 'natalie.r@learningvoyage.com', '0533067638', 58, 'Natalie  Ribisi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('168 Burt Drive', 'jeanclaude.kinski@invisioncom.', '0533872160', 80, 'Jean-Claude  Kinski');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Trumbull Street', 'redo@younginnovations.com', '0570828215', 84, 'Red  O''Sullivan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('101 Vannelli', 's.mandrell@ksj.com', '0568067289', 8, 'Sissy  Mandrell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Regina Street', 'bo.okeefe@chhc.ch', '0571265425', 31, 'Bo  O''Keefe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Aniston Street', 'w.yankovic@knightsbridge.uk', '0518096450', 28, 'Wang  Yankovic');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 South Hadley Street', 'christopher.lupone@mitsubishim', '0568695225', 84, 'Christopher  LuPone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('835 Scorsese Road', 'geoff.weisz@progressivedesigns', '0528971362', 26, 'Geoff  Weisz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Mary Beth Street', 'mark.brando@dataprise.com', '0506186106', 44, 'Mark  Brando');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 McNarland Drive', 'freddiee@oneidafinancial.it', '0537512415', 51, 'Freddie  Ermey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 Lovitz', 'stewart.cusack@glacierbancorp.', '0572653950', 79, 'Stewart  Cusack');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Blige Drive', 'rich.hayek@whitewave.de', '0512292884', 47, 'Rich  Hayek');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Famke Street', 'omars@royalgold.it', '0523077848', 27, 'Omar  Shaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('250 Saul Street', 'emm@north.com', '0578542640', 85, 'Emm  Gracie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Mel Street', 'kelli.ledger@travizon.ch', '0504865898', 13, 'Kelli  Ledger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'avenged@genghisgrill.in', '0521864852', 20, 'Avenged  Weaving');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Kelly Blvd', 'laurence.mcbride@allegiantbanc', '0543823294', 57, 'Laurence  McBride');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Buddy Street', 'buffy.tinsley@sony.nl', '0516893830', 67, 'Buffy  Tinsley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 South Hadley Street', 'shannon.salonga@providentbanco', '0535890313', 35, 'Shannon  Salonga');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Cummings Street', 'lholly@interfacesoftware.nl', '0595608854', 34, 'Lance  Holly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Shearer Drive', 'merle.m@gateway.fr', '0525242119', 53, 'Merle  Morrison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Pete', 'william@pioneerdatasystems.com', '0556503370', 15, 'William  Gaynor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Stiles Road', 'a.doucette@ctg.cz', '0554303343', 88, 'Andrae  Doucette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Peebles Street', 'collin@ptg.it', '0541247569', 63, 'Collin  Bullock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 McLachlan Road', 'millier@ait.com', '0592907100', 70, 'Millie  Roberts');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Nicholson Road', 'linda.g@catamount.com', '0571588597', 13, 'Linda  Goldblum');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Henstridge Road', 'jaime.e@pepsico.com', '0569212142', 47, 'Jaime  Elizondo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Thomson Street', 'thin.hershey@sbc.fi', '0554870727', 59, 'Thin  Hershey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Mos', 'rosario.cassel@kmart.com', '0539271835', 60, 'Rosario  Cassel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Ebersberg Drive', 'a.paquin@netnumina.dk', '0506765560', 48, 'Albertina  Paquin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Shorter Street', 'kenneth.peet@tracertechnologie', '0512885075', 18, 'Kenneth  Peet');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Mills Blvd', 'nigel.wolf@spd.jp', '0522498540', 83, 'Nigel  Wolf');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Ulm Ave', 'wallace@heritagemicrofilm.fr', '0579840014', 84, 'Wallace  Westerberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Patillo Ave', 'burton.o@lydiantrust.com', '0562830198', 15, 'Burton  Ojeda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('924 Rifkin Drive', 'ahenstridge@gdi.fi', '0555455311', 7, 'Angie  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Pullman Street', 'hex@staffforce.de', '0510038697', 89, 'Hex  Landau');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Lodi Drive', 'ceilir@catamount.br', '0530011659', 62, 'Ceili  Rippy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Statham Street', 'carlene.mcintosh@alogent.com', '0503637007', 25, 'Carlene  McIntosh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Boyd Ave', 'guy@cns.com', '0562890698', 57, 'Guy  Braugher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Gellar Street', 'r.cromwell@younginnovations.co', '0505090303', 85, 'Robin  Cromwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Torres Road', 'grant.liu@diamondgroup.com', '0542089975', 34, 'Grant  Liu');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Devon Drive', 'bo.mills@mastercardinternation', '0542658043', 65, 'Bo  Mills');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Blades Street', 'wayman.bradford@greenmountain.', '0500462051', 72, 'Wayman  Bradford');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Iglesias Street', 'michelle.w@qestrel.com', '0596332660', 9, 'Michelle  Weiland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Lübeck Drive', 'a.teng@bedfordbancshares.com', '0539604060', 90, 'Adam  Teng');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Denny Street', 'david@innovativelighting.com', '0592705965', 32, 'David  Rickman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Charles Drive', 'courtney.grier@idas.de', '0549978963', 81, 'Courtney  Grier');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Solomon Road', 'shelbyh@qssgroup.no', '0531895595', 85, 'Shelby  Hart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Young Road', 'gloria@credopetroleum.dk', '0586096977', 17, 'Gloria  Brolin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Curtis', 'emma.suchet@fflcbancorp.com', '0591249222', 66, 'Emma  Suchet');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Danny', 'a.tobolowsky@gsat.com', '0541275940', 26, 'Angie  Tobolowsky');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Snipes Ave', 'rik.mclachlan@capital.de', '0522836721', 48, 'Rik  McLachlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Davy Street', 'tracy.d@diamondtechnologies.ca', '0574942999', 40, 'Tracy  Diddley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Pretoria Road', 'kurt.t@pioneermortgage.com', '0567707918', 74, 'Kurt  Taha');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Mississauga Drive', 'cwinger@ibfh.com', '0590879056', 73, 'Cliff  Winger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Ingram Drive', 'larenz@capellaeducation.pl', '0531457887', 42, 'Larenz  Red');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Ray Street', 'l.heatherly@mitsubishimotors.c', '0552390533', 80, 'Lindsay  Heatherly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'micky.murray@newhorizons.com', '0513878323', 78, 'Micky  Murray');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Brad Street', 'sander.rippy@abs.au', '0595065787', 80, 'Sander  Rippy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Sample Street', 'simon.vai@ipsadvisory.gr', '0543618630', 55, 'Simon  Vai');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 LaBelle Road', 'junior.tucker@tmt.de', '0508293379', 40, 'Junior  Tucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'maureen@berkshirehathaway.com', '0560166476', 75, 'Maureen  McDiarmid');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Scorsese Drive', 'davey.snow@sci.com', '0534392911', 47, 'Davey  Snow');
commit;
prompt 1400 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Coppell Drive', 'halle.turner@newviewgifts.com', '0523509262', 21, 'Halle  Turner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Herndon Street', 'charlize.reno@waltdisney.py', '0543603210', 88, 'Charlize  Reno');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Jane Street', 'cole@afs.ch', '0518014104', 89, 'Cole  Akins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Cobbs Street', 'grace.law@dis.pl', '0531986417', 40, 'Grace  Law');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Grant Road', 'bradley.dench@greenmountain.co', '0533746220', 68, 'Bradley  Dench');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Nara Road', 'ernest.c@sears.au', '0548473473', 30, 'Ernest  Crow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('562 Micky Road', 'busta.rossellini@lloydgroup.co', '0572642713', 32, 'Busta  Rossellini');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Laredo Ave', 'rosanna.nelson@vspan.au', '0545970612', 58, 'Rosanna  Nelson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Minnie Blvd', 'lea@restaurantpartners.de', '0580486751', 90, 'Lea  Gallagher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Witt Road', 'spencer.busey@wlt.de', '0580618867', 10, 'Spencer  Busey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Rothenburg Blvd', 'martha.h@chipssolutions.uk', '0513275895', 60, 'Martha  Hauser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Tony Drive', 'ernie.fraser@avs.com', '0511783086', 15, 'Ernie  Fraser');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Austin Blvd', 'robbie.simpson@contract.com', '0545850073', 25, 'Robbie  Simpson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('94 Gilley Drive', 'c.macneil@dsp.es', '0534451065', 51, 'Cole  MacNeil');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Joli Road', 'ricky.lennox@cardtronics.com', '0587290437', 21, 'Ricky  Lennox');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Ilmenau Drive', 'wes.young@sourcegear.uk', '0551313015', 7, 'Wes  Young');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Morris Road', 'jake.m@capellaeducation.ch', '0517259216', 73, 'Jake  Mazzello');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Milsap Drive', 'tmiles@sourcegear.my', '0578998789', 43, 'Thomas  Miles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('99 Baldwin Street', 'daniel.henstridge@bestbuy.com', '0555486732', 78, 'Daniel  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Olga Street', 'colleen@royalgold.uk', '0587928862', 58, 'Colleen  Gere');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Campana Road', 'temuera.margolyes@ungertechnol', '0594261698', 48, 'Temuera  Margolyes');
insert into PERSON (address, mail, mainphone, age, pname)
values ('300 Ronny Street', 'lindsay@pepsico.ca', '0557841767', 36, 'Lindsay  Matheson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'taylor.mcclinton@datawarehouse', '0548627994', 46, 'Taylor  McClinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Boz Street', 'cary.ceasar@nuinfosystems.com', '0596280241', 53, 'Cary  Ceasar');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51st Street', 'kate.satriani@aquascapedesigns', '0582195934', 38, 'Kate  Satriani');
insert into PERSON (address, mail, mainphone, age, pname)
values ('58 Research Triangle Drive', 'amy.holly@novartis.is', '0501694276', 66, 'Amy  Holly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('483 Lennie Road', 'larry.oldman@unicru.com', '0518523707', 10, 'Larry  Oldman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12nd Street', 'scott.curtis@ppr.com', '0548222148', 70, 'Scott  Curtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('348 Hauer Road', 'mika.santarosa@pulaskifinancia', '0545926995', 76, 'Mika  Santa Rosa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Osborne Road', 'tamala.miles@smartdrawcom.com', '0590843744', 41, 'Tamala  Miles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Matheson Drive', 'cliff.clarkson@trx.in', '0536383214', 21, 'Cliff  Clarkson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 McGregor', 'halle.oates@nexxtworks.uk', '0585506285', 18, 'Halle  Oates');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 San Jose', 'colinb@progressivedesigns.ch', '0592883142', 52, 'Colin  Balaban');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Duschel Road', 'judd.portman@emt.jp', '0511629023', 50, 'Judd  Portman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 New Hope Street', 'alice.wagner@jsa.com', '0553726130', 84, 'Alice  Wagner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Lenny Drive', 'collin.j@codykramerimports.br', '0565309738', 78, 'Collin  Johansen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Bergara Ave', 'alice.navarro@gra.com', '0584492233', 36, 'Alice  Navarro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Chennai', 'frankie.newton@ppr.jp', '0547939892', 22, 'Frankie  Newton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Peabo Street', 'praga.henstridge@larkinenterpr', '0504881478', 84, 'Praga  Henstridge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('988 Hikaru Drive', 'betty.newton@socketinternet.fi', '0593654748', 29, 'Betty  Newton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Rickman Road', 'johnette.j@target.com', '0576907204', 11, 'Johnette  Janssen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Warszawa Road', 'dsimpson@aquickdelivery.com', '0592139791', 20, 'Demi  Simpson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Milton Keynes Drive', 'night.marin@y2marketing.com', '0501889391', 85, 'Night  Marin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Cox Road', 'terry.dunst@smartronix.es', '0537531459', 78, 'Terry  Dunst');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Bentley Road', 'paule@arkidata.uk', '0511954017', 30, 'Paul  England');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Royston', 'howard.d@connected.au', '0542318672', 26, 'Howard  Devine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Yavne Drive', 'trick.cromwell@cimalabs.it', '0559679521', 27, 'Trick  Cromwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Tobolowsky Street', 'queen.spacey@afs.com', '0542370304', 62, 'Queen  Spacey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Watley Road', 'bonnie.gibbons@gra.com', '0590610095', 24, 'Bonnie  Gibbons');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Snoqualmie', 'rowan.s@gra.com', '0521088662', 55, 'Rowan  Simpson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 'elijah@its.ch', '0590075390', 39, 'Elijah  Reid');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'lmorrison@grayhawksystems.com', '0572155588', 46, 'Lydia  Morrison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Nordhausen Road', 'q.craven@whitewave.uk', '0588608574', 46, 'Queen  Craven');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Candice Road', 'debby.sedgwick@viacell.de', '0576957623', 24, 'Debby  Sedgwick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Nashua Ave', 'rufus@tastefullysimple.com', '0555140712', 13, 'Rufus  Kidman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'joan.glenn@mavericktechnologie', '0512334412', 66, 'Joan  Glenn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('329 Andrea Street', 'a.mars@tlsservicebureau.mx', '0558983337', 78, 'Austin  Mars');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Overstreet Road', 'clintp@ccfholding.com', '0502050217', 35, 'Clint  Piven');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Lou Street', 'peter.bening@sysconmedia.com', '0572682419', 61, 'Peter  Bening');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Köln Drive', 'andrew.bell@kis.it', '0539776972', 67, 'Andrew  Bell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Brisbane Street', 'rchandler@midwestmedia.com', '0547018526', 65, 'Robert  Chandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'oshue@authoria.jp', '0594550504', 65, 'Oro  Shue');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Moffat Street', 'hal.berkley@marsinc.za', '0532818157', 90, 'Hal  Berkley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Weston Street', 'remy.fierstein@marathonheater.', '0550529379', 38, 'Remy  Fierstein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Dwight Street', 'merrilee.r@pfizer.com', '0512548943', 52, 'Merrilee  Rickles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Bandy Ave', 'barbara.buffalo@hfn.com', '0599734854', 85, 'Barbara  Buffalo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Jolie Ave', 'kris.nightingale@multimedialiv', '0513727962', 18, 'Kris  Nightingale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Pfeiffer Street', 'avril.penders@sunstream.nl', '0545069380', 76, 'Avril  Penders');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Spacey Ave', 'sally.brolin@qssgroup.de', '0513985304', 17, 'Sally  Brolin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61st Street', 'scott.mann@north.com', '0517734166', 68, 'Scott  Mann');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Ermey Drive', 'julio.lopez@greene.it', '0500731266', 89, 'Julio  Lopez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Brentwood Road', 'burt.mcbride@gulfmarkoffshore.', '0556742738', 24, 'Burt  McBride');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Geena Street', 'barry.garofalo@dcgroup.nl', '0574851032', 7, 'Barry  Garofalo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 DeGraw Street', 'nigel.cartlidge@inspirationsof', '0591366002', 68, 'Nigel  Cartlidge');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Spiner Street', 'meg.brooke@mindworks.com', '0504416242', 49, 'Meg  Brooke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Mortensen Road', 'balthazar@qls.de', '0562428679', 69, 'Balthazar  Bale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('467 Gerald Road', 'heather.h@lydiantrust.it', '0518065587', 39, 'Heather  Hewett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Tomei Drive', 'merle.yankovic@generalmotors.b', '0539287491', 23, 'Merle  Yankovic');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63rd Street', 'delroy.whitaker@priorityleasin', '0546904191', 65, 'Delroy  Whitaker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Richards Drive', 'goranb@navigatorsystems.com', '0565078226', 35, 'Goran  Bentley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('382 Smith Drive', 'mblair@marlabs.jp', '0583206356', 25, 'Madeleine  Blair');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Thörishaus', 'amandap@pra.uk', '0589008587', 53, 'Amanda  Paltrow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Greenwood Drive', 'dfirth@gcd.hk', '0567138787', 51, 'Darius  Firth');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Hingle Ave', 'c.johnson@amerisourcefunding.d', '0554189004', 84, 'Collin  Johnson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'isabella.patillo@bioreliance.z', '0590982799', 84, 'Isabella  Patillo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Postlethwaite Road', 'k.levert@capstone.com', '0576982063', 24, 'Kimberly  Levert');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Schwarzenegger Road', 'a.tippe@healthscribe.br', '0532214224', 28, 'Avenged  Tippe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Haysbert Road', 'sander@news.hu', '0513080349', 15, 'Sander  Tripplehorn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('688 DiCaprio Street', 'paul.landau@grt.com', '0599207053', 38, 'Paul  Landau');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Overland park Road', 'ronnie.bragg@fmi.com', '0518191941', 72, 'Ronnie  Bragg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Cheadle Street', 'rachid.dillane@eagleone.de', '0598755386', 54, 'Rachid  Dillane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 San Francisco Street', 'bonnie.gaines@sprint.jp', '0561486629', 24, 'Bonnie  Gaines');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Donna Street', 'vendetta.cobbs@coridiantechnol', '0586428302', 40, 'Vendetta  Cobbs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Daniel Street', 'rose.finn@biosite.jp', '0563908416', 8, 'Rose  Finn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Delroy Ave', 'heather.waits@lloydgroup.at', '0598298451', 36, 'Heather  Waits');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Rollins Street', 'christineg@bioreliance.com', '0504202883', 77, 'Christine  Gallagher');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Matheson Ave', 'timothyr@pscinfogroup.uk', '0568488063', 57, 'Timothy  Robbins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Skaggs Street', 'b.oneill@americanmegacom.com', '0511991297', 46, 'Buddy  O''Neill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83rd Street', 'peter.manning@axis.com', '0504913077', 85, 'Peter  Manning');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Edwardstown Blvd', 'p.buffalo@operationaltechnolog', '0582663637', 89, 'Patrick  Buffalo');
commit;
prompt 1500 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Sao paulo Street', 'd.llewelyn@scheringplough.com', '0557393243', 90, 'Dianne  Llewelyn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('320 Hingle Road', 'carrieanne.p@blueoceansoftware', '0538444788', 13, 'Carrie-Anne  Pearce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('576 Aniston Ave', 'sissy.imbruglia@unitedasset.ch', '0568910713', 9, 'Sissy  Imbruglia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Los Alamos Street', 'elizabeth.wong@mindworks.it', '0510527288', 58, 'Elizabeth  Wong');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Deborah Street', 'clarenceh@vms.dk', '0577929672', 39, 'Clarence  Hershey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 von Sydow Street', 'sally.belle@prahs.ca', '0524488186', 47, 'Sally  Belle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Pusan Ave', 'karon.burstyn@mosaic.com', '0557481158', 78, 'Karon  Burstyn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Azucar', 'c.vannelli@biosite.com', '0567255847', 55, 'Connie  Vannelli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Hawthorne Drive', 'bradley.bosco@kmart.com', '0510909443', 34, 'Bradley  Bosco');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Coward Drive', 'lonnie.connick@lloydgroup.de', '0509619309', 43, 'Lonnie  Connick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Popper Street', 'm.pony@ads.com', '0583642769', 33, 'Mickey  Pony');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21st Street', 'debbie.emmett@nobrainerblindsc', '0547705117', 89, 'Debbie  Emmett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Fukuoka Blvd', 'sandra.pollak@mitsubishimotors', '0529288652', 44, 'Sandra  Pollak');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Selma Drive', 'christine@creditorsinterchange', '0510493124', 66, 'Christine  Goldblum');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 English Drive', 'rufus.dicaprio@infovision.uk', '0587736537', 34, 'Rufus  DiCaprio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('231 Hatchet Blvd', 'jodier@scjohnson.de', '0524975436', 31, 'Jodie  Rizzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Vassar Road', 'kay.c@ungertechnologies.com', '0548078203', 33, 'Kay  Crouch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Child Blvd', 'desmond.buscemi@cowlitzbancorp', '0591682244', 37, 'Desmond  Buscemi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Nash Road', 'mindy.sweeney@asa.com', '0563742831', 27, 'Mindy  Sweeney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Espoo Street', 's.channing@telecheminternation', '0562979152', 19, 'Stephanie  Channing');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Manaus', 'isaace@americanhealthways.com', '0514641959', 64, 'Isaac  Evett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53rd Street', 'victoria.garr@prosum.com', '0560036969', 67, 'Victoria  Garr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Madrid Road', 'machine.aykroyd@speakeasy.com', '0563434618', 51, 'Machine  Aykroyd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Tommy Street', 'lupe.valentin@ibm.ar', '0567188090', 85, 'Lupe  Valentin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('142 DeGraw Drive', 'molly.galecki@ctg.au', '0507228154', 71, 'Molly  Galecki');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Gyllenhaal Blvd', 'kasey.m@kingston.com', '0514569763', 90, 'Kasey  McDowell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Firenze Blvd', 'darreng@otbd.com', '0511431866', 41, 'Darren  Guest');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Hunt Street', 'frawls@taycorfinancial.com', '0579073261', 38, 'Frankie  Rawls');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Elias Drive', 'wally.singletary@procter.cn', '0569141143', 87, 'Wally  Singletary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Herbie Road', 'croot@bestbuy.nl', '0546399937', 40, 'Cate  Root');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Natacha Road', 'kenneth.finney@gagwear.il', '0547637651', 55, 'Kenneth  Finney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Brasília Blvd', 'rhona.p@linksys.de', '0574997494', 45, 'Rhona  Phillippe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Coldmeece Blvd', 'rarkin@prometheuslaboratories.', '0559473400', 10, 'Rodney  Arkin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Stormare Ave', 'joseph.martinez@proclarity.com', '0519502655', 55, 'Joseph  Martinez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Matsuyama Street', 'vanessa.gano@mcdonalds.com', '0530940161', 69, 'Vanessa  Gano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('383 Rains Road', 'bruce.delancie@eagleone.it', '0521334369', 38, 'Bruce  de Lancie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Goodman', 'geoff.domino@ogiointernational', '0524408988', 73, 'Geoff  Domino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Pacino Road', 'darius.branch@columbiabancorp.', '0512535459', 68, 'Darius  Branch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Cledus Street', 'tobey.diggs@formatech.fi', '0572079258', 71, 'Tobey  Diggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51st Street', 'dunion@wlt.fi', '0513672669', 26, 'Delroy  Union');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Waite', 'larnelle.plummer@airmethods.uk', '0536151191', 27, 'Larnelle  Plummer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 'bryan.s@bigdoughcom.com', '0518706424', 80, 'Bryan  Sepulveda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Fred Road', 'christopher@dancor.hk', '0521535570', 46, 'Christopher  Oszajca');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Roddy Street', 'jennifer.klein@americanpan.jp', '0527541784', 29, 'Jennifer  Klein');
insert into PERSON (address, mail, mainphone, age, pname)
values ('76 Borger Ave', 'h.goodman@capellaeducation.nl', '0510263959', 14, 'Halle  Goodman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Kirshner Road', 'leon@nsd.jp', '0586508981', 49, 'Leon  Emmerich');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Leto Blvd', 'edie.hawke@diamondtechnologies', '0506161484', 89, 'Edie  Hawke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Linz Drive', 'miriam.orlando@kmart.br', '0585175429', 59, 'Miriam  Orlando');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Worrell Road', 'cole.spacek@aoltimewarner.com', '0589336158', 51, 'Cole  Spacek');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Debby Street', 'scocker@canterburypark.com', '0577967338', 65, 'Sydney  Cocker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Bridgette Road', 'elijahs@carteretmortgage.com', '0523889922', 15, 'Elijah  Solido');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Austin Road', 'pamela.playboys@pioneerdatasys', '0514308915', 60, 'Pamela  Playboys');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Hannover Ave', 'linda.gugino@mindworks.com', '0553510598', 12, 'Linda  Gugino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Dreyfuss Road', 'jonny.biggs@loreal.com', '0586357575', 67, 'Jonny  Biggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Pfeiffer Road', 'louise@gtp.br', '0512280194', 88, 'Louise  Aiken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 D''Onofrio Blvd', 'desmond.s@talx.jp', '0586969609', 62, 'Desmond  Skerritt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Robards Drive', 'temuera@caliber.il', '0509717480', 64, 'Temuera  Glover');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Mechanicsburg Drive', 'nile@cws.uk', '0522944773', 41, 'Nile  Arquette');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Carrey Drive', 'lwainwright@tarragonrealty.com', '0513802438', 73, 'Lonnie  Wainwright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63rd Street', 'mpresley@shirtfactory.com', '0556551340', 57, 'Maggie  Presley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('521 Carr Blvd', 'mia.solido@profitline.uk', '0547332361', 38, 'Mia  Solido');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Ball Road', 'gloria.numan@typhoon.it', '0573968355', 16, 'Gloria  Numan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('120 Dawson Ave', 'w.webb@infopros.de', '0506270485', 89, 'Whoopi  Webb');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Rea Street', 'gene.foxx@ach.com', '0585407556', 48, 'Gene  Foxx');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23 Val Street', 'mitchell.harper@profitline.jp', '0599537022', 29, 'Mitchell  Harper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Shearer Street', 'brent.guinness@cendant.com', '0598613815', 71, 'Brent  Guinness');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Paramus Street', 'cameron.jordan@scripnet.nl', '0599111556', 82, 'Cameron  Jordan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Evett Drive', 'c.nicholas@operationaltechnolo', '0570220956', 46, 'Chi  Nicholas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'fisher.mcclinton@paisley.de', '0575480737', 11, 'Fisher  McClinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('591 Van Der Beek', 's.mulroney@telecheminternation', '0558349495', 43, 'Stevie  Mulroney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'mika.epps@ris.com', '0547613943', 52, 'Mika  Epps');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Cazale Road', 'shannyn.wolf@worldcom.com', '0506098276', 86, 'Shannyn  Wolf');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Tucci Road', 'albert.blackmore@mcdonalds.com', '0562618016', 9, 'Albert  Blackmore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('199 Lynn Street', 'adam.c@tilsonlandscape.br', '0520795630', 25, 'Adam  Cochran');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Donal Drive', 'molly@marketbased.com', '0571972191', 76, 'Molly  Witt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Osbourne Road', 'daryleg@tama.au', '0561893317', 57, 'Daryle  Graham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Rockville Drive', 'harry.flanery@marsinc.com', '0547053230', 26, 'Harry  Flanery');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Gabriel Street', 'hector.scott@nsd.de', '0592255019', 75, 'Hector  Scott');
insert into PERSON (address, mail, mainphone, age, pname)
values ('892 Snipes Street', 'dom.may@portosan.ca', '0577957138', 87, 'Dom  May');
insert into PERSON (address, mail, mainphone, age, pname)
values ('766 Greenville Blvd', 'seann.lindo@ogi.de', '0506196417', 26, 'Seann  Lindo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Carter', 'h.howard@trafficmanagement.jp', '0524618115', 90, 'Humberto  Howard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Peabo Street', 'robbie.walker@talx.com', '0533501681', 15, 'Robbie  Walker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Cazale Road', 'd.vonsydow@sweetproductions.co', '0507439000', 41, 'Dan  von Sydow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Nicky Road', 'kid.flanagan@philipmorris.com', '0596055512', 59, 'Kid  Flanagan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Phifer Road', 'l.eder@yashtechnologies.de', '0505858115', 78, 'Louise  Eder');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Fiorentino Drive', 'clarence.mcintyre@nexxtworks.f', '0518883797', 25, 'Clarence  McIntyre');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51 Boyd Ave', 'temuera.walken@bmm.com', '0571968263', 31, 'Temuera  Walken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Denny Road', 'gloria.hidalgo@quicksilverreso', '0575099602', 82, 'Gloria  Hidalgo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Nicholas Road', 'naomi.thomson@cendant.de', '0594545794', 19, 'Naomi  Thomson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Cledus Drive', 'amanda.overstreet@younginnovat', '0593646569', 70, 'Amanda  Overstreet');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'nicolasm@webgroup.de', '0507590690', 23, 'Nicolas  McNeice');
insert into PERSON (address, mail, mainphone, age, pname)
values ('153 Polito Street', 'j.brooke@veritekinternational.', '0518279956', 8, 'Judd  Brooke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('650 Dickinson Blvd', 'dwight.rubinek@trusecure.com', '0545485739', 63, 'Dwight  Rubinek');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Knoxville Street', 'jimmies@fmi.com', '0580332361', 46, 'Jimmie  Solido');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Delbert Blvd', 'reese.tarantino@gna.es', '0541112613', 78, 'Reese  Tarantino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Numan Street', 'liev.day@digitalmotorworks.com', '0583484009', 67, 'Liev  Day');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Griffin Street', 'frankie@meritagetechnologies.c', '0523725837', 19, 'Frankie  Cumming');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Mitra Road', 'petula.pony@dataprise.jp', '0528982351', 23, 'Petula  Pony');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Glenn Drive', 'courtneyc@aoltimewarner.uk', '0550775389', 81, 'Courtney  Cara');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Myers Road', 's.keaton@tilsonlandscape.es', '0549094809', 70, 'Sara  Keaton');
commit;
prompt 1600 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Mechelen Street', 'hope@ungertechnologies.de', '0587967436', 30, 'Hope  Matheson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Doucette Street', 'colin.buscemi@softworld.nl', '0584132930', 81, 'Colin  Buscemi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('829 Kirk Ave', 'rachael@manhattanassociates.de', '0589080369', 48, 'Rachael  Moore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('94 Debbie Street', 's.dupree@bedfordbancshares.ar', '0561459920', 89, 'Stanley  Dupree');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Bernard Street', 'quentin@mindiq.com', '0534105564', 9, 'Quentin  Holm');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Chi Street', 'loreena.whitwam@yumbrands.com', '0590670064', 67, 'Loreena  Whitwam');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Skarsgard Drive', 'taylor.studi@aci.uk', '0527905569', 87, 'Taylor  Studi');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Betty Drive', 'hmaclachlan@johnkeeler.com', '0515320052', 73, 'Humberto  MacLachlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Cozier Road', 'rik.muellerstahl@aop.ca', '0561318268', 19, 'Rik  Mueller-Stahl');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Bebe Blvd', 'jackie.jenkins@amerisourcefund', '0591576361', 77, 'Jackie  Jenkins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Coburn Street', 'remy.hutton@myricom.com', '0526672552', 25, 'Remy  Hutton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Kelly Road', 'edie.u@usenergyservices.ch', '0541257873', 63, 'Edie  Unger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Costello Road', 'pat.stanley@atg.com', '0571117939', 15, 'Pat  Stanley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Geena Drive', 'julianne.moorer@cowlitzbancorp', '0514684452', 18, 'Julianne  Moorer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Claude Road', 'ccolinyoung@millersystems.com', '0526756508', 43, 'Celia  Colin Young');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'm.bruce@accesssystems.com', '0535817383', 81, 'Merrill  Bruce');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Shand Street', 'sonas@newmedia.com', '0585398522', 83, 'Sona  Sylvian');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Crouch Blvd', 'wally.wills@chipssolutions.it', '0528343396', 30, 'Wally  Wills');
insert into PERSON (address, mail, mainphone, age, pname)
values ('179 Winstone Street', 'rade.sisto@homedepot.com', '0593197344', 44, 'Rade  Sisto');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 McCoy Road', 'steven.brooks@tmaresources.com', '0586071221', 45, 'Steven  Brooks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Assante Drive', 'mia.banderas@newtoninteractive', '0530421520', 41, 'Mia  Banderas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'chrissie.curtis@ptg.com', '0572808736', 23, 'Chrissie  Curtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'frankie.arjona@dell.com', '0532617160', 56, 'Frankie  Arjona');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Adler Street', 'carl.cochran@gltg.com', '0567452511', 66, 'Carl  Cochran');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Rutger', 'vertical.negbaur@pfizer.it', '0511266935', 36, 'Vertical  Negbaur');
insert into PERSON (address, mail, mainphone, age, pname)
values ('283 Uden Street', 'judy.makeba@kroger.com', '0539240147', 58, 'Judy  Makeba');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 English Street', 'nigel.campbell@investorstitle.', '0546894229', 61, 'Nigel  Campbell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Viggo Blvd', 'andrae.c@learningvoyage.no', '0542049479', 68, 'Andrae  Cherry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Cuba', 'brad.koyana@digitalmotorworks.', '0558508452', 90, 'Brad  Koyana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Bekescsaba Street', 'julier@dillards.com', '0593944679', 70, 'Julie  Rio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33rd Street', 'meredith.hackman@terrafirma.co', '0532514146', 40, 'Meredith  Hackman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Schock Road', 'benicio.blackwell@fab.com', '0508105606', 63, 'Benicio  Blackwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Zevon Road', 'rachel@trc.jp', '0542369578', 66, 'Rachel  Eat World');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Bernie Drive', 'alans@north.cn', '0591527306', 58, 'Alan  Sandoval');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Lovitz Road', 'carlos.lennox@genextechnologie', '0595024322', 80, 'Carlos  Lennox');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Mazzello Road', 'drew.c@gillani.com', '0556853945', 25, 'Drew  Curtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('297 Iglesias Street', 'roberta@jma.jp', '0535500108', 67, 'Roberta  Williams');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'ricky.conley@hiltonhotels.uk', '0540056731', 36, 'Ricky  Conley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('20 Gallant Road', 'hguinness@mission.com', '0573835188', 38, 'Horace  Guinness');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Fair Lawn Blvd', 'marlon.shelton@stonebrewing.de', '0561153057', 13, 'Marlon  Shelton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Curtis Street', 'bradleyd@innovateecommerce.uk', '0580802384', 23, 'Bradley  Duchovny');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Gothenburg Street', 'ericl@sony.com', '0529360207', 77, 'Eric  Leigh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Ray Drive', 'matt@scriptsave.com', '0581113592', 86, 'Matt  De Niro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('447 Marsden Road', 'jay.sherman@inzone.de', '0529278556', 37, 'Jay  Sherman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Nicosia Road', 'johnette.simpson@ivci.com', '0573072506', 67, 'Johnette  Simpson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Mars Road', 'darius.koyana@microtek.com', '0566861154', 11, 'Darius  Koyana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Swarthmore Road', 'phil.keith@cyberthink.com', '0581494122', 48, 'Phil  Keith');
insert into PERSON (address, mail, mainphone, age, pname)
values ('86 Sampson Drive', 'b.madsen@contract.com', '0554450019', 41, 'Bill  Madsen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Athens Ave', 'nikka.renfro@philipmorris.dk', '0518889575', 61, 'Nikka  Renfro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Tisdale Drive', 'rcattrall@horizon.com', '0526052352', 14, 'Rose  Cattrall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'curtisa@grayhawksystems.com', '0539969104', 44, 'Curtis  Anderson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('456 Steenburgen Drive', 'tburmester@woronocobancorp.de', '0521853830', 74, 'Tcheky  Burmester');
insert into PERSON (address, mail, mainphone, age, pname)
values ('980 Würzburg Drive', 'amcanally@innovativelighting.c', '0519863758', 31, 'Alfie  McAnally');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73rd Street', 'robert.marx@gateway.com', '0586402285', 83, 'Robert  Marx');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33 Curitiba Road', 'c.armstrong@firstsouthbancorp.', '0561000159', 25, 'Chely  Armstrong');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Esposito Street', 'elijah.hedaya@progressivedesig', '0598699725', 28, 'Elijah  Hedaya');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22nd Street', 'emerson.stampley@hudsonriverba', '0522313715', 33, 'Emerson  Stampley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('335 Maidenhead Drive', 'jena.unger@cardinalcartridge.i', '0520887051', 52, 'Jena  Unger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Phil Drive', 'r.carter@dataprise.au', '0582144236', 86, 'Robin  Carter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Andrew Street', 'bchild@americanland.ca', '0535523996', 62, 'Ben  Child');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43rd Street', 'bob.belle@hencie.com', '0533318149', 11, 'Bob  Belle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Loggia Street', 'mira.p@creditorsinterchange.co', '0572585964', 55, 'Mira  Posey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Harry Ave', 'liquid@bmm.ca', '0506289997', 21, 'Liquid  Schiavelli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Andrae Road', 'terrence.moraz@enterprise.it', '0585967894', 59, 'Terrence  Moraz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Seann Road', 'busta.mahood@alohanysystems.co', '0534885696', 28, 'Busta  Mahood');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Lena', 'andraea@unicru.com', '0549600818', 72, 'Andrae  Adams');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Kejae City Drive', 'melba.lyonne@globalwireless.co', '0586826842', 27, 'Melba  Lyonne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Bristol Blvd', 'gilbertos@aquickdelivery.ch', '0524583588', 31, 'Gilberto  Sewell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11st Street', 'natascha.hersh@tps.com', '0583210728', 48, 'Natascha  Hersh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('61 Rhona Road', 'jeroen.jamal@career.it', '0567559495', 69, 'Jeroen  Jamal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('798 McLachlan Drive', 'vondie@innovativelighting.it', '0586116078', 47, 'Vondie  Iglesias');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Nathan Ave', 'lionelh@trinityhomecare.ge', '0557286261', 84, 'Lionel  Hawke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Lennix Road', 'jackson.krumholtz@peerlessmanu', '0540572328', 62, 'Jackson  Krumholtz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Anna Drive', 'cevin@midwestmedia.jp', '0541269190', 67, 'Cevin  Levine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('715 Toni Drive', 'aimee.rodgers@codykramerimport', '0503688401', 28, 'Aimee  Rodgers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Hope Road', 'jann.quinones@johnkeeler.com', '0503332151', 57, 'Jann  Quinones');
insert into PERSON (address, mail, mainphone, age, pname)
values ('105 Carolyn Road', 'collin.shearer@americanvanguar', '0503403563', 38, 'Collin  Shearer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Dustin Street', 'hex.broderick@wendysinternatio', '0573981190', 12, 'Hex  Broderick');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Atkins Drive', 'james.c@integratelecom.com', '0523247419', 78, 'James  Caldwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('124 Shaw Ave', 'thomas.blaine@privatebancorp.c', '0597348207', 19, 'Thomas  Blaine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Christian Road', 'joely.c@wrgservices.com', '0586066084', 41, 'Joely  Coverdale');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Judd Road', 'colin.hubbard@supplycorecom.co', '0535929798', 35, 'Colin  Hubbard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('7 Gabriel Street', 'johnny.davidson@evinco.se', '0565135349', 35, 'Johnny  Davidson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('226 Broza Drive', 'kyulin@aop.fr', '0572458553', 81, 'Kenny  Yulin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Dinslaken', 'd.vassar@stonetechprofessional', '0528896146', 52, 'Dwight  Vassar');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Meredith Road', 'patty.fehr@learningvoyage.com', '0524747319', 22, 'Patty  Fehr');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Stuermer Blvd', 'rod@aquascapedesigns.de', '0574068385', 15, 'Rod  Chinlund');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Chaka', 'brendan.downey@hiltonhotels.ca', '0538977298', 76, 'Brendan  Downey');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Fuchstal-asch Street', 'traceg@bedfordbancshares.de', '0536095784', 83, 'Trace  Gertner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Manchester Road', 'chazz.adkins@pharmafab.uk', '0563495275', 32, 'Chazz  Adkins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('346 McPherson Blvd', 'jeanne.cocker@hfn.com', '0549633704', 19, 'Jeanne  Cocker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'mel.c@stonetechprofessional.co', '0552873066', 17, 'Mel  Cetera');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 von Sydow Street', 'nikka.c@coadvantageresources.h', '0593376704', 47, 'Nikka  Colton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('66 Pollack Street', 'vickie.hoffman@albertsons.au', '0588661413', 58, 'Vickie  Hoffman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13rd Street', 'isabella.kinnear@mwp.es', '0594344874', 9, 'Isabella  Kinnear');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Sirtis Drive', 'hilton.swinton@serentec.de', '0549769826', 7, 'Hilton  Swinton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('28 Camp Street', 'amorse@aop.com', '0580799506', 71, 'Aidan  Morse');
insert into PERSON (address, mail, mainphone, age, pname)
values ('735 Irene Road', 'danielt@hcoa.de', '0529114671', 22, 'Daniel  Trejo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Singletary Street', 'cmcgriff@paintedword.pt', '0535112858', 22, 'Charlize  McGriff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('3 Rundgren', 'howie.rooker@tama.com', '0539239080', 58, 'Howie  Rooker');
commit;
prompt 1700 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Whitley Street', 'cyndi.parm@aoe.jp', '0512784355', 51, 'Cyndi  Parm');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Crowell Blvd', 'pierce.richter@integratelecom.', '0530436727', 70, 'Pierce  Richter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Slater Street', 'stewart.eatworld@mre.de', '0583081726', 54, 'Stewart  Eat World');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 Mewes Street', 'ramsey.taylor@ufs.nl', '0580130362', 73, 'Ramsey  Taylor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Ponty Street', 'nikki.rizzo@air.com', '0525544240', 80, 'Nikki  Rizzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Singapore', 'lynette@coadvantageresources.p', '0582565361', 18, 'Lynette  Beatty');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Dwight Blvd', 'nicolase@extremepizza.fr', '0599701891', 9, 'Nicolas  Ellis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Foley Street', 'losbourne@carteretmortgage.uk', '0592154624', 54, 'Laurence  Osbourne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Stevens Street', 'd.shearer@enterprise.ar', '0552678365', 77, 'Devon  Shearer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'crystal@sprint.com', '0514465503', 15, 'Crystal  Dern');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Arquette Road', 'fionnula.levine@portosan.ch', '0518340269', 14, 'Fionnula  Levine');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Springville Road', 'emma.sheen@prp.id', '0544261384', 76, 'Emma  Sheen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Jaime Street', 'a.gano@granitesystems.com', '0587020408', 40, 'Avril  Gano');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Naomi Drive', 'hikaru.c@elite.dk', '0513827416', 58, 'Hikaru  Crudup');
insert into PERSON (address, mail, mainphone, age, pname)
values ('923 Dempsey Road', 'rowan.tomlin@sony.de', '0512803002', 8, 'Rowan  Tomlin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Collette Blvd', 'marley.s@ecopy.com', '0546075528', 26, 'Marley  Silverman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('144 Englewood Drive', 'nkweller@qestrel.com', '0593211448', 51, 'Nelly  Kweller');
insert into PERSON (address, mail, mainphone, age, pname)
values ('223 Peebles Road', 'rueben.gatlin@nissanmotor.com', '0597854788', 31, 'Rueben  Gatlin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Azucar Street', 'armin@pulaskifinancial.com', '0564141880', 55, 'Armin  Rourke');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Hyde', 'louise.eldard@fordmotor.uk', '0532777056', 75, 'Louise  Eldard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Baldwin Ave', 'carole.s@contract.com', '0549373007', 32, 'Carole  Smith');
insert into PERSON (address, mail, mainphone, age, pname)
values ('5 Gibson', 'kid@monitronicsinternational.c', '0512884376', 81, 'Kid  Grier');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Winnipeg Ave', 'collective.fichtner@bayer.ch', '0531888791', 16, 'Collective  Fichtner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Garner Street', 'lila.miller@doctorsassociates.', '0590145621', 36, 'Lila  Miller');
insert into PERSON (address, mail, mainphone, age, pname)
values ('938 Gleeson', 'nancid@usenergyservices.com', '0546636055', 89, 'Nanci  De Niro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 France Drive', 'nickel.mcdormand@aventis.de', '0584739736', 30, 'Nickel  McDormand');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Lyonne Blvd', 'katie.nugent@mai.pt', '0530325327', 27, 'Katie  Nugent');
insert into PERSON (address, mail, mainphone, age, pname)
values ('1 Rossellini Blvd', 'h.mathis@kingland.ht', '0533225402', 17, 'Halle  Mathis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Selma Road', 'stockard.sandler@millersystems', '0523532082', 88, 'Stockard  Sandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Luongo Drive', 'bret.gyllenhaal@ads.com', '0571892201', 66, 'Bret  Gyllenhaal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Marley Ave', 'xander.tanon@bayer.com', '0558986300', 27, 'Xander  Tanon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Kimberly Street', 'todd.phillips@dell.it', '0517554269', 51, 'Todd  Phillips');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Gaza Ave', 'boyd.brock@gentrasystems.fr', '0576897201', 48, 'Boyd  Brock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('852 Bogguss Road', 'merle@officedepot.de', '0578771674', 49, 'Merle  Lane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Jeroen Drive', 'earl@yes.com', '0517744013', 53, 'Earl  Secada');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Jean', 'brads@philipmorris.com', '0559285404', 45, 'Brad  Stewart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Doncaster', 'oro@gillette.ca', '0555010836', 34, 'Oro  Isaak');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Peet Road', 'kyle.amos@nsd.com', '0571528760', 12, 'Kyle  Amos');
insert into PERSON (address, mail, mainphone, age, pname)
values ('94 Union', 'rsandler@mavericktechnologies.', '0513464724', 12, 'Ritchie  Sandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Bern Ave', 'beverley.labelle@fmb.ca', '0530604135', 27, 'Beverley  LaBelle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('734 Newman Ave', 'mindy@intraspheretechnologies.', '0551884272', 28, 'Mindy  Horizon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Fisher Drive', 'rhea.bedelia@hencie.com', '0582771375', 47, 'Rhea  Bedelia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Glenn Street', 'tal.wright@ibm.com', '0589328680', 35, 'Tal  Wright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Kumamoto Road', 'annie.nugent@allegiantbancorp.', '0558736420', 25, 'Annie  Nugent');
insert into PERSON (address, mail, mainphone, age, pname)
values ('19 Def Road', 'rkattan@integramedamerica.no', '0536211316', 57, 'Rob  Kattan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Heiligenhaus Road', 'holland.kotto@sandyspringbanco', '0516691142', 85, 'Holland  Kotto');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Athens Street', 'n.clarkson@ssci.fr', '0523413421', 59, 'Ned  Clarkson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('741 Butler Ave', 'kathleeno@venoco.au', '0515674478', 39, 'Kathleen  Oszajca');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Willard Road', 'lea.davis@bradleypharmaceutica', '0543772681', 60, 'Lea  Davis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Harry Drive', 'b.baez@fordmotor.it', '0500973156', 49, 'Brad  Baez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Dunst Street', 'clive.carrington@atxforms.com', '0510173912', 41, 'Clive  Carrington');
insert into PERSON (address, mail, mainphone, age, pname)
values ('69 Crimson', 'brooke.franklin@cyberthink.uk', '0500891214', 10, 'Brooke  Franklin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Sepulveda', 'courtney.shorter@americanland.', '0524783060', 52, 'Courtney  Shorter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Mac Road', 'dtaylor@linacsystems.com', '0555561684', 46, 'Dave  Taylor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Hector', 'goldie@kramontrealty.com', '0573651244', 80, 'Goldie  Nunn');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Loeb Road', 'jarvis@grayhawksystems.com', '0589596436', 63, 'Jarvis  Chesnutt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Warden Road', 'patti.rydell@staffforce.com', '0531430840', 66, 'Patti  Rydell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('305 Stevenson Street', 'parker.patton@ibm.com', '0591540861', 41, 'Parker  Patton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Cusack Road', 'hal.mcgregor@socketinternet.is', '0599777765', 9, 'Hal  McGregor');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Harper', 'emm@mre.com', '0542807523', 12, 'Emm  Sweeney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Michaels Road', 'randy.deltoro@marlabs.com', '0515342330', 50, 'Randy  Del Toro');
insert into PERSON (address, mail, mainphone, age, pname)
values ('51st Street', 'april.hannah@bioreference.com', '0518799170', 32, 'April  Hannah');
insert into PERSON (address, mail, mainphone, age, pname)
values ('68 Tartu Street', 'lkinnear@cima.com', '0575135152', 7, 'Leslie  Kinnear');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 MacDowell', 'thora.wilder@mms.si', '0575019829', 33, 'Thora  Wilder');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Depp Blvd', 'eliza.parm@data.com', '0596148854', 8, 'Eliza  Parm');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Antonio Blvd', 'marty.hampton@staffone.com', '0540842303', 61, 'Marty  Hampton');
insert into PERSON (address, mail, mainphone, age, pname)
values ('575 Sossamon Road', 'yaphet.flanagan@cima.com', '0544873528', 18, 'Yaphet  Flanagan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('10 Fornacette', 'jarvis@wrgservices.nl', '0590024835', 80, 'Jarvis  Shaw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('23rd Street', 'jonathan.alexander@pulaskifina', '0510581976', 45, 'Jonathan  Alexander');
insert into PERSON (address, mail, mainphone, age, pname)
values ('45 Evett', 'wvandamme@dis.au', '0523797416', 56, 'Wang  Van Damme');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Wopat Blvd', 'xander.molina@sunstream.si', '0504767343', 66, 'Xander  Molina');
insert into PERSON (address, mail, mainphone, age, pname)
values ('982 Hazel Street', 'fairuzag@nlx.com', '0571740194', 90, 'Fairuza  Gagnon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Kitty Street', 'g.arjona@aop.it', '0531464463', 10, 'Gilbert  Arjona');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Kim Road', 'mickey.chestnut@unica.com', '0512985614', 40, 'Mickey  Chestnut');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'dick.domino@alternativetechnol', '0551815273', 29, 'Dick  Domino');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31st Street', 'vienna.okeefe@kellogg.com', '0594328199', 39, 'Vienna  O''Keefe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Belo Horizonte Drive', 'brad.porter@balchem.br', '0510948045', 74, 'Brad  Porter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Brock Street', 'fats.matheson@hersheyfoods.com', '0514074719', 11, 'Fats  Matheson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('373 Buckingham Road', 'talvin.l@learningvoyage.il', '0505604731', 23, 'Talvin  Leguizamo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('206 Curry Road', 'richard.cagle@genextechnologie', '0593363967', 55, 'Richard  Cagle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Cornell Street', 'arturo@angieslist.com', '0577760219', 35, 'Arturo  Krumholtz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 Frankfurt am Main Street', 'mike.griggs@americanland.com', '0550806344', 25, 'Mike  Griggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Costello Ave', 'eugene@progressivemedical.uk', '0524008981', 56, 'Eugene  Gore');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Nelligan Blvd', 'jay@telecheminternational.com', '0553294235', 65, 'Jay  Caviezel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Sarandon Blvd', 'mpesci@dis.com', '0599225297', 44, 'Mandy  Pesci');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Kwun Tong', 'laurieh@stmaryland.ch', '0520183255', 53, 'Laurie  Haysbert');
insert into PERSON (address, mail, mainphone, age, pname)
values ('592 Lois Road', 'uma.begley@glmt.de', '0503174119', 72, 'Uma  Begley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Conway Street', 'lizzy.byrd@mms.com', '0523663885', 26, 'Lizzy  Byrd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Cobbs Blvd', 'rosanna.herndon@nobrainerblind', '0550806580', 67, 'Rosanna  Herndon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Olin Ave', 'n.eckhart@ssci.com', '0594592130', 87, 'Nile  Eckhart');
insert into PERSON (address, mail, mainphone, age, pname)
values ('49 Denise Street', 'emma.olin@faef.com', '0549539628', 59, 'Emma  Olin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 O''Neal Ave', 'nancy.rizzo@capstone.com', '0516957065', 20, 'Nancy  Rizzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 MacLachlan Street', 'scott@wyeth.uk', '0523080274', 16, 'Scott  Leguizamo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Dustin Road', 'ted.rivers@ris.com', '0580314025', 65, 'Ted  Rivers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('838 Coe Drive', 'jessica.davison@supplycorecom.', '0506093412', 32, 'Jessica  Davison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13 Maxwell Street', 'j.tsettos@supplycorecom.de', '0562932290', 67, 'Jean  Tsettos');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Hiatt Ave', 'e.lupone@bayer.com', '0586574055', 9, 'Ellen  LuPone');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Taoyuan', 'lauren.b@floorgraphics.com', '0529795740', 7, 'Lauren  Bridges');
insert into PERSON (address, mail, mainphone, age, pname)
values ('85 Maintenon', 'b.stevens@trafficmanagement.co', '0501327038', 11, 'Breckin  Stevens');
insert into PERSON (address, mail, mainphone, age, pname)
values ('260 Russell Road', 'dfeore@linacsystems.no', '0514783605', 24, 'David  Feore');
commit;
prompt 1800 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 East sussex', 'erockwell@timberlanewoodcrafte', '0544439696', 54, 'Eddie  Rockwell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Zellweger Drive', 'martin.eatworld@mag.ca', '0539788421', 51, 'Martin  Eat World');
insert into PERSON (address, mail, mainphone, age, pname)
values ('70 Taylor Blvd', 'pkline@ibfh.com', '0578304563', 9, 'Paul  Kline');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Haslam Road', 'william.b@usgovernment.com', '0526099565', 31, 'William  Biel');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Michelle Street', 'maggie.lapaglia@noodles.es', '0503568827', 48, 'Maggie  LaPaglia');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Ruth Street', 'angie.p@naturescure.it', '0508937947', 50, 'Angie  Phillippe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('271 Skarsgard Street', 'julianar@fetchlogistics.au', '0598854980', 81, 'Juliana  Rains');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Altstätten Street', 't.kadison@bigdoughcom.yu', '0599860920', 89, 'Temuera  Kadison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81st Street', 'james@bps.com', '0527925498', 21, 'James  Banderas');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Neeson Street', 'vickie.wells@baesch.com', '0578264424', 8, 'Vickie  Wells');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Lovitz Street', 'ruebenm@cardtronics.de', '0565710548', 31, 'Rueben  Marley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('415 Udo Drive', 'b.whitley@irissoftware.com', '0545217769', 38, 'Brittany  Whitley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Palmer Ave', 'jody@callhenry.com', '0595783326', 43, 'Jody  Whitford');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 Neville Drive', 'tal.r@gtp.com', '0509507343', 63, 'Tal  Roberts');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62 Susan Street', 'eddie.lorenz@directdata.tw', '0556449052', 42, 'Eddie  Lorenz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Akins Road', 'johnnie.kane@gateway.com', '0518797331', 86, 'Johnnie  Kane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Carlton Street', 'g.cozier@kingland.com', '0529623339', 88, 'Grace  Cozier');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Gran Road', 'angie.rauhofer@sears.hk', '0528127351', 84, 'Angie  Rauhofer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Saucedo Street', 'merle.pride@ositissoftware.jp', '0537160425', 29, 'Merle  Pride');
insert into PERSON (address, mail, mainphone, age, pname)
values ('91 Connelly Drive', 'patricia.schock@jlphor.ca', '0510085906', 34, 'Patricia  Schock');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Speaks Drive', 'tanya.chapman@meridiangold.com', '0553718947', 64, 'Tanya  Chapman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Fats Street', 'yolanda.kretschmann@randomwalk', '0589713993', 76, 'Yolanda  Kretschmann');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Walter Road', 'nathan.vanderbeek@afs.com', '0520504122', 43, 'Nathan  Van Der Beek');
insert into PERSON (address, mail, mainphone, age, pname)
values ('33rd Street', 'roberta.griggs@pinnaclestaffin', '0588613873', 35, 'Roberta  Griggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('43 Phoebe Road', 'janeane.weiland@ibm.uk', '0537581884', 15, 'Janeane  Weiland');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Yolanda Road', 'carolyn.dibiasio@drinkmorewate', '0584052574', 57, 'Carolyn  DiBiasio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('943 Stampley Drive', 'daryl.taha@trinityhomecare.com', '0512960994', 58, 'Daryl  Taha');
insert into PERSON (address, mail, mainphone, age, pname)
values ('16 Harris Road', 'thin.haslam@envisiontelephony.', '0512944390', 33, 'Thin  Haslam');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Janssen Street', 'tal.haggard@allegiantbancorp.e', '0503858541', 88, 'Tal  Haggard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Bologna Road', 'orlando@saralee.de', '0512180213', 11, 'Orlando  Hudson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('437 Brando Ave', 'bernie.w@linersdirect.mx', '0500454771', 87, 'Bernie  Winans');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Coppell Road', 'lynette.rain@its.be', '0523398250', 8, 'Lynette  Rain');
insert into PERSON (address, mail, mainphone, age, pname)
values ('155 Craddock Drive', 'sean.orbit@hfg.uk', '0531420350', 56, 'Sean  Orbit');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Houston Ave', 'lydia@fnb.com', '0534477724', 87, 'Lydia  Lane');
insert into PERSON (address, mail, mainphone, age, pname)
values ('37 Crystal Drive', 'sean.meniketti@yumbrands.de', '0547721938', 44, 'Sean  Meniketti');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Pacific Grove Street', 'mpressly@techbooks.nl', '0531829931', 66, 'Ming-Na  Pressly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Tanon Street', 'franz@topicsentertainment.de', '0547205186', 66, 'Franz  Bonham');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Vaughan Road', 'forest@marketfirst.uk', '0541551605', 53, 'Forest  Sandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'ksandler@gci.com', '0552281695', 90, 'Kylie  Sandler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('22 Pollak Blvd', 'norm.richards@tmt.com', '0504061513', 22, 'Norm  Richards');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Mary-Louise', 'i.hobson@processplus.ch', '0581274439', 36, 'Ian  Hobson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Sandoval Drive', 'john.pfeiffer@ecopy.com', '0563202025', 69, 'John  Pfeiffer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Rik Road', 'rchestnut@banfeproducts.uk', '0529202140', 43, 'Rip  Chestnut');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Lodi Blvd', 'pamela.pollack@capitolbancorp.', '0533539659', 71, 'Pamela  Pollack');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Schneider Road', 'tia.griffin@ubp.com', '0561756032', 40, 'Tia  Griffin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92nd Street', 'ike.eldard@advancedneuromodula', '0516080408', 24, 'Ike  Eldard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Giovanni Street', 'wanga@codykramerimports.com', '0546260730', 69, 'Wang  Archer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('548 Buffalo Ave', 'rwopat@monarchcasino.com', '0507839941', 72, 'Rascal  Wopat');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Coventry Street', 'antonio@powerlight.com', '0599826440', 79, 'Antonio  Flemyng');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Breslin Street', 'ritchie.sanders@randomwalk.jp', '0565579161', 47, 'Ritchie  Sanders');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72nd Street', 'rose.winger@webgroup.jp', '0518132305', 75, 'Rose  Winger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('38 Russo Ave', 's.jeter@bestbuy.jp', '0516508173', 41, 'Sarah  Jeter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('18 Demi Drive', 'v.lorenz@mai.de', '0544397236', 14, 'Victoria  Lorenz');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Visnjic Ave', 'c.cornell@viacell.br', '0587334465', 17, 'Clarence  Cornell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Santa Clarat Road', 'meryl.lloyd@safeway.no', '0551608227', 34, 'Meryl  Lloyd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Place Drive', 'jeffrey.richter@lynksystems.co', '0512074913', 80, 'Jeffrey  Richter');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Saxon Road', 'allison.rivers@sandyspringbanc', '0528682197', 57, 'Allison  Rivers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53rd Street', 'judd.sepulveda@democracydata.i', '0544873234', 61, 'Judd  Sepulveda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('8 Joaquin Blvd', 'kieran.hedaya@printtech.za', '0514745288', 90, 'Kieran  Hedaya');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 New Haven Ave', 'cheech.myles@atlanticcredit.au', '0554442644', 45, 'Cheech  Myles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Paxton Street', 'angie.bates@adolph.nl', '0589252861', 72, 'Angie  Bates');
insert into PERSON (address, mail, mainphone, age, pname)
values ('35 Osbourne', 'gabriel.lucien@infopros.com', '0521834270', 90, 'Gabriel  Lucien');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Griggs Drive', 'stanley@kimberlyclark.uk', '0523288045', 21, 'Stanley  Torres');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Ribisi Street', 'mphoenix@studiobproductions.ca', '0521495830', 30, 'Mae  Phoenix');
insert into PERSON (address, mail, mainphone, age, pname)
values ('79 Anna', 'franz.lewis@unica.uk', '0518451940', 31, 'Franz  Lewis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('12 Earl Street', 'jasona@trc.uk', '0546396161', 70, 'Jason  Aiken');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Clayton Road', 'jonnylee.crouch@jewettcameron.', '0526529811', 11, 'Jonny Lee  Crouch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Close Road', 'andre.mitchell@scjohnson.ar', '0559271693', 27, 'Andre  Mitchell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('21 Stone Ave', 'greg.carlisle@tilsonhr.it', '0503556481', 12, 'Greg  Carlisle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Peet Ave', 'petula@unit.be', '0572803395', 30, 'Petula  O''Keefe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('317 Frakes Drive', 'ricky@peerlessmanufacturing.lt', '0528974262', 88, 'Ricky  Curtis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Michelle Street', 'murray@myricom.com', '0540882563', 64, 'Murray  Galecki');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Winnipeg Drive', 'nancy.sweeney@fab.es', '0519415809', 19, 'Nancy  Sweeney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'dgreene@fpf.lk', '0536663472', 68, 'Derrick  Greene');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Prowse Street', 'ani.hewitt@glaxosmithkline.it', '0594602771', 63, 'Ani  Hewitt');
insert into PERSON (address, mail, mainphone, age, pname)
values ('71 Redding Ave', 'diamond.r@biosite.es', '0595797584', 73, 'Diamond  Rio');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Crouch Street', 'catherine.berry@sfmai.de', '0534364781', 61, 'Catherine  Berry');
insert into PERSON (address, mail, mainphone, age, pname)
values ('100 Offenburg Road', 'willem.lynne@bedfordbancshares', '0540765295', 35, 'Willem  Lynne');
insert into PERSON (address, mail, mainphone, age, pname)
values ('82nd Street', 'cledus.saucedo@aquascapedesign', '0527835242', 82, 'Cledus  Saucedo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'janice.baldwin@aoltimewarner.u', '0565488258', 79, 'Janice  Baldwin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Cornell Road', 'fionnula.mcferrin@mds.nl', '0525260524', 73, 'Fionnula  McFerrin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('41 Houston Drive', 'michelle.latifah@americanvangu', '0552877530', 67, 'Michelle  Latifah');
insert into PERSON (address, mail, mainphone, age, pname)
values ('6 Breda Road', 'miranda@proclarity.hk', '0512276162', 85, 'Miranda  McIntyre');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Macclesfield Ave', 'j.heslov@atxforms.de', '0504853332', 78, 'Joseph  Heslov');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Napolitano Street', 'daryle.dafoe@bioreliance.de', '0584218123', 48, 'Daryle  Dafoe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('11 Mars', 'bill.bragg@dcgroup.de', '0564828011', 75, 'Bill  Bragg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('874 Culkin Street', 'cloris.w@advertisingventures.d', '0549019530', 76, 'Cloris  Worrell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Maxine Street', 'carl.basinger@innovativelighti', '0589002713', 69, 'Carl  Basinger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Martha Drive', 'lindao@capellaeducation.jp', '0599129021', 77, 'Linda  Olin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('833 DeVito Street', 'natascha.macdowell@portageenvi', '0542739804', 90, 'Natascha  MacDowell');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'gwyneth.krieger@ceom.com', '0537353778', 60, 'Gwyneth  Krieger');
insert into PERSON (address, mail, mainphone, age, pname)
values ('67 Lewis Road', 'r.morrison@visionarysystems.co', '0502139249', 90, 'Rufus  Morrison');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Tara', 'aalda@usenergyservices.lk', '0505890945', 49, 'Anna  Alda');
insert into PERSON (address, mail, mainphone, age, pname)
values ('60 Kelly Blvd', 'donal.lunch@diamondtechnologie', '0540024692', 46, 'Donal  Lunch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('202 Juliet Drive', 'ozzy.zevon@staffforce.com', '0535515642', 84, 'Ozzy  Zevon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Orbit Blvd', 'veruca.mirren@socketinternet.b', '0576520335', 89, 'Veruca  Mirren');
insert into PERSON (address, mail, mainphone, age, pname)
values ('13rd Street', 'raymond.malkovich@connected.co', '0563166994', 30, 'Raymond  Malkovich');
insert into PERSON (address, mail, mainphone, age, pname)
values ('62nd Street', 'tcrystal@sourcegear.com', '0515610301', 20, 'Tia  Crystal');
insert into PERSON (address, mail, mainphone, age, pname)
values ('381 McDiarmid Drive', 'johnnie.bergen@telecheminterna', '0518339502', 8, 'Johnnie  Bergen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('2 Cash Road', 'pablo.holbrook@bestever.de', '0520434408', 64, 'Pablo  Holbrook');
commit;
prompt 1900 records committed...
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Shawn Road', 'mwopat@spd.ca', '0567992338', 34, 'Mel  Wopat');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Kinney Street', 'denzel.himmelman@marsinc.com', '0597634073', 77, 'Denzel  Himmelman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Young Road', 'sigourney@formatech.au', '0510798407', 90, 'Sigourney  Molina');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Nepean Street', 'fionnula@investmentscorecard.c', '0546257864', 73, 'Fionnula  Carlyle');
insert into PERSON (address, mail, mainphone, age, pname)
values ('88 Hawke', 'levar@mathis.ch', '0502535520', 13, 'LeVar  Gary');
insert into PERSON (address, mail, mainphone, age, pname)
values ('25 Fariq Drive', 'natascha.chestnut@campbellsoup', '0519348146', 22, 'Natascha  Chestnut');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32 Salisbury Drive', 'lena.olyphant@shirtfactory.com', '0542287074', 89, 'Lena  Olyphant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'xander.balaban@tama.fr', '0511653827', 89, 'Xander  Balaban');
insert into PERSON (address, mail, mainphone, age, pname)
values ('83 Allen Road', 'rory.mcpherson@consultants.ch', '0514752133', 74, 'Rory  McPherson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Sharp Road', 'tim@idlabel.com', '0542648953', 13, 'Tim  Vincent');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52 Chinnor Drive', 'sona.popper@circuitcitystores.', '0510265838', 38, 'Sona  Popper');
insert into PERSON (address, mail, mainphone, age, pname)
values ('273 Parker Drive', 'rob.greene@priorityexpress.com', '0592502015', 68, 'Rob  Greene');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Mike Street', 'geoff.imperioli@egroup.uk', '0593961960', 42, 'Geoff  Imperioli');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Balmoral Drive', 'raul@activeservices.uk', '0519560607', 68, 'Raul  Simpson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('44 Narrows Blvd', 'beverley.whitley@trx.com', '0523695352', 90, 'Beverley  Whitley');
insert into PERSON (address, mail, mainphone, age, pname)
values ('15 Hampton Street', 'aidan.coleman@hfg.com', '0519906600', 87, 'Aidan  Coleman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('52nd Street', 'lindat@spotfireholdings.it', '0561637325', 42, 'Linda  Tippe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('305 Jeroen Road', 'f.myles@tama.de', '0516067704', 60, 'Freddie  Myles');
insert into PERSON (address, mail, mainphone, age, pname)
values ('39 Blanchett Street', 'cyndi@bluffcitysteel.com', '0528021876', 63, 'Cyndi  Gatlin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('438 Hughes Road', 'aaron.mclachlan@dearbornbancor', '0568904976', 8, 'Aaron  McLachlan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Jose Street', 'anita.speaks@vivendiuniversal.', '0544690116', 54, 'Anita  Speaks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('95 Flack Drive', 'steven@capitolbancorp.ch', '0509879038', 14, 'Steven  Johansson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 El-Saher Blvd', 'o.webb@pepsico.com', '0566474207', 42, 'Oliver  Webb');
insert into PERSON (address, mail, mainphone, age, pname)
values ('54 Drew Road', 'seann.c@glacierbancorp.se', '0544727842', 19, 'Seann  Chan');
insert into PERSON (address, mail, mainphone, age, pname)
values ('75 Alston Street', 'marlon.mccabe@cws.com', '0524189375', 56, 'Marlon  McCabe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('64 Denny Road', 'carole.secada@authoria.com', '0596924914', 24, 'Carole  Secada');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Princeton Street', 'kelly.gill@ciwservices.it', '0532833235', 22, 'Kelly  Gill');
insert into PERSON (address, mail, mainphone, age, pname)
values ('59 Capshaw Street', 'a.parm@ibm.de', '0588543325', 12, 'Alicia  Parm');
insert into PERSON (address, mail, mainphone, age, pname)
values ('653 Lee Drive', 'irene.rawls@scooterstore.com', '0576038654', 54, 'Irene  Rawls');
insert into PERSON (address, mail, mainphone, age, pname)
values ('578 Keaton Street', 'vertical.berkoff@diamondgroup.', '0501812602', 90, 'Vertical  Berkoff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('524 Lauper Road', 'kurt.matheson@merck.uk', '0594714139', 82, 'Kurt  Matheson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('24 Jesse Road', 'd.olyphant@viacom.com', '0535080391', 59, 'Dabney  Olyphant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('92 McLean Street', 'e.drive@printtech.com', '0556103009', 8, 'Eric  Drive');
insert into PERSON (address, mail, mainphone, age, pname)
values ('65 Emily Drive', 'k.santarosa@hotmail.jp', '0570229445', 84, 'Kimberly  Santa Rosa');
insert into PERSON (address, mail, mainphone, age, pname)
values ('761 Shand Drive', 'jane.t@iss.com', '0518637651', 81, 'Jane  Tucker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('478 Pryce Street', 'lonnie.parker@bigyanksports.co', '0512314721', 46, 'Lonnie  Parker');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Jena Road', 'keanu@stonebrewing.uk', '0508602088', 16, 'Keanu  Nicks');
insert into PERSON (address, mail, mainphone, age, pname)
values ('96 Phifer', 'nicole.tomlin@tripwire.de', '0537286923', 43, 'Nicole  Tomlin');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Merchant Ave', 'yolanda.sayer@montpelierplasti', '0568556272', 19, 'Yolanda  Sayer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('40 Radney', 'davy.freeman@serentec.com', '0592791003', 54, 'Davy  Freeman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Colorado Springs Road', 'marisa@ungertechnologies.com', '0527769461', 61, 'Marisa  Haggard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('29 Flanagan Road', 'knoseworthy@zoneperfectnutriti', '0560327506', 43, 'Kelly  Noseworthy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('84 Ronny Street', 'laurie@prometheuslaboratories.', '0516004950', 48, 'Laurie  Stuermer');
insert into PERSON (address, mail, mainphone, age, pname)
values ('74 Johor Bahru Ave', 'jesse@saksinc.uk', '0583701695', 43, 'Jesse  Koyana');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Crosby Street', 'jeanne.sarsgaard@savela.de', '0513706895', 86, 'Jeanne  Sarsgaard');
insert into PERSON (address, mail, mainphone, age, pname)
values ('747 Quinones Street', 'niles@ccb.de', '0515262231', 64, 'Nile  Shepherd');
insert into PERSON (address, mail, mainphone, age, pname)
values ('31 Ricky Road', 'freddie.w@signalperfection.de', '0569512202', 65, 'Freddie  Webb');
insert into PERSON (address, mail, mainphone, age, pname)
values ('292 Spector Road', 'jody.s@kingland.com', '0523943119', 22, 'Jody  Shatner');
insert into PERSON (address, mail, mainphone, age, pname)
values ('26 Oslo Road', 'h.mcintyre@ptg.com', '0500075326', 16, 'Halle  McIntyre');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Cetera Blvd', 'debbieo@abs.com', '0556038725', 49, 'Debbie  Overstreet');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'marie.c@cynergydata.com', '0523644741', 52, 'Marie  Conlee');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Silver Spring Blvd', 'pelvic.merchant@gulfmarkoffsho', '0544863256', 54, 'Pelvic  Merchant');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93 Peterborough Drive', 'jeff.voight@mcdonalds.jp', '0524249324', 75, 'Jeff  Voight');
insert into PERSON (address, mail, mainphone, age, pname)
values ('63 Wang Road', 'merrilee.williamson@fpf.de', '0513570343', 23, 'Merrilee  Williamson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('905 Pleasure Drive', 'chi.child@cynergydata.de', '0584429699', 48, 'Chi  Child');
insert into PERSON (address, mail, mainphone, age, pname)
values ('14 Borden Drive', 'petula.crow@knightsbridge.com', '0510176243', 7, 'Petula  Crow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42nd Street', 'gord.mckean@infovision.uk', '0583974580', 70, 'Gord  McKean');
insert into PERSON (address, mail, mainphone, age, pname)
values ('72 Close Road', 'wade.biggs@staffforce.com', '0592842572', 87, 'Wade  Biggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('47 Kidman Road', 'freddie.skaggs@aristotle.ch', '0520413686', 52, 'Freddie  Skaggs');
insert into PERSON (address, mail, mainphone, age, pname)
values ('53 Hopper Street', 'taye.wahlberg@trx.com', '0539778860', 76, 'Taye  Wahlberg');
insert into PERSON (address, mail, mainphone, age, pname)
values ('147 Rob Street', 'aemmett@creditorsinterchange.c', '0533173822', 85, 'Adrien  Emmett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('30 Eastwood Street', 'rebecca.shue@owm.br', '0549789564', 36, 'Rebecca  Shue');
insert into PERSON (address, mail, mainphone, age, pname)
values ('48 Jennifer Blvd', 'frank@gltg.com', '0503109241', 35, 'Frank  Li');
insert into PERSON (address, mail, mainphone, age, pname)
values ('42 Ipswich Drive', 'levar.foster@cocacola.it', '0547840019', 31, 'LeVar  Foster');
insert into PERSON (address, mail, mainphone, age, pname)
values ('81 Hudson Blvd', 'cheryl.gershon@fds.com', '0588036430', 8, 'Cheryl  Gershon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Thornton Drive', 'carrie.williamson@vesta.com', '0549886196', 37, 'Carrie  Williamson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 CeCe Road', 'edgare@wav.com', '0528039351', 30, 'Edgar  Evett');
insert into PERSON (address, mail, mainphone, age, pname)
values ('32nd Street', 'carla.gagnon@ris.com', '0591286539', 72, 'Carla  Gagnon');
insert into PERSON (address, mail, mainphone, age, pname)
values ('485 McKennitt Road', 'mel.chambers@captechventures.a', '0551851835', 64, 'Mel  Chambers');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Woodward Road', 'dcoe@aoe.com', '0557673859', 35, 'Davy  Coe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('73 Uden Street', 'c.walsh@alohanysystems.ht', '0532006802', 67, 'Colleen  Walsh');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Puckett Drive', 'emmylou.holly@pharmafab.uk', '0539602777', 28, 'Emmylou  Holly');
insert into PERSON (address, mail, mainphone, age, pname)
values ('239 Eschborn Street', 'gordie.adler@kelmooreinvestmen', '0503854502', 48, 'Gordie  Adler');
insert into PERSON (address, mail, mainphone, age, pname)
values ('147 Owen Road', 'curtis.deluise@ciwservices.it', '0546037641', 81, 'Curtis  DeLuise');
insert into PERSON (address, mail, mainphone, age, pname)
values ('46 Cameron Street', 'delbert.delta@proclarity.com', '0595664140', 27, 'Delbert  Delta');
insert into PERSON (address, mail, mainphone, age, pname)
values ('80 Pleasure Blvd', 'fiona.rizzo@americanland.jp', '0545042516', 89, 'Fiona  Rizzo');
insert into PERSON (address, mail, mainphone, age, pname)
values ('78 Tankard Ave', 'lionel.d@apexsystems.de', '0555136862', 19, 'Lionel  Diffie');
insert into PERSON (address, mail, mainphone, age, pname)
values ('695 Ivan Road', 'courtney.wen@hatworld.uk', '0524191583', 27, 'Courtney  Wen');
insert into PERSON (address, mail, mainphone, age, pname)
values ('94 Double Oak Road', 'btyson@afs.de', '0546943098', 81, 'Brittany  Tyson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('27 Thin Road', 'casey@bayer.com', '0538826047', 23, 'Casey  Bright');
insert into PERSON (address, mail, mainphone, age, pname)
values ('57 Adelaide Road', 'spencer.baez@gra.jp', '0576923058', 59, 'Spencer  Baez');
insert into PERSON (address, mail, mainphone, age, pname)
values ('98 Nik Drive', 'salma.sweeney@aquascapedesigns', '0524211495', 61, 'Salma  Sweeney');
insert into PERSON (address, mail, mainphone, age, pname)
values ('77 Ankara Blvd', 'bradley.hutch@kingland.com', '0592510004', 52, 'Bradley  Hutch');
insert into PERSON (address, mail, mainphone, age, pname)
values ('34 Steyr Drive', 'rebecca.kudrow@aldensystems.co', '0599688863', 34, 'Rebecca  Kudrow');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Breda Road', 'daryl.parish@ubp.de', '0567537469', 49, 'Daryl  Parish');
insert into PERSON (address, mail, mainphone, age, pname)
values ('50 Janney Blvd', 'johnny.atkinson@ssci.uk', '0512045690', 7, 'Johnny  Atkinson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('56 Brisbane Road', 'richard.mcgriff@dell.com', '0543731390', 85, 'Richard  McGriff');
insert into PERSON (address, mail, mainphone, age, pname)
values ('739 Kurt Drive', 'curtis.shandling@fmi.com', '0593148948', 51, 'Curtis  Shandling');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Aaron Street', 'jackie.lowe@streetglow.nl', '0536861295', 85, 'Jackie  Lowe');
insert into PERSON (address, mail, mainphone, age, pname)
values ('330 Schenectady Road', 'jody.wells@callhenry.dk', '0564994511', 83, 'Jody  Wells');
insert into PERSON (address, mail, mainphone, age, pname)
values ('90 Close Road', 'vince.c@ass.de', '0591871132', 8, 'Vince  Cattrall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('87 Carmichael Road', 'm.dukakis@americanvanguard.uk', '0548243220', 88, 'Mili  Dukakis');
insert into PERSON (address, mail, mainphone, age, pname)
values ('17 Bush Street', 'k.curtishall@advancedneuromodu', '0561210126', 25, 'Keanu  Curtis-Hall');
insert into PERSON (address, mail, mainphone, age, pname)
values ('97 McDonald Drive', 'anthony.crimson@genghisgrill.i', '0584967846', 80, 'Anthony  Crimson');
insert into PERSON (address, mail, mainphone, age, pname)
values ('4 Rolando Road', 'julie.degraw@genghisgrill.com', '0555709048', 22, 'Julie  DeGraw');
insert into PERSON (address, mail, mainphone, age, pname)
values ('93rd Street', 'rosanne.p@mitsubishimotors.jp', '0558499449', 25, 'Rosanne  Purefoy');
insert into PERSON (address, mail, mainphone, age, pname)
values ('36 Forrest Drive', 'luis.shandling@vfs.com', '0581815954', 54, 'Luis  Shandling');
insert into PERSON (address, mail, mainphone, age, pname)
values ('89 Lauper Road', 'k.oldman@globalwireless.com', '0593003587', 44, 'Kim  Oldman');
insert into PERSON (address, mail, mainphone, age, pname)
values ('665 Shue Blvd', 'x.hopkins@ivorysystems.com', '0521769839', 89, 'Xander  Hopkins');
insert into PERSON (address, mail, mainphone, age, pname)
values ('9 Nils Road', 'aaron.tate@ivci.pt', '0580504756', 80, 'Aaron  Tate');
commit;
prompt 2000 records loaded
prompt Loading ACTIVITYOPERATOR...
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3228.33, 'Storyteller', 'male', '0599222124');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9755.72, 'Historian', 'male', '0547205186');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (701.15, 'Gardening expert', 'female', '0520795630');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5467.82, 'Puppeteer', 'male', '0591698950');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7605.01, 'Art instructor', 'female', '0516893830');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2417.05, 'Historian', 'female', '0516056811');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2494.39, 'Gardening expert', 'male', '0595233459');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3365.15, 'Historian', 'female', '0528291399');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4664.06, 'Gardening expert', 'male', '0536093940');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8265.62, 'Yoga guide', 'male', '0511534711');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5478.44, 'Musician', 'female', '0561981808');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7047.61, 'Science educator', 'male', '0576621676');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5561.84, 'Magician', 'female', '0599400640');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7312.48, 'Children''s author', 'female', '0506259273');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8501.14, 'Art instructor', 'male', '0544524116');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8742.75, 'Art instructor', 'female', '0506170828');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (461.1, 'Children''s author', 'male', '0512826130');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2623.58, 'Historian', 'male', '0504416242');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6276.77, 'Yoga guide', 'male', '0509934289');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9470.13, 'Art instructor', 'female', '0513396514');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5007.24, 'Storyteller', 'female', '0550776802');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1450.03, 'Storyteller', 'male', '0551127903');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7362, 'Historian', 'female', '0542988174');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8530.21, 'Storyteller', 'male', '0546354667');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7901.65, 'Magician', 'male', '0508908589');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3130.66, 'Science educator', 'male', '0528982351');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4484.39, 'Science educator', 'female', '0515235827');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2303.12, 'Art instructor', 'male', '0564042954');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1462.42, 'Children''s author', 'female', '0592883142');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7533.81, 'Art instructor', 'male', '0597307316');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8591.03, 'Gardening expert', 'female', '0526531825');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8858.67, 'Gardening expert', 'female', '0531986417');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6250.01, 'Magician', 'female', '0519348146');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4291.08, 'Science educator', 'male', '0583773968');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4377.66, 'Science educator', 'male', '0511652001');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5162.14, 'Gardening expert', 'female', '0531829931');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8917.27, 'Historian', 'female', '0593083669');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7773.35, 'Magician', 'female', '0523247419');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3576.12, 'Science educator', 'male', '0516221965');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9761.87, 'Yoga guide', 'female', '0592510004');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5696.94, 'Science educator', 'female', '0544863256');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2578.25, 'Art instructor', 'male', '0547752542');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (241.91, 'Yoga guide', 'female', '0544435470');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8676.67, 'Art instructor', 'female', '0597348207');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6689.14, 'Yoga guide', 'female', '0518451940');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6617.66, 'Historian', 'male', '0509072047');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4441.65, 'Storyteller', 'female', '0566515727');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8683.36, 'Historian', 'male', '0587967436');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (948.87, 'Gardening expert', 'male', '0526057408');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6805.22, 'Science educator', 'female', '0545919599');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7340.6, 'Magician', 'female', '0543819549');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2404.28, 'Puppeteer', 'female', '0510392833');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9773.51, 'Magician', 'female', '0553616105');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2543.85, 'Historian', 'male', '0558118082');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5090.14, 'Art instructor', 'male', '0504944897');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1994.78, 'Storyteller', 'female', '0540761780');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2790.34, 'Art instructor', 'male', '0577539321');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (213.2, 'Storyteller', 'male', '0549600818');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3115.3, 'Storyteller', 'male', '0588036430');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4230.71, 'Yoga guide', 'male', '0500311798');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (244, 'Art instructor', 'female', '0523532082');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7657.18, 'Historian', 'female', '0546937935');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (802.22, 'Yoga guide', 'male', '0514591560');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4595.92, 'Musician', 'male', '0559874976');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8684.02, 'Magician', 'male', '0563849581');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9071.47, 'Historian', 'male', '0539271835');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5585.71, 'Art instructor', 'male', '0585506285');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1569.79, 'Musician', 'female', '0575099602');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5652.33, 'Puppeteer', 'female', '0540469018');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8491.02, 'Science educator', 'female', '0566939169');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7836.67, 'Children''s author', 'male', '0552127026');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (914.69, 'Musician', 'male', '0525260524');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2770.72, 'Puppeteer', 'female', '0564503705');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4677.5, 'Musician', 'male', '0593918778');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4749.66, 'Magician', 'male', '0563453847');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (363.5, 'Yoga guide', 'male', '0587676181');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1028.37, 'Gardening expert', 'male', '0551851835');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5206.86, 'Storyteller', 'male', '0582038256');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4630.37, 'Magician', 'male', '0583324755');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3707.11, 'Puppeteer', 'female', '0568591784');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4869.35, 'Storyteller', 'male', '0542853203');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1356.82, 'Puppeteer', 'male', '0519211681');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1783.11, 'Puppeteer', 'female', '0511338139');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5481.92, 'Children''s author', 'female', '0521079976');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6880.1, 'Gardening expert', 'male', '0503213186');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1794.34, 'Gardening expert', 'male', '0568067289');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (398.34, 'Gardening expert', 'male', '0573308991');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5057.33, 'Musician', 'male', '0583974580');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7463.14, 'Children''s author', 'female', '0580373266');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9040.13, 'Science educator', 'female', '0539862173');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1123.27, 'Yoga guide', 'female', '0569913037');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (993.62, 'Art instructor', 'female', '0573981190');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6071.2, 'Yoga guide', 'female', '0574836981');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5733.71, 'Musician', 'female', '0546311833');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5777.64, 'Musician', 'male', '0545042516');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6568.7, 'Yoga guide', 'male', '0571444030');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5778.26, 'Science educator', 'female', '0591527306');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1052.92, 'Storyteller', 'female', '0575480737');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9613.9, 'Puppeteer', 'male', '0534952967');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6633.17, 'Yoga guide', 'male', '0561153057');
commit;
prompt 100 records committed...
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (283.32, 'Gardening expert', 'male', '0539686928');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3207.75, 'Puppeteer', 'female', '0502050217');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5608.45, 'Historian', 'female', '0501889391');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8597.9, 'Musician', 'female', '0565309738');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2512.12, 'Yoga guide', 'female', '0580248754');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2731.81, 'Puppeteer', 'female', '0550035618');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3208.26, 'Science educator', 'female', '0535215553');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4341.12, 'Magician', 'female', '0585175429');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9704.69, 'Gardening expert', 'male', '0542369578');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6169.85, 'Art instructor', 'male', '0523725837');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3218.28, 'Historian', 'male', '0512045690');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3895.96, 'Yoga guide', 'male', '0508625403');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7702.78, 'Children''s author', 'male', '0531171109');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1165.25, 'Magician', 'female', '0549215065');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2088.97, 'Historian', 'male', '0537278302');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (537.93, 'Musician', 'male', '0531635860');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9747.53, 'Historian', 'male', '0579600814');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6003.8, 'Storyteller', 'female', '0580799506');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4472.43, 'Musician', 'male', '0507234732');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5816.43, 'Yoga guide', 'female', '0590610095');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4419.82, 'Gardening expert', 'female', '0510085906');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5766.73, 'Historian', 'male', '0580265923');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7922.22, 'Magician', 'female', '0556551340');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8211.81, 'Science educator', 'female', '0594317775');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (646.42, 'Historian', 'male', '0591082024');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9014.98, 'Science educator', 'female', '0522974518');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2340.23, 'Children''s author', 'female', '0555709048');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2880.39, 'Musician', 'male', '0554923177');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6270.73, 'Children''s author', 'male', '0557948814');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8186.19, 'Science educator', 'female', '0505607425');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6150.29, 'Art instructor', 'male', '0563629776');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2329.1, 'Puppeteer', 'male', '0561893317');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2889.41, 'Gardening expert', 'male', '0516884247');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6418.06, 'Historian', 'male', '0521834270');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5749.29, 'Science educator', 'male', '0502061771');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (596.91, 'Magician', 'female', '0584029480');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1238.31, 'Musician', 'male', '0576378811');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5947.07, 'Yoga guide', 'male', '0568811749');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5921.03, 'Yoga guide', 'male', '0541900669');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5302.83, 'Children''s author', 'male', '0585938946');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7139.64, 'Science educator', 'male', '0595024322');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6779.04, 'Science educator', 'male', '0501194171');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7247.96, 'Art instructor', 'male', '0599687457');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5011.39, 'Musician', 'female', '0549670849');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4757.95, 'Art instructor', 'male', '0553376099');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6709.07, 'Magician', 'male', '0529569517');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (598.65, 'Magician', 'female', '0506792949');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2920.11, 'Storyteller', 'female', '0552786778');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9887.71, 'Children''s author', 'male', '0552281695');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5609.01, 'Art instructor', 'male', '0527835242');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1547.04, 'Gardening expert', 'female', '0577086371');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5640.75, 'Yoga guide', 'male', '0597214515');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9714.95, 'Science educator', 'male', '0543227853');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2001.3, 'Science educator', 'female', '0505779526');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7018.22, 'Yoga guide', 'female', '0578619490');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5533.79, 'Gardening expert', 'male', '0510263959');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6514.77, 'Musician', 'male', '0598854980');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1408.57, 'Science educator', 'female', '0534661698');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3955.21, 'Children''s author', 'female', '0548528731');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8775.95, 'Musician', 'female', '0581113592');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8235.58, 'Gardening expert', 'male', '0508602088');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3725.23, 'Yoga guide', 'female', '0572458553');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8762.57, 'Storyteller', 'female', '0537353778');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4556.19, 'Gardening expert', 'male', '0520181879');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7131.26, 'Storyteller', 'male', '0590918086');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5763.03, 'Yoga guide', 'male', '0539028067');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5315.36, 'Magician', 'male', '0518065587');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5730.9, 'Art instructor', 'female', '0571739539');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9169.95, 'Art instructor', 'male', '0577929672');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (744.84, 'Historian', 'female', '0555010836');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8046.68, 'Magician', 'male', '0563192682');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4111.32, 'Musician', 'male', '0510581976');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8921.54, 'Magician', 'female', '0533318149');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2192.17, 'Historian', 'female', '0572915813');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7435.1, 'Gardening expert', 'female', '0568556272');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4151.09, 'Art instructor', 'female', '0595887819');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3645.19, 'Yoga guide', 'male', '0540146203');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9012.65, 'Gardening expert', 'female', '0514654972');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3692.21, 'Historian', 'male', '0535017772');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7633.73, 'Puppeteer', 'female', '0517686361');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7376.81, 'Musician', 'female', '0505343777');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9787.55, 'Yoga guide', 'female', '0532833235');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1250.13, 'Historian', 'male', '0568910713');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8160.13, 'Historian', 'male', '0580244698');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6216.56, 'Puppeteer', 'male', '0569937375');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6659.28, 'Puppeteer', 'female', '0563908416');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3248.95, 'Gardening expert', 'male', '0562938318');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5236.08, 'Art instructor', 'male', '0521662454');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1816.36, 'Science educator', 'female', '0532089288');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9818.88, 'Storyteller', 'female', '0521769839');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6024.3, 'Storyteller', 'female', '0581494122');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5867.41, 'Art instructor', 'male', '0507590690');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2593.51, 'Historian', 'male', '0558491298');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3394.79, 'Yoga guide', 'female', '0592948508');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3109.18, 'Science educator', 'female', '0596527177');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5187.65, 'Science educator', 'female', '0533138647');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4533.98, 'Art instructor', 'male', '0532214224');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (749.57, 'Children''s author', 'female', '0530940161');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2429.81, 'Science educator', 'female', '0505085584');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7102.23, 'Science educator', 'male', '0595065787');
commit;
prompt 200 records committed...
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9535.77, 'Magician', 'female', '0518718822');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3921.95, 'Magician', 'male', '0553225887');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7358.82, 'Art instructor', 'female', '0588066007');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2546.04, 'Musician', 'female', '0500454771');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2928.3, 'Puppeteer', 'female', '0558349495');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (881.73, 'Art instructor', 'female', '0563366374');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6406.04, 'Magician', 'female', '0512235238');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6821.43, 'Storyteller', 'female', '0542658043');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1855.77, 'Science educator', 'male', '0564117696');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3697.46, 'Puppeteer', 'male', '0582570661');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7861.94, 'Children''s author', 'male', '0578965979');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9891.31, 'Musician', 'female', '0560278444');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3152.56, 'Yoga guide', 'male', '0590530612');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1681.3, 'Musician', 'male', '0510359446');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7067.89, 'Puppeteer', 'male', '0594913266');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7432.79, 'Historian', 'female', '0576504473');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (988.1, 'Yoga guide', 'male', '0561756032');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9732.1, 'Magician', 'female', '0554898210');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2273.58, 'Gardening expert', 'male', '0514474086');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9833.09, 'Children''s author', 'male', '0545069380');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6517.64, 'Science educator', 'female', '0522421340');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9416.07, 'Musician', 'female', '0583909593');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3911.71, 'Science educator', 'male', '0584151025');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7659.32, 'Storyteller', 'female', '0548729179');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1123.16, 'Science educator', 'female', '0513672669');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9485.46, 'Art instructor', 'male', '0513827416');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5345.99, 'Storyteller', 'male', '0523077848');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9300.95, 'Art instructor', 'male', '0565078226');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2254.13, 'Magician', 'female', '0573909285');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7856.04, 'Children''s author', 'female', '0580802384');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5882.46, 'Science educator', 'male', '0554627156');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4949.01, 'Musician', 'female', '0532617160');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4908.84, 'Yoga guide', 'female', '0593376704');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3130.16, 'Puppeteer', 'male', '0569512202');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5300.5, 'Historian', 'female', '0519585348');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3854.62, 'Musician', 'female', '0583484009');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7172.99, 'Storyteller', 'male', '0540056731');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9147.54, 'Science educator', 'male', '0516940381');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9181.83, 'Puppeteer', 'female', '0538315198');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3905.97, 'Yoga guide', 'female', '0567026383');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4768.4, 'Yoga guide', 'female', '0535805943');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5245.22, 'Musician', 'male', '0586953094');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6760.98, 'Gardening expert', 'male', '0594508912');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1634.84, 'Yoga guide', 'female', '0506994224');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4565.93, 'Children''s author', 'male', '0521658484');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2909.16, 'Musician', 'male', '0533096673');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5489.02, 'Science educator', 'female', '0543202091');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7006.89, 'Storyteller', 'male', '0530392320');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1453.84, 'Gardening expert', 'male', '0514074719');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8399.26, 'Yoga guide', 'male', '0592719496');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7717.55, 'Art instructor', 'female', '0513338215');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5273.75, 'Musician', 'male', '0515262231');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5391.25, 'Yoga guide', 'female', '0566568076');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8890.37, 'Historian', 'female', '0576973467');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7280.94, 'Puppeteer', 'male', '0548473473');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2661.47, 'Science educator', 'male', '0531430840');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9303.79, 'Magician', 'male', '0587517709');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9705.85, 'Historian', 'female', '0540842303');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6403.18, 'Children''s author', 'male', '0560617077');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2373.39, 'Science educator', 'female', '0582771375');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5678.63, 'Historian', 'female', '0598570593');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8199.81, 'Gardening expert', 'male', '0528709917');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (441.22, 'Gardening expert', 'male', '0532415008');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (202.64, 'Children''s author', 'female', '0561407477');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6765.61, 'Science educator', 'male', '0592988124');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2374.04, 'Magician', 'female', '0574997494');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4755.46, 'Children''s author', 'female', '0582663637');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8232.8, 'Musician', 'female', '0526010284');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (471.53, 'Magician', 'female', '0569212142');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9061.23, 'Magician', 'female', '0569139556');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (414.15, 'Magician', 'male', '0506289997');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6753.18, 'Historian', 'female', '0542688933');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3285.77, 'Magician', 'male', '0572803395');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8856.52, 'Science educator', 'male', '0543772681');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4292.1, 'Puppeteer', 'male', '0552736660');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9216.99, 'Gardening expert', 'female', '0555136862');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2594.79, 'Children''s author', 'male', '0565899890');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8375.33, 'Children''s author', 'male', '0522313715');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1199.44, 'Storyteller', 'male', '0544492653');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (406.06, 'Storyteller', 'male', '0506093412');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7473.88, 'Magician', 'female', '0525815220');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5185.2, 'Magician', 'male', '0586736939');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6933.88, 'Children''s author', 'male', '0516691142');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3696.87, 'Puppeteer', 'female', '0516999870');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9872.68, 'Art instructor', 'female', '0549377200');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3261.66, 'Science educator', 'female', '0585967894');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8273.64, 'Puppeteer', 'female', '0569141143');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9553.22, 'Science educator', 'male', '0555665593');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8516.06, 'Puppeteer', 'female', '0555493632');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7057.27, 'Children''s author', 'female', '0585000866');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6143.96, 'Science educator', 'female', '0574909052');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5718.98, 'Puppeteer', 'male', '0560327506');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3464.98, 'Art instructor', 'male', '0508464360');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5713.35, 'Yoga guide', 'male', '0553633895');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7483.57, 'Storyteller', 'male', '0598800052');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5498.58, 'Magician', 'male', '0581234609');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5562.05, 'Historian', 'male', '0502776079');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5899.64, 'Science educator', 'male', '0566795113');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2538, 'Magician', 'male', '0522498540');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7018.76, 'Storyteller', 'female', '0584429699');
commit;
prompt 300 records committed...
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2030.02, 'Art instructor', 'female', '0513727962');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1401.99, 'Magician', 'female', '0594835754');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1163.86, 'Yoga guide', 'male', '0505277047');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2808.59, 'Children''s author', 'male', '0513878323');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8162.64, 'Puppeteer', 'female', '0514641959');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6649.6, 'Musician', 'female', '0506161484');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6686.25, 'Magician', 'female', '0576907204');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3863.31, 'Magician', 'female', '0528021876');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5985.43, 'Storyteller', 'female', '0540024692');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8780.92, 'Yoga guide', 'female', '0547939892');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7496.46, 'Magician', 'female', '0592502015');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3550.81, 'Storyteller', 'female', '0512944390');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8658.47, 'Storyteller', 'female', '0588696385');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8197.38, 'Science educator', 'female', '0597992618');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4207.75, 'Art instructor', 'male', '0557742192');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5801.96, 'Children''s author', 'female', '0586116571');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1132.56, 'Musician', 'male', '0551884272');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6315.1, 'Children''s author', 'female', '0505344246');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4952.72, 'Science educator', 'female', '0509916824');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5959.36, 'Magician', 'female', '0546345940');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8828.56, 'Musician', 'female', '0509563165');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1144.51, 'Magician', 'female', '0542287074');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7782.47, 'Art instructor', 'female', '0510173912');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7895.26, 'Yoga guide', 'male', '0536663472');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8632.81, 'Musician', 'female', '0548486021');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8391.53, 'Children''s author', 'female', '0589020755');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6240.47, 'Puppeteer', 'female', '0582401507');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1021.14, 'Storyteller', 'male', '0558031018');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4467.8, 'Yoga guide', 'male', '0508105606');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6945.1, 'Children''s author', 'female', '0546399937');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3450.1, 'Science educator', 'male', '0500630946');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3775.27, 'Yoga guide', 'female', '0595384820');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2179.63, 'Magician', 'female', '0536095784');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1964.66, 'Historian', 'female', '0508589973');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6602.08, 'Historian', 'female', '0587736537');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4025.56, 'Gardening expert', 'male', '0510798407');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9567.68, 'Science educator', 'male', '0550226706');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1842.06, 'Gardening expert', 'female', '0549751262');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8380.05, 'Historian', 'female', '0549373007');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3161.46, 'Science educator', 'female', '0559322753');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2317.1, 'Yoga guide', 'female', '0572798055');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7558.03, 'Historian', 'male', '0579597190');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5428.5, 'Gardening expert', 'female', '0515320052');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7529.36, 'Musician', 'female', '0554731443');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1708.91, 'Science educator', 'female', '0587334465');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (267.9, 'Historian', 'male', '0590081008');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1275.78, 'Gardening expert', 'female', '0534364781');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4944.9, 'Historian', 'female', '0565581113');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4059.57, 'Children''s author', 'female', '0552925526');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7106.93, 'Historian', 'male', '0554272966');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8206.45, 'Gardening expert', 'female', '0540664848');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6584.85, 'Yoga guide', 'female', '0592791003');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4393.57, 'Gardening expert', 'male', '0560036969');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5056.79, 'Storyteller', 'male', '0547664287');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (730.9, 'Musician', 'male', '0521495830');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9525.52, 'Musician', 'male', '0555970106');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3975.79, 'Puppeteer', 'male', '0551313015');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8050.03, 'Art instructor', 'female', '0579187030');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6945.49, 'Magician', 'female', '0566399657');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1073.5, 'Children''s author', 'female', '0580486751');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4398.06, 'Yoga guide', 'female', '0538900053');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3864.06, 'Storyteller', 'female', '0512885075');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2532.91, 'Science educator', 'female', '0538826047');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4216.03, 'Puppeteer', 'female', '0551815273');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7792.47, 'Magician', 'female', '0585336833');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (8642.44, 'Art instructor', 'male', '0540169478');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (6456.14, 'Art instructor', 'female', '0520183255');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2869.29, 'Science educator', 'female', '0546267936');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1022.23, 'Yoga guide', 'female', '0574211067');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (1989.69, 'Science educator', 'male', '0522670596');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3435.35, 'Gardening expert', 'male', '0568526327');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4260.54, 'Puppeteer', 'male', '0573708240');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7028.38, 'Children''s author', 'female', '0556742738');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4338.57, 'Storyteller', 'female', '0520887051');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (4303.56, 'Yoga guide', 'male', '0518432457');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5270.81, 'Gardening expert', 'male', '0526111872');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (3746.46, 'Gardening expert', 'male', '0586782213');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5008.15, 'Art instructor', 'male', '0557863783');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (9304.08, 'Art instructor', 'male', '0502917695');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (7784.99, 'Historian', 'female', '0501327038');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5166.09, 'Gardening expert', 'female', '0593148948');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (365.71, 'Magician', 'male', '0599637996');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (5817.59, 'Gardening expert', 'female', '0550562109');
insert into ACTIVITYOPERATOR (ocost, expertise, gender, mainphone)
values (2403.69, 'Science educator', 'female', '0532956656');
commit;
prompt 384 records loaded
prompt Loading HALL...
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 1, 150);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 4 room: 4056', 2, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 1 room: 1023', 3, 200);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 4 room: 4056', 4, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 4 room: 4056', 5, 30);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 6, 500);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 7, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 8, 50);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 9, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 0 room: 0001', 10, 500);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 11, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 1 room: 1023', 12, 50);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 13, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 1 room: 1023', 14, 300);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 15, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 1 room: 1023', 16, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 0 room: 0001', 17, 100);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 18, 200);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 19, 50);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 20, 500);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 21, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 22, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 23, 200);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 4 room: 4056', 24, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 6 room: 6078', 25, 30);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 26, 100);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 27, 100);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 28, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 4 room: 4056', 29, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 30, 300);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 31, 500);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 32, 200);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 33, 200);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 34, 30);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 35, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 2 room: 2034', 36, 150);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 37, 300);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 0 room: 0001', 38, 500);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 39, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 2 room: 2034', 40, 50);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 41, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 42, 200);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 43, 200);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 44, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 6 room: 6078', 45, 200);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 0 room: 0001', 46, 250);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 47, 80);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 48, 500);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 49, 500);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 4 room: 4056', 50, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 5 room: 5067', 51, 200);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 3 room: 3045', 52, 30);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 53, 500);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 54, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 55, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 56, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 57, 200);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 0 room: 0001', 58, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 59, 250);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 6 room: 6078', 60, 150);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 61, 100);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 62, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 63, 300);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 64, 50);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 65, 250);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 4 room: 4056', 66, 250);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 67, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 68, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 3 room: 3045', 69, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 4 room: 4056', 70, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 71, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 72, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 4 room: 4056', 73, 150);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 6 room: 6078', 74, 250);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 75, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 1 room: 1023', 76, 200);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 4 room: 4056', 77, 30);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 2 room: 2034', 78, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 79, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 80, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 2 room: 2034', 81, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 82, 250);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 83, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 4 room: 4056', 84, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 85, 300);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 86, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 87, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 88, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 5 room: 5067', 89, 50);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 90, 300);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 91, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 5 room: 5067', 92, 50);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 93, 200);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 94, 100);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 2 room: 2034', 95, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 4 room: 4056', 96, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 97, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 6 room: 6078', 98, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 99, 80);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 100, 250);
commit;
prompt 100 records committed...
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 101, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 4 room: 4056', 102, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 4 room: 4056', 103, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 4 room: 4056', 104, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 105, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 106, 300);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 6 room: 6078', 107, 200);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 108, 150);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 109, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 110, 250);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 2 room: 2034', 111, 30);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 112, 100);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 113, 100);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 114, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 4 room: 4056', 115, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 116, 200);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 117, 300);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 118, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 119, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 6 room: 6078', 120, 100);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 121, 30);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 122, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 4 room: 4056', 123, 500);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 124, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 0 room: 0001', 125, 150);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 126, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 6 room: 6078', 127, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 6 room: 6078', 128, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 129, 80);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 130, 200);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 131, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 4 room: 4056', 132, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 133, 300);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 134, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 135, 250);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 136, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 137, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 1 room: 1023', 138, 80);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 139, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 2 room: 2034', 140, 300);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 141, 150);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 142, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 1 room: 1023', 143, 100);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 144, 100);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 145, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 146, 200);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 147, 50);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 2 room: 2034', 148, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 149, 100);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 150, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 2 room: 2034', 151, 100);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 152, 80);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 153, 500);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 6 room: 6078', 154, 30);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 155, 150);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 156, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 0 room: 0001', 157, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 158, 150);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 4 room: 4056', 159, 500);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 160, 30);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 161, 50);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 162, 200);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 0 room: 0001', 163, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 164, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 165, 300);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 2 room: 2034', 166, 500);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 3 room: 3045', 167, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 3 room: 3045', 168, 30);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 169, 150);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 170, 150);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 171, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 4 room: 4056', 172, 50);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 0 room: 0001', 173, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 174, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 175, 100);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 0 room: 0001', 176, 300);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 177, 200);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 1 room: 1023', 178, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 4 room: 4056', 179, 150);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 180, 50);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 181, 30);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 5 room: 5067', 182, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 183, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 184, 150);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 185, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 186, 500);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 187, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 6 room: 6078', 188, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 189, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 190, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 191, 150);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 192, 50);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 193, 50);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 194, 30);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 2 room: 2034', 195, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 196, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 5 room: 5067', 197, 250);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 6 room: 6078', 198, 30);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 199, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 2 room: 2034', 200, 300);
commit;
prompt 200 records committed...
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 5 room: 5067', 201, 30);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 202, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 3 room: 3045', 203, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 204, 100);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 6 room: 6078', 205, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 206, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 207, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 208, 200);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 209, 80);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 210, 100);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 211, 300);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 212, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 213, 250);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 214, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 0 room: 0001', 215, 50);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 0 room: 0001', 216, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 6 room: 6078', 217, 80);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 218, 200);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 3 room: 3045', 219, 200);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 220, 30);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 221, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 222, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 223, 80);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 4 room: 4056', 224, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 225, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 2 room: 2034', 226, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 1 room: 1023', 227, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 6 room: 6078', 228, 150);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 229, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 6 room: 6078', 230, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 231, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 232, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 6 room: 6078', 233, 50);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 6 room: 6078', 234, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 235, 250);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 1 room: 1023', 236, 30);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 6 room: 6078', 237, 80);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 4 room: 4056', 238, 80);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 239, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 4 room: 4056', 240, 30);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 5 room: 5067', 241, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 0 room: 0001', 242, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 243, 30);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 244, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 2 room: 2034', 245, 500);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 246, 300);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 247, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 248, 30);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 1 room: 1023', 249, 300);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 5 room: 5067', 250, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 251, 500);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 4 room: 4056', 252, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 253, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 4 room: 4056', 254, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 1 room: 1023', 255, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 1 room: 1023', 256, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 2 room: 2034', 257, 30);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 258, 500);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 4 room: 4056', 259, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 260, 30);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 3 room: 3045', 261, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 262, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 0 room: 0001', 263, 250);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 2 room: 2034', 264, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 265, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 266, 30);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 267, 100);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 268, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 269, 150);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 270, 300);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 6 room: 6078', 271, 200);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 4 room: 4056', 272, 300);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 273, 500);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 274, 100);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 6 room: 6078', 275, 100);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 2 room: 2034', 276, 200);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 277, 300);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 278, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 279, 300);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 280, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 281, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 282, 500);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 283, 50);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 4 room: 4056', 284, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 6 room: 6078', 285, 50);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 286, 150);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 287, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 288, 50);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 289, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 3 room: 3045', 290, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 6 room: 6078', 291, 300);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 2 room: 2034', 292, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 6 room: 6078', 293, 50);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 294, 80);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 295, 200);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 2 room: 2034', 296, 80);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 4 room: 4056', 297, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 298, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 3 room: 3045', 299, 250);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 1 room: 1023', 300, 250);
commit;
prompt 300 records committed...
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 301, 50);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 302, 30);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 303, 30);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 2 room: 2034', 304, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 305, 80);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 5 room: 5067', 306, 150);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 307, 80);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 4 room: 4056', 308, 150);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 309, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 4 room: 4056', 310, 30);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 6 room: 6078', 311, 300);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 312, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 0 room: 0001', 313, 100);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 0 room: 0001', 314, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 6 room: 6078', 315, 100);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 316, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 317, 30);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 318, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 4 room: 4056', 319, 100);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 4 room: 4056', 320, 250);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 0 room: 0001', 321, 100);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 4 room: 4056', 322, 30);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 323, 30);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 0 room: 0001', 324, 200);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 325, 30);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 326, 100);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 6 room: 6078', 327, 30);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 328, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 329, 150);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 6 room: 6078', 330, 250);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 331, 300);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 332, 80);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 333, 200);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 334, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 0 room: 0001', 335, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 336, 80);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 337, 50);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 6 room: 6078', 338, 50);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 339, 250);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 340, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 341, 30);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 342, 500);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 5 room: 5067', 343, 250);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 2 room: 2034', 344, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 4 room: 4056', 345, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 4 room: 4056', 346, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 347, 80);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 1 room: 1023', 348, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 2 room: 2034', 349, 300);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 0 room: 0001', 350, 500);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 6 room: 6078', 351, 50);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 4 room: 4056', 352, 50);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 6 room: 6078', 353, 30);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 1 room: 1023', 354, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 355, 50);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 356, 150);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 4 room: 4056', 357, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 0 room: 0001', 358, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 6 room: 6078', 359, 150);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 2 room: 2034', 360, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 2 room: 2034', 361, 200);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 362, 500);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 0 room: 0001', 363, 250);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 364, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 1 room: 1023', 365, 80);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 5 room: 5067', 366, 300);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 367, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 368, 150);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 6 room: 6078', 369, 300);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 370, 100);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 371, 300);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 0 room: 0001', 372, 80);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 373, 200);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 4 room: 4056', 374, 300);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 375, 300);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 1 room: 1023', 376, 80);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 3 room: 3045', 377, 50);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 3 room: 3045', 378, 50);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 379, 80);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 2 room: 2034', 380, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 1 room: 1023', 381, 100);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 382, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 1 room: 1023', 383, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 2 room: 2034', 384, 500);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 385, 100);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 0 room: 0001', 386, 250);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 387, 80);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 388, 100);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 5 room: 5067', 389, 250);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 390, 200);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 391, 50);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 6 room: 6078', 392, 100);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 393, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 1 room: 1023', 394, 250);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 1 room: 1023', 395, 50);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 6 room: 6078', 396, 200);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 397, 100);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 6 room: 6078', 398, 30);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 1 room: 1023', 399, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 6 room: 6078', 400, 50);
commit;
prompt 400 records committed...
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 401, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 402, 200);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 1 room: 1023', 403, 30);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 0 room: 0001', 404, 150);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 405, 500);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 4 room: 4056', 406, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 3 room: 3045', 407, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 408, 30);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 409, 500);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 410, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 411, 30);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 6 room: 6078', 412, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 6 room: 6078', 413, 200);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 414, 500);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 2 room: 2034', 415, 30);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 4 room: 4056', 416, 30);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 417, 250);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 418, 50);
insert into HALL (hname, place, hid, capacity)
values ('Tavor', 'floor: 2 room: 2034', 419, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 0 room: 0001', 420, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 5 room: 5067', 421, 30);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 5 room: 5067', 422, 500);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 4 room: 4056', 423, 300);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 5 room: 5067', 424, 500);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 425, 50);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 3 room: 3045', 426, 200);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 0 room: 0001', 427, 150);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 3 room: 3045', 428, 500);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 6 room: 6078', 429, 80);
insert into HALL (hname, place, hid, capacity)
values ('Carmel', 'floor: 2 room: 2034', 430, 100);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 6 room: 6078', 431, 300);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 432, 100);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 3 room: 3045', 433, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 4 room: 4056', 434, 200);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 2 room: 2034', 435, 80);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 436, 250);
insert into HALL (hname, place, hid, capacity)
values ('Galilee', 'floor: 4 room: 4056', 437, 80);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 1 room: 1023', 438, 250);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 3 room: 3045', 439, 100);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 6 room: 6078', 440, 150);
insert into HALL (hname, place, hid, capacity)
values ('Sharon', 'floor: 5 room: 5067', 441, 80);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 5 room: 5067', 442, 250);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 1 room: 1023', 443, 200);
insert into HALL (hname, place, hid, capacity)
values ('Eilat', 'floor: 5 room: 5067', 444, 150);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 445, 30);
insert into HALL (hname, place, hid, capacity)
values ('Hermon', 'floor: 3 room: 3045', 446, 100);
insert into HALL (hname, place, hid, capacity)
values ('Golan', 'floor: 1 room: 1023', 447, 200);
insert into HALL (hname, place, hid, capacity)
values ('Iris', 'floor: 2 room: 2034', 448, 100);
insert into HALL (hname, place, hid, capacity)
values ('Sinai', 'floor: 5 room: 5067', 449, 30);
insert into HALL (hname, place, hid, capacity)
values ('Negev', 'floor: 5 room: 5067', 450, 150);
commit;
prompt 450 records loaded
prompt Loading MANAGER...
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 20, '0586950873');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 21, '0517945438');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 33, '0549019530');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 0, '0563694653');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 11, '0589283325');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 7, '0590081008');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 25, '0567138787');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 8, '0583324755');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 16, '0581721598');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 23, '0526057408');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 37, '0566343621');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 37, '0515610301');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 20, '0565219854');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 34, '0585938946');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 12, '0521036197');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 8, '0570229445');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 15, '0569139556');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 8, '0512985614');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 40, '0558851508');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 38, '0596377511');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 11, '0566308995');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 22, '0538158764');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 19, '0544166787');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 23, '0522313715');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 16, '0596416460');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 28, '0580265923');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 39, '0517951142');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 4, '0535268135');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 2, '0537581884');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 4, '0579370417');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 22, '0554923177');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 14, '0586357575');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 0, '0503160585');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 38, '0507664837');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 17, '0555010836');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 9, '0565710548');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 32, '0518339502');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 37, '0595797584');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 6, '0598390461');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 40, '0549451329');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 31, '0540146203');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 40, '0556136503');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 35, '0520477258');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 2, '0517146164');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 28, '0557707249');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 6, '0552390533');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 21, '0577877385');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 18, '0549751262');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 27, '0564474356');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 21, '0528313806');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 31, '0594894111');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 23, '0526052352');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 31, '0518951361');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 32, '0571681099');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 14, '0541314302');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 5, '0599346865');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 7, '0576717798');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 27, '0512784355');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 16, '0545007956');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 11, '0598893373');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 39, '0561000159');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 3, '0527541784');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 9, '0507511795');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 16, '0510217105');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 31, '0520183255');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 24, '0528971362');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 13, '0547637651');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 11, '0528836738');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 21, '0526843229');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 5, '0578430058');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 39, '0568819541');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 22, '0518451940');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 14, '0545485739');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 38, '0538567428');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 32, '0508452551');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 2, '0528950917');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 12, '0524008981');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 1, '0577760219');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 11, '0576923186');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 24, '0502582602');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 27, '0522670596');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 16, '0546932842');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 38, '0517628405');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 11, '0582038256');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 30, '0544479475');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 16, '0532214224');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 19, '0531324145');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 15, '0574211067');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 20, '0587517709');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 36, '0583206356');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 20, '0573585596');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 11, '0504061513');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 27, '0534805825');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 19, '0514684452');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 10, '0548325334');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 38, '0531775431');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 16, '0595535243');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 22, '0532031018');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 22, '0503525885');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 1, '0582657283');
commit;
prompt 100 records committed...
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 25, '0584492233');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 2, '0518014104');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 24, '0505277047');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 30, '0593646569');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 33, '0549028902');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 26, '0506270485');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 16, '0550776802');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 16, '0512803002');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 17, '0510265838');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 35, '0540664848');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 5, '0575003422');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 38, '0511271389');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 33, '0593197344');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 39, '0534201997');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 19, '0547053230');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 1, '0591491809');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 19, '0519348146');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 33, '0542853203');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 32, '0506994224');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 10, '0593148948');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 40, '0576801411');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 12, '0578227685');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 32, '0536093940');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 31, '0501193938');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 17, '0528086324');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 32, '0514654972');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 20, '0575655796');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 38, '0599777765');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 21, '0534364781');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 34, '0512182893');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 2, '0539290960');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 16, '0547018526');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 21, '0514110655');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 22, '0561486629');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 0, '0581234609');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 12, '0580482345');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 20, '0571385000');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 3, '0569512202');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 26, '0542688933');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 22, '0584151025');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 17, '0559473400');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 27, '0542287074');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 35, '0597634073');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 15, '0578635534');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 30, '0592883142');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 36, '0568308811');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 35, '0597296185');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 5, '0591599824');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 10, '0587468780');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 4, '0518165645');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 39, '0534477724');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 4, '0531986417');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 7, '0559679521');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 14, '0515320052');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 3, '0585023714');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 1, '0591286539');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 27, '0513672669');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 6, '0524063712');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 30, '0598800052');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 1, '0519560607');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 7, '0561981808');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 7, '0564567343');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 11, '0540882563');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 32, '0526816296');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 38, '0502139249');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 32, '0518432457');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 40, '0585482927');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 15, '0547664287');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 4, '0588066007');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 29, '0588583669');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 14, '0577661021');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 5, '0508890461');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 33, '0573708240');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 10, '0524191583');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 0, '0546343616');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 0, '0595664140');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 39, '0514938011');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 10, '0504416242');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 38, '0521206960');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 10, '0592248811');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 2, '0517744013');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 30, '0513827416');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 23, '0516056811');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 26, '0540775948');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 36, '0557863783');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 40, '0576731225');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 19, '0594835754');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 29, '0562979152');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 14, '0550226706');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 27, '0547702639');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 18, '0592396997');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 38, '0599832953');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 20, '0532833235');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 25, '0578794894');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 34, '0526756508');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 8, '0593469147');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 6, '0540110136');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 33, '0535523996');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 7, '0532074703');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 14, '0503109241');
commit;
prompt 200 records committed...
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 25, '0535608360');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 33, '0532818157');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 31, '0509619309');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 14, '0520460860');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 5, '0573308991');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 30, '0583559384');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 9, '0572803395');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 36, '0573072506');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 37, '0547939892');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 23, '0551688545');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 31, '0573222797');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 26, '0518917016');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 14, '0541748264');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 26, '0504683078');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 20, '0555201497');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 12, '0536211316');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 8, '0574586960');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 4, '0592842572');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 5, '0514569763');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 26, '0580373266');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 4, '0593597055');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 16, '0552187987');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 39, '0593215466');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 28, '0558499449');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 5, '0561112519');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 22, '0560337677');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 29, '0585435867');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 38, '0533921371');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 16, '0550274513');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 2, '0580799506');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 21, '0595314419');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 27, '0539686928');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 38, '0544960010');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 38, '0514312666');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 17, '0535425043');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 0, '0501059090');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 4, '0513080349');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 31, '0544571829');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 29, '0524912831');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 1, '0571838230');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 14, '0573981190');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 9, '0563202025');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 12, '0599826440');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 32, '0534504508');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 7, '0529488499');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 13, '0597214515');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 3, '0590115268');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 17, '0554442644');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 38, '0598570593');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 37, '0531895595');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 9, '0546888058');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 11, '0551000200');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 30, '0550582716');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 21, '0513390767');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 21, '0576378811');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 18, '0559895612');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 14, '0591899816');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 4, '0510317336');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 35, '0577086371');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 12, '0572079258');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 24, '0589002713');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 30, '0527921856');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 38, '0523247419');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 5, '0594592130');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 11, '0544524116');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 20, '0502200972');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 8, '0526529811');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 18, '0569254186');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 30, '0550035618');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 38, '0592988124');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 34, '0594048250');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 9, '0557673859');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 11, '0572808736');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 33, '0501812602');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 35, '0524569869');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 35, '0549377200');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 33, '0590530612');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 15, '0540169478');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 39, '0535112858');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 17, '0540024692');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 30, '0539347618');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 13, '0518523707');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 0, '0554898210');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 35, '0553225887');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 38, '0504944897');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 20, '0582401507');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 34, '0592510004');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 18, '0555813256');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 38, '0547319975');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 30, '0513570343');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 11, '0523725837');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 22, '0554333345');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 21, '0563808753');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 1, '0554309626');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 1, '0551127903');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 15, '0586116571');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 7, '0511954017');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 18, '0584218123');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 27, '0555493632');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 18, '0585000866');
commit;
prompt 300 records committed...
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 25, '0564042954');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 22, '0509754573');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 4, '0552298926');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 12, '0551908086');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 1, '0506186106');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 22, '0504878828');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 25, '0593311899');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 1, '0599690689');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 39, '0514596993');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 29, '0599087527');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 25, '0501694276');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 9, '0589008587');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 2, '0533173822');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 39, '0591946782');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 34, '0555593226');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 19, '0518799170');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 37, '0548222148');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 23, '0596148854');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 13, '0553633895');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 7, '0529278556');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 13, '0567188090');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 25, '0576241402');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 9, '0540765295');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 38, '0519415809');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 13, '0528974262');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 22, '0557443266');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 12, '0552678365');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 34, '0503892731');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 6, '0500995288');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 2, '0525603811');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 19, '0561153057');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 0, '0577758689');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 8, '0501667138');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 18, '0501889391');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 3, '0517847220');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 11, '0518096450');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 8, '0531058922');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 14, '0591020249');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 11, '0539361373');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 30, '0558508452');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 26, '0512960994');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 40, '0540056731');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 18, '0582881688');
insert into MANAGER (mrole, seniority, mainphone)
values ('Outreach Manager', 32, '0557481158');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 7, '0561507428');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 10, '0501327038');
insert into MANAGER (mrole, seniority, mainphone)
values ('Archives Manager', 30, '0520458230');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 7, '0545969840');
insert into MANAGER (mrole, seniority, mainphone)
values ('Adult Program Manage', 2, '0506259273');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 8, '0538644364');
insert into MANAGER (mrole, seniority, mainphone)
values ('Community Engagement', 34, '0501015255');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 16, '0510594048');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 28, '0512763980');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 23, '0531888791');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 27, '0506502189');
insert into MANAGER (mrole, seniority, mainphone)
values ('Fundraising Manager', 23, '0503530360');
insert into MANAGER (mrole, seniority, mainphone)
values ('Facilities Manager', 17, '0539842539');
insert into MANAGER (mrole, seniority, mainphone)
values ('Public Relations Coo', 32, '0563366374');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 34, '0580332361');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 10, '0517259216');
insert into MANAGER (mrole, seniority, mainphone)
values ('Technology Integrati', 31, '0547705117');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 13, '0596924914');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 27, '0586473713');
insert into MANAGER (mrole, seniority, mainphone)
values ('Educational Program ', 3, '0558118082');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 38, '0503556481');
insert into MANAGER (mrole, seniority, mainphone)
values ('Events Planner', 9, '0526088200');
insert into MANAGER (mrole, seniority, mainphone)
values ('Logistic Manager', 24, '0572155588');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 7, '0523644741');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 23, '0539778860');
insert into MANAGER (mrole, seniority, mainphone)
values ('User Experience (UX)', 35, '0538243599');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 7, '0539969104');
insert into MANAGER (mrole, seniority, mainphone)
values ('Collection Developme', 32, '0509879038');
insert into MANAGER (mrole, seniority, mainphone)
values ('Volunteer Coordinato', 10, '0578704415');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 28, '0502938640');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 2, '0506239202');
insert into MANAGER (mrole, seniority, mainphone)
values ('Information Services', 28, '0528291399');
insert into MANAGER (mrole, seniority, mainphone)
values ('Children''s Program M', 23, '0589194981');
insert into MANAGER (mrole, seniority, mainphone)
values ('Digital Services Man', 5, '0506765560');
insert into MANAGER (mrole, seniority, mainphone)
values ('Program Coordinator', 29, '0557841767');
insert into MANAGER (mrole, seniority, mainphone)
values ('Marketing and Commun', 12, '0501717471');
insert into MANAGER (mrole, seniority, mainphone)
values ('Librarian', 3, '0576193712');
commit;
prompt 381 records loaded
prompt Loading EVENT...
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-06-2010', 'dd-mm-yyyy'), 2000, 'Youth', 'sports', 'Combo Intel P4 2.0Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 277.97, 96, 1, 292, '0557673859');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-04-2010', 'dd-mm-yyyy'), 1230, 'Adults', 'training', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 182.34, 273, 2, 102, '0531058922');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-07-2015', 'dd-mm-yyyy'), 1330, 'Youth', 'volunteering', 'GigaByte G-Max AMD Flex ATX Platform .', 194.23, 276, 3, 420, '0557707249');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-01-2014', 'dd-mm-yyyy'), 1200, 'Children and youth', 'exhibition', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)', 247.43, 313, 4, 346, '0577661021');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-04-2006', 'dd-mm-yyyy'), 1830, 'Elderly', 'film screening', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.', 210.21, 261, 5, 405, '0509619309');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-11-2004', 'dd-mm-yyyy'), 1530, 'Youth', 'exhibition', 'Maxtor External 80Gb Hard drive USB&USB2', 156.37, 124, 6, 82, '0552298926');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-04-2009', 'dd-mm-yyyy'), 1930, 'Children', 'workshop', 'Sony 48x24x48 and 16x CD-RW/DVD OEM.', 45.09, 201, 7, 119, '0591946782');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-12-2004', 'dd-mm-yyyy'), 2000, 'Children and youth', 'sports', 'CyberPower Surge Protector 850 with 8 Outlet.', 35.53, 57, 8, 131, '0554923177');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-08-2013', 'dd-mm-yyyy'), 1430, 'Adults', 'workshop', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 199.01, 360, 9, 142, '0542688933');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-11-2003', 'dd-mm-yyyy'), 1200, 'Children', 'conversation with an author', 'CyberDrive 40X16X48X CD-R/RW Drive.', 53.46, 64, 10, 214, '0524063712');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-02-2005', 'dd-mm-yyyy'), 1930, 'Children and youth', 'story', '313F-B ATX case 400W P4/AMD Free LED Fan.', 287.65, 188, 11, 128, '0571838230');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-12-2014', 'dd-mm-yyyy'), 1530, 'Adults', 'story', 'Intel Pentium4 2.0ghz & Gigabyte 8IE533 MB w/ 313N Case. W/ Free PS2 Mouse.', 174.22, 98, 12, 445, '0545969840');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-02-2010', 'dd-mm-yyyy'), 1200, 'Elderly', 'conversation with an author', 'CyberPower 1500VA UPS Upto 135 minutes', 35.55, 303, 13, 252, '0563202025');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-05-2002', 'dd-mm-yyyy'), 1230, 'Children', 'play', 'Cooler Master Ball Bearing Case Fan', 265.18, 98, 14, 118, '0577086371');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-06-2004', 'dd-mm-yyyy'), 1800, 'Youth', 'volunteering', 'AMD XP 1700+ & Gigabyte GA-7DXE MB w/ 313N Case. W/ Free PS2 Mouse.', 262.14, 359, 15, 127, '0528291399');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-01-2014', 'dd-mm-yyyy'), 1400, 'Youth', 'workshop', 'Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 261.21, 302, 16, 85, '0578430058');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-09-2013', 'dd-mm-yyyy'), 1830, 'Children and youth', 'performance', 'Sony 16X DVD-CDRom (OEM)', 140.25, 328, 17, 181, '0544960010');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-07-2004', 'dd-mm-yyyy'), 1230, 'Children', 'exhibition', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan', 41.5, 49, 18, 261, '0564474356');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-11-2010', 'dd-mm-yyyy'), 1930, 'Children', 'performance', 'Intel D845PESV P4 M/B DDR-333 support.', 221.42, 90, 19, 183, '0510217105');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-09-2012', 'dd-mm-yyyy'), 1300, 'Children and youth', 'exhibition', 'Intel Pentium4 2.4ghz & Gigabyte 8IRXP MB w/ 313N Case. W/ Free PS2 Mouse.', 287.02, 117, 20, 358, '0591599824');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-01-2007', 'dd-mm-yyyy'), 1200, 'Children and youth', 'volunteering', 'Cooler Master P4 CopperHeatPipe Fan IHC-H71', 240.44, 111, 21, 109, '0589002713');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-07-2004', 'dd-mm-yyyy'), 1600, 'Children', 'story', '512mb DDR ECC Registerd. For Dual Processor Server MotherBoards.', 26.6, 105, 22, 142, '0517628405');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-10-2010', 'dd-mm-yyyy'), 1100, 'Youth', 'film screening', 'AMD Duron 1.1/128M/30G Black Complete System.', 137.98, 42, 23, 320, '0524912831');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-12-2010', 'dd-mm-yyyy'), 1400, 'Children', 'conversation with an author', 'ATX 300W High Quality Switching Power Supply', 257.79, 209, 24, 77, '0532074703');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-02-2002', 'dd-mm-yyyy'), 1430, 'Children', 'play', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.', 247.2, 182, 25, 258, '0597634073');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-09-2010', 'dd-mm-yyyy'), 1330, 'Elderly', 'educational activity', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKML MB w/ 313M Case. W/ Free PS2 Mouse.', 136.78, 272, 26, 294, '0539969104');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-11-2010', 'dd-mm-yyyy'), 1830, 'Children and youth', 'volunteering', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan', 261.5, 270, 27, 43, '0512960994');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-12-2002', 'dd-mm-yyyy'), 1700, 'Adults', 'educational activity', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.', 79.06, 290, 28, 215, '0564042954');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-06-2010', 'dd-mm-yyyy'), 1430, 'Elderly', 'exhibition', 'ATI Radeon 9800 Pro 128MB Gold Edition.', 288.52, 199, 29, 330, '0526529811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-01-2002', 'dd-mm-yyyy'), 1530, 'Youth', 'conversation with an author', 'Biostar M6TBA skt 370 Motherboard. (D.O.A 30 days)', 171.05, 199, 30, 34, '0524191583');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-06-2000', 'dd-mm-yyyy'), 1430, 'Children and youth', 'exhibition', 'Logitech Cordless Elite Duo Optical Kit(KB/MS)', 214.23, 255, 31, 81, '0528950917');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-05-2011', 'dd-mm-yyyy'), 1300, 'Children and youth', 'sports', 'ATI RADEON 9200™ SE 128M DDR DVI+TV-Out 8X AGP (R92LE-C3S).', 22.03, 265, 32, 113, '0531986417');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-12-2005', 'dd-mm-yyyy'), 1430, 'Adults', 'performance', 'Double RJ45 Surface Mount', 202.47, 83, 33, 27, '0554333345');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-08-2013', 'dd-mm-yyyy'), 1230, 'Elderly', 'exhibition', 'Combo Intel Celeron 1.7G Gigabyte MB GA-8LS533', 177.29, 255, 34, 138, '0510594048');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-09-2013', 'dd-mm-yyyy'), 1630, 'Youth', 'story', 'AOC 15" Monitor .27mm Pitch', 153.98, 141, 35, 206, '0534364781');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-11-2010', 'dd-mm-yyyy'), 1300, 'Youth', 'training', 'Combo AMD XP 2000+ Gigabyte GA-7VKML MB', 136.61, 342, 36, 82, '0569512202');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-09-2000', 'dd-mm-yyyy'), 1530, 'Children', 'volunteering', 'Cooler Master P4 CopperHeatPipe Fan IHC-H71', 26.28, 227, 37, 429, '0531895595');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-04-2007', 'dd-mm-yyyy'), 1400, 'Children', 'training', 'CyberPower PhoneSaver', 279.46, 188, 38, 359, '0546888058');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-10-2007', 'dd-mm-yyyy'), 1500, 'Elderly', 'story', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .', 67.17, 237, 39, 97, '0578794894');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-12-2010', 'dd-mm-yyyy'), 1330, 'Adults', 'play', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.', 237.93, 102, 40, 142, '0535523996');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-12-2008', 'dd-mm-yyyy'), 1230, 'Youth', 'conversation with an author', 'YS AMD XP 2000+ Performance System', 190.17, 345, 41, 200, '0549019530');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-08-2005', 'dd-mm-yyyy'), 1700, 'Youth', 'workshop', 'ATI Radeon 9800 Pro 128MB Gold Edition.', 33.88, 64, 42, 271, '0514596993');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-06-2013', 'dd-mm-yyyy'), 2000, 'Children and youth', 'exhibition', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;', 286.75, 231, 43, 26, '0540146203');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-07-2005', 'dd-mm-yyyy'), 1500, 'Children', 'exhibition', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 135.59, 285, 44, 91, '0541314302');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-04-2011', 'dd-mm-yyyy'), 1330, 'Children and youth', 'workshop', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 196.77, 273, 45, 106, '0501327038');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-06-2008', 'dd-mm-yyyy'), 1800, 'Elderly', 'conversation with an author', 'YS AMD XP 2000+ Performance System', 65, 320, 46, 346, '0555493632');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-02-2008', 'dd-mm-yyyy'), 1830, 'Adults', 'workshop', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 22.24, 295, 47, 27, '0569254186');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-09-2002', 'dd-mm-yyyy'), 1330, 'Elderly', 'conversation with an author', 'AMD 1.1Ghz BareBone System W/Free M&M', 137.34, 185, 48, 308, '0525603811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-06-2006', 'dd-mm-yyyy'), 1230, 'Elderly', 'educational activity', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )', 149.95, 153, 49, 164, '0531058922');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-07-2001', 'dd-mm-yyyy'), 1300, 'Children', 'story', 'ATI Radeon 7000 VIVO 64mb DDR AGP .', 103.62, 139, 50, 268, '0503556481');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-05-2009', 'dd-mm-yyyy'), 1200, 'Elderly', 'exhibition', 'Promise Fast Track ATA 100 RAID Controller Kit.', 41.89, 68, 51, 391, '0544524116');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-08-2011', 'dd-mm-yyyy'), 1430, 'Children', 'volunteering', 'Intel Pentium4 1.6Ghz & Biostar M7TDB MB w/ 313M Case.', 191.34, 177, 52, 152, '0554333345');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-07-2015', 'dd-mm-yyyy'), 1600, 'Children', 'sports', 'AMD XP 2600+ Retail box. (with 333Mhz Front Side Bus)', 288.96, 149, 53, 417, '0576923186');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-12-2001', 'dd-mm-yyyy'), 1800, 'Elderly', 'play', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.', 93.05, 104, 54, 165, '0506186106');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-03-2006', 'dd-mm-yyyy'), 1330, 'Elderly', 'conversation with an author', 'Iomega Internal EIDE 250MB Zip Drive - OEM Version .', 59.17, 191, 55, 123, '0584151025');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-07-2014', 'dd-mm-yyyy'), 1330, 'Youth', 'Lecture', 'Combo AMD XP 2100+ CPU ASUS A7N8X Deluxe NVIDIA Force2', 163.85, 139, 56, 346, '0558508452');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-07-2004', 'dd-mm-yyyy'), 1830, 'Children', 'educational activity', 'AMD XP 2100+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 136.66, 284, 57, 232, '0586116571');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-11-2008', 'dd-mm-yyyy'), 1200, 'Elderly', 'educational activity', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKML MB w/ 312J Color Case. W/ Free PS2 Mouse.', 81.23, 240, 58, 189, '0551000200');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-06-2010', 'dd-mm-yyyy'), 1600, 'Children', 'training', '312B ATX Case 250W P4/AMD Ready Power Supply.', 298.54, 212, 59, 24, '0599777765');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-10-2001', 'dd-mm-yyyy'), 1230, 'Children and youth', 'training', '10/100 16 Port Switch', 51.46, 148, 60, 139, '0572803395');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-12-2014', 'dd-mm-yyyy'), 1200, 'Children', 'educational activity', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.', 102.73, 53, 61, 138, '0548325334');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-11-2004', 'dd-mm-yyyy'), 1700, 'Elderly', 'performance', 'AMD XP 2000+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.', 199.17, 198, 62, 303, '0551908086');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-05-2013', 'dd-mm-yyyy'), 1800, 'Children and youth', 'volunteering', 'AOC 17" Monitor 7FSLK .25mm Dot Pitch TureFlat', 257.76, 31, 63, 75, '0534504508');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-12-2008', 'dd-mm-yyyy'), 1200, 'Youth', 'workshop', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).', 159.66, 315, 64, 341, '0585938946');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-07-2012', 'dd-mm-yyyy'), 1000, 'Youth', 'conversation with an author', 'Cooler Master Ball Bearing Case Fan', 45.67, 209, 65, 435, '0595535243');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-05-2011', 'dd-mm-yyyy'), 1930, 'Children and youth', 'film screening', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).', 68.74, 159, 66, 424, '0547664287');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-06-2009', 'dd-mm-yyyy'), 1600, 'Children', 'film screening', 'AMD XP 2000+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', 226.56, 180, 67, 243, '0538644364');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-09-2002', 'dd-mm-yyyy'), 1200, 'Children', 'educational activity', 'Combo Intel P4 1.6Ghz (Box CPU)+ Biostar U8668 m/b (478pin)CPU & Fan Support SD.', 191.85, 39, 68, 111, '0539361373');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-08-2007', 'dd-mm-yyyy'), 1700, 'Children', 'educational activity', 'AMD XP 2000+ & Gigabyte GA-7VKMLE MB w/ 313M Color Case. W/ Free PS2 Mouse.', 99.47, 258, 69, 359, '0506186106');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-01-2001', 'dd-mm-yyyy'), 1200, 'Children and youth', 'performance', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001', 245.29, 109, 70, 305, '0520458230');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-10-2009', 'dd-mm-yyyy'), 1500, 'Children', 'exhibition', 'Intel P4 3.06Ghz (478)pin(HT) 3 Year MFG Warr.', 174.24, 346, 71, 20, '0588066007');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-09-2010', 'dd-mm-yyyy'), 1500, 'Youth', 'Lecture', 'Combo AMD Duron 1.2Ghz Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 35.68, 317, 72, 175, '0532818157');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-07-2012', 'dd-mm-yyyy'), 1830, 'Elderly', 'sports', 'ATI Radion 7000 64Mb SD CRT+TV-Out', 153.76, 192, 73, 356, '0583206356');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-03-2013', 'dd-mm-yyyy'), 1230, 'Youth', 'story', 'C Rimm', 253.1, 192, 74, 442, '0594894111');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-05-2005', 'dd-mm-yyyy'), 1530, 'Elderly', 'educational activity', 'AMD XP 1800+ (oem)', 260.65, 189, 75, 192, '0578704415');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-03-2013', 'dd-mm-yyyy'), 1330, 'Adults', 'educational activity', 'LABTEC Internet Keyboard (Spanish Edition).', 175.79, 293, 76, 106, '0570229445');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-10-2014', 'dd-mm-yyyy'), 1330, 'Youth', 'performance', 'AMD XP 2100+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 248.31, 150, 77, 233, '0597296185');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-10-2011', 'dd-mm-yyyy'), 1600, 'Children', 'volunteering', 'Front panel USB kit (for 312J and 312D Case)', 23.97, 292, 78, 2, '0544166787');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-08-2003', 'dd-mm-yyyy'), 1430, 'Children', 'educational activity', 'Removeable ATA100 hard drive tray', 48.32, 44, 79, 114, '0557673859');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-03-2000', 'dd-mm-yyyy'), 1430, 'Children', 'sports', 'KIT Keyboard Mouse and Speakers to match color case', 24.7, 119, 80, 347, '0509619309');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-01-2002', 'dd-mm-yyyy'), 1700, 'Elderly', 'performance', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.', 155.68, 89, 81, 8, '0544524116');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-04-2000', 'dd-mm-yyyy'), 1930, 'Elderly', 'conversation with an author', 'AMD XP 1800+ & Gigabyte GA-7VR MB w/ 313N Case. W/ Free PS2 Mouse.', 22.13, 65, 82, 39, '0552298926');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-12-2010', 'dd-mm-yyyy'), 1230, 'Adults', 'film screening', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 235.22, 112, 83, 81, '0535112858');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-01-2008', 'dd-mm-yyyy'), 1330, 'Children', 'performance', 'Intel Celeron 2.0Ghz 478 pin Box cpu + fan', 76.2, 149, 84, 411, '0598390461');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-05-2003', 'dd-mm-yyyy'), 1030, 'Youth', 'sports', 'Epson Stylus C42UX - C11C482001.', 267.97, 271, 85, 55, '0532818157');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-11-2003', 'dd-mm-yyyy'), 1800, 'Youth', 'exhibition', 'Sony 16X DVD-CDRom (OEM)', 50.8, 52, 86, 109, '0526756508');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-05-2011', 'dd-mm-yyyy'), 1330, 'Children and youth', 'exhibition', 'Mitsumi 1.44 Floppy Drive', 70.78, 174, 87, 23, '0513570343');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-03-2003', 'dd-mm-yyyy'), 1600, 'Youth', 'story', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.', 227.69, 119, 88, 125, '0514569763');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-03-2013', 'dd-mm-yyyy'), 1330, 'Adults', 'educational activity', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).', 176.31, 166, 89, 394, '0547705117');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-09-2010', 'dd-mm-yyyy'), 1000, 'Elderly', 'performance', 'CyberPower PhoneSaver', 288.4, 286, 90, 394, '0534477724');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-03-2014', 'dd-mm-yyyy'), 1700, 'Youth', 'story', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 219.81, 277, 91, 303, '0508452551');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-07-2010', 'dd-mm-yyyy'), 1500, 'Elderly', 'workshop', 'SVA-USA VR-15B 15" TFT LCD Display.', 31.02, 60, 92, 71, '0592883142');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-05-2010', 'dd-mm-yyyy'), 1200, 'Children and youth', 'film screening', 'PowerColor 128MB USB Portable MP3 Player.', 104.24, 81, 93, 435, '0593597055');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-01-2002', 'dd-mm-yyyy'), 1830, 'Youth', 'volunteering', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', 54.93, 186, 94, 360, '0587517709');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-11-2006', 'dd-mm-yyyy'), 1630, 'Youth', 'volunteering', 'Combo AMD Duron 1.2Ghz + Biostar M7VKQ mb & fan (Free AMR Modem.)', 31.78, 266, 95, 126, '0571838230');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-06-2010', 'dd-mm-yyyy'), 1830, 'Elderly', 'educational activity', 'Intel Pentium4 2.4ghz & Gigabyte GA-8IE800 MB w/ 313N Case. W/ Free PS2 Mouse.', 33.23, 149, 96, 223, '0593148948');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-02-2013', 'dd-mm-yyyy'), 1830, 'Children and youth', 'workshop', 'AMD XP 2500+ FBS 333 & GigaByte GA-7N400L MB w/ 313M case. Free PS2 Mouse.', 278.46, 272, 97, 165, '0557863783');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-03-2010', 'dd-mm-yyyy'), 1700, 'Adults', 'educational activity', '512MB DDR PC3200 Kingston Hyper X (KHX3200/512 )', 31.38, 278, 98, 425, '0580482345');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-01-2003', 'dd-mm-yyyy'), 1100, 'Children and youth', 'story', 'Serial ATA Power Connector for the Hard Drive.', 285.22, 126, 99, 450, '0547018526');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-03-2010', 'dd-mm-yyyy'), 1730, 'Youth', 'Lecture', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)', 251.69, 95, 100, 358, '0566308995');
commit;
prompt 100 records committed...
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-04-2003', 'dd-mm-yyyy'), 1830, 'Youth', 'educational activity', 'Boka 2000 Sub Woofer Speaker System', 63.12, 41, 101, 260, '0544166787');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-04-2007', 'dd-mm-yyyy'), 2000, 'Children and youth', 'workshop', 'Microsoft Internet Keyboard AND MOUSE', 97.74, 98, 102, 160, '0554923177');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-09-2015', 'dd-mm-yyyy'), 1000, 'Elderly', 'volunteering', 'Biostar M7SXD P4 M/B Socket 478 Support SD/DDR (30 day D.O.A Warranty)', 219.7, 146, 103, 387, '0555201497');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-04-2013', 'dd-mm-yyyy'), 1730, 'Adults', 'training', 'AMDXP2400/128M/30G Black Complete System.', 20.1, 65, 104, 105, '0539686928');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-11-2005', 'dd-mm-yyyy'), 1330, 'Adults', 'educational activity', 'Combo AMD XP 2000 Biostar M7VIK Skt A MotherBoard; KT400.', 206.28, 359, 105, 69, '0587468780');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-01-2004', 'dd-mm-yyyy'), 1100, 'Youth', 'Lecture', 'Combo AMD XP 2100+ (Box CPU) Biostar M7VKQ Pro m/b Cooler Master Fan', 107.59, 270, 106, 151, '0525603811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-12-2008', 'dd-mm-yyyy'), 1230, 'Adults', 'exhibition', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 70.12, 53, 107, 61, '0580482345');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-12-2012', 'dd-mm-yyyy'), 1530, 'Youth', 'educational activity', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.', 34.79, 253, 108, 190, '0545007956');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-06-2006', 'dd-mm-yyyy'), 1630, 'Children and youth', 'play', 'AMD XP 2500+ Barton (OEM). (with 333Mhz Front Side Bus w/ 512k Cache).', 19.49, 75, 109, 202, '0573981190');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-07-2007', 'dd-mm-yyyy'), 1330, 'Youth', 'film screening', 'SVA-USA VR-15B 15" TFT LCD Display.', 259.59, 312, 110, 383, '0511954017');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-06-2002', 'dd-mm-yyyy'), 1030, 'Children and youth', 'play', 'Seagate 60GB 7200rpm EIDE Hard Drive Barracuda V ST360015A (OEM).', 90.69, 291, 111, 40, '0503109241');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-12-2012', 'dd-mm-yyyy'), 1030, 'Adults', 'Lecture', 'Intel Celeron 1.8ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 252.92, 289, 112, 274, '0591020249');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-06-2014', 'dd-mm-yyyy'), 1500, 'Elderly', 'educational activity', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.', 234.3, 36, 113, 332, '0534201997');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-01-2003', 'dd-mm-yyyy'), 1330, 'Youth', 'conversation with an author', 'AMD XP 2000+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', 119.02, 302, 114, 250, '0570229445');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-02-2006', 'dd-mm-yyyy'), 2000, 'Children', 'exhibition', 'Sound Blaster Audigy with 1394 firewire (oem)', 178.48, 101, 115, 176, '0558508452');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-06-2001', 'dd-mm-yyyy'), 1300, 'Children and youth', 'volunteering', '14"/15" Filter Screen', 126.78, 56, 116, 108, '0567188090');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-01-2012', 'dd-mm-yyyy'), 1500, 'Children and youth', 'film screening', 'Dynatron CPU Cooler DF1206BH AMD Athlon\Duron Fan. (AMD Recommend)', 21.52, 41, 117, 61, '0536211316');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-02-2001', 'dd-mm-yyyy'), 1000, 'Children and youth', 'exhibition', '256Mb DDRam PC2100 Kingston', 54.73, 129, 118, 21, '0535112858');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-09-2014', 'dd-mm-yyyy'), 1530, 'Adults', 'performance', 'CP-691 Stereo Speakers', 218.8, 49, 119, 344, '0555813256');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-09-2002', 'dd-mm-yyyy'), 1600, 'Adults', 'Lecture', 'CoolerMaster Thermal Compound Premium PTK-001.', 191, 289, 120, 79, '0519415809');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-07-2008', 'dd-mm-yyyy'), 1730, 'Adults', 'sports', 'Combo AMD XP 2100+ w/ Cpu Fan & Biostar M7VKQ +', 222.11, 124, 121, 444, '0510594048');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-03-2001', 'dd-mm-yyyy'), 1700, 'Elderly', 'Lecture', 'Removeable ATA100 hard drive tray', 229.52, 329, 122, 83, '0591020249');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-05-2004', 'dd-mm-yyyy'), 1530, 'Adults', 'educational activity', 'AMDXP2000/128M/30G Black Complete System.', 187.41, 188, 123, 306, '0521206960');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-11-2010', 'dd-mm-yyyy'), 1200, 'Elderly', 'story', 'Sound Blaster Audigy with 1394 firewire (oem)', 31.85, 65, 124, 446, '0567138787');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-11-2011', 'dd-mm-yyyy'), 1930, 'Adults', 'educational activity', 'AMD XP 2500+ Barton (OEM). (with 333Mhz Front Side Bus w/ 512k Cache).', 260.6, 221, 125, 299, '0591946782');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-04-2002', 'dd-mm-yyyy'), 2000, 'Elderly', 'story', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.', 184.35, 350, 126, 293, '0563202025');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-06-2008', 'dd-mm-yyyy'), 1500, 'Youth', 'conversation with an author', 'Serial ATA Power Connector for the Hard Drive.', 276.7, 346, 127, 46, '0561981808');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-11-2002', 'dd-mm-yyyy'), 1630, 'Elderly', 'film screening', 'Headset with Mircophone.', 210.25, 315, 128, 61, '0592248811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-11-2000', 'dd-mm-yyyy'), 1700, 'Adults', 'training', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.', 64.66, 256, 129, 417, '0545007956');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-09-2015', 'dd-mm-yyyy'), 1630, 'Children and youth', 'play', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.', 99.44, 105, 130, 6, '0566308995');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-11-2014', 'dd-mm-yyyy'), 1530, 'Youth', 'volunteering', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 225.82, 171, 131, 277, '0525603811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-02-2003', 'dd-mm-yyyy'), 1900, 'Children and youth', 'workshop', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.', 122.94, 31, 132, 417, '0517628405');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-04-2006', 'dd-mm-yyyy'), 1700, 'Elderly', 'volunteering', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan', 117.01, 177, 133, 118, '0513390767');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-07-2010', 'dd-mm-yyyy'), 1300, 'Elderly', 'exhibition', 'Cooler Master P4 CopperHeatPipe Fan IHC-H71', 247.69, 140, 134, 1, '0557481158');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-03-2010', 'dd-mm-yyyy'), 1100, 'Elderly', 'film screening', 'Case Fan 3 1/2"(80mm) 12V', 297.12, 295, 135, 216, '0528086324');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-11-2004', 'dd-mm-yyyy'), 1030, 'Elderly', 'conversation with an author', 'Creative Inspire 2.1 2500 surround sound', 98.24, 98, 136, 266, '0501193938');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-07-2008', 'dd-mm-yyyy'), 1730, 'Adults', 'training', 'Windows XP Pro Registered OEM', 88.14, 151, 137, 404, '0569254186');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-10-2010', 'dd-mm-yyyy'), 2000, 'Children', 'Lecture', '256MB DDR 400 (PC3200) Kingston(KVR400X64C3/256)', 158.33, 151, 138, 348, '0518432457');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-11-2000', 'dd-mm-yyyy'), 1630, 'Youth', 'conversation with an author', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 33.59, 109, 139, 175, '0501059090');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-01-2001', 'dd-mm-yyyy'), 1300, 'Children and youth', 'educational activity', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan', 145.87, 279, 140, 390, '0552678365');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-07-2006', 'dd-mm-yyyy'), 1400, 'Elderly', 'performance', '14inch LCD MG-015A Xgen2 Monitor.', 51.07, 280, 141, 176, '0540765295');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-10-2009', 'dd-mm-yyyy'), 1930, 'Adults', 'workshop', 'Microsoft Office 2000 Small Biz edition', 241.37, 290, 142, 145, '0520458230');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-04-2008', 'dd-mm-yyyy'), 1800, 'Adults', 'story', 'Hewlett Packard Color Deskjet HP 3420 .( Comes with Sample of HP Paper. HP Bright White Paper; HP Glossy Paperm; and HP inkjet Paper).', 284.86, 278, 143, 448, '0531895595');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-07-2000', 'dd-mm-yyyy'), 2000, 'Elderly', 'sports', 'GigaByte G-Max AMD Flex ATX Platform .', 32.38, 120, 144, 396, '0576923186');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-11-2007', 'dd-mm-yyyy'), 1300, 'Adults', 'conversation with an author', 'GA-7VT600-L VIA KT600 chipset.', 231.57, 232, 145, 441, '0599777765');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-02-2011', 'dd-mm-yyyy'), 1200, 'Elderly', 'performance', 'Black Mitsumi CD-RW 52x24x52x.', 285.77, 187, 146, 182, '0518917016');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-04-2005', 'dd-mm-yyyy'), 1600, 'Adults', 'sports', 'Intel Pentium4 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', 141.38, 43, 147, 224, '0541748264');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-04-2004', 'dd-mm-yyyy'), 1430, 'Elderly', 'story', 'Linksys Wireless Access Point (WAP11)', 206.54, 70, 148, 133, '0547319975');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-03-2013', 'dd-mm-yyyy'), 1930, 'Youth', 'play', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server', 250.09, 271, 149, 44, '0542688933');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-10-2011', 'dd-mm-yyyy'), 1630, 'Adults', 'educational activity', 'Mitsumi 1.44 Floppy Drive', 46.75, 294, 150, 234, '0569139556');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-02-2005', 'dd-mm-yyyy'), 1230, 'Elderly', 'exhibition', 'Combo AMD XP 2000+ CPU; Gigabyte GA-7VT600L M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 209.36, 246, 151, 372, '0514596993');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-11-2015', 'dd-mm-yyyy'), 1600, 'Youth', 'educational activity', 'AMD XP 2600+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 271.25, 192, 152, 433, '0537581884');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-07-2009', 'dd-mm-yyyy'), 1800, 'Children', 'story', 'Biostar M7VKQ Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 43.93, 292, 153, 341, '0563202025');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-07-2004', 'dd-mm-yyyy'), 2000, 'Adults', 'educational activity', 'Intel P4 1;7Ghz + Intel 845wn M/B;fan and ATX6053 Case w/350w power supply', 250.33, 315, 154, 408, '0585000866');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-08-2007', 'dd-mm-yyyy'), 1300, 'Elderly', 'workshop', 'Intel Celeron 1.7ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.', 241.09, 297, 155, 113, '0524063712');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-08-2005', 'dd-mm-yyyy'), 1530, 'Youth', 'educational activity', 'Sony 48x24x48 and 16x CD-RW/DVD OEM.', 181.36, 188, 156, 244, '0557841767');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-09-2004', 'dd-mm-yyyy'), 1800, 'Youth', 'volunteering', 'Biostar M6VLB Intel PPGA (w/30day limit warranty)', 90.75, 168, 157, 306, '0555813256');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-06-2001', 'dd-mm-yyyy'), 1300, 'Adults', 'Lecture', '312B ATX Case with 400Watt P4/P3/AMD Ready PS.', 95.46, 158, 158, 255, '0592842572');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-01-2006', 'dd-mm-yyyy'), 1400, 'Adults', 'conversation with an author', 'AMD XP 2100+ Box w/Fan & Biostar M7VKQ Pro MB w/ 313M Case. W/ PS2 Mouse.', 88.07, 198, 159, 184, '0591491809');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-06-2006', 'dd-mm-yyyy'), 1300, 'Adults', 'workshop', 'Gigabyte GA 7DPXDW-c Dual AMD server board', 139.01, 273, 160, 390, '0536093940');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-01-2015', 'dd-mm-yyyy'), 1630, 'Youth', 'performance', 'Black LG Electronics CD-RW 48x12x48x / DVD 16x Combo Drive.', 76.98, 155, 161, 174, '0514110655');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-01-2001', 'dd-mm-yyyy'), 1830, 'Children and youth', 'exhibition', 'Maxtor 30GB 7200RPM ATA133', 166.7, 315, 162, 334, '0584151025');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-08-2005', 'dd-mm-yyyy'), 1330, 'Youth', 'performance', '313G-B ATX case 400W P4/AMD Free Fan and 2 Front USB.', 256.93, 304, 163, 50, '0550226706');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-10-2012', 'dd-mm-yyyy'), 1730, 'Children', 'play', '312A Black ATX case 300W P4/AMD (Front USB Optional.)', 160.71, 174, 164, 450, '0596416460');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-08-2013', 'dd-mm-yyyy'), 1100, 'Elderly', 'workshop', 'Combo Intel Celeron 1.7G Gigabyte MB GA-8LS533', 157.29, 199, 165, 293, '0528291399');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('14-06-2006', 'dd-mm-yyyy'), 1030, 'Youth', 'training', '10/100 16 Port Switch', 23.08, 330, 166, 194, '0506994224');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-04-2010', 'dd-mm-yyyy'), 2000, 'Adults', 'performance', 'AMR 56K V.90 Modem Riser Card', 160.22, 175, 167, 190, '0569254186');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-03-2013', 'dd-mm-yyyy'), 1600, 'Children and youth', 'Lecture', 'Combo Intel Celeron 1.7Ghz (Box CPU)+ Biostar U8668D m/b (478pin)CPU & Fan Support .', 72.97, 241, 168, 96, '0528086324');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-06-2014', 'dd-mm-yyyy'), 1000, 'Children', 'story', 'Intel Celeron 1.8ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.', 33.66, 37, 169, 439, '0534201997');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-02-2009', 'dd-mm-yyyy'), 1600, 'Children', 'training', 'AOC LM520 Flat Screen (LCD) 15" Monitor', 100.85, 39, 170, 359, '0532214224');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-09-2001', 'dd-mm-yyyy'), 1030, 'Elderly', 'workshop', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.', 57.14, 277, 171, 378, '0513672669');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-12-2010', 'dd-mm-yyyy'), 1500, 'Adults', 'Lecture', '313K 300W P4/AMD and Free Case Fan and 2 Front USB.', 185.56, 138, 172, 194, '0571385000');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-07-2005', 'dd-mm-yyyy'), 1500, 'Elderly', 'educational activity', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Intel D845PESV P4 M/B Socket 478.', 145.19, 92, 173, 17, '0517847220');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-01-2004', 'dd-mm-yyyy'), 1230, 'Children and youth', 'Lecture', 'W.D 80.0Gb 7200rpm ATA100 (WD800BB)', 240.89, 80, 174, 263, '0528313806');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-04-2001', 'dd-mm-yyyy'), 1200, 'Children', 'play', 'Intel P4 1;6Ghz Bare Bone CPU & Fan;', 281.43, 122, 175, 273, '0529488499');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-12-2003', 'dd-mm-yyyy'), 1400, 'Elderly', 'sports', 'AMD XP 1800+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.', 64.26, 262, 176, 351, '0547018526');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-09-2008', 'dd-mm-yyyy'), 1230, 'Children and youth', 'play', 'Intel Pentium4 1.8ghz & Intel D845PESV MB w/ 313N Case. W/ Free PS2 Mouse.', 52.15, 257, 177, 122, '0529278556');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-03-2009', 'dd-mm-yyyy'), 1100, 'Youth', 'exhibition', 'AMD XP 3000+ Barton Box. (with 333Mhz Front Side Bus w/ 512k Cache).', 273.42, 246, 178, 412, '0597214515');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-04-2007', 'dd-mm-yyyy'), 1530, 'Elderly', 'educational activity', '312J ATX Case with 400W P4/P3/AMD PS', 126.3, 77, 179, 206, '0501889391');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-05-2010', 'dd-mm-yyyy'), 1330, 'Children', 'exhibition', 'Maxtor 40Gb ATA100 5400rpm H/D', 147.22, 184, 180, 146, '0547705117');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-01-2005', 'dd-mm-yyyy'), 1530, 'Elderly', 'volunteering', 'MITSUMI 54X CD-Rom Black.', 190.54, 40, 181, 440, '0517146164');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-02-2001', 'dd-mm-yyyy'), 1000, 'Elderly', 'workshop', 'Combo Intel P4 3.06ghz CPU + Fan(BOx)with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard.', 45.79, 282, 182, 22, '0534805825');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('14-08-2003', 'dd-mm-yyyy'), 2000, 'Youth', 'volunteering', 'Combo Intel P4 1.6ghz CPU + Fan (BOX);Biostar M7SXF P4 478pin M/B Support DDR DIMM', 278.78, 255, 183, 163, '0501327038');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-01-2007', 'dd-mm-yyyy'), 1830, 'Children and youth', 'workshop', 'Biostar M7VKD AMD 1Ghz Duron + Cooler Master Fan', 291.68, 104, 184, 66, '0594592130');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-12-2008', 'dd-mm-yyyy'), 1200, 'Youth', 'training', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 195.52, 314, 185, 306, '0540056731');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-03-2004', 'dd-mm-yyyy'), 1200, 'Children and youth', 'Lecture', 'Assembly CPU/Fan; Motherboard; Case; and Other Products.', 121.13, 217, 186, 444, '0594048250');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-11-2014', 'dd-mm-yyyy'), 1930, 'Children and youth', 'workshop', 'Combo AMD XP 2000+ cpu Gigabyte GA-7VKMLS m/b fan.', 298.26, 257, 187, 7, '0504683078');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-11-2002', 'dd-mm-yyyy'), 1430, 'Youth', 'educational activity', '128Mb RDRam 800Mhz Kingston', 140.25, 104, 188, 139, '0572079258');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-06-2008', 'dd-mm-yyyy'), 1700, 'Children and youth', 'performance', 'ATA 100 Controller Card PCI', 115.04, 38, 189, 280, '0564042954');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('14-08-2014', 'dd-mm-yyyy'), 1800, 'Elderly', 'play', 'Gigabyte GA-7DPXDW-P Dual AMD Server board w/RAID up to 4GB of Registered DDR memory', 98.33, 345, 190, 13, '0528086324');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-12-2011', 'dd-mm-yyyy'), 2000, 'Youth', 'play', '128Mb PC2100 266Mhz DDR Ram ( Micron )', 106.6, 292, 191, 84, '0536211316');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('31-08-2010', 'dd-mm-yyyy'), 1830, 'Adults', 'exhibition', 'Intel P4 1;6Ghz Box CPU (478pin)(256KB L2 Cache)', 178.57, 44, 192, 178, '0584492233');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-04-2013', 'dd-mm-yyyy'), 1400, 'Children and youth', 'Lecture', 'Biostar M7VKD-Pro AMD Skt A M/B VIA KT133 / 686B 266/200 Mhz FSB SD Ram ATA100(30 day D.O.A Warranty)', 177.04, 295, 193, 257, '0547939892');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('31-05-2002', 'dd-mm-yyyy'), 1930, 'Youth', 'workshop', 'Combo Intel P4 1.8ghz Gigabyte GA-8LS533 m/b + fan.', 276.44, 121, 194, 275, '0593597055');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-02-2004', 'dd-mm-yyyy'), 1530, 'Adults', 'educational activity', '128Mb RDRam 800Mhz Kingston', 29.73, 315, 195, 76, '0589283325');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-07-2003', 'dd-mm-yyyy'), 1600, 'Youth', 'Lecture', 'Intel Celeron 2.0Ghz/128M/30G Black Complete System.', 108.38, 344, 196, 289, '0544960010');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-05-2000', 'dd-mm-yyyy'), 1230, 'Adults', 'performance', 'Linksys USB Wireless (WUSB11)', 66.55, 222, 197, 168, '0509619309');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-11-2001', 'dd-mm-yyyy'), 1900, 'Children and youth', 'sports', 'SIS Xabre200 64MB DDR AGP 8X DVI+TV+CRT by Power Color', 278.84, 211, 198, 43, '0573708240');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('31-01-2001', 'dd-mm-yyyy'), 1830, 'Youth', 'educational activity', 'AMDXP2000+ Box BiostarM7VIG-Pro', 92.88, 205, 199, 410, '0547637651');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-01-2011', 'dd-mm-yyyy'), 1030, 'Children and youth', 'Lecture', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).', 222.91, 58, 200, 394, '0547018526');
commit;
prompt 200 records committed...
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-11-2007', 'dd-mm-yyyy'), 1030, 'Elderly', 'workshop', 'Intel Celeron 1.7ghz & Biostar U8668D. W/ Free CNR 56k & PS2 Mouse.', 191.06, 324, 201, 411, '0518451940');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-03-2014', 'dd-mm-yyyy'), 1000, 'Children', 'sports', 'Combo AMD XP 2700+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 215.2, 170, 202, 135, '0580373266');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-07-2012', 'dd-mm-yyyy'), 1800, 'Adults', 'Lecture', 'AMD XP 2200+ Retail box.', 214.51, 109, 203, 268, '0529488499');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-05-2001', 'dd-mm-yyyy'), 1530, 'Children', 'story', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', 233.69, 245, 204, 337, '0523247419');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-12-2011', 'dd-mm-yyyy'), 1530, 'Children', 'play', 'Biostar M7VKD-Pro AMD Skt A M/B VIA KT133 / 686B 266/200 Mhz FSB SD Ram ATA100(30 day D.O.A Warranty)', 235.4, 247, 205, 186, '0502582602');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-03-2011', 'dd-mm-yyyy'), 1000, 'Children', 'educational activity', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.', 171.72, 141, 206, 420, '0533173822');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-07-2001', 'dd-mm-yyyy'), 1500, 'Adults', 'exhibition', 'Biostar M6VCG skt 370 m/b (30 day D.O.A Warranty)', 116.21, 152, 207, 339, '0585938946');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-03-2001', 'dd-mm-yyyy'), 1730, 'Children', 'story', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.', 220.52, 273, 208, 10, '0518523707');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-10-2009', 'dd-mm-yyyy'), 1930, 'Youth', 'volunteering', 'Mitsumi 48x 12 x 40 CD-RW', 239.63, 357, 209, 101, '0583206356');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-03-2013', 'dd-mm-yyyy'), 1530, 'Children and youth', 'film screening', 'AMDXP2200/128M/30G Black Complete System.', 272.52, 199, 210, 120, '0537581884');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-02-2015', 'dd-mm-yyyy'), 1700, 'Adults', 'conversation with an author', 'Combo AMD XP 1800+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 158.26, 137, 211, 81, '0513570343');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-09-2010', 'dd-mm-yyyy'), 1500, 'Elderly', 'film screening', 'AMD XP 2700+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 38.86, 206, 212, 377, '0529278556');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-08-2011', 'dd-mm-yyyy'), 1900, 'Children', 'educational activity', 'Pentiume 4 3.0Ghz 800FSB/512M/80G Black Complete System.', 226.17, 337, 213, 253, '0512784355');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-09-2009', 'dd-mm-yyyy'), 1330, 'Elderly', 'play', 'ADS External USB 2.0 Drive Kit', 147.84, 269, 214, 293, '0576801411');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-08-2015', 'dd-mm-yyyy'), 1200, 'Elderly', 'Lecture', 'Maxtor 30GB 7200RPM ATA133', 33.49, 268, 215, 86, '0520460860');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-07-2013', 'dd-mm-yyyy'), 1330, 'Children and youth', 'play', 'Cyber Power 1000VA Back Up W/Automatic Voltage Regulator', 261.31, 33, 216, 117, '0517628405');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-04-2006', 'dd-mm-yyyy'), 1600, 'Adults', 'Lecture', 'Intel Pentium4 2.4ghz & Gigabyte GA-8IE800 MB w/ 313N Case. W/ Free PS2 Mouse.', 274.57, 334, 217, 368, '0519560607');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-11-2006', 'dd-mm-yyyy'), 1730, 'Children', 'film screening', 'CyberPower Surge Protector 850 with 8 Outlet.', 196.74, 30, 218, 344, '0582038256');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-02-2013', 'dd-mm-yyyy'), 1330, 'Youth', 'educational activity', 'Cable/DSL Broadband Router (w/ 4-port Switch) (EE400-R).', 153.99, 346, 219, 25, '0526529811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-12-2015', 'dd-mm-yyyy'), 1500, 'Children', 'Lecture', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan', 262.48, 139, 220, 252, '0550776802');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-11-2012', 'dd-mm-yyyy'), 1330, 'Adults', 'conversation with an author', '312B ATX Case (No Power Supply)', 115.22, 33, 221, 191, '0578704415');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-03-2012', 'dd-mm-yyyy'), 1630, 'Adults', 'volunteering', 'Mitsumi DW-7801TE DVD Duplicator/Burner.', 145.08, 266, 222, 296, '0501889391');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-05-2014', 'dd-mm-yyyy'), 1600, 'Children', 'performance', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)', 198.17, 319, 223, 279, '0540110136');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-04-2006', 'dd-mm-yyyy'), 1800, 'Youth', 'training', '500W P4 Dual Fan Codegen Power supply.', 148.77, 213, 224, 423, '0505277047');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-05-2015', 'dd-mm-yyyy'), 1930, 'Elderly', 'film screening', 'Combo AMD XP 1700+ cpu Gigabyte GA-7ZXE Motherboard + Fan', 285.36, 346, 225, 168, '0544571829');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-05-2007', 'dd-mm-yyyy'), 1400, 'Children and youth', 'volunteering', '128Mb RDRam 800Mhz Kingston', 41.5, 252, 226, 447, '0518432457');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-08-2011', 'dd-mm-yyyy'), 1330, 'Elderly', 'exhibition', 'Combo AMD XP 1900+ cpu Gigabyte GA-7ZXE Motherboard + Fan', 88.09, 121, 227, 191, '0523644741');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-01-2001', 'dd-mm-yyyy'), 1800, 'Adults', 'educational activity', 'AMD XP 2100+ (Box) & Gigabyte GA-7VKML MB w/ 313M Case. W/ Free PS2 Mouse.', 257.61, 178, 228, 337, '0508452551');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-12-2015', 'dd-mm-yyyy'), 1330, 'Children', 'educational activity', 'AMD Duron 1.2MHz & Biostar M7VIG-Pro MB w/ 312J case. Free PS2 Mouse.', 293.77, 284, 229, 396, '0526088200');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-01-2015', 'dd-mm-yyyy'), 1830, 'Elderly', 'training', 'Cooler Master Copper HEAT PIPE Cooler. HHC-001', 206.98, 95, 230, 39, '0550582716');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-02-2000', 'dd-mm-yyyy'), 1000, 'Elderly', 'performance', 'AMD XP 3000+ Barton CPU ASUS A7N8X Deluxe NVIDIA Force2 w/ Antec Performance plus II 1040B Case.', 39.12, 190, 231, 390, '0554898210');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-05-2012', 'dd-mm-yyyy'), 1400, 'Children', 'training', '14"/15" Filter Screen', 142.5, 172, 232, 161, '0526843229');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-01-2011', 'dd-mm-yyyy'), 1830, 'Children', 'volunteering', 'Mitsumi PS2 Keyboard', 42.47, 167, 233, 369, '0506270485');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-05-2000', 'dd-mm-yyyy'), 1700, 'Elderly', 'story', 'Assembly & Testing of the CPU/Fan; Motherboard; Case; and Other Products.', 205.96, 138, 234, 254, '0586116571');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-07-2014', 'dd-mm-yyyy'), 1730, 'Children', 'story', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)', 167.1, 114, 235, 96, '0557863783');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-04-2000', 'dd-mm-yyyy'), 1630, 'Elderly', 'Lecture', 'TV Tuner card PCI (KWorld M878A)', 193.39, 336, 236, 99, '0557673859');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-12-2004', 'dd-mm-yyyy'), 1800, 'Adults', 'conversation with an author', 'Achieve Gold Dual Fan 550Watt PowerSupply.', 96.66, 248, 237, 390, '0523644741');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-02-2007', 'dd-mm-yyyy'), 1230, 'Elderly', 'story', 'Biostar M7VKB Ver2.0 ATA100 socket A (w/30 day limit warranty)', 169.48, 212, 238, 366, '0538158764');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-10-2005', 'dd-mm-yyyy'), 1500, 'Elderly', 'exhibition', '313B Black 300W P4/AMD Fan&USB .', 210.14, 244, 239, 216, '0585023714');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-10-2003', 'dd-mm-yyyy'), 1000, 'Elderly', 'Lecture', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7VA M/B.', 123.89, 277, 240, 375, '0559679521');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-12-2001', 'dd-mm-yyyy'), 1430, 'Elderly', 'story', 'Biostar M7SXF P4 478pin M/B Intel P4 1;8ghz CPU + Fan(BOx)Support DDR DIMM', 236.47, 124, 241, 238, '0599777765');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-04-2006', 'dd-mm-yyyy'), 1430, 'Adults', 'story', 'Creative Sound Blaster LIVE 5.1 (OEM - SB0220 ).', 43.18, 292, 242, 237, '0544166787');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-02-2004', 'dd-mm-yyyy'), 1100, 'Children and youth', 'Lecture', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server', 284.96, 290, 243, 235, '0539361373');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-08-2009', 'dd-mm-yyyy'), 1630, 'Children', 'conversation with an author', 'ASUS A7N8X Deluxe NVIDIA Force2 .', 229.74, 98, 244, 275, '0545485739');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-06-2003', 'dd-mm-yyyy'), 1530, 'Children and youth', 'film screening', 'Intel Pentium4 2.4ghz & Gigabyte GA-8IE800 MB w/ 313N Case. W/ Free PS2 Mouse.', 146.65, 83, 245, 212, '0596924914');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-04-2009', 'dd-mm-yyyy'), 1030, 'Youth', 'performance', 'AMD XP 2000+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', 235.88, 207, 246, 448, '0546343616');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-08-2014', 'dd-mm-yyyy'), 1600, 'Children and youth', 'Lecture', 'Intel P4 2.4 Ghz CPU BOX (800Mhz)', 190.12, 198, 247, 378, '0550035618');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-01-2002', 'dd-mm-yyyy'), 1100, 'Elderly', 'play', 'AMD XP 1800+ & Gigabyte GA-7DXE MB w/ 313M Case W/ Free PS2 Mouse.', 84.96, 59, 248, 381, '0504061513');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-01-2007', 'dd-mm-yyyy'), 1530, 'Youth', 'educational activity', 'Sony Black 16X DVD .', 82.66, 338, 249, 368, '0593311899');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-06-2010', 'dd-mm-yyyy'), 1400, 'Children and youth', 'play', 'Mitsumi 52x 40 x 48 CD-RW', 256.5, 110, 250, 435, '0518799170');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-10-2001', 'dd-mm-yyyy'), 1200, 'Children', 'educational activity', 'Cyber Power 1000VA Back Up W/Automatic Voltage Regulator', 61, 146, 251, 409, '0591020249');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-06-2015', 'dd-mm-yyyy'), 1830, 'Youth', 'workshop', 'Gigabyte GA-8IRXP ATA133 + onboard Raid + USB2.0 + Lan', 145.29, 269, 252, 144, '0514596993');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-02-2010', 'dd-mm-yyyy'), 1100, 'Elderly', 'educational activity', 'Headset with Mircophone.', 294.46, 113, 253, 159, '0583324755');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-09-2015', 'dd-mm-yyyy'), 1930, 'Elderly', 'exhibition', 'AMD XP 2000+ & GigaByte GA-7VT600L MB w/ 313M case. Free PS2 Mouse.', 119.83, 211, 254, 96, '0561507428');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-12-2009', 'dd-mm-yyyy'), 2000, 'Children', 'story', 'Cyber Power 725VA Battery Back Up', 33.8, 179, 255, 46, '0540775948');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-05-2001', 'dd-mm-yyyy'), 2000, 'Youth', 'play', 'Combo AMD XP 2100+ w/ Cpu Fan & Biostar M7VKQ +', 200.26, 275, 256, 106, '0558508452');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-06-2007', 'dd-mm-yyyy'), 1930, 'Adults', 'educational activity', '256Mb DDRam PC2100 Kingston', 91.38, 316, 257, 348, '0548222148');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-08-2002', 'dd-mm-yyyy'), 1500, 'Adults', 'performance', 'Biostar M6TSU M/B(30 day D.O.A Warranty)', 94.22, 303, 258, 70, '0549751262');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-07-2001', 'dd-mm-yyyy'), 1230, 'Children and youth', 'volunteering', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 128.51, 100, 259, 209, '0550582716');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-03-2012', 'dd-mm-yyyy'), 1900, 'Youth', 'workshop', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 288.35, 125, 260, 216, '0594835754');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-11-2007', 'dd-mm-yyyy'), 1930, 'Children and youth', 'film screening', 'Mitsumi Win 2000 Internet Keyboard', 114.35, 347, 261, 207, '0544166787');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-05-2011', 'dd-mm-yyyy'), 1430, 'Children', 'Lecture', 'Combo AMD XP 2200+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 236.5, 72, 262, 64, '0550226706');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-01-2009', 'dd-mm-yyyy'), 1930, 'Adults', 'educational activity', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.', 183.13, 313, 263, 416, '0512763980');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-08-2008', 'dd-mm-yyyy'), 1100, 'Children and youth', 'Lecture', 'Combo AMD XP 2500+ Gigabyte GA-7VA M/B.', 191.92, 279, 264, 210, '0501812602');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-09-2004', 'dd-mm-yyyy'), 1030, 'Youth', 'performance', 'Intel Pentium4 1.7Ghz & Biostar M7TDB MB w/ 313M Case.', 143.92, 215, 265, 170, '0571385000');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-03-2013', 'dd-mm-yyyy'), 1100, 'Adults', 'Lecture', '128Mb SDRam PC133 Kingston', 72.25, 229, 266, 119, '0535268135');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-04-2001', 'dd-mm-yyyy'), 1800, 'Children and youth', 'conversation with an author', 'AMD MP 1900+ OEM cpu', 33.95, 101, 267, 318, '0578635534');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-11-2008', 'dd-mm-yyyy'), 1430, 'Adults', 'Lecture', 'Linksys Wireless PCI card (WMP11)', 81.02, 133, 268, 1, '0552390533');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-07-2013', 'dd-mm-yyyy'), 1300, 'Adults', 'workshop', 'AMD Duron 1.1Ghz (1100 Mhz) OEM', 215.33, 347, 269, 34, '0501327038');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-01-2003', 'dd-mm-yyyy'), 1730, 'Children and youth', 'Lecture', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 11.82, 306, 270, 362, '0571838230');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-07-2002', 'dd-mm-yyyy'), 1530, 'Youth', 'story', 'Seagate 40GB 5400RPM ATA100', 209.32, 160, 271, 10, '0575655796');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-03-2008', 'dd-mm-yyyy'), 1530, 'Elderly', 'workshop', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .', 17.9, 297, 272, 431, '0538644364');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-07-2006', 'dd-mm-yyyy'), 1230, 'Children', 'training', 'Logitech Smart Click 310 Camera', 124.07, 145, 273, 426, '0547018526');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-10-2002', 'dd-mm-yyyy'), 1730, 'Elderly', 'performance', 'Flat Panel Speakers Boka-206', 75, 299, 274, 296, '0593646569');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-11-2001', 'dd-mm-yyyy'), 1430, 'Children', 'film screening', 'Intel Pentium4 1.8Ghz & Biostar U8668D MB w/ 313M case. W/ Free CNR 56k & PS2 Mouse.', 286.72, 68, 275, 135, '0592988124');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-08-2008', 'dd-mm-yyyy'), 1630, 'Children and youth', 'educational activity', 'Intel Pentium4 2.4ghz & GigaByte 8IPE1000 Pro MB w/ Antec Performance Plus II 1040B Case.', 166.46, 301, 276, 309, '0503160585');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-05-2009', 'dd-mm-yyyy'), 1400, 'Children and youth', 'educational activity', 'ATI Radeon 9600 256MB DVI+CRT+TV 8X .', 18.07, 113, 277, 70, '0517146164');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-01-2015', 'dd-mm-yyyy'), 1330, 'Children and youth', 'educational activity', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan', 269.96, 158, 278, 174, '0517951142');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-07-2006', 'dd-mm-yyyy'), 1830, 'Children and youth', 'story', '4 Port USB 2.0 High-Speed PCI Card', 255.42, 332, 279, 244, '0563366374');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-08-2012', 'dd-mm-yyyy'), 1000, 'Children and youth', 'performance', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.', 143.22, 324, 280, 208, '0547664287');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-11-2006', 'dd-mm-yyyy'), 1700, 'Children and youth', 'Lecture', 'PowerColor 128MB USB Portable MP3 Player.', 205.27, 150, 281, 407, '0583559384');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-03-2004', 'dd-mm-yyyy'), 1100, 'Children', 'workshop', 'Intel Celeron 1.2Ghz & Biostar M6VLR MB w/ 312J Color Case. W/ Free AMR 56k & PS2 Mouse.', 84.29, 176, 282, 321, '0589283325');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-06-2008', 'dd-mm-yyyy'), 2000, 'Youth', 'Lecture', 'AMD XP 2400+ Retail box.', 149.67, 192, 283, 255, '0588583669');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-04-2009', 'dd-mm-yyyy'), 1300, 'Elderly', 'Lecture', 'Matrox Dual Head G550 With 32 MB of Double Data Rate (DDR) memory; a 360. MHz primary RAMDAC.OEM package', 79.23, 124, 284, 175, '0564474356');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-06-2010', 'dd-mm-yyyy'), 1200, 'Children', 'volunteering', 'ATX 300W High Quality Switching Power Supply', 117.33, 326, 285, 449, '0548325334');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-03-2002', 'dd-mm-yyyy'), 1900, 'Youth', 'performance', 'Sony Black 16X DVD .', 128.76, 81, 286, 271, '0551908086');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-09-2003', 'dd-mm-yyyy'), 1600, 'Children', 'educational activity', 'Combo Intel P4 2.0Ghz (Box CPU)+ Biostar M7SXF m/b (478pin)CPU & Fan', 249.66, 319, 287, 101, '0504878828');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-03-2005', 'dd-mm-yyyy'), 1730, 'Youth', 'play', 'Maxtor 40Gb ATA100 5400rpm H/D', 234.43, 287, 288, 239, '0595535243');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-11-2005', 'dd-mm-yyyy'), 1230, 'Children', 'workshop', 'AMD XP 2200+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 213.44, 217, 289, 373, '0591946782');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('01-04-2006', 'dd-mm-yyyy'), 1200, 'Children and youth', 'training', 'Intel Pentium4 2.0ghz & Gigabyte 8IE533 MB w/ 313N Case. W/ Free PS2 Mouse.', 56.5, 60, 290, 111, '0511271389');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-07-2015', 'dd-mm-yyyy'), 1230, 'Adults', 'workshop', 'Gigabyte GA-7VAC SKT A AMD® DDR400 / KT333.', 160.17, 98, 291, 373, '0578430058');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-04-2009', 'dd-mm-yyyy'), 1530, 'Children and youth', 'play', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 138.83, 121, 292, 116, '0550226706');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('20-01-2014', 'dd-mm-yyyy'), 1730, 'Children', 'Lecture', 'Combo AMD XP 2400+ cpu Gigabyte GA-7DXE Motherboard + Fan.', 240.07, 294, 293, 100, '0523725837');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-08-2015', 'dd-mm-yyyy'), 1800, 'Children', 'exhibition', '64Mb RDRam SAMSUNG Must be used in pairs', 293.45, 340, 294, 285, '0594592130');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-11-2013', 'dd-mm-yyyy'), 1030, 'Youth', 'conversation with an author', 'AMD XP 2200+ & Gigabyte 7N400Pro w/ 313M case . W/ Free PS2 Mouse.', 79.27, 139, 295, 184, '0555813256');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-04-2000', 'dd-mm-yyyy'), 1930, 'Children and youth', 'sports', 'ADS Technologies Firewire 1394 3 Port PCI', 47.17, 145, 296, 7, '0501015255');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-10-2007', 'dd-mm-yyyy'), 1630, 'Elderly', 'performance', 'GA-SINXP1394(GA-8SQ800 Ultra2) (SiS 655 Chipset) w/ Pentium 4 2.4 Ghz (Box CPU)', 95.35, 296, 297, 381, '0577877385');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-07-2009', 'dd-mm-yyyy'), 1230, 'Children and youth', 'performance', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LS533 m/b + fan.', 107.72, 91, 298, 210, '0531895595');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-05-2010', 'dd-mm-yyyy'), 1600, 'Children', 'Lecture', '313N-B ATX case 300W P4/AMD Free Fan and 2 Front USB.', 101.77, 177, 299, 245, '0515610301');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-09-2001', 'dd-mm-yyyy'), 1430, 'Elderly', 'volunteering', 'Intel D 850MV P4 M/B RDRam support', 26.28, 333, 300, 13, '0540882563');
commit;
prompt 300 records committed...
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-04-2005', 'dd-mm-yyyy'), 1730, 'Children and youth', 'conversation with an author', 'USB Cable 6ft. Long.', 49.2, 220, 301, 20, '0588583669');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-07-2013', 'dd-mm-yyyy'), 1430, 'Elderly', 'performance', 'CyberDrive 40X16X48X CD-R/RW Drive.', 278.43, 49, 302, 283, '0581721598');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-01-2005', 'dd-mm-yyyy'), 1600, 'Children', 'play', '128Mb DDRam PC2100 Kingston', 145.01, 201, 303, 373, '0598800052');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-05-2012', 'dd-mm-yyyy'), 2000, 'Children', 'volunteering', 'Logitech Optical Mouse', 186.85, 261, 304, 293, '0595664140');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-12-2010', 'dd-mm-yyyy'), 1330, 'Elderly', 'sports', 'Windows 2000 w/Service Pack 3(NEW) OEM Full Version LICENCED', 42.71, 353, 305, 147, '0503892731');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-05-2000', 'dd-mm-yyyy'), 1030, 'Elderly', 'Lecture', 'Biostar M7VIG-Pro Skt A MotherBoard w/ OnBoard Video/sound/Lan.', 137.15, 184, 306, 227, '0518799170');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-02-2008', 'dd-mm-yyyy'), 1330, 'Adults', 'educational activity', 'Combo Intel Celeron 1.7ghz (box)478pin +Gigabyte GA8IRX M/b +fan', 256.54, 125, 307, 126, '0561981808');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-07-2006', 'dd-mm-yyyy'), 1500, 'Children and youth', 'sports', 'AMD XP 2600+ & Biostar M7VIK KT400 MB w/ 313M case. Free PS2 Mouse.', 133.88, 82, 308, 167, '0563366374');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-05-2004', 'dd-mm-yyyy'), 1500, 'Elderly', 'conversation with an author', 'AMD Duron 1.3MHz & Biostar M7VIG-Pro MB w/ 312D case. Free PS2 Mouse.', 182.95, 186, 309, 399, '0585023714');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-02-2005', 'dd-mm-yyyy'), 1730, 'Youth', 'educational activity', 'AMD Server Solution YS XP2000+ 266 FSB Raid Server', 287.13, 292, 310, 344, '0582401507');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-04-2013', 'dd-mm-yyyy'), 1730, 'Children and youth', 'training', 'PS2 2 Button Mouse', 266.33, 344, 311, 102, '0550776802');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-05-2014', 'dd-mm-yyyy'), 1800, 'Elderly', 'story', 'Seagate 60GB 7200rpm EIDE Hard Drive Barracuda V ST360015A (OEM).', 132.45, 49, 312, 308, '0541748264');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-12-2007', 'dd-mm-yyyy'), 1430, 'Children and youth', 'exhibition', 'ASUS A7N8X Deluxe NVIDIA Force2 w/ AMD XP 2700+ CPU.', 271.79, 96, 313, 394, '0517945438');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-08-2000', 'dd-mm-yyyy'), 1230, 'Children and youth', 'workshop', 'AMD XP 2500+ FBS 333 & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 48.54, 301, 314, 231, '0545485739');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-12-2008', 'dd-mm-yyyy'), 1000, 'Youth', 'film screening', 'Biostar M6VLR skt 370 Motherboard', 138.05, 325, 315, 212, '0539778860');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-07-2010', 'dd-mm-yyyy'), 1330, 'Youth', 'performance', '312D ATX color case translucent blue(No PowerSupply).', 178.1, 313, 316, 147, '0506259273');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-06-2010', 'dd-mm-yyyy'), 1300, 'Children and youth', 'Lecture', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 49.8, 144, 317, 127, '0534504508');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-08-2015', 'dd-mm-yyyy'), 1600, 'Adults', 'sports', 'Combo AMD Duron 1.3Ghz + Biostar M7VKQ Pro', 210.05, 55, 318, 388, '0597214515');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-09-2008', 'dd-mm-yyyy'), 1400, 'Elderly', 'training', 'Combo AMD XP 2600+ CPU; Gigabyte GA-7VA M/B.', 127.1, 69, 319, 352, '0596148854');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-02-2012', 'dd-mm-yyyy'), 1730, 'Youth', 'volunteering', '312D ATX color case(translucent blue) with 300Watt P4/P3/AMD Support PowerSupply.', 193.48, 210, 320, 268, '0580265923');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-03-2009', 'dd-mm-yyyy'), 1330, 'Children', 'film screening', 'ADS External USB 2.0 Drive Kit', 168.77, 65, 321, 300, '0534504508');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-07-2003', 'dd-mm-yyyy'), 1300, 'Elderly', 'conversation with an author', 'Intel Celeron 1.8ghz & Gigabyte GA-8LD533 MB w/ 313N Case. W/ Free PS2 Mouse.', 279.75, 163, 322, 142, '0570229445');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-07-2003', 'dd-mm-yyyy'), 1530, 'Children', 'training', 'Combo AMD Duron 1.2Ghz cpu Gigabyte GA-7VKMLS m/b fan.', 214.89, 90, 323, 5, '0559473400');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-07-2009', 'dd-mm-yyyy'), 1630, 'Children', 'educational activity', 'ATI Radeon 7000 32MB DDR PCI CRT+DVI+TV.', 295.55, 255, 324, 349, '0520460860');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-08-2002', 'dd-mm-yyyy'), 1630, 'Adults', 'story', 'Combo AMD XP 2500+ CPU; Gigabyte GA-7N400Pro M/B(W/DDR400 up to 3GB/ATA133 Raid/USB2.0) +Fan.', 209.13, 261, 325, 48, '0599346865');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-07-2015', 'dd-mm-yyyy'), 1530, 'Adults', 'volunteering', 'Combo Intel Celeron 1.8ghz Gigabyte GA-8LS533 m/b + fan.', 90.93, 214, 326, 260, '0502582602');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-10-2000', 'dd-mm-yyyy'), 1000, 'Children', 'training', 'Intel P4 3.06 HT CPU & Intel D845PEBT2 M/B onboard Raid and S-ATA', 102.02, 276, 327, 162, '0586116571');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-03-2013', 'dd-mm-yyyy'), 1100, 'Children', 'sports', 'AMD XP 2100+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 149.99, 263, 328, 378, '0591946782');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-05-2013', 'dd-mm-yyyy'), 1200, 'Youth', 'workshop', 'AMDXP2000/128M/30G Black Complete System.', 280.61, 77, 329, 32, '0518951361');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-06-2001', 'dd-mm-yyyy'), 1230, 'Children', 'performance', 'AMD XP 1900+ & Gigabyte GA-7VKMLS MB w/ 313M Color Case.', 30.54, 60, 330, 280, '0572079258');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-11-2011', 'dd-mm-yyyy'), 1630, 'Youth', 'performance', 'Combo Intel P4 1.8ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.', 244.93, 79, 331, 290, '0524063712');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-06-2006', 'dd-mm-yyyy'), 1630, 'Children', 'conversation with an author', 'Serial ATA IDE Connector.', 272.1, 297, 332, 445, '0502938640');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-10-2013', 'dd-mm-yyyy'), 1500, 'Elderly', 'conversation with an author', 'AMDXP2200/128M/30G Black Complete System.', 57.44, 297, 333, 50, '0524912831');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-03-2008', 'dd-mm-yyyy'), 1230, 'Youth', 'educational activity', '512MB DDR PC2700 Kingston(KVR333X64C25/512)', 31.02, 335, 334, 69, '0540882563');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-05-2002', 'dd-mm-yyyy'), 1200, 'Youth', 'workshop', 'Combo AMD XP 2400+ CPU; Gigabyte GA-7VR M/B(W/DDR333 up to 3GB/ATA133) .', 143.62, 220, 335, 246, '0593646569');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-07-2015', 'dd-mm-yyyy'), 1530, 'Children', 'volunteering', 'Intel P4 2.4G BareBone System W/ Free Mouse.', 85.81, 326, 336, 310, '0551127903');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-12-2000', 'dd-mm-yyyy'), 1030, 'Elderly', 'volunteering', '256Mb DDRam PC2100 Kingston', 191.59, 353, 337, 264, '0561153057');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-12-2011', 'dd-mm-yyyy'), 1830, 'Children and youth', 'sports', 'Combo Intel P4 2.4ghz CPU + Fan(BOx) w/ Gigabyte GA-8IE800 Intel®845E Chipset.', 148.31, 104, 338, 364, '0506994224');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-12-2010', 'dd-mm-yyyy'), 2000, 'Elderly', 'sports', 'Intel D845WN 478Pin SDRAM retail Box', 20.09, 253, 339, 82, '0589283325');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-04-2015', 'dd-mm-yyyy'), 1330, 'Youth', 'story', 'Windows XP Pro Registered OEM', 95.15, 183, 340, 108, '0557863783');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-09-2005', 'dd-mm-yyyy'), 1100, 'Elderly', 'educational activity', 'AMDXP2000+ Box BiostarM7VIG-Pro', 100.17, 320, 341, 348, '0501812602');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-03-2001', 'dd-mm-yyyy'), 1400, 'Adults', 'exhibition', 'AMD XP2000+ Biostar M7VKQ Pro', 111.49, 226, 342, 324, '0547053230');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-05-2009', 'dd-mm-yyyy'), 1000, 'Adults', 'play', 'LG Goldstar 16X DVD with audio cable OEM', 209.91, 283, 343, 239, '0512803002');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-09-2001', 'dd-mm-yyyy'), 1000, 'Youth', 'story', 'ANTEC Performance PLUS Model PLUS1080 w/ Antec Original TRUE 430W P4 Power Supply.', 224.81, 173, 344, 47, '0502139249');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('31-05-2002', 'dd-mm-yyyy'), 1330, 'Adults', 'exhibition', 'ADS USB Turbo 2.0 WebCam.', 115.54, 342, 345, 50, '0592248811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-06-2003', 'dd-mm-yyyy'), 1300, 'Youth', 'training', 'Cyber Power 1250VA Back Up.', 232.17, 256, 346, 120, '0554898210');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-07-2007', 'dd-mm-yyyy'), 1530, 'Children', 'educational activity', 'Intel Pentium4 1.8ghz & Biostar U8668 MB w/ 313N Case. W/ Free CNR 56k & PS2 Mouse.', 201.82, 346, 347, 232, '0591491809');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('10-07-2005', 'dd-mm-yyyy'), 1030, 'Youth', 'workshop', 'AMD XP 2500+ Barton (OEM). (with 333Mhz Front Side Bus w/ 512k Cache).', 89, 105, 348, 207, '0572079258');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-12-2008', 'dd-mm-yyyy'), 1900, 'Adults', 'volunteering', 'AMDXP2000/128M/30G Black Complete System.', 109.26, 122, 349, 204, '0599087527');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-05-2007', 'dd-mm-yyyy'), 1230, 'Adults', 'performance', 'White RF Wireless Keyboard Track Ball .(PS/2 Connector)', 43.93, 252, 350, 81, '0583206356');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('19-04-2014', 'dd-mm-yyyy'), 1930, 'Adults', 'workshop', 'AOC 17" Monitor 7FSLK .25mm Dot Pitch TureFlat', 202.6, 300, 351, 350, '0596924914');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-01-2002', 'dd-mm-yyyy'), 1930, 'Children and youth', 'Lecture', 'Intel Pentium4 2.4ghz & Intel D845PESV MB w/ 313M Case. W/ Free PS2 Mouse.', 60.38, 235, 352, 320, '0501059090');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-04-2014', 'dd-mm-yyyy'), 1100, 'Children', 'Lecture', 'AMDXP2000/128M/30G Black Complete System.', 113.54, 213, 353, 227, '0557673859');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-12-2010', 'dd-mm-yyyy'), 1330, 'Elderly', 'sports', 'Intel Celeron 1.7ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 104.94, 121, 354, 133, '0501015255');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-09-2015', 'dd-mm-yyyy'), 1630, 'Elderly', 'performance', 'ATA 100 Controller Card PCI', 57.16, 179, 355, 206, '0518799170');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-09-2011', 'dd-mm-yyyy'), 1000, 'Youth', 'performance', 'Serial ATA Power Connector for the Hard Drive.', 53.3, 100, 356, 444, '0584492233');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-01-2000', 'dd-mm-yyyy'), 1800, 'Children and youth', 'volunteering', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + Intel Pentium 4 2.4Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 126.16, 308, 357, 397, '0540882563');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-06-2010', 'dd-mm-yyyy'), 1730, 'Adults', 'workshop', 'Combo Intel P4 3.0ghz CPU + Fan(BOx) FSB800 with Hyper Threading w/ Gigabyte 8IPE1000 Pro MotherBoard(Intel 865G chipset Support FSB800).', 289.03, 109, 358, 284, '0577760219');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-03-2004', 'dd-mm-yyyy'), 1430, 'Children and youth', 'sports', 'xAMD XP 1600+ Biostar M7VIB M/B + Cooler master fan', 286.05, 53, 359, 230, '0538158764');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('12-06-2002', 'dd-mm-yyyy'), 1030, 'Children', 'story', 'GigaByte G-Max Intel P4 Flex ATX Platform .', 257.93, 202, 360, 355, '0547939892');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-11-2004', 'dd-mm-yyyy'), 1430, 'Youth', 'sports', 'LG 52x24x52x CD-RW (OEM).', 127.45, 55, 361, 209, '0517847220');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-04-2008', 'dd-mm-yyyy'), 1530, 'Elderly', 'performance', 'Mitsumi PS/2 Net scroll 5 button mouse', 143.41, 168, 362, 260, '0548325334');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('04-01-2004', 'dd-mm-yyyy'), 1230, 'Youth', 'educational activity', '219L ATX color Case teal 400W ScrewLess mid tower w/case Fan', 215.45, 171, 363, 171, '0554333345');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-02-2008', 'dd-mm-yyyy'), 1700, 'Children', 'play', 'Boka 1050 Sub Woofer and Speakers', 14.72, 30, 364, 157, '0586473713');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-12-2010', 'dd-mm-yyyy'), 1700, 'Adults', 'conversation with an author', 'Intel Celeron 1.7Ghz 478 pin Box cpu + fan', 250.62, 99, 365, 422, '0518951361');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-03-2008', 'dd-mm-yyyy'), 1000, 'Adults', 'performance', 'Asus P4C800 Deluxe intel 875 Chip 800FSB DDR SATA ATA133 RAID GIGABIT LAN USB2.0 ATX Retail Box + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 293.33, 345, 366, 170, '0539347618');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-02-2008', 'dd-mm-yyyy'), 1400, 'Adults', 'play', 'Combo Intel P4 1.7Ghz retail CPU + Gigabyte GA-8ID533 M/B + Fan.', 136.74, 282, 367, 12, '0535608360');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('14-12-2001', 'dd-mm-yyyy'), 1600, 'Youth', 'performance', 'Headset with Mircophone.', 80.65, 222, 368, 162, '0568819541');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-06-2008', 'dd-mm-yyyy'), 1430, 'Adults', 'story', 'Intel Celeron 1.8ghz & Gigabyte GA-8LS533 MB w/ 313M Case. W/ Free PS2 Mouse.', 248.82, 88, 369, 328, '0553225887');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-08-2001', 'dd-mm-yyyy'), 1230, 'Youth', 'training', 'Microsoft Office XP Small Business Edition', 176.7, 76, 370, 92, '0553225887');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-08-2002', 'dd-mm-yyyy'), 1930, 'Elderly', 'volunteering', 'Combo AMD XP 2100+ CPU; Gigabyte GA-7VA M/B.', 295.66, 42, 371, 306, '0517628405');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-04-2012', 'dd-mm-yyyy'), 1400, 'Elderly', 'story', 'Combo Intel P4 1.8Ghz retail CPU + Gigabyte GA-8IE533 M/B + Fan.', 271.71, 170, 372, 58, '0551908086');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-10-2008', 'dd-mm-yyyy'), 1800, 'Elderly', 'Lecture', 'Microsoft Office XP Small Business Edition', 85.06, 120, 373, 334, '0586357575');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-01-2004', 'dd-mm-yyyy'), 1900, 'Children', 'Lecture', 'Gigabyte GA-8IPE1000 Pro (intel 865PE Chipset) Pentium 4 ;DDR400 and FSB 800.', 224.18, 348, 374, 215, '0540024692');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-04-2001', 'dd-mm-yyyy'), 1800, 'Adults', 'play', '312B ATX Case 250W P4/AMD Ready Power Supply.', 23.4, 247, 375, 359, '0590081008');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-06-2010', 'dd-mm-yyyy'), 1330, 'Children and youth', 'educational activity', 'Cooler Master DP5-6J31C AMD Approved HeatSync.', 198.23, 51, 376, 148, '0572155588');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-11-2004', 'dd-mm-yyyy'), 1800, 'Elderly', 'performance', 'Logitech Optical Mouse', 63.7, 231, 377, 257, '0549451329');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-06-2007', 'dd-mm-yyyy'), 2000, 'Elderly', 'educational activity', 'GA-8LD533 Intel®845GL Chipset VC/SC/Lan.', 142.66, 169, 378, 120, '0501717471');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-05-2004', 'dd-mm-yyyy'), 1500, 'Adults', 'educational activity', 'Gigabyte GA-6VEML skt 370 M/B (With onboard sound and Video and Realtek Lan)', 104.32, 354, 379, 24, '0514569763');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('08-11-2001', 'dd-mm-yyyy'), 1330, 'Adults', 'story', 'AMD 1.3Ghz BareBone System Free Mouse', 152.29, 77, 380, 396, '0563808753');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('14-12-2006', 'dd-mm-yyyy'), 1300, 'Children', 'training', 'AMD XP 2200+ & GigaByte GA-7VA MB w/ 313M case. Free PS2 Mouse.', 154.49, 240, 381, 39, '0581721598');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-02-2012', 'dd-mm-yyyy'), 1000, 'Adults', 'educational activity', '10ft Cat 5 network cable w/RJ45 connectors', 112.67, 72, 382, 395, '0517951142');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-03-2002', 'dd-mm-yyyy'), 1330, 'Elderly', 'film screening', 'Intel D875PBZ M/B onboard S-ATA 150 + Intel Pentium 4 3.0Ghz; 800MHz FSB; Fan; Retail Box CPU/MB.', 237.82, 107, 383, 185, '0573308991');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('09-11-2003', 'dd-mm-yyyy'), 1900, 'Adults', 'story', 'Intel P4 1;6Ghz Bare Bone', 148.88, 127, 384, 303, '0554309626');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-04-2000', 'dd-mm-yyyy'), 2000, 'Adults', 'educational activity', '313H ATX 400w Case W/ case Fan P4/P3/AMD.', 262.8, 359, 385, 283, '0525603811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-04-2012', 'dd-mm-yyyy'), 1600, 'Elderly', 'workshop', 'AMD XP 1700+ & Gigabyte GA-7ZXE MB w/ 313N Case. W/ Free PS2 Mouse.', 182.53, 294, 386, 7, '0503530360');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-06-2010', 'dd-mm-yyyy'), 1430, 'Children', 'conversation with an author', 'CyberPower 525VA(525SL)', 54.1, 269, 387, 256, '0539842539');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('05-09-2011', 'dd-mm-yyyy'), 1930, 'Adults', 'educational activity', 'AMD XP 2700+ Retail box. (with 333Mhz Front Side Bus)', 125.15, 45, 388, 50, '0513390767');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('06-10-2010', 'dd-mm-yyyy'), 1500, 'Children', 'sports', 'Gigabyte GA-7VKMLE', 82.15, 84, 389, 65, '0558118082');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-09-2010', 'dd-mm-yyyy'), 1030, 'Children and youth', 'exhibition', 'ASUS P4C800 Deluxe Skt 478 Intel 875P (800MHZ FSB).', 174.9, 218, 390, 41, '0515610301');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-11-2010', 'dd-mm-yyyy'), 1930, 'Adults', 'sports', 'Intel Celeron 1.2Ghz & Gigabyte GA6VEML MB w/ 312J Color Case. W/ Free PS2 Mouse.', 36.17, 168, 391, 138, '0528971362');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('07-05-2012', 'dd-mm-yyyy'), 1030, 'Children and youth', 'story', 'Combo AMD XP 1800+ cpu Gigabyte GA-7VKMLE m/b fan.', 24.33, 257, 392, 326, '0510265838');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('03-01-2004', 'dd-mm-yyyy'), 1030, 'Elderly', 'educational activity', 'Combo AMD XP 2700+ CPU ASUS A7N8X Deluxe NVIDIA Force2', 137.52, 241, 393, 13, '0526529811');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-09-2008', 'dd-mm-yyyy'), 1730, 'Elderly', 'Lecture', 'Intel Celeron 2.2Ghz 478 pin Box cpu + fan', 173.59, 140, 394, 257, '0524063712');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('29-03-2013', 'dd-mm-yyyy'), 1600, 'Adults', 'sports', 'SVA-USA VR-17S 17" TFT LCD Display.', 223.01, 120, 395, 258, '0593215466');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-11-2012', 'dd-mm-yyyy'), 1930, 'Elderly', 'conversation with an author', 'Gigabyte GA-7NNXP MotherBoard w/ Nforce2 400 chipset.', 13.67, 184, 396, 148, '0514110655');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-02-2003', 'dd-mm-yyyy'), 1100, 'Elderly', 'play', 'Windows 2000 w/Service Pack 3(NEW) OEM Full Version LICENCED', 190.76, 230, 397, 230, '0519348146');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-08-2005', 'dd-mm-yyyy'), 1900, 'Youth', 'educational activity', 'AMD Duron 1.1/128M/30G Black Complete System.', 281.14, 195, 398, 201, '0551688545');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('15-02-2012', 'dd-mm-yyyy'), 1830, 'Youth', 'workshop', 'Biostar M6VCF MICRO ATX M/B(w/30 day D.O.A. warranty)', 151.07, 331, 399, 144, '0518799170');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('16-04-2005', 'dd-mm-yyyy'), 1030, 'Children', 'educational activity', 'YS AMD T-Bird 1.2 Ghz Performance Series', 288.01, 242, 400, 213, '0585435867');
commit;
prompt 400 records committed...
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-08-2015', 'dd-mm-yyyy'), 1600, 'Elderly', 'conversation with an author', 'Combo AMD XP 2500+ Biostar M7VIK Skt A MotherBoard; KT400.', 241.41, 167, 401, 374, '0532031018');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('22-11-2012', 'dd-mm-yyyy'), 1200, 'Elderly', 'conversation with an author', 'Combo AMD MP 1500+ Gigabyte GA-7DPXDW Dual CPU M/B +Fan (one cpu only)', 150.06, 309, 402, 93, '0544960010');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('18-08-2011', 'dd-mm-yyyy'), 1900, 'Youth', 'educational activity', 'CNet External 56k V.92 Fax modem (Serial).', 84.23, 202, 403, 180, '0572803395');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-01-2004', 'dd-mm-yyyy'), 1100, 'Children', 'volunteering', 'AMD XP 1800+ & Gigabyte GA-7VKML MB w/ 313M case W/ Free PS2 Mouse.', 273.25, 92, 404, 65, '0593646569');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('30-05-2003', 'dd-mm-yyyy'), 1030, 'Elderly', 'story', 'Combo Intel P4 2.4Ghz retail CPU + Gigabyte GA-8IE800 M/B + Fan.', 149.33, 108, 405, 251, '0572079258');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('13-09-2009', 'dd-mm-yyyy'), 1330, 'Elderly', 'educational activity', 'Microsoft Office 2000 Small Biz edition', 23.33, 159, 406, 407, '0595535243');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-11-2011', 'dd-mm-yyyy'), 1930, 'Adults', 'film screening', 'C Rimm', 174.2, 48, 407, 29, '0580265923');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-06-2005', 'dd-mm-yyyy'), 1000, 'Children', 'educational activity', 'Intel Pentium4 1.8ghz & Intel D845PESV MB w/ 313N Case. W/ Free PS2 Mouse.', 16.43, 96, 408, 440, '0526052352');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('23-02-2004', 'dd-mm-yyyy'), 1100, 'Children and youth', 'volunteering', 'Sony Black 16X DVD .', 67.39, 271, 409, 354, '0558118082');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('26-01-2015', 'dd-mm-yyyy'), 1500, 'Elderly', 'film screening', 'Biostar M7VKQ Duron 850Mhz B/B w/Video/Sound &10/100 LAN 312case.', 162.03, 191, 410, 86, '0587517709');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-02-2012', 'dd-mm-yyyy'), 1630, 'Youth', 'sports', 'Visioneer 5800 48bit USB Scanner XP compatable', 66.57, 78, 411, 397, '0510217105');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('21-05-2012', 'dd-mm-yyyy'), 1400, 'Children', 'performance', 'DVI to 15pin CRT adapter', 241.65, 127, 412, 202, '0534364781');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('11-10-2007', 'dd-mm-yyyy'), 1330, 'Children', 'educational activity', 'Combo AMD XP 2000+ cpu Gigabyte GA-7VKMLS m/b fan.', 175.68, 236, 413, 40, '0528971362');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('24-08-2003', 'dd-mm-yyyy'), 1200, 'Elderly', 'volunteering', 'Maxtor External 80Gb Hard drive USB&USB2', 250.56, 184, 414, 190, '0539290960');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-03-2010', 'dd-mm-yyyy'), 1400, 'Adults', 'performance', 'Combo Intel P4 1.8ghz Gigabyte GA-8LD533 m/b + fan.', 89.56, 119, 415, 40, '0501717471');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('28-11-2015', 'dd-mm-yyyy'), 1330, 'Children and youth', 'performance', 'GA-7N400L nForce 2 Ultra400 chipset.', 233.53, 211, 416, 359, '0523644741');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('17-05-2008', 'dd-mm-yyyy'), 1630, 'Children and youth', 'educational activity', 'Intel Pentium4 2.0ghz & Gigabyte GA-8LS533 MB w/ 313N Case. W/ Free PS2 Mouse.', 20.52, 204, 417, 182, '0542853203');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('27-07-2006', 'dd-mm-yyyy'), 1200, 'Elderly', 'training', 'AMR 56K V.90 Modem Riser Card', 152.54, 242, 418, 85, '0572803395');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('02-07-2014', 'dd-mm-yyyy'), 1200, 'Youth', 'conversation with an author', 'ADS External USB 2.0 Drive Kit', 15.51, 59, 419, 314, '0518799170');
insert into EVENT (edate, etime, audience, ecategory, activityd, price, duration, eid, hid, mainphone)
values (to_date('25-08-2002', 'dd-mm-yyyy'), 1500, 'Youth', 'educational activity', 'AMD Duron 1.3Ghz & Gigabyte GA-7VKMLE MB w/ 312D Color Case. W/ Free PS2 Mouse.', 32.45, 295, 420, 288, '0596377511');
commit;
prompt 420 records loaded
prompt Loading EVENT_OPERATOR...
insert into EVENT_OPERATOR (eid, mainphone)
values (97, '0508105606');
insert into EVENT_OPERATOR (eid, mainphone)
values (273, '0507590690');
insert into EVENT_OPERATOR (eid, mainphone)
values (163, '0580265923');
insert into EVENT_OPERATOR (eid, mainphone)
values (96, '0553376099');
insert into EVENT_OPERATOR (eid, mainphone)
values (277, '0520887051');
insert into EVENT_OPERATOR (eid, mainphone)
values (245, '0537353778');
insert into EVENT_OPERATOR (eid, mainphone)
values (381, '0514654972');
insert into EVENT_OPERATOR (eid, mainphone)
values (375, '0534952967');
insert into EVENT_OPERATOR (eid, mainphone)
values (201, '0578619490');
insert into EVENT_OPERATOR (eid, mainphone)
values (153, '0579600814');
insert into EVENT_OPERATOR (eid, mainphone)
values (138, '0533138647');
insert into EVENT_OPERATOR (eid, mainphone)
values (19, '0572798055');
insert into EVENT_OPERATOR (eid, mainphone)
values (92, '0576621676');
insert into EVENT_OPERATOR (eid, mainphone)
values (72, '0549751262');
insert into EVENT_OPERATOR (eid, mainphone)
values (265, '0584429699');
insert into EVENT_OPERATOR (eid, mainphone)
values (215, '0590610095');
insert into EVENT_OPERATOR (eid, mainphone)
values (221, '0580265923');
insert into EVENT_OPERATOR (eid, mainphone)
values (175, '0567026383');
insert into EVENT_OPERATOR (eid, mainphone)
values (112, '0512826130');
insert into EVENT_OPERATOR (eid, mainphone)
values (250, '0505343777');
insert into EVENT_OPERATOR (eid, mainphone)
values (152, '0554923177');
insert into EVENT_OPERATOR (eid, mainphone)
values (356, '0580248754');
insert into EVENT_OPERATOR (eid, mainphone)
values (357, '0540664848');
insert into EVENT_OPERATOR (eid, mainphone)
values (83, '0587334465');
insert into EVENT_OPERATOR (eid, mainphone)
values (193, '0531829931');
insert into EVENT_OPERATOR (eid, mainphone)
values (96, '0525260524');
insert into EVENT_OPERATOR (eid, mainphone)
values (376, '0583484009');
insert into EVENT_OPERATOR (eid, mainphone)
values (223, '0568067289');
insert into EVENT_OPERATOR (eid, mainphone)
values (360, '0564503705');
insert into EVENT_OPERATOR (eid, mainphone)
values (237, '0596527177');
insert into EVENT_OPERATOR (eid, mainphone)
values (270, '0516893830');
insert into EVENT_OPERATOR (eid, mainphone)
values (157, '0521769839');
insert into EVENT_OPERATOR (eid, mainphone)
values (205, '0581234609');
insert into EVENT_OPERATOR (eid, mainphone)
values (380, '0526057408');
insert into EVENT_OPERATOR (eid, mainphone)
values (387, '0550562109');
insert into EVENT_OPERATOR (eid, mainphone)
values (382, '0507234732');
insert into EVENT_OPERATOR (eid, mainphone)
values (353, '0505277047');
insert into EVENT_OPERATOR (eid, mainphone)
values (288, '0521662454');
insert into EVENT_OPERATOR (eid, mainphone)
values (35, '0588036430');
insert into EVENT_OPERATOR (eid, mainphone)
values (42, '0585000866');
insert into EVENT_OPERATOR (eid, mainphone)
values (280, '0593376704');
insert into EVENT_OPERATOR (eid, mainphone)
values (280, '0563849581');
insert into EVENT_OPERATOR (eid, mainphone)
values (4, '0569141143');
insert into EVENT_OPERATOR (eid, mainphone)
values (272, '0559874976');
insert into EVENT_OPERATOR (eid, mainphone)
values (323, '0549373007');
insert into EVENT_OPERATOR (eid, mainphone)
values (170, '0579600814');
insert into EVENT_OPERATOR (eid, mainphone)
values (67, '0576621676');
insert into EVENT_OPERATOR (eid, mainphone)
values (212, '0592988124');
insert into EVENT_OPERATOR (eid, mainphone)
values (351, '0522498540');
insert into EVENT_OPERATOR (eid, mainphone)
values (125, '0592502015');
insert into EVENT_OPERATOR (eid, mainphone)
values (299, '0595384820');
insert into EVENT_OPERATOR (eid, mainphone)
values (399, '0540842303');
insert into EVENT_OPERATOR (eid, mainphone)
values (146, '0563908416');
insert into EVENT_OPERATOR (eid, mainphone)
values (81, '0581113592');
insert into EVENT_OPERATOR (eid, mainphone)
values (305, '0506994224');
insert into EVENT_OPERATOR (eid, mainphone)
values (96, '0548486021');
insert into EVENT_OPERATOR (eid, mainphone)
values (230, '0513396514');
insert into EVENT_OPERATOR (eid, mainphone)
values (237, '0595065787');
insert into EVENT_OPERATOR (eid, mainphone)
values (173, '0558491298');
insert into EVENT_OPERATOR (eid, mainphone)
values (315, '0516884247');
insert into EVENT_OPERATOR (eid, mainphone)
values (197, '0542658043');
insert into EVENT_OPERATOR (eid, mainphone)
values (98, '0548486021');
insert into EVENT_OPERATOR (eid, mainphone)
values (180, '0585336833');
insert into EVENT_OPERATOR (eid, mainphone)
values (359, '0532214224');
insert into EVENT_OPERATOR (eid, mainphone)
values (9, '0569937375');
insert into EVENT_OPERATOR (eid, mainphone)
values (282, '0560036969');
insert into EVENT_OPERATOR (eid, mainphone)
values (110, '0514074719');
insert into EVENT_OPERATOR (eid, mainphone)
values (59, '0558349495');
insert into EVENT_OPERATOR (eid, mainphone)
values (64, '0521658484');
insert into EVENT_OPERATOR (eid, mainphone)
values (359, '0568811749');
insert into EVENT_OPERATOR (eid, mainphone)
values (276, '0506994224');
insert into EVENT_OPERATOR (eid, mainphone)
values (147, '0572798055');
insert into EVENT_OPERATOR (eid, mainphone)
values (27, '0516221965');
insert into EVENT_OPERATOR (eid, mainphone)
values (289, '0556742738');
insert into EVENT_OPERATOR (eid, mainphone)
values (48, '0547939892');
insert into EVENT_OPERATOR (eid, mainphone)
values (346, '0523077848');
insert into EVENT_OPERATOR (eid, mainphone)
values (203, '0582771375');
insert into EVENT_OPERATOR (eid, mainphone)
values (411, '0566568076');
insert into EVENT_OPERATOR (eid, mainphone)
values (195, '0552736660');
insert into EVENT_OPERATOR (eid, mainphone)
values (214, '0585175429');
insert into EVENT_OPERATOR (eid, mainphone)
values (6, '0580802384');
insert into EVENT_OPERATOR (eid, mainphone)
values (417, '0546937935');
insert into EVENT_OPERATOR (eid, mainphone)
values (196, '0592988124');
insert into EVENT_OPERATOR (eid, mainphone)
values (227, '0597307316');
insert into EVENT_OPERATOR (eid, mainphone)
values (228, '0590530612');
insert into EVENT_OPERATOR (eid, mainphone)
values (230, '0514474086');
insert into EVENT_OPERATOR (eid, mainphone)
values (219, '0539686928');
insert into EVENT_OPERATOR (eid, mainphone)
values (158, '0549215065');
insert into EVENT_OPERATOR (eid, mainphone)
values (289, '0516056811');
insert into EVENT_OPERATOR (eid, mainphone)
values (294, '0526010284');
insert into EVENT_OPERATOR (eid, mainphone)
values (165, '0552925526');
insert into EVENT_OPERATOR (eid, mainphone)
values (212, '0580486751');
insert into EVENT_OPERATOR (eid, mainphone)
values (148, '0510798407');
insert into EVENT_OPERATOR (eid, mainphone)
values (406, '0573308991');
insert into EVENT_OPERATOR (eid, mainphone)
values (18, '0593083669');
insert into EVENT_OPERATOR (eid, mainphone)
values (294, '0595233459');
insert into EVENT_OPERATOR (eid, mainphone)
values (126, '0537353778');
insert into EVENT_OPERATOR (eid, mainphone)
values (48, '0592988124');
insert into EVENT_OPERATOR (eid, mainphone)
values (204, '0513338215');
insert into EVENT_OPERATOR (eid, mainphone)
values (358, '0592988124');
commit;
prompt 100 records committed...
insert into EVENT_OPERATOR (eid, mainphone)
values (342, '0519585348');
insert into EVENT_OPERATOR (eid, mainphone)
values (225, '0561153057');
insert into EVENT_OPERATOR (eid, mainphone)
values (307, '0572915813');
insert into EVENT_OPERATOR (eid, mainphone)
values (149, '0587676181');
insert into EVENT_OPERATOR (eid, mainphone)
values (174, '0586953094');
insert into EVENT_OPERATOR (eid, mainphone)
values (64, '0505607425');
insert into EVENT_OPERATOR (eid, mainphone)
values (331, '0552281695');
insert into EVENT_OPERATOR (eid, mainphone)
values (27, '0516940381');
insert into EVENT_OPERATOR (eid, mainphone)
values (268, '0592502015');
insert into EVENT_OPERATOR (eid, mainphone)
values (379, '0586782213');
insert into EVENT_OPERATOR (eid, mainphone)
values (299, '0592988124');
insert into EVENT_OPERATOR (eid, mainphone)
values (334, '0510581976');
insert into EVENT_OPERATOR (eid, mainphone)
values (369, '0509563165');
insert into EVENT_OPERATOR (eid, mainphone)
values (331, '0518451940');
insert into EVENT_OPERATOR (eid, mainphone)
values (310, '0558349495');
insert into EVENT_OPERATOR (eid, mainphone)
values (175, '0574211067');
insert into EVENT_OPERATOR (eid, mainphone)
values (121, '0502050217');
insert into EVENT_OPERATOR (eid, mainphone)
values (201, '0548729179');
insert into EVENT_OPERATOR (eid, mainphone)
values (196, '0568526327');
insert into EVENT_OPERATOR (eid, mainphone)
values (201, '0508602088');
insert into EVENT_OPERATOR (eid, mainphone)
values (316, '0576378811');
insert into EVENT_OPERATOR (eid, mainphone)
values (205, '0520887051');
insert into EVENT_OPERATOR (eid, mainphone)
values (44, '0588036430');
insert into EVENT_OPERATOR (eid, mainphone)
values (174, '0526531825');
insert into EVENT_OPERATOR (eid, mainphone)
values (384, '0503213186');
insert into EVENT_OPERATOR (eid, mainphone)
values (375, '0507234732');
insert into EVENT_OPERATOR (eid, mainphone)
values (328, '0555970106');
insert into EVENT_OPERATOR (eid, mainphone)
values (129, '0532956656');
insert into EVENT_OPERATOR (eid, mainphone)
values (110, '0542369578');
insert into EVENT_OPERATOR (eid, mainphone)
values (272, '0592948508');
insert into EVENT_OPERATOR (eid, mainphone)
values (386, '0514074719');
insert into EVENT_OPERATOR (eid, mainphone)
values (93, '0582771375');
insert into EVENT_OPERATOR (eid, mainphone)
values (123, '0504416242');
insert into EVENT_OPERATOR (eid, mainphone)
values (178, '0566568076');
insert into EVENT_OPERATOR (eid, mainphone)
values (281, '0597214515');
insert into EVENT_OPERATOR (eid, mainphone)
values (31, '0532089288');
insert into EVENT_OPERATOR (eid, mainphone)
values (303, '0525260524');
insert into EVENT_OPERATOR (eid, mainphone)
values (15, '0577539321');
insert into EVENT_OPERATOR (eid, mainphone)
values (175, '0577929672');
insert into EVENT_OPERATOR (eid, mainphone)
values (45, '0546267936');
insert into EVENT_OPERATOR (eid, mainphone)
values (322, '0566399657');
insert into EVENT_OPERATOR (eid, mainphone)
values (181, '0590530612');
insert into EVENT_OPERATOR (eid, mainphone)
values (137, '0542988174');
insert into EVENT_OPERATOR (eid, mainphone)
values (373, '0540024692');
insert into EVENT_OPERATOR (eid, mainphone)
values (203, '0506161484');
insert into EVENT_OPERATOR (eid, mainphone)
values (94, '0501194171');
insert into EVENT_OPERATOR (eid, mainphone)
values (410, '0513338215');
insert into EVENT_OPERATOR (eid, mainphone)
values (372, '0509563165');
insert into EVENT_OPERATOR (eid, mainphone)
values (75, '0522421340');
insert into EVENT_OPERATOR (eid, mainphone)
values (339, '0578965979');
insert into EVENT_OPERATOR (eid, mainphone)
values (20, '0523532082');
insert into EVENT_OPERATOR (eid, mainphone)
values (259, '0543202091');
insert into EVENT_OPERATOR (eid, mainphone)
values (363, '0574997494');
insert into EVENT_OPERATOR (eid, mainphone)
values (10, '0582401507');
insert into EVENT_OPERATOR (eid, mainphone)
values (25, '0592502015');
insert into EVENT_OPERATOR (eid, mainphone)
values (144, '0592510004');
insert into EVENT_OPERATOR (eid, mainphone)
values (338, '0582401507');
insert into EVENT_OPERATOR (eid, mainphone)
values (168, '0547205186');
insert into EVENT_OPERATOR (eid, mainphone)
values (79, '0585506285');
insert into EVENT_OPERATOR (eid, mainphone)
values (138, '0582663637');
insert into EVENT_OPERATOR (eid, mainphone)
values (38, '0502917695');
insert into EVENT_OPERATOR (eid, mainphone)
values (392, '0528709917');
insert into EVENT_OPERATOR (eid, mainphone)
values (58, '0595065787');
insert into EVENT_OPERATOR (eid, mainphone)
values (285, '0506994224');
insert into EVENT_OPERATOR (eid, mainphone)
values (128, '0558349495');
insert into EVENT_OPERATOR (eid, mainphone)
values (193, '0535215553');
insert into EVENT_OPERATOR (eid, mainphone)
values (33, '0596527177');
insert into EVENT_OPERATOR (eid, mainphone)
values (302, '0588696385');
insert into EVENT_OPERATOR (eid, mainphone)
values (98, '0528291399');
insert into EVENT_OPERATOR (eid, mainphone)
values (237, '0500454771');
insert into EVENT_OPERATOR (eid, mainphone)
values (268, '0523532082');
insert into EVENT_OPERATOR (eid, mainphone)
values (399, '0576504473');
insert into EVENT_OPERATOR (eid, mainphone)
values (272, '0540169478');
insert into EVENT_OPERATOR (eid, mainphone)
values (31, '0554272966');
insert into EVENT_OPERATOR (eid, mainphone)
values (410, '0540469018');
insert into EVENT_OPERATOR (eid, mainphone)
values (235, '0542853203');
insert into EVENT_OPERATOR (eid, mainphone)
values (61, '0544524116');
insert into EVENT_OPERATOR (eid, mainphone)
values (37, '0546399937');
insert into EVENT_OPERATOR (eid, mainphone)
values (372, '0594913266');
insert into EVENT_OPERATOR (eid, mainphone)
values (210, '0532833235');
insert into EVENT_OPERATOR (eid, mainphone)
values (23, '0526010284');
insert into EVENT_OPERATOR (eid, mainphone)
values (252, '0597992618');
insert into EVENT_OPERATOR (eid, mainphone)
values (419, '0533138647');
insert into EVENT_OPERATOR (eid, mainphone)
values (54, '0533096673');
insert into EVENT_OPERATOR (eid, mainphone)
values (168, '0554731443');
insert into EVENT_OPERATOR (eid, mainphone)
values (278, '0531986417');
insert into EVENT_OPERATOR (eid, mainphone)
values (10, '0569139556');
insert into EVENT_OPERATOR (eid, mainphone)
values (170, '0513827416');
insert into EVENT_OPERATOR (eid, mainphone)
values (392, '0549215065');
insert into EVENT_OPERATOR (eid, mainphone)
values (49, '0505343777');
insert into EVENT_OPERATOR (eid, mainphone)
values (26, '0588696385');
insert into EVENT_OPERATOR (eid, mainphone)
values (275, '0523077848');
insert into EVENT_OPERATOR (eid, mainphone)
values (95, '0565899890');
insert into EVENT_OPERATOR (eid, mainphone)
values (372, '0584429699');
insert into EVENT_OPERATOR (eid, mainphone)
values (408, '0578619490');
insert into EVENT_OPERATOR (eid, mainphone)
values (378, '0520183255');
insert into EVENT_OPERATOR (eid, mainphone)
values (344, '0554272966');
insert into EVENT_OPERATOR (eid, mainphone)
values (353, '0531829931');
insert into EVENT_OPERATOR (eid, mainphone)
values (342, '0597307316');
insert into EVENT_OPERATOR (eid, mainphone)
values (313, '0517686361');
commit;
prompt 200 records committed...
insert into EVENT_OPERATOR (eid, mainphone)
values (188, '0538315198');
insert into EVENT_OPERATOR (eid, mainphone)
values (90, '0595384820');
insert into EVENT_OPERATOR (eid, mainphone)
values (146, '0599637996');
insert into EVENT_OPERATOR (eid, mainphone)
values (347, '0521658484');
insert into EVENT_OPERATOR (eid, mainphone)
values (131, '0595233459');
insert into EVENT_OPERATOR (eid, mainphone)
values (245, '0542287074');
insert into EVENT_OPERATOR (eid, mainphone)
values (245, '0592719496');
insert into EVENT_OPERATOR (eid, mainphone)
values (349, '0584429699');
insert into EVENT_OPERATOR (eid, mainphone)
values (178, '0599687457');
insert into EVENT_OPERATOR (eid, mainphone)
values (175, '0502776079');
insert into EVENT_OPERATOR (eid, mainphone)
values (174, '0516056811');
insert into EVENT_OPERATOR (eid, mainphone)
values (27, '0515320052');
insert into EVENT_OPERATOR (eid, mainphone)
values (5, '0523247419');
insert into EVENT_OPERATOR (eid, mainphone)
values (75, '0557863783');
insert into EVENT_OPERATOR (eid, mainphone)
values (126, '0580486751');
insert into EVENT_OPERATOR (eid, mainphone)
values (252, '0505607425');
insert into EVENT_OPERATOR (eid, mainphone)
values (412, '0519348146');
insert into EVENT_OPERATOR (eid, mainphone)
values (1, '0560617077');
insert into EVENT_OPERATOR (eid, mainphone)
values (5, '0565581113');
insert into EVENT_OPERATOR (eid, mainphone)
values (407, '0595024322');
insert into EVENT_OPERATOR (eid, mainphone)
values (191, '0555709048');
insert into EVENT_OPERATOR (eid, mainphone)
values (387, '0518451940');
insert into EVENT_OPERATOR (eid, mainphone)
values (187, '0531986417');
insert into EVENT_OPERATOR (eid, mainphone)
values (184, '0520181879');
insert into EVENT_OPERATOR (eid, mainphone)
values (148, '0592791003');
insert into EVENT_OPERATOR (eid, mainphone)
values (279, '0538315198');
insert into EVENT_OPERATOR (eid, mainphone)
values (208, '0532415008');
insert into EVENT_OPERATOR (eid, mainphone)
values (344, '0512045690');
insert into EVENT_OPERATOR (eid, mainphone)
values (23, '0502050217');
insert into EVENT_OPERATOR (eid, mainphone)
values (4, '0556551340');
insert into EVENT_OPERATOR (eid, mainphone)
values (415, '0592719496');
insert into EVENT_OPERATOR (eid, mainphone)
values (364, '0599222124');
insert into EVENT_OPERATOR (eid, mainphone)
values (48, '0549377200');
insert into EVENT_OPERATOR (eid, mainphone)
values (298, '0502776079');
insert into EVENT_OPERATOR (eid, mainphone)
values (286, '0543202091');
insert into EVENT_OPERATOR (eid, mainphone)
values (98, '0533096673');
insert into EVENT_OPERATOR (eid, mainphone)
values (17, '0588066007');
insert into EVENT_OPERATOR (eid, mainphone)
values (134, '0554923177');
insert into EVENT_OPERATOR (eid, mainphone)
values (409, '0550226706');
insert into EVENT_OPERATOR (eid, mainphone)
values (56, '0582401507');
insert into EVENT_OPERATOR (eid, mainphone)
values (210, '0510359446');
insert into EVENT_OPERATOR (eid, mainphone)
values (322, '0561981808');
insert into EVENT_OPERATOR (eid, mainphone)
values (265, '0568811749');
insert into EVENT_OPERATOR (eid, mainphone)
values (164, '0532089288');
insert into EVENT_OPERATOR (eid, mainphone)
values (47, '0515320052');
insert into EVENT_OPERATOR (eid, mainphone)
values (78, '0593376704');
insert into EVENT_OPERATOR (eid, mainphone)
values (362, '0552925526');
insert into EVENT_OPERATOR (eid, mainphone)
values (203, '0586953094');
insert into EVENT_OPERATOR (eid, mainphone)
values (376, '0587736537');
insert into EVENT_OPERATOR (eid, mainphone)
values (120, '0516999870');
insert into EVENT_OPERATOR (eid, mainphone)
values (274, '0595065787');
insert into EVENT_OPERATOR (eid, mainphone)
values (324, '0526111872');
insert into EVENT_OPERATOR (eid, mainphone)
values (400, '0554627156');
insert into EVENT_OPERATOR (eid, mainphone)
values (268, '0572915813');
insert into EVENT_OPERATOR (eid, mainphone)
values (31, '0525260524');
insert into EVENT_OPERATOR (eid, mainphone)
values (171, '0575480737');
insert into EVENT_OPERATOR (eid, mainphone)
values (288, '0501889391');
insert into EVENT_OPERATOR (eid, mainphone)
values (17, '0550562109');
insert into EVENT_OPERATOR (eid, mainphone)
values (256, '0518718822');
insert into EVENT_OPERATOR (eid, mainphone)
values (200, '0538900053');
insert into EVENT_OPERATOR (eid, mainphone)
values (277, '0571739539');
insert into EVENT_OPERATOR (eid, mainphone)
values (403, '0528291399');
insert into EVENT_OPERATOR (eid, mainphone)
values (18, '0511338139');
insert into EVENT_OPERATOR (eid, mainphone)
values (98, '0501194171');
insert into EVENT_OPERATOR (eid, mainphone)
values (10, '0553616105');
insert into EVENT_OPERATOR (eid, mainphone)
values (12, '0550776802');
insert into EVENT_OPERATOR (eid, mainphone)
values (382, '0550035618');
insert into EVENT_OPERATOR (eid, mainphone)
values (152, '0510392833');
insert into EVENT_OPERATOR (eid, mainphone)
values (206, '0513727962');
insert into EVENT_OPERATOR (eid, mainphone)
values (254, '0591082024');
insert into EVENT_OPERATOR (eid, mainphone)
values (216, '0547752542');
insert into EVENT_OPERATOR (eid, mainphone)
values (139, '0513727962');
insert into EVENT_OPERATOR (eid, mainphone)
values (368, '0554731443');
insert into EVENT_OPERATOR (eid, mainphone)
values (166, '0595384820');
insert into EVENT_OPERATOR (eid, mainphone)
values (211, '0597214515');
insert into EVENT_OPERATOR (eid, mainphone)
values (330, '0536663472');
insert into EVENT_OPERATOR (eid, mainphone)
values (92, '0543202091');
insert into EVENT_OPERATOR (eid, mainphone)
values (59, '0566399657');
insert into EVENT_OPERATOR (eid, mainphone)
values (1, '0522498540');
insert into EVENT_OPERATOR (eid, mainphone)
values (13, '0588036430');
insert into EVENT_OPERATOR (eid, mainphone)
values (186, '0552127026');
insert into EVENT_OPERATOR (eid, mainphone)
values (153, '0522498540');
insert into EVENT_OPERATOR (eid, mainphone)
values (134, '0529569517');
insert into EVENT_OPERATOR (eid, mainphone)
values (228, '0595065787');
insert into EVENT_OPERATOR (eid, mainphone)
values (247, '0546345940');
insert into EVENT_OPERATOR (eid, mainphone)
values (77, '0566568076');
insert into EVENT_OPERATOR (eid, mainphone)
values (89, '0547752542');
insert into EVENT_OPERATOR (eid, mainphone)
values (242, '0540842303');
insert into EVENT_OPERATOR (eid, mainphone)
values (257, '0506259273');
insert into EVENT_OPERATOR (eid, mainphone)
values (75, '0580373266');
insert into EVENT_OPERATOR (eid, mainphone)
values (295, '0528021876');
insert into EVENT_OPERATOR (eid, mainphone)
values (338, '0505085584');
insert into EVENT_OPERATOR (eid, mainphone)
values (310, '0523532082');
insert into EVENT_OPERATOR (eid, mainphone)
values (140, '0573308991');
insert into EVENT_OPERATOR (eid, mainphone)
values (202, '0523532082');
insert into EVENT_OPERATOR (eid, mainphone)
values (22, '0585000866');
insert into EVENT_OPERATOR (eid, mainphone)
values (163, '0531986417');
insert into EVENT_OPERATOR (eid, mainphone)
values (12, '0520181879');
insert into EVENT_OPERATOR (eid, mainphone)
values (355, '0558491298');
insert into EVENT_OPERATOR (eid, mainphone)
values (25, '0549377200');
commit;
prompt 300 records committed...
insert into EVENT_OPERATOR (eid, mainphone)
values (272, '0516940381');
insert into EVENT_OPERATOR (eid, mainphone)
values (46, '0502917695');
insert into EVENT_OPERATOR (eid, mainphone)
values (93, '0561893317');
insert into EVENT_OPERATOR (eid, mainphone)
values (138, '0506093412');
insert into EVENT_OPERATOR (eid, mainphone)
values (139, '0586736939');
insert into EVENT_OPERATOR (eid, mainphone)
values (420, '0561981808');
insert into EVENT_OPERATOR (eid, mainphone)
values (99, '0598800052');
insert into EVENT_OPERATOR (eid, mainphone)
values (16, '0541900669');
insert into EVENT_OPERATOR (eid, mainphone)
values (238, '0548729179');
insert into EVENT_OPERATOR (eid, mainphone)
values (377, '0523077848');
insert into EVENT_OPERATOR (eid, mainphone)
values (149, '0538315198');
insert into EVENT_OPERATOR (eid, mainphone)
values (418, '0518718822');
insert into EVENT_OPERATOR (eid, mainphone)
values (417, '0541900669');
insert into EVENT_OPERATOR (eid, mainphone)
values (5, '0548486021');
insert into EVENT_OPERATOR (eid, mainphone)
values (37, '0518718822');
insert into EVENT_OPERATOR (eid, mainphone)
values (282, '0569937375');
insert into EVENT_OPERATOR (eid, mainphone)
values (193, '0556742738');
insert into EVENT_OPERATOR (eid, mainphone)
values (369, '0560617077');
insert into EVENT_OPERATOR (eid, mainphone)
values (313, '0528709917');
insert into EVENT_OPERATOR (eid, mainphone)
values (124, '0521834270');
insert into EVENT_OPERATOR (eid, mainphone)
values (149, '0532089288');
insert into EVENT_OPERATOR (eid, mainphone)
values (311, '0505085584');
insert into EVENT_OPERATOR (eid, mainphone)
values (326, '0595065787');
insert into EVENT_OPERATOR (eid, mainphone)
values (3, '0536663472');
insert into EVENT_OPERATOR (eid, mainphone)
values (185, '0514654972');
insert into EVENT_OPERATOR (eid, mainphone)
values (407, '0594913266');
insert into EVENT_OPERATOR (eid, mainphone)
values (270, '0543819549');
insert into EVENT_OPERATOR (eid, mainphone)
values (29, '0527835242');
insert into EVENT_OPERATOR (eid, mainphone)
values (115, '0593148948');
insert into EVENT_OPERATOR (eid, mainphone)
values (241, '0568591784');
insert into EVENT_OPERATOR (eid, mainphone)
values (120, '0518718822');
insert into EVENT_OPERATOR (eid, mainphone)
values (67, '0507590690');
insert into EVENT_OPERATOR (eid, mainphone)
values (86, '0548473473');
insert into EVENT_OPERATOR (eid, mainphone)
values (317, '0560036969');
insert into EVENT_OPERATOR (eid, mainphone)
values (51, '0592988124');
insert into EVENT_OPERATOR (eid, mainphone)
values (291, '0521769839');
insert into EVENT_OPERATOR (eid, mainphone)
values (380, '0561153057');
insert into EVENT_OPERATOR (eid, mainphone)
values (226, '0523725837');
insert into EVENT_OPERATOR (eid, mainphone)
values (266, '0521769839');
insert into EVENT_OPERATOR (eid, mainphone)
values (102, '0532214224');
insert into EVENT_OPERATOR (eid, mainphone)
values (201, '0579600814');
insert into EVENT_OPERATOR (eid, mainphone)
values (185, '0562938318');
insert into EVENT_OPERATOR (eid, mainphone)
values (213, '0585938946');
insert into EVENT_OPERATOR (eid, mainphone)
values (1, '0546399937');
insert into EVENT_OPERATOR (eid, mainphone)
values (61, '0598854980');
insert into EVENT_OPERATOR (eid, mainphone)
values (100, '0516056811');
insert into EVENT_OPERATOR (eid, mainphone)
values (135, '0594835754');
insert into EVENT_OPERATOR (eid, mainphone)
values (131, '0521658484');
insert into EVENT_OPERATOR (eid, mainphone)
values (190, '0520181879');
insert into EVENT_OPERATOR (eid, mainphone)
values (323, '0516691142');
insert into EVENT_OPERATOR (eid, mainphone)
values (347, '0543202091');
insert into EVENT_OPERATOR (eid, mainphone)
values (106, '0552736660');
insert into EVENT_OPERATOR (eid, mainphone)
values (34, '0510581976');
insert into EVENT_OPERATOR (eid, mainphone)
values (336, '0545042516');
insert into EVENT_OPERATOR (eid, mainphone)
values (319, '0591082024');
insert into EVENT_OPERATOR (eid, mainphone)
values (126, '0599222124');
insert into EVENT_OPERATOR (eid, mainphone)
values (86, '0554898210');
insert into EVENT_OPERATOR (eid, mainphone)
values (410, '0576504473');
insert into EVENT_OPERATOR (eid, mainphone)
values (101, '0561407477');
insert into EVENT_OPERATOR (eid, mainphone)
values (15, '0528291399');
insert into EVENT_OPERATOR (eid, mainphone)
values (171, '0521662454');
insert into EVENT_OPERATOR (eid, mainphone)
values (336, '0523247419');
insert into EVENT_OPERATOR (eid, mainphone)
values (301, '0506161484');
insert into EVENT_OPERATOR (eid, mainphone)
values (396, '0592502015');
insert into EVENT_OPERATOR (eid, mainphone)
values (69, '0538826047');
insert into EVENT_OPERATOR (eid, mainphone)
values (300, '0518432457');
insert into EVENT_OPERATOR (eid, mainphone)
values (202, '0533138647');
insert into EVENT_OPERATOR (eid, mainphone)
values (96, '0553616105');
insert into EVENT_OPERATOR (eid, mainphone)
values (371, '0592791003');
insert into EVENT_OPERATOR (eid, mainphone)
values (86, '0530392320');
insert into EVENT_OPERATOR (eid, mainphone)
values (314, '0548486021');
insert into EVENT_OPERATOR (eid, mainphone)
values (311, '0516056811');
insert into EVENT_OPERATOR (eid, mainphone)
values (220, '0566568076');
insert into EVENT_OPERATOR (eid, mainphone)
values (1, '0514641959');
insert into EVENT_OPERATOR (eid, mainphone)
values (122, '0575099602');
insert into EVENT_OPERATOR (eid, mainphone)
values (390, '0558349495');
insert into EVENT_OPERATOR (eid, mainphone)
values (317, '0522421340');
insert into EVENT_OPERATOR (eid, mainphone)
values (132, '0519585348');
insert into EVENT_OPERATOR (eid, mainphone)
values (268, '0545042516');
insert into EVENT_OPERATOR (eid, mainphone)
values (367, '0516893830');
insert into EVENT_OPERATOR (eid, mainphone)
values (291, '0546399937');
insert into EVENT_OPERATOR (eid, mainphone)
values (63, '0580265923');
insert into EVENT_OPERATOR (eid, mainphone)
values (357, '0518432457');
insert into EVENT_OPERATOR (eid, mainphone)
values (162, '0540146203');
insert into EVENT_OPERATOR (eid, mainphone)
values (84, '0520887051');
insert into EVENT_OPERATOR (eid, mainphone)
values (290, '0513396514');
insert into EVENT_OPERATOR (eid, mainphone)
values (349, '0592510004');
insert into EVENT_OPERATOR (eid, mainphone)
values (63, '0557948814');
insert into EVENT_OPERATOR (eid, mainphone)
values (307, '0538826047');
insert into EVENT_OPERATOR (eid, mainphone)
values (299, '0561981808');
insert into EVENT_OPERATOR (eid, mainphone)
values (97, '0516940381');
insert into EVENT_OPERATOR (eid, mainphone)
values (399, '0533096673');
insert into EVENT_OPERATOR (eid, mainphone)
values (322, '0572915813');
insert into EVENT_OPERATOR (eid, mainphone)
values (42, '0506170828');
insert into EVENT_OPERATOR (eid, mainphone)
values (371, '0561981808');
insert into EVENT_OPERATOR (eid, mainphone)
values (396, '0594317775');
insert into EVENT_OPERATOR (eid, mainphone)
values (329, '0555493632');
insert into EVENT_OPERATOR (eid, mainphone)
values (170, '0502050217');
insert into EVENT_OPERATOR (eid, mainphone)
values (348, '0508602088');
insert into EVENT_OPERATOR (eid, mainphone)
values (1, '0522670596');
commit;
prompt 400 records committed...
insert into EVENT_OPERATOR (eid, mainphone)
values (339, '0527835242');
insert into EVENT_OPERATOR (eid, mainphone)
values (192, '0595024322');
insert into EVENT_OPERATOR (eid, mainphone)
values (372, '0505607425');
insert into EVENT_OPERATOR (eid, mainphone)
values (52, '0551884272');
insert into EVENT_OPERATOR (eid, mainphone)
values (217, '0549377200');
insert into EVENT_OPERATOR (eid, mainphone)
values (27, '0551313015');
insert into EVENT_OPERATOR (eid, mainphone)
values (332, '0532089288');
insert into EVENT_OPERATOR (eid, mainphone)
values (375, '0514591560');
insert into EVENT_OPERATOR (eid, mainphone)
values (386, '0595024322');
insert into EVENT_OPERATOR (eid, mainphone)
values (315, '0583324755');
insert into EVENT_OPERATOR (eid, mainphone)
values (379, '0569913037');
insert into EVENT_OPERATOR (eid, mainphone)
values (3, '0572798055');
insert into EVENT_OPERATOR (eid, mainphone)
values (238, '0585506285');
insert into EVENT_OPERATOR (eid, mainphone)
values (239, '0588036430');
insert into EVENT_OPERATOR (eid, mainphone)
values (194, '0521495830');
insert into EVENT_OPERATOR (eid, mainphone)
values (369, '0533138647');
insert into EVENT_OPERATOR (eid, mainphone)
values (158, '0506792949');
insert into EVENT_OPERATOR (eid, mainphone)
values (412, '0597992618');
insert into EVENT_OPERATOR (eid, mainphone)
values (177, '0599222124');
insert into EVENT_OPERATOR (eid, mainphone)
values (117, '0590918086');
insert into EVENT_OPERATOR (eid, mainphone)
values (404, '0580265923');
insert into EVENT_OPERATOR (eid, mainphone)
values (330, '0550562109');
insert into EVENT_OPERATOR (eid, mainphone)
values (347, '0526111872');
insert into EVENT_OPERATOR (eid, mainphone)
values (25, '0507590690');
insert into EVENT_OPERATOR (eid, mainphone)
values (241, '0516893830');
insert into EVENT_OPERATOR (eid, mainphone)
values (48, '0573981190');
insert into EVENT_OPERATOR (eid, mainphone)
values (326, '0585506285');
insert into EVENT_OPERATOR (eid, mainphone)
values (394, '0538900053');
insert into EVENT_OPERATOR (eid, mainphone)
values (239, '0540056731');
insert into EVENT_OPERATOR (eid, mainphone)
values (210, '0558118082');
insert into EVENT_OPERATOR (eid, mainphone)
values (392, '0535215553');
insert into EVENT_OPERATOR (eid, mainphone)
values (136, '0558349495');
insert into EVENT_OPERATOR (eid, mainphone)
values (195, '0538315198');
insert into EVENT_OPERATOR (eid, mainphone)
values (419, '0574211067');
insert into EVENT_OPERATOR (eid, mainphone)
values (250, '0549377200');
insert into EVENT_OPERATOR (eid, mainphone)
values (100, '0546937935');
insert into EVENT_OPERATOR (eid, mainphone)
values (224, '0587334465');
insert into EVENT_OPERATOR (eid, mainphone)
values (153, '0594913266');
insert into EVENT_OPERATOR (eid, mainphone)
values (144, '0518432457');
insert into EVENT_OPERATOR (eid, mainphone)
values (114, '0538315198');
insert into EVENT_OPERATOR (eid, mainphone)
values (415, '0512235238');
insert into EVENT_OPERATOR (eid, mainphone)
values (131, '0516940381');
insert into EVENT_OPERATOR (eid, mainphone)
values (98, '0505607425');
insert into EVENT_OPERATOR (eid, mainphone)
values (260, '0594835754');
insert into EVENT_OPERATOR (eid, mainphone)
values (296, '0558349495');
insert into EVENT_OPERATOR (eid, mainphone)
values (345, '0521079976');
insert into EVENT_OPERATOR (eid, mainphone)
values (237, '0556742738');
insert into EVENT_OPERATOR (eid, mainphone)
values (71, '0513396514');
insert into EVENT_OPERATOR (eid, mainphone)
values (219, '0573981190');
commit;
prompt 449 records loaded
prompt Loading PARTICIPANT...
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jody50', 86447459, 'not_subscriber', '0521558639');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Brothers98', 38493631, 'not_subscriber', '0507473966');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Connie66', 92018778, 'subscription', '0515943261');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Peter23', 25134364, 'subscription', '0521658484');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Will50', 31777361, 'subscription', '0568196519');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jet88', 40163453, 'subscription', '0543585977');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Elias17', 50426081, 'subscription', '0590081008');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jessica18', 98760047, 'not_subscriber', '0557702023');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Marlon85', 97880626, 'subscription', '0577808997');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sammy15', 31993843, 'not_subscriber', '0503332151');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lance73', 67910572, 'not_subscriber', '0547840019');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Winona11', 11745198, 'subscription', '0558664403');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jane88', 72187571, 'not_subscriber', '0576184662');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Barbara69', 27943495, 'not_subscriber', '0501667138');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mickey91', 1472886, 'not_subscriber', '0511653827');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nick29', 67934723, 'not_subscriber', '0568532597');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Denzel91', 36342735, 'subscription', '0583773968');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Orlando96', 75464182, 'subscription', '0506622466');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mary22', 98524854, 'not_subscriber', '0507320576');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gary07', 90435267, 'not_subscriber', '0571591241');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rosco01', 55094730, 'subscription', '0561507428');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Desmond99', 96480259, 'not_subscriber', '0584218123');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rosco04', 15254940, 'not_subscriber', '0587020408');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Renee88', 27454076, 'subscription', '0506161484');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Thin14', 84396039, 'subscription', '0571588597');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rosario49', 9336897, 'subscription', '0554333345');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Louise42', 64012415, 'not_subscriber', '0509879038');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Veruca90', 39906620, 'subscription', '0551000200');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sander09', 10621578, 'subscription', '0544524116');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lizzy91', 31817079, 'subscription', '0500076402');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Grant24', 94310291, 'subscription', '0520434408');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Larnelle61', 70792957, 'not_subscriber', '0565579161');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nathan54', 20706000, 'not_subscriber', '0580244698');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Marina83', 66327342, 'subscription', '0532006802');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jackie40', 3446997, 'subscription', '0587867493');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Vern19', 95142851, 'subscription', '0509398922');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Avril12', 4499744, 'not_subscriber', '0590145621');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Drew78', 65352268, 'subscription', '0596273264');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Brooke42', 78546811, 'not_subscriber', '0597296185');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gena94', 51529637, 'subscription', '0544873234');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Helen58', 87243846, 'not_subscriber', '0539969104');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ethan66', 78477728, 'not_subscriber', '0596148854');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Patricia70', 71119039, 'subscription', '0592139791');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lauren69', 54552843, 'subscription', '0526052352');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rascal65', 94363491, 'subscription', '0564474356');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('France70', 80882872, 'subscription', '0541247569');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Trini16', 1135946, 'not_subscriber', '0526843229');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Geggy96', 89089553, 'not_subscriber', '0512826130');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Johnny43', 46480316, 'subscription', '0513424470');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Avril73', 82800871, 'subscription', '0531248552');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ming-Na22', 93229432, 'subscription', '0512226967');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jean-Luc09', 85414526, 'not_subscriber', '0585967894');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rowan38', 86243468, 'not_subscriber', '0504853332');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Trini01', 20448414, 'not_subscriber', '0512884376');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Miles82', 44806466, 'not_subscriber', '0571086012');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sandra80', 75489061, 'not_subscriber', '0534391633');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stellan10', 36779408, 'subscription', '0583484009');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Juan49', 27823942, 'not_subscriber', '0585745777');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lynn26', 23683264, 'not_subscriber', '0540761780');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Burton60', 30818619, 'not_subscriber', '0504391808');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jim73', 90260463, 'not_subscriber', '0571968263');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stevie68', 90374649, 'not_subscriber', '0506259273');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nils78', 98538217, 'subscription', '0543195030');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Merrilee71', 81179186, 'not_subscriber', '0535499232');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Roscoe56', 29192134, 'not_subscriber', '0581812792');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Paula67', 79532218, 'subscription', '0517303523');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Alessandro46', 283573, 'subscription', '0588687796');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Coley47', 15312389, 'subscription', '0508092702');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ali54', 77319150, 'not_subscriber', '0535268135');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Meryl22', 68217315, 'not_subscriber', '0525954920');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Barbara59', 13555866, 'subscription', '0543227853');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Devon74', 61589368, 'subscription', '0556990071');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lionel29', 83450269, 'not_subscriber', '0532074703');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Albert76', 28212832, 'subscription', '0543185060');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Fred34', 1325096, 'subscription', '0512495200');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mike57', 51543391, 'subscription', '0503066383');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Temuera03', 35201839, 'subscription', '0523943119');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Shannyn12', 8305877, 'not_subscriber', '0528044413');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Woody35', 59122658, 'not_subscriber', '0549019530');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Davey10', 63171218, 'not_subscriber', '0573585596');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Fats19', 4560097, 'not_subscriber', '0540063616');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Oro55', 93898520, 'not_subscriber', '0567087919');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Maceo51', 1688021, 'not_subscriber', '0517017524');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Elvis41', 46503225, 'subscription', '0501327038');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Fiona79', 24762227, 'not_subscriber', '0550529379');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lucy93', 48187281, 'subscription', '0530325327');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Talvin10', 79634159, 'subscription', '0555638079');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Larry38', 29842264, 'not_subscriber', '0508890461');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sigourney63', 98296164, 'not_subscriber', '0506289997');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tara01', 33511376, 'subscription', '0571265425');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kirsten81', 29031732, 'subscription', '0520516674');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rosario01', 7571285, 'not_subscriber', '0580373266');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Vern06', 36319149, 'subscription', '0520181879');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Carrie33', 50312011, 'not_subscriber', '0596416460');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Suzy10', 9029701, 'subscription', '0516940381');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Murray85', 28595030, 'subscription', '0576193712');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jonatha45', 46206600, 'not_subscriber', '0567257883');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Bill35', 20188564, 'subscription', '0587561178');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jason13', 48758506, 'subscription', '0592510004');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Bonnie62', 45850324, 'not_subscriber', '0569464555');
commit;
prompt 100 records committed...
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Susan55', 32466308, 'not_subscriber', '0583331407');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ralph30', 33497680, 'not_subscriber', '0598759179');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Trini31', 58014142, 'subscription', '0512314721');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jimmie33', 72549015, 'not_subscriber', '0556326933');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Leo10', 80316244, 'not_subscriber', '0526756508');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Isaiah21', 77157552, 'subscription', '0589008587');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Steven45', 97251118, 'subscription', '0546101500');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('CeCe24', 71186111, 'subscription', '0500454771');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Leon10', 24938976, 'subscription', '0501194171');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jose16', 35046206, 'subscription', '0597214515');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ned45', 50373371, 'subscription', '0545486830');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Anita50', 77699950, 'not_subscriber', '0524927249');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rosco01', 39392969, 'not_subscriber', '0518889575');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Maura32', 23798179, 'not_subscriber', '0577661021');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Wayne83', 99454392, 'subscription', '0505085584');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Loreena93', 28403253, 'subscription', '0518339502');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lesley53', 26042078, 'subscription', '0564591647');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Emilio84', 60519953, 'subscription', '0587201180');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Randy96', 81826086, 'subscription', '0589262650');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Edgar69', 17732929, 'subscription', '0518169431');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ralph52', 88153789, 'not_subscriber', '0583210305');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Meredith66', 61424128, 'subscription', '0524180227');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ray72', 27236393, 'not_subscriber', '0553509838');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rebeka92', 87718631, 'subscription', '0541900669');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ritchie40', 83666213, 'subscription', '0547205186');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Irene20', 71482359, 'subscription', '0515342330');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Phoebe24', 76875654, 'subscription', '0568819541');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nicky61', 48670058, 'subscription', '0568526327');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tommy32', 83971729, 'subscription', '0585435867');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Julio15', 66681961, 'subscription', '0548627994');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Benjamin32', 41691687, 'subscription', '0552873066');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Judd03', 94753862, 'subscription', '0583324755');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kid25', 65564204, 'not_subscriber', '0572079258');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Noah77', 59280054, 'subscription', '0509619309');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jared59', 42720216, 'subscription', '0586473713');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Anna45', 11485301, 'subscription', '0524583588');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Vondie13', 4174803, 'not_subscriber', '0592248811');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jonny Lee94', 70783632, 'not_subscriber', '0526705144');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Freddie13', 13294774, 'subscription', '0546894229');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Graham70', 35964664, 'not_subscriber', '0569212142');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Edgar58', 58392746, 'subscription', '0558027286');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nile98', 74695057, 'not_subscriber', '0575655796');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Davis90', 84732466, 'subscription', '0510317336');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Teri29', 95296053, 'subscription', '0555970106');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Emerson08', 80093792, 'not_subscriber', '0576957623');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Julianne90', 25133017, 'not_subscriber', '0513727962');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mykelti34', 48127929, 'not_subscriber', '0536987418');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ned25', 68351324, 'not_subscriber', '0522313715');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Wes40', 78680770, 'subscription', '0578635534');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jon11', 27301761, 'subscription', '0532653801');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Talvin27', 71960722, 'subscription', '0555593226');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Liquid85', 8854907, 'not_subscriber', '0546396161');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lenny32', 98203136, 'not_subscriber', '0582144236');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Machine50', 9174942, 'not_subscriber', '0544261384');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Toshiro63', 32723199, 'not_subscriber', '0578794894');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lonnie38', 44247590, 'subscription', '0514745288');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sydney77', 37032236, 'not_subscriber', '0524281442');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Clive36', 4719028, 'not_subscriber', '0557443266');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Dabney55', 34417586, 'subscription', '0504944897');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Neil10', 76281963, 'subscription', '0524618115');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Delbert92', 4721990, 'not_subscriber', '0549215065');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Brent94', 66332319, 'subscription', '0538233833');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Carlos10', 50933430, 'subscription', '0559895612');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kylie97', 14371353, 'not_subscriber', '0506093412');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ahmad21', 66691895, 'subscription', '0511317538');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Collin92', 38630219, 'not_subscriber', '0559060901');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Darren55', 60601411, 'not_subscriber', '0527905569');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tim36', 10916312, 'not_subscriber', '0599794085');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Natascha18', 3331544, 'subscription', '0550775389');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Armin35', 30188749, 'subscription', '0544123195');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Zooey28', 80490625, 'subscription', '0539604060');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Barbara80', 34738440, 'subscription', '0502050217');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nicolas63', 9931237, 'not_subscriber', '0523080274');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Desmond27', 87836089, 'not_subscriber', '0521769839');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Elisabeth76', 41655314, 'not_subscriber', '0541551605');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mira17', 48168576, 'not_subscriber', '0525273822');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nancy53', 70110197, 'subscription', '0505779526');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Anita81', 48887969, 'not_subscriber', '0515899814');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Oro69', 16896909, 'not_subscriber', '0524285517');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rawlins38', 57880939, 'not_subscriber', '0505798712');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Hilary62', 48966048, 'not_subscriber', '0550970920');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ed13', 88598972, 'subscription', '0526319624');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gordie79', 86294439, 'not_subscriber', '0589661346');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Alessandro79', 35190446, 'not_subscriber', '0551688545');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jackie07', 49153487, 'subscription', '0580265923');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ed70', 95032997, 'not_subscriber', '0582401507');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rodney24', 22355171, 'subscription', '0515087619');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Matt63', 69439617, 'not_subscriber', '0532968343');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Wang61', 38336604, 'not_subscriber', '0565581113');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tobey05', 54086920, 'subscription', '0549377200');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Boz00', 5119109, 'subscription', '0509755517');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Danni16', 60689011, 'not_subscriber', '0575008809');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Howie23', 30452749, 'subscription', '0572510783');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Frances06', 19832230, 'not_subscriber', '0512180213');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Anita19', 43026399, 'not_subscriber', '0593313177');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mary-Louise43', 48445149, 'subscription', '0570355788');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stephanie70', 92274432, 'not_subscriber', '0592522051');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kasey18', 35088480, 'not_subscriber', '0599637996');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Andrae29', 39594701, 'not_subscriber', '0541766966');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sheena62', 68264278, 'not_subscriber', '0517043030');
commit;
prompt 200 records committed...
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mira80', 36283652, 'subscription', '0564567343');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kylie26', 62340512, 'not_subscriber', '0530436727');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ceili73', 48738660, 'subscription', '0589283325');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Davy33', 44037971, 'subscription', '0597156735');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Leo05', 84507392, 'subscription', '0526531825');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ani46', 96779184, 'not_subscriber', '0510217105');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Isaiah30', 61370272, 'subscription', '0511266935');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Javon84', 14410291, 'subscription', '0542648953');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jean-Luc09', 82754486, 'subscription', '0567299811');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lizzy12', 9652971, 'subscription', '0576816738');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Yaphet68', 41396822, 'subscription', '0578723446');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Taye14', 429087, 'subscription', '0562033925');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Cyndi66', 46604553, 'subscription', '0562922131');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Phil82', 83290971, 'subscription', '0551851835');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Harris70', 57718856, 'not_subscriber', '0529389597');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gordon75', 51581034, 'subscription', '0575242763');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Alana92', 3006196, 'subscription', '0537863884');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Miko33', 53474648, 'subscription', '0554595594');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Liquid87', 74979776, 'not_subscriber', '0526111872');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Murray61', 90452537, 'not_subscriber', '0597153435');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Emilio00', 75877361, 'not_subscriber', '0509072047');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Alana94', 81597429, 'not_subscriber', '0561210126');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('CeCe47', 10584905, 'subscription', '0587334465');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Devon02', 43042504, 'subscription', '0528291399');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mekhi81', 26930683, 'not_subscriber', '0522778032');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Liv11', 23669281, 'not_subscriber', '0506345335');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Cole16', 36849842, 'subscription', '0588080910');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Percy11', 33507804, 'subscription', '0552260583');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ronny75', 72340614, 'subscription', '0523288045');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Donald85', 18637496, 'not_subscriber', '0583909593');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nile70', 8390022, 'subscription', '0558349495');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Cherry11', 63784166, 'not_subscriber', '0523476937');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jean-Claude62', 53081804, 'subscription', '0562748523');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Connie61', 6269454, 'subscription', '0509920179');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Cherry45', 17871046, 'not_subscriber', '0505528150');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Vertical21', 65367946, 'not_subscriber', '0578704415');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Anjelica59', 6723918, 'not_subscriber', '0551884272');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ty78', 13112974, 'subscription', '0582347599');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Pelvic52', 32091804, 'not_subscriber', '0587861653');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kyra55', 52890478, 'subscription', '0596659954');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Harvey59', 96303307, 'not_subscriber', '0563694653');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('David49', 585245, 'subscription', '0500462051');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lara92', 72496825, 'subscription', '0598699725');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Garland95', 52974116, 'not_subscriber', '0518279956');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stephanie81', 19597152, 'not_subscriber', '0593197344');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Toshiro17', 13068694, 'subscription', '0545850073');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lauren73', 20632138, 'not_subscriber', '0540832348');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lenny76', 13927910, 'subscription', '0512838383');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Joaquim57', 42219281, 'not_subscriber', '0577758689');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Annie83', 1421604, 'subscription', '0552877530');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Chi79', 99553196, 'subscription', '0589002713');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Terri57', 1320997, 'not_subscriber', '0528829612');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gerald05', 32887502, 'not_subscriber', '0526662562');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mira50', 30238104, 'subscription', '0538977298');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Aimee94', 60588568, 'subscription', '0577955022');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Caroline27', 29898620, 'subscription', '0541096515');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Larry48', 10351175, 'subscription', '0504865898');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Alice75', 26815832, 'subscription', '0502938640');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Maggie41', 19510789, 'subscription', '0557926273');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Katie17', 47312863, 'not_subscriber', '0516080408');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('First52', 41159279, 'subscription', '0597992618');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gerald86', 38506311, 'not_subscriber', '0557481158');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Zooey96', 64877336, 'not_subscriber', '0546075528');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ellen79', 52015175, 'subscription', '0547797090');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stanley22', 29669522, 'not_subscriber', '0515978803');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gary83', 80068518, 'not_subscriber', '0581190718');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lionel79', 30062897, 'subscription', '0562702162');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rip03', 57560294, 'subscription', '0535215553');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Holland20', 42705158, 'not_subscriber', '0557948814');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jamie74', 69074779, 'subscription', '0580852480');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Balthazar19', 24173228, 'subscription', '0581494122');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Spike88', 25681051, 'not_subscriber', '0589180000');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Malcolm12', 99269945, 'not_subscriber', '0586508981');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lin06', 45127780, 'not_subscriber', '0548473473');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mel00', 30381928, 'subscription', '0585084978');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sammy79', 45849329, 'subscription', '0506270485');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ming-Na23', 73511058, 'subscription', '0558499449');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Trick75', 53651361, 'not_subscriber', '0510087703');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Wes13', 94649489, 'not_subscriber', '0509693825');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Al61', 1155377, 'subscription', '0562938318');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lizzy23', 47792743, 'not_subscriber', '0512276162');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Isabella53', 12192792, 'subscription', '0547705117');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Hookah47', 81087379, 'subscription', '0550806580');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tony83', 15174478, 'not_subscriber', '0558508452');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Beth41', 57169846, 'not_subscriber', '0523725837');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Udo97', 29964277, 'not_subscriber', '0503550006');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Heather20', 96557880, 'not_subscriber', '0546311833');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Saul95', 53798046, 'not_subscriber', '0506683518');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rickie68', 97707752, 'not_subscriber', '0533746220');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Mena87', 37920330, 'subscription', '0577877385');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Fats08', 51450122, 'subscription', '0592050053');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lois82', 21785791, 'not_subscriber', '0537512415');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Emma98', 76083953, 'not_subscriber', '0591952966');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Udo83', 14434059, 'not_subscriber', '0562412336');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Saul32', 31879832, 'subscription', '0546142962');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stewart35', 66786740, 'not_subscriber', '0599092022');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tom94', 79657787, 'subscription', '0587517709');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kasey19', 74390045, 'subscription', '0580802384');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Chrissie89', 37150571, 'subscription', '0571329971');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Natasha93', 73901448, 'subscription', '0552127026');
commit;
prompt 300 records committed...
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lena10', 7238318, 'not_subscriber', '0554189004');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jeanne77', 23393834, 'not_subscriber', '0535425043');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ethan99', 81815529, 'not_subscriber', '0587676181');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Janice86', 79525559, 'subscription', '0599687457');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Dave69', 46926326, 'subscription', '0543823294');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('France88', 11999868, 'subscription', '0585938946');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Seth97', 39778890, 'not_subscriber', '0501248907');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Brian82', 36325052, 'subscription', '0599777765');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Laura89', 22358164, 'subscription', '0584763434');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nils10', 69065948, 'subscription', '0542688933');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Chely61', 93552575, 'not_subscriber', '0550367583');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Judy05', 2819689, 'not_subscriber', '0560036969');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Juliana98', 85379743, 'not_subscriber', '0579332086');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Merle90', 18861980, 'subscription', '0523398250');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Roddy06', 97876693, 'subscription', '0594344874');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ossie63', 85725624, 'not_subscriber', '0524773854');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Victor71', 29620811, 'subscription', '0534881136');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Hookah65', 39870998, 'subscription', '0503892731');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Gilbert38', 40105430, 'not_subscriber', '0504353524');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jarvis13', 60585686, 'not_subscriber', '0545681953');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Johnny10', 37436412, 'not_subscriber', '0597697549');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Charlize97', 20716138, 'subscription', '0501854592');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Cesar92', 20554608, 'not_subscriber', '0512308721');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nickel91', 72548483, 'subscription', '0518883797');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Carole19', 54097564, 'subscription', '0543413397');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sona31', 34942923, 'subscription', '0524747319');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jann02', 47556081, 'not_subscriber', '0576717798');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Derrick97', 90493538, 'not_subscriber', '0506186106');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Emma64', 68492176, 'subscription', '0507839941');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Delroy59', 3407136, 'subscription', '0564714035');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Madeline31', 24394677, 'not_subscriber', '0582556077');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lindsey08', 37283082, 'subscription', '0533501681');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Percy30', 15892905, 'subscription', '0526813005');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Marc55', 71692713, 'subscription', '0573968355');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Harrison44', 1216427, 'subscription', '0547939892');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jennifer00', 33975896, 'subscription', '0520695920');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kasey36', 56784134, 'not_subscriber', '0549350445');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Sam76', 58092990, 'not_subscriber', '0575549482');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Nancy92', 89325840, 'not_subscriber', '0574107038');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kasey49', 3552595, 'subscription', '0508464360');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Marc15', 379950, 'not_subscriber', '0566568076');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Michael46', 46837241, 'subscription', '0510012715');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Catherine02', 26791885, 'subscription', '0538243599');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Chubby51', 57873100, 'not_subscriber', '0568997242');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Garth56', 7151742, 'subscription', '0546533308');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lance40', 44652717, 'subscription', '0538243316');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stephen40', 45616277, 'not_subscriber', '0513802438');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Juice73', 28553064, 'not_subscriber', '0505344246');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Wallace50', 45567360, 'not_subscriber', '0571838230');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Jane24', 78561585, 'subscription', '0585407556');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Moe29', 55954827, 'not_subscriber', '0563453847');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Teena71', 17246850, 'subscription', '0550051323');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Heather93', 54982754, 'not_subscriber', '0503627425');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Julie45', 20704692, 'not_subscriber', '0526088200');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Joely59', 72247945, 'not_subscriber', '0582657283');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Winona34', 25022237, 'subscription', '0538158764');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Temuera52', 23165666, 'not_subscriber', '0513390767');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Garland25', 92274499, 'not_subscriber', '0535523996');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Natasha49', 9616045, 'subscription', '0518337460');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Ritchie63', 42992324, 'subscription', '0545007956');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tommy62', 96535596, 'not_subscriber', '0595797584');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Latin55', 11737574, 'not_subscriber', '0546937935');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Shannyn51', 59500445, 'subscription', '0523213548');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('April05', 24820096, 'not_subscriber', '0584151025');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lou18', 76037464, 'subscription', '0512784355');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Rebeka03', 52750660, 'subscription', '0562247352');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lin99', 21129744, 'not_subscriber', '0503160585');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kristin78', 75181676, 'not_subscriber', '0505343777');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Freddy66', 60341862, 'subscription', '0569518851');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Lesley92', 68798378, 'subscription', '0585000866');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Stevie56', 38650571, 'subscription', '0577760219');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Tyrone65', 32339197, 'subscription', '0512985614');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Matt73', 16779259, 'not_subscriber', '0543731390');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Kurtwood75', 23649118, 'not_subscriber', '0514891833');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Bonnie26', 50252505, 'subscription', '0581113592');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Christine30', 35939219, 'subscription', '0537241221');
insert into PARTICIPANT (username, ppassword, ptype, mainphone)
values ('Steve64', 38372532, 'subscription', '0546257864');
commit;
prompt 377 records loaded
prompt Loading EVENT_PARTICIPANT...
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 409, 284, to_date('09-12-2009', 'dd-mm-yyyy'), 52, '0563453847');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 459, 535, to_date('02-09-2001', 'dd-mm-yyyy'), 364, '0506289997');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 327, 754, to_date('04-05-2003', 'dd-mm-yyyy'), 267, '0541900669');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 487, 350, to_date('12-10-2007', 'dd-mm-yyyy'), 386, '0515943261');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 118, 777, to_date('09-09-2015', 'dd-mm-yyyy'), 374, '0580802384');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 115, 716, to_date('19-10-2001', 'dd-mm-yyyy'), 73, '0546101500');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 434, 891, to_date('03-05-2014', 'dd-mm-yyyy'), 224, '0551851835');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 16, 606, to_date('06-02-2002', 'dd-mm-yyyy'), 6, '0590145621');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 229, 879, to_date('27-07-2011', 'dd-mm-yyyy'), 416, '0530325327');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 447, 369, to_date('10-06-2020', 'dd-mm-yyyy'), 395, '0547797090');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 215, 402, to_date('09-09-2000', 'dd-mm-yyyy'), 48, '0598759179');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 305, 605, to_date('19-05-2004', 'dd-mm-yyyy'), 264, '0585745777');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 264, 203, to_date('18-08-2003', 'dd-mm-yyyy'), 290, '0566568076');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 264, 957, to_date('08-09-2006', 'dd-mm-yyyy'), 119, '0528829612');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 545, 850, to_date('26-06-2007', 'dd-mm-yyyy'), 317, '0550367583');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 230, 436, to_date('11-02-2009', 'dd-mm-yyyy'), 417, '0505528150');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 364, 345, to_date('14-05-2012', 'dd-mm-yyyy'), 63, '0505779526');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 130, 276, to_date('04-12-2009', 'dd-mm-yyyy'), 9, '0575549482');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 163, 209, to_date('10-12-2010', 'dd-mm-yyyy'), 337, '0543195030');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 5, 595, to_date('06-07-2006', 'dd-mm-yyyy'), 108, '0516940381');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 336, 220, to_date('02-01-2014', 'dd-mm-yyyy'), 263, '0580852480');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 298, 393, to_date('13-07-2014', 'dd-mm-yyyy'), 104, '0589661346');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 222, 878, to_date('28-06-2002', 'dd-mm-yyyy'), 35, '0587334465');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 413, 727, to_date('26-11-2006', 'dd-mm-yyyy'), 241, '0506345335');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 241, 499, to_date('20-04-2004', 'dd-mm-yyyy'), 315, '0562922131');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 342, 340, to_date('12-01-2022', 'dd-mm-yyyy'), 184, '0502938640');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 21, 192, to_date('17-04-2020', 'dd-mm-yyyy'), 197, '0584218123');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 127, 227, to_date('03-09-2000', 'dd-mm-yyyy'), 318, '0582556077');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 580, 450, to_date('03-11-2009', 'dd-mm-yyyy'), 374, '0556326933');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 466, 572, to_date('10-10-2020', 'dd-mm-yyyy'), 57, '0561507428');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 131, 352, to_date('21-04-2008', 'dd-mm-yyyy'), 218, '0526813005');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 115, 694, to_date('07-09-2021', 'dd-mm-yyyy'), 204, '0597153435');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 253, 693, to_date('30-10-2022', 'dd-mm-yyyy'), 237, '0592248811');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 307, 271, to_date('09-02-2011', 'dd-mm-yyyy'), 82, '0592510004');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 304, 848, to_date('23-10-2006', 'dd-mm-yyyy'), 75, '0576816738');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 137, 344, to_date('08-03-2002', 'dd-mm-yyyy'), 36, '0526813005');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 118, 158, to_date('27-05-2003', 'dd-mm-yyyy'), 388, '0571086012');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 26, 114, to_date('16-01-2014', 'dd-mm-yyyy'), 248, '0578704415');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 570, 397, to_date('26-06-2002', 'dd-mm-yyyy'), 223, '0587517709');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 528, 179, to_date('29-03-2019', 'dd-mm-yyyy'), 363, '0570355788');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 132, 744, to_date('27-05-2021', 'dd-mm-yyyy'), 121, '0530325327');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 79, 590, to_date('06-06-2015', 'dd-mm-yyyy'), 328, '0547939892');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 126, 284, to_date('03-12-2013', 'dd-mm-yyyy'), 263, '0582347599');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 264, 307, to_date('26-08-2020', 'dd-mm-yyyy'), 5, '0535499232');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 281, 794, to_date('13-09-2009', 'dd-mm-yyyy'), 314, '0569518851');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 285, 385, to_date('18-08-2013', 'dd-mm-yyyy'), 272, '0562033925');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 6, 110, to_date('15-09-2004', 'dd-mm-yyyy'), 151, '0546075528');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 324, 831, to_date('24-05-2014', 'dd-mm-yyyy'), 27, '0540063616');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 493, 765, to_date('18-12-2016', 'dd-mm-yyyy'), 353, '0541247569');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 575, 208, to_date('11-09-2002', 'dd-mm-yyyy'), 413, '0523725837');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 543, 347, to_date('08-12-2007', 'dd-mm-yyyy'), 180, '0528829612');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 333, 976, to_date('03-07-2001', 'dd-mm-yyyy'), 390, '0579332086');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 148, 418, to_date('27-12-2023', 'dd-mm-yyyy'), 110, '0550367583');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 432, 386, to_date('08-01-2011', 'dd-mm-yyyy'), 231, '0544873234');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 215, 897, to_date('11-04-2006', 'dd-mm-yyyy'), 139, '0543227853');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 496, 989, to_date('14-07-2012', 'dd-mm-yyyy'), 199, '0532074703');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 165, 997, to_date('14-06-2019', 'dd-mm-yyyy'), 286, '0542648953');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 16, 308, to_date('16-07-2003', 'dd-mm-yyyy'), 293, '0523725837');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 85, 159, to_date('07-07-2023', 'dd-mm-yyyy'), 189, '0582556077');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 412, 488, to_date('18-06-2007', 'dd-mm-yyyy'), 282, '0551851835');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 484, 733, to_date('03-04-2023', 'dd-mm-yyyy'), 238, '0512180213');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 579, 629, to_date('18-05-2007', 'dd-mm-yyyy'), 232, '0562922131');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 18, 902, to_date('07-08-2019', 'dd-mm-yyyy'), 73, '0509693825');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 190, 463, to_date('07-02-2023', 'dd-mm-yyyy'), 136, '0501854592');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 132, 738, to_date('14-04-2009', 'dd-mm-yyyy'), 52, '0587867493');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 563, 127, to_date('10-01-2005', 'dd-mm-yyyy'), 314, '0515342330');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 497, 444, to_date('11-03-2021', 'dd-mm-yyyy'), 45, '0555593226');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 239, 844, to_date('20-01-2016', 'dd-mm-yyyy'), 137, '0589661346');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 478, 617, to_date('26-09-2015', 'dd-mm-yyyy'), 111, '0502050217');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 595, 720, to_date('13-01-2003', 'dd-mm-yyyy'), 313, '0567299811');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 418, 238, to_date('16-09-2007', 'dd-mm-yyyy'), 136, '0537512415');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 349, 813, to_date('02-02-2001', 'dd-mm-yyyy'), 213, '0513424470');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 272, 878, to_date('21-11-2010', 'dd-mm-yyyy'), 272, '0512226967');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 556, 835, to_date('24-02-2012', 'dd-mm-yyyy'), 289, '0538233833');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 475, 663, to_date('13-11-2008', 'dd-mm-yyyy'), 290, '0521558639');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 466, 985, to_date('10-02-2005', 'dd-mm-yyyy'), 15, '0543585977');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 479, 454, to_date('01-06-2018', 'dd-mm-yyyy'), 329, '0575549482');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 149, 539, to_date('06-01-2011', 'dd-mm-yyyy'), 358, '0524927249');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 138, 821, to_date('01-10-2005', 'dd-mm-yyyy'), 104, '0524618115');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 145, 234, to_date('19-07-2004', 'dd-mm-yyyy'), 159, '0596416460');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 291, 127, to_date('04-03-2022', 'dd-mm-yyyy'), 86, '0590145621');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 549, 419, to_date('01-05-2013', 'dd-mm-yyyy'), 261, '0598699725');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 205, 642, to_date('27-04-2019', 'dd-mm-yyyy'), 279, '0532074703');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 296, 679, to_date('14-04-2014', 'dd-mm-yyyy'), 347, '0507839941');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 534, 162, to_date('05-07-2010', 'dd-mm-yyyy'), 289, '0556326933');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 542, 525, to_date('10-07-2022', 'dd-mm-yyyy'), 25, '0545486830');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 159, 796, to_date('29-06-2002', 'dd-mm-yyyy'), 312, '0547797090');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 18, 132, to_date('30-01-2016', 'dd-mm-yyyy'), 245, '0587867493');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 61, 247, to_date('16-01-2016', 'dd-mm-yyyy'), 229, '0588687796');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 350, 263, to_date('02-12-2017', 'dd-mm-yyyy'), 6, '0583324755');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 498, 407, to_date('04-09-2015', 'dd-mm-yyyy'), 416, '0589283325');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 517, 795, to_date('04-07-2014', 'dd-mm-yyyy'), 173, '0522313715');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 128, 832, to_date('23-12-2006', 'dd-mm-yyyy'), 413, '0503892731');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 547, 152, to_date('05-06-2020', 'dd-mm-yyyy'), 341, '0550529379');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 459, 675, to_date('25-10-2013', 'dd-mm-yyyy'), 109, '0501194171');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 515, 912, to_date('06-05-2004', 'dd-mm-yyyy'), 359, '0500454771');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 561, 485, to_date('21-11-2013', 'dd-mm-yyyy'), 216, '0523943119');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 257, 929, to_date('12-09-2021', 'dd-mm-yyyy'), 210, '0571968263');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 129, 910, to_date('10-12-2012', 'dd-mm-yyyy'), 183, '0597153435');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 544, 889, to_date('13-07-2017', 'dd-mm-yyyy'), 2, '0580802384');
commit;
prompt 100 records committed...
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 315, 949, to_date('11-01-2012', 'dd-mm-yyyy'), 183, '0535499232');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 46, 915, to_date('18-10-2016', 'dd-mm-yyyy'), 269, '0516940381');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 344, 461, to_date('21-03-2012', 'dd-mm-yyyy'), 87, '0550367583');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 527, 454, to_date('22-07-2009', 'dd-mm-yyyy'), 352, '0582144236');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 11, 103, to_date('09-02-2015', 'dd-mm-yyyy'), 158, '0526531825');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 495, 637, to_date('19-05-2020', 'dd-mm-yyyy'), 294, '0529389597');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 374, 265, to_date('28-06-2007', 'dd-mm-yyyy'), 371, '0510012715');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 252, 386, to_date('29-05-2017', 'dd-mm-yyyy'), 54, '0517043030');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 464, 733, to_date('10-08-2020', 'dd-mm-yyyy'), 372, '0522778032');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 68, 306, to_date('14-05-2018', 'dd-mm-yyyy'), 405, '0564474356');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 595, 386, to_date('27-04-2000', 'dd-mm-yyyy'), 115, '0520181879');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 326, 695, to_date('24-12-2012', 'dd-mm-yyyy'), 376, '0546142962');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 208, 908, to_date('29-07-2022', 'dd-mm-yyyy'), 51, '0591952966');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 57, 950, to_date('08-02-2023', 'dd-mm-yyyy'), 17, '0533501681');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 549, 777, to_date('22-07-2002', 'dd-mm-yyyy'), 273, '0513727962');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 19, 658, to_date('31-12-2003', 'dd-mm-yyyy'), 185, '0554333345');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 390, 163, to_date('27-11-2019', 'dd-mm-yyyy'), 233, '0518883797');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 427, 202, to_date('21-01-2016', 'dd-mm-yyyy'), 381, '0555970106');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 197, 736, to_date('09-05-2012', 'dd-mm-yyyy'), 308, '0512826130');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 401, 713, to_date('10-06-2022', 'dd-mm-yyyy'), 388, '0581812792');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 270, 785, to_date('28-02-2020', 'dd-mm-yyyy'), 327, '0517303523');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 337, 751, to_date('11-12-2017', 'dd-mm-yyyy'), 229, '0547939892');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 147, 674, to_date('28-09-2009', 'dd-mm-yyyy'), 332, '0559060901');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 157, 808, to_date('18-06-2000', 'dd-mm-yyyy'), 222, '0566568076');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 94, 611, to_date('07-11-2014', 'dd-mm-yyyy'), 150, '0529389597');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 357, 841, to_date('17-06-2022', 'dd-mm-yyyy'), 45, '0523476937');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 282, 788, to_date('01-09-2019', 'dd-mm-yyyy'), 317, '0587861653');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 298, 605, to_date('25-10-2013', 'dd-mm-yyyy'), 67, '0528044413');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 567, 727, to_date('26-03-2022', 'dd-mm-yyyy'), 308, '0505085584');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 368, 129, to_date('26-05-2009', 'dd-mm-yyyy'), 282, '0562748523');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 372, 239, to_date('12-07-2002', 'dd-mm-yyyy'), 178, '0518279956');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 354, 647, to_date('07-10-2004', 'dd-mm-yyyy'), 309, '0504865898');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 101, 175, to_date('13-08-2005', 'dd-mm-yyyy'), 93, '0567087919');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 352, 204, to_date('11-05-2013', 'dd-mm-yyyy'), 225, '0561507428');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 265, 438, to_date('25-03-2004', 'dd-mm-yyyy'), 304, '0504391808');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 458, 871, to_date('14-07-2016', 'dd-mm-yyyy'), 2, '0532006802');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 61, 168, to_date('23-02-2003', 'dd-mm-yyyy'), 15, '0561507428');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 465, 654, to_date('24-11-2007', 'dd-mm-yyyy'), 44, '0577808997');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 281, 738, to_date('29-09-2013', 'dd-mm-yyyy'), 13, '0557443266');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 312, 983, to_date('10-03-2003', 'dd-mm-yyyy'), 406, '0504944897');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 595, 709, to_date('12-02-2013', 'dd-mm-yyyy'), 167, '0592248811');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 403, 597, to_date('17-03-2013', 'dd-mm-yyyy'), 128, '0526319624');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 580, 932, to_date('17-02-2008', 'dd-mm-yyyy'), 231, '0585000866');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 450, 891, to_date('01-02-2007', 'dd-mm-yyyy'), 346, '0503627425');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 246, 414, to_date('03-10-2018', 'dd-mm-yyyy'), 297, '0503892731');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 455, 264, to_date('19-04-2019', 'dd-mm-yyyy'), 245, '0512784355');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 122, 656, to_date('06-02-2017', 'dd-mm-yyyy'), 324, '0576816738');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 380, 293, to_date('19-10-2007', 'dd-mm-yyyy'), 212, '0589661346');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 560, 450, to_date('07-07-2008', 'dd-mm-yyyy'), 321, '0597296185');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 35, 836, to_date('24-08-2012', 'dd-mm-yyyy'), 199, '0569518851');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 18, 199, to_date('25-01-2015', 'dd-mm-yyyy'), 409, '0576957623');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 215, 114, to_date('06-07-2018', 'dd-mm-yyyy'), 321, '0544261384');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 79, 871, to_date('23-11-2015', 'dd-mm-yyyy'), 28, '0580373266');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 318, 743, to_date('23-05-2010', 'dd-mm-yyyy'), 296, '0534881136');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 466, 923, to_date('03-09-2000', 'dd-mm-yyyy'), 337, '0568997242');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 396, 412, to_date('23-12-2021', 'dd-mm-yyyy'), 344, '0583324755');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 515, 158, to_date('15-09-2010', 'dd-mm-yyyy'), 64, '0536987418');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 145, 119, to_date('28-12-2005', 'dd-mm-yyyy'), 370, '0504944897');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 268, 781, to_date('12-11-2023', 'dd-mm-yyyy'), 376, '0593197344');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 98, 129, to_date('27-11-2009', 'dd-mm-yyyy'), 241, '0566568076');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 524, 680, to_date('24-11-2001', 'dd-mm-yyyy'), 13, '0544524116');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 228, 804, to_date('26-05-2018', 'dd-mm-yyyy'), 310, '0526813005');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 148, 251, to_date('27-05-2016', 'dd-mm-yyyy'), 247, '0589283325');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 323, 509, to_date('30-11-2005', 'dd-mm-yyyy'), 161, '0597697549');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 453, 240, to_date('01-11-2015', 'dd-mm-yyyy'), 272, '0505344246');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 38, 117, to_date('26-09-2004', 'dd-mm-yyyy'), 392, '0546075528');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 247, 665, to_date('14-12-2001', 'dd-mm-yyyy'), 281, '0587020408');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 287, 457, to_date('04-12-2023', 'dd-mm-yyyy'), 168, '0576816738');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 87, 347, to_date('04-02-2022', 'dd-mm-yyyy'), 182, '0512308721');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 582, 869, to_date('20-06-2020', 'dd-mm-yyyy'), 183, '0535425043');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 208, 359, to_date('05-08-2013', 'dd-mm-yyyy'), 86, '0503066383');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 285, 972, to_date('05-02-2010', 'dd-mm-yyyy'), 200, '0557443266');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 177, 581, to_date('12-10-2022', 'dd-mm-yyyy'), 381, '0574107038');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 466, 749, to_date('23-01-2003', 'dd-mm-yyyy'), 183, '0506345335');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 48, 313, to_date('21-11-2006', 'dd-mm-yyyy'), 179, '0592139791');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 252, 622, to_date('07-04-2008', 'dd-mm-yyyy'), 260, '0588080910');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 554, 674, to_date('19-04-2017', 'dd-mm-yyyy'), 142, '0509879038');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 246, 651, to_date('06-03-2019', 'dd-mm-yyyy'), 358, '0535215553');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 21, 411, to_date('03-06-2008', 'dd-mm-yyyy'), 280, '0523943119');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 6, 986, to_date('29-10-2020', 'dd-mm-yyyy'), 6, '0506161484');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 237, 384, to_date('03-09-2010', 'dd-mm-yyyy'), 199, '0555970106');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 67, 468, to_date('27-04-2015', 'dd-mm-yyyy'), 164, '0597992618');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 65, 696, to_date('06-11-2019', 'dd-mm-yyyy'), 161, '0587676181');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 582, 441, to_date('12-03-2021', 'dd-mm-yyyy'), 264, '0542688933');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 125, 791, to_date('28-04-2017', 'dd-mm-yyyy'), 144, '0527905569');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 188, 334, to_date('12-01-2008', 'dd-mm-yyyy'), 64, '0569518851');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 39, 441, to_date('07-06-2013', 'dd-mm-yyyy'), 94, '0511266935');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 50, 616, to_date('12-09-2021', 'dd-mm-yyyy'), 144, '0599092022');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 472, 688, to_date('19-05-2012', 'dd-mm-yyyy'), 37, '0575549482');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 198, 135, to_date('19-07-2017', 'dd-mm-yyyy'), 347, '0530325327');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 143, 420, to_date('11-02-2019', 'dd-mm-yyyy'), 67, '0551851835');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 22, 298, to_date('08-01-2005', 'dd-mm-yyyy'), 285, '0593197344');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 358, 685, to_date('21-06-2022', 'dd-mm-yyyy'), 378, '0500076402');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 516, 857, to_date('21-12-2008', 'dd-mm-yyyy'), 177, '0535499232');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 331, 288, to_date('13-01-2015', 'dd-mm-yyyy'), 289, '0585435867');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 51, 190, to_date('12-02-2007', 'dd-mm-yyyy'), 26, '0512308721');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 342, 612, to_date('06-01-2020', 'dd-mm-yyyy'), 417, '0589180000');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 177, 609, to_date('16-12-2008', 'dd-mm-yyyy'), 248, '0549350445');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 507, 964, to_date('05-08-2005', 'dd-mm-yyyy'), 36, '0523288045');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 309, 532, to_date('15-08-2015', 'dd-mm-yyyy'), 283, '0523476937');
commit;
prompt 200 records committed...
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 501, 136, to_date('12-01-2005', 'dd-mm-yyyy'), 266, '0512985614');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 515, 592, to_date('13-11-2013', 'dd-mm-yyyy'), 201, '0506289997');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 313, 326, to_date('31-12-2022', 'dd-mm-yyyy'), 309, '0504391808');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 560, 576, to_date('16-10-2019', 'dd-mm-yyyy'), 351, '0572510783');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 467, 778, to_date('06-06-2010', 'dd-mm-yyyy'), 108, '0585938946');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 319, 323, to_date('14-06-2001', 'dd-mm-yyyy'), 75, '0506186106');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 301, 207, to_date('23-04-2004', 'dd-mm-yyyy'), 215, '0546396161');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 214, 813, to_date('01-12-2019', 'dd-mm-yyyy'), 415, '0558508452');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 233, 342, to_date('18-10-2006', 'dd-mm-yyyy'), 266, '0524747319');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 488, 126, to_date('06-01-2022', 'dd-mm-yyyy'), 293, '0520516674');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 293, 397, to_date('24-12-2023', 'dd-mm-yyyy'), 94, '0512838383');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 75, 766, to_date('27-03-2020', 'dd-mm-yyyy'), 86, '0520434408');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 567, 444, to_date('18-09-2018', 'dd-mm-yyyy'), 36, '0506345335');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 170, 966, to_date('05-02-2009', 'dd-mm-yyyy'), 225, '0580802384');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 329, 359, to_date('26-11-2017', 'dd-mm-yyyy'), 55, '0538243316');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 372, 426, to_date('20-05-2005', 'dd-mm-yyyy'), 119, '0557481158');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 598, 155, to_date('16-07-2020', 'dd-mm-yyyy'), 332, '0572079258');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 589, 746, to_date('21-08-2005', 'dd-mm-yyyy'), 337, '0506186106');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 4, 539, to_date('23-12-2006', 'dd-mm-yyyy'), 213, '0515943261');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 481, 857, to_date('10-04-2020', 'dd-mm-yyyy'), 166, '0562412336');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 397, 939, to_date('18-09-2019', 'dd-mm-yyyy'), 53, '0523213548');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 353, 563, to_date('26-08-2013', 'dd-mm-yyyy'), 371, '0585435867');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 388, 594, to_date('17-02-2004', 'dd-mm-yyyy'), 118, '0537512415');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 329, 350, to_date('22-07-2017', 'dd-mm-yyyy'), 128, '0526052352');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 145, 411, to_date('16-07-2015', 'dd-mm-yyyy'), 38, '0537241221');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 262, 214, to_date('25-05-2019', 'dd-mm-yyyy'), 293, '0567257883');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 142, 819, to_date('16-11-2012', 'dd-mm-yyyy'), 310, '0509920179');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 491, 532, to_date('10-07-2000', 'dd-mm-yyyy'), 57, '0539969104');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 86, 988, to_date('02-07-2001', 'dd-mm-yyyy'), 329, '0586508981');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 194, 961, to_date('18-01-2002', 'dd-mm-yyyy'), 213, '0580265923');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 210, 482, to_date('14-05-2021', 'dd-mm-yyyy'), 112, '0565579161');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 372, 841, to_date('11-07-2005', 'dd-mm-yyyy'), 301, '0532074703');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 67, 159, to_date('19-01-2011', 'dd-mm-yyyy'), 395, '0520695920');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 81, 254, to_date('15-11-2021', 'dd-mm-yyyy'), 115, '0506161484');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 307, 265, to_date('04-12-2015', 'dd-mm-yyyy'), 82, '0549019530');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 477, 243, to_date('30-11-2019', 'dd-mm-yyyy'), 198, '0556990071');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 472, 149, to_date('25-11-2014', 'dd-mm-yyyy'), 226, '0578635534');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 172, 906, to_date('25-11-2003', 'dd-mm-yyyy'), 251, '0558499449');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 394, 716, to_date('06-02-2014', 'dd-mm-yyyy'), 279, '0582657283');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 369, 815, to_date('08-06-2003', 'dd-mm-yyyy'), 375, '0597697549');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 334, 998, to_date('30-10-2005', 'dd-mm-yyyy'), 196, '0587867493');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 584, 529, to_date('01-02-2009', 'dd-mm-yyyy'), 89, '0522778032');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 536, 297, to_date('24-03-2021', 'dd-mm-yyyy'), 245, '0509920179');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 112, 587, to_date('06-03-2013', 'dd-mm-yyyy'), 238, '0584763434');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 443, 441, to_date('23-12-2006', 'dd-mm-yyyy'), 106, '0575008809');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 145, 823, to_date('01-01-2009', 'dd-mm-yyyy'), 17, '0583324755');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 350, 248, to_date('12-06-2006', 'dd-mm-yyyy'), 266, '0536987418');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 407, 826, to_date('24-12-2023', 'dd-mm-yyyy'), 315, '0504391808');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 35, 600, to_date('19-08-2003', 'dd-mm-yyyy'), 355, '0512826130');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 513, 724, to_date('26-12-2003', 'dd-mm-yyyy'), 341, '0524618115');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 443, 955, to_date('09-04-2018', 'dd-mm-yyyy'), 147, '0535499232');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 207, 793, to_date('08-05-2020', 'dd-mm-yyyy'), 223, '0551851835');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 272, 775, to_date('15-07-2014', 'dd-mm-yyyy'), 203, '0500454771');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 595, 403, to_date('29-10-2004', 'dd-mm-yyyy'), 103, '0552873066');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 431, 619, to_date('17-08-2007', 'dd-mm-yyyy'), 101, '0532653801');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 229, 646, to_date('29-11-2023', 'dd-mm-yyyy'), 227, '0512884376');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 111, 648, to_date('08-09-2014', 'dd-mm-yyyy'), 251, '0558664403');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 448, 828, to_date('09-12-2021', 'dd-mm-yyyy'), 332, '0530325327');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 154, 738, to_date('26-05-2006', 'dd-mm-yyyy'), 420, '0501667138');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 346, 802, to_date('13-04-2008', 'dd-mm-yyyy'), 93, '0581812792');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 155, 388, to_date('16-08-2021', 'dd-mm-yyyy'), 336, '0584151025');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 263, 678, to_date('10-01-2014', 'dd-mm-yyyy'), 396, '0552260583');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 472, 389, to_date('25-06-2013', 'dd-mm-yyyy'), 319, '0581812792');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 471, 453, to_date('15-07-2013', 'dd-mm-yyyy'), 284, '0575549482');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 97, 365, to_date('25-03-2009', 'dd-mm-yyyy'), 384, '0512308721');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 449, 515, to_date('03-04-2012', 'dd-mm-yyyy'), 43, '0577808997');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 50, 925, to_date('28-04-2020', 'dd-mm-yyyy'), 172, '0556990071');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 127, 644, to_date('10-02-2004', 'dd-mm-yyyy'), 24, '0552873066');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 549, 472, to_date('12-01-2009', 'dd-mm-yyyy'), 38, '0513727962');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 388, 708, to_date('07-12-2011', 'dd-mm-yyyy'), 5, '0524618115');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 131, 367, to_date('23-12-2007', 'dd-mm-yyyy'), 415, '0544524116');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 301, 204, to_date('22-03-2022', 'dd-mm-yyyy'), 227, '0501667138');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 258, 846, to_date('27-12-2014', 'dd-mm-yyyy'), 404, '0552127026');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 91, 323, to_date('02-09-2015', 'dd-mm-yyyy'), 315, '0512495200');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 498, 914, to_date('20-08-2011', 'dd-mm-yyyy'), 53, '0506345335');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 396, 727, to_date('16-10-2012', 'dd-mm-yyyy'), 353, '0559060901');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 110, 405, to_date('18-10-2003', 'dd-mm-yyyy'), 368, '0505779526');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 539, 557, to_date('22-01-2012', 'dd-mm-yyyy'), 119, '0597156735');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 421, 748, to_date('08-09-2012', 'dd-mm-yyyy'), 236, '0514745288');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 456, 822, to_date('18-11-2015', 'dd-mm-yyyy'), 126, '0509920179');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 124, 385, to_date('04-09-2022', 'dd-mm-yyyy'), 81, '0505798712');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 303, 138, to_date('05-11-2009', 'dd-mm-yyyy'), 250, '0538158764');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 392, 752, to_date('09-04-2018', 'dd-mm-yyyy'), 295, '0541900669');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 290, 310, to_date('01-08-2006', 'dd-mm-yyyy'), 232, '0575008809');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 228, 284, to_date('07-09-2008', 'dd-mm-yyyy'), 264, '0525273822');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 462, 677, to_date('06-08-2007', 'dd-mm-yyyy'), 149, '0564714035');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 450, 936, to_date('22-04-2016', 'dd-mm-yyyy'), 113, '0558027286');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 278, 876, to_date('25-06-2006', 'dd-mm-yyyy'), 300, '0516940381');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 30, 614, to_date('02-07-2011', 'dd-mm-yyyy'), 282, '0591952966');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 402, 375, to_date('17-11-2018', 'dd-mm-yyyy'), 72, '0574107038');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 490, 962, to_date('20-01-2022', 'dd-mm-yyyy'), 415, '0507320576');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 266, 489, to_date('17-07-2010', 'dd-mm-yyyy'), 75, '0568196519');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 568, 756, to_date('20-09-2003', 'dd-mm-yyyy'), 30, '0597156735');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 108, 390, to_date('01-12-2008', 'dd-mm-yyyy'), 168, '0532006802');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 161, 283, to_date('25-02-2000', 'dd-mm-yyyy'), 149, '0565579161');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 151, 461, to_date('21-07-2017', 'dd-mm-yyyy'), 398, '0541096515');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 255, 927, to_date('30-08-2022', 'dd-mm-yyyy'), 155, '0597153435');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 535, 457, to_date('15-10-2006', 'dd-mm-yyyy'), 211, '0585745777');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 152, 580, to_date('02-03-2022', 'dd-mm-yyyy'), 190, '0560036969');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 347, 878, to_date('14-01-2020', 'dd-mm-yyyy'), 220, '0524281442');
commit;
prompt 300 records committed...
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 5, 146, to_date('29-08-2019', 'dd-mm-yyyy'), 212, '0502938640');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 277, 867, to_date('26-01-2009', 'dd-mm-yyyy'), 416, '0592139791');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 65, 615, to_date('24-08-2011', 'dd-mm-yyyy'), 353, '0514745288');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 344, 579, to_date('04-09-2001', 'dd-mm-yyyy'), 163, '0503332151');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 155, 115, to_date('08-11-2016', 'dd-mm-yyyy'), 204, '0510317336');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 514, 898, to_date('12-01-2011', 'dd-mm-yyyy'), 381, '0594344874');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 75, 582, to_date('27-08-2012', 'dd-mm-yyyy'), 209, '0520516674');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 154, 790, to_date('27-03-2014', 'dd-mm-yyyy'), 5, '0546142962');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 562, 594, to_date('04-07-2019', 'dd-mm-yyyy'), 47, '0582556077');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 253, 910, to_date('16-04-2021', 'dd-mm-yyyy'), 376, '0532006802');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 381, 666, to_date('02-11-2021', 'dd-mm-yyyy'), 351, '0538233833');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 442, 722, to_date('25-12-2021', 'dd-mm-yyyy'), 191, '0543585977');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 303, 697, to_date('07-10-2019', 'dd-mm-yyyy'), 322, '0508464360');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 453, 886, to_date('29-12-2011', 'dd-mm-yyyy'), 340, '0571086012');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 236, 116, to_date('11-12-2007', 'dd-mm-yyyy'), 322, '0532653801');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 146, 416, to_date('12-08-2017', 'dd-mm-yyyy'), 213, '0543731390');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 548, 681, to_date('31-12-2019', 'dd-mm-yyyy'), 115, '0572510783');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 239, 835, to_date('26-06-2020', 'dd-mm-yyyy'), 380, '0561210126');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 174, 409, to_date('21-11-2022', 'dd-mm-yyyy'), 356, '0551851835');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 585, 953, to_date('01-09-2001', 'dd-mm-yyyy'), 173, '0528044413');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 429, 650, to_date('26-07-2003', 'dd-mm-yyyy'), 338, '0580265923');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 206, 358, to_date('26-06-2018', 'dd-mm-yyyy'), 238, '0546101500');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 221, 836, to_date('22-04-2020', 'dd-mm-yyyy'), 194, '0513424470');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 456, 210, to_date('14-06-2017', 'dd-mm-yyyy'), 53, '0556990071');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 295, 662, to_date('15-02-2021', 'dd-mm-yyyy'), 367, '0559895612');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 202, 952, to_date('29-09-2004', 'dd-mm-yyyy'), 267, '0592248811');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 91, 885, to_date('01-08-2005', 'dd-mm-yyyy'), 41, '0543731390');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 310, 385, to_date('21-06-2001', 'dd-mm-yyyy'), 74, '0558027286');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 353, 442, to_date('06-06-2008', 'dd-mm-yyyy'), 151, '0596659954');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 9, 289, to_date('30-03-2009', 'dd-mm-yyyy'), 110, '0524583588');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 172, 431, to_date('29-05-2013', 'dd-mm-yyyy'), 273, '0522313715');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 329, 267, to_date('03-05-2001', 'dd-mm-yyyy'), 20, '0559060901');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 97, 500, to_date('14-08-2007', 'dd-mm-yyyy'), 261, '0547205186');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 502, 943, to_date('03-11-2008', 'dd-mm-yyyy'), 146, '0562247352');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 299, 436, to_date('25-10-2008', 'dd-mm-yyyy'), 348, '0502938640');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 381, 166, to_date('12-03-2017', 'dd-mm-yyyy'), 60, '0551851835');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 325, 160, to_date('07-01-2000', 'dd-mm-yyyy'), 280, '0573585596');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 507, 270, to_date('13-06-2018', 'dd-mm-yyyy'), 223, '0585745777');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 517, 554, to_date('04-10-2023', 'dd-mm-yyyy'), 244, '0502938640');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 563, 605, to_date('26-08-2018', 'dd-mm-yyyy'), 136, '0562748523');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 544, 592, to_date('10-06-2022', 'dd-mm-yyyy'), 153, '0504353524');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 134, 151, to_date('20-09-2021', 'dd-mm-yyyy'), 317, '0537241221');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 223, 838, to_date('08-02-2001', 'dd-mm-yyyy'), 261, '0585967894');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 434, 157, to_date('11-03-2017', 'dd-mm-yyyy'), 413, '0585938946');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 161, 246, to_date('25-12-2014', 'dd-mm-yyyy'), 316, '0515978803');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 404, 586, to_date('14-03-2005', 'dd-mm-yyyy'), 156, '0578635534');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 510, 360, to_date('30-03-2018', 'dd-mm-yyyy'), 418, '0538243599');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 539, 548, to_date('04-02-2002', 'dd-mm-yyyy'), 295, '0516940381');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 463, 704, to_date('23-04-2000', 'dd-mm-yyyy'), 162, '0510087703');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 365, 552, to_date('06-01-2000', 'dd-mm-yyyy'), 351, '0512826130');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 83, 829, to_date('30-01-2002', 'dd-mm-yyyy'), 298, '0584763434');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 210, 114, to_date('14-11-2003', 'dd-mm-yyyy'), 195, '0571086012');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 183, 424, to_date('21-06-2018', 'dd-mm-yyyy'), 314, '0597156735');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 90, 703, to_date('11-01-2011', 'dd-mm-yyyy'), 398, '0543227853');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 371, 828, to_date('15-08-2015', 'dd-mm-yyyy'), 184, '0528044413');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 65, 807, to_date('28-02-2021', 'dd-mm-yyyy'), 179, '0533501681');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 255, 702, to_date('06-03-2009', 'dd-mm-yyyy'), 309, '0544261384');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 570, 744, to_date('13-07-2001', 'dd-mm-yyyy'), 274, '0528829612');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 30, 442, to_date('29-12-2011', 'dd-mm-yyyy'), 118, '0562247352');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 192, 870, to_date('11-03-2003', 'dd-mm-yyyy'), 109, '0578704415');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 355, 434, to_date('14-08-2001', 'dd-mm-yyyy'), 83, '0569212142');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 486, 445, to_date('25-05-2005', 'dd-mm-yyyy'), 174, '0516940381');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 421, 102, to_date('04-01-2016', 'dd-mm-yyyy'), 244, '0530436727');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 12, 157, to_date('29-08-2007', 'dd-mm-yyyy'), 22, '0571968263');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 431, 383, to_date('29-09-2011', 'dd-mm-yyyy'), 224, '0506622466');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 74, 724, to_date('05-10-2006', 'dd-mm-yyyy'), 64, '0575008809');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 488, 834, to_date('16-03-2013', 'dd-mm-yyyy'), 339, '0523213548');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 445, 116, to_date('06-03-2006', 'dd-mm-yyyy'), 321, '0536987418');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 19, 761, to_date('23-01-2007', 'dd-mm-yyyy'), 156, '0571588597');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 77, 277, to_date('13-03-2019', 'dd-mm-yyyy'), 304, '0538243316');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 218, 514, to_date('25-05-2002', 'dd-mm-yyyy'), 216, '0509920179');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 549, 225, to_date('11-03-2009', 'dd-mm-yyyy'), 111, '0550775389');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 149, 204, to_date('10-12-2010', 'dd-mm-yyyy'), 119, '0597992618');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 582, 371, to_date('15-05-2004', 'dd-mm-yyyy'), 417, '0572079258');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 88, 523, to_date('16-09-2019', 'dd-mm-yyyy'), 143, '0568997242');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 55, 784, to_date('25-05-2006', 'dd-mm-yyyy'), 381, '0546075528');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 36, 668, to_date('01-06-2010', 'dd-mm-yyyy'), 245, '0549350445');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 350, 686, to_date('30-03-2014', 'dd-mm-yyyy'), 183, '0540063616');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 99, 320, to_date('19-02-2014', 'dd-mm-yyyy'), 34, '0506186106');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 584, 365, to_date('02-09-2010', 'dd-mm-yyyy'), 288, '0576717798');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 556, 217, to_date('17-06-2003', 'dd-mm-yyyy'), 76, '0554189004');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 224, 625, to_date('16-09-2004', 'dd-mm-yyyy'), 144, '0518889575');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 203, 612, to_date('05-08-2006', 'dd-mm-yyyy'), 350, '0539969104');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 159, 522, to_date('25-06-2013', 'dd-mm-yyyy'), 401, '0576193712');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 118, 728, to_date('19-10-2017', 'dd-mm-yyyy'), 208, '0540063616');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 434, 663, to_date('16-10-2016', 'dd-mm-yyyy'), 226, '0575242763');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 312, 731, to_date('14-06-2004', 'dd-mm-yyyy'), 74, '0585967894');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 198, 645, to_date('26-10-2019', 'dd-mm-yyyy'), 290, '0505528150');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 318, 796, to_date('19-03-2005', 'dd-mm-yyyy'), 184, '0535215553');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 186, 171, to_date('21-04-2005', 'dd-mm-yyyy'), 296, '0583331407');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 493, 125, to_date('03-08-2007', 'dd-mm-yyyy'), 189, '0592510004');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 393, 984, to_date('11-08-2018', 'dd-mm-yyyy'), 143, '0565581113');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 374, 851, to_date('26-04-2019', 'dd-mm-yyyy'), 185, '0597697549');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 136, 682, to_date('08-01-2011', 'dd-mm-yyyy'), 104, '0505798712');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 159, 342, to_date('07-12-2009', 'dd-mm-yyyy'), 27, '0503550006');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 86, 322, to_date('26-08-2008', 'dd-mm-yyyy'), 91, '0597296185');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 165, 673, to_date('14-11-2004', 'dd-mm-yyyy'), 244, '0545681953');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 554, 220, to_date('11-05-2004', 'dd-mm-yyyy'), 303, '0582657283');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 436, 337, to_date('09-07-2020', 'dd-mm-yyyy'), 371, '0541551605');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 120, 905, to_date('08-01-2008', 'dd-mm-yyyy'), 193, '0552127026');
commit;
prompt 400 records committed...
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 439, 121, to_date('28-07-2014', 'dd-mm-yyyy'), 304, '0568819541');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 578, 284, to_date('17-07-2000', 'dd-mm-yyyy'), 349, '0526052352');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 129, 365, to_date('13-01-2008', 'dd-mm-yyyy'), 288, '0546142962');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 391, 829, to_date('01-01-2023', 'dd-mm-yyyy'), 240, '0586508981');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 223, 365, to_date('05-05-2013', 'dd-mm-yyyy'), 325, '0512180213');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 347, 288, to_date('08-04-2014', 'dd-mm-yyyy'), 415, '0523398250');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 266, 104, to_date('06-11-2008', 'dd-mm-yyyy'), 277, '0517303523');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 274, 884, to_date('03-07-2000', 'dd-mm-yyyy'), 208, '0562702162');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 415, 223, to_date('24-02-2014', 'dd-mm-yyyy'), 396, '0547840019');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 33, 156, to_date('22-11-2021', 'dd-mm-yyyy'), 176, '0565579161');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 438, 860, to_date('01-08-2014', 'dd-mm-yyyy'), 412, '0509755517');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 145, 652, to_date('29-12-2003', 'dd-mm-yyyy'), 110, '0509398922');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 357, 208, to_date('11-04-2017', 'dd-mm-yyyy'), 53, '0537512415');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 553, 278, to_date('03-02-2003', 'dd-mm-yyyy'), 364, '0504853332');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 116, 197, to_date('20-02-2023', 'dd-mm-yyyy'), 190, '0536987418');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (2, 393, 966, to_date('27-11-2012', 'dd-mm-yyyy'), 92, '0510012715');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 10, 777, to_date('19-02-2017', 'dd-mm-yyyy'), 125, '0535523996');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 569, 615, to_date('15-01-2014', 'dd-mm-yyyy'), 341, '0575549482');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 166, 564, to_date('06-04-2013', 'dd-mm-yyyy'), 81, '0532006802');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 305, 116, to_date('27-07-2017', 'dd-mm-yyyy'), 331, '0501854592');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 502, 188, to_date('25-07-2004', 'dd-mm-yyyy'), 2, '0546533308');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 574, 764, to_date('30-01-2004', 'dd-mm-yyyy'), 126, '0596148854');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 347, 431, to_date('31-07-2010', 'dd-mm-yyyy'), 168, '0526843229');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 460, 922, to_date('17-08-2001', 'dd-mm-yyyy'), 343, '0522778032');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 73, 966, to_date('10-08-2012', 'dd-mm-yyyy'), 379, '0583324755');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 276, 984, to_date('21-11-2023', 'dd-mm-yyyy'), 124, '0550775389');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 595, 328, to_date('20-02-2005', 'dd-mm-yyyy'), 75, '0568526327');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 189, 759, to_date('19-12-2003', 'dd-mm-yyyy'), 196, '0500076402');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 404, 670, to_date('03-11-2013', 'dd-mm-yyyy'), 148, '0558664403');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 55, 569, to_date('27-02-2009', 'dd-mm-yyyy'), 262, '0573585596');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 95, 396, to_date('22-06-2008', 'dd-mm-yyyy'), 175, '0526111872');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 339, 532, to_date('15-02-2020', 'dd-mm-yyyy'), 289, '0533746220');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 533, 270, to_date('18-02-2005', 'dd-mm-yyyy'), 41, '0549215065');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 515, 781, to_date('06-10-2003', 'dd-mm-yyyy'), 191, '0552127026');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 145, 241, to_date('18-02-2010', 'dd-mm-yyyy'), 308, '0524773854');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 515, 220, to_date('25-03-2007', 'dd-mm-yyyy'), 100, '0556990071');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (1, 560, 431, to_date('24-12-2015', 'dd-mm-yyyy'), 415, '0526756508');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (7, 126, 645, to_date('07-06-2006', 'dd-mm-yyyy'), 156, '0512308721');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 600, 190, to_date('29-09-2001', 'dd-mm-yyyy'), 210, '0503160585');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (9, 412, 764, to_date('28-05-2016', 'dd-mm-yyyy'), 113, '0596273264');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 136, 998, to_date('08-04-2016', 'dd-mm-yyyy'), 323, '0582401507');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (3, 547, 893, to_date('03-12-2016', 'dd-mm-yyyy'), 412, '0584151025');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (6, 111, 366, to_date('16-07-2020', 'dd-mm-yyyy'), 375, '0550775389');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 438, 619, to_date('16-09-2020', 'dd-mm-yyyy'), 202, '0549350445');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 149, 992, to_date('08-08-2011', 'dd-mm-yyyy'), 393, '0512495200');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 440, 762, to_date('08-09-2017', 'dd-mm-yyyy'), 42, '0505798712');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (10, 148, 250, to_date('05-06-2020', 'dd-mm-yyyy'), 20, '0513727962');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (4, 418, 458, to_date('16-07-2014', 'dd-mm-yyyy'), 352, '0576184662');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (5, 383, 915, to_date('26-01-2014', 'dd-mm-yyyy'), 273, '0532653801');
insert into EVENT_PARTICIPANT (review, seatnumber, cardnum, signupdate, eid, mainphone)
values (8, 573, 260, to_date('20-01-2011', 'dd-mm-yyyy'), 208, '0506093412');
commit;
prompt 450 records loaded
prompt Loading MANAGER_WORKING_DAYS...
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0576801411');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0580373266');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0588066007');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0520477258');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0506270485');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0516056811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0553225887');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0528086324');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0549751262');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0595664140');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0549451329');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0535608360');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0549751262');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0535608360');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0502200972');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0598800052');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0508890461');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0583206356');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0556136503');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0551688545');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0502200972');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0576717798');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0514312666');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0550776802');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0502139249');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0567188090');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0593469147');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0575655796');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0555593226');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0557863783');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0573072506');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0591020249');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0528086324');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0578704415');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0512182893');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0584492233');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0561981808');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0554442644');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0539778860');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0561000159');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0518432457');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0509619309');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0540110136');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0561981808');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0513672669');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0547637651');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0504944897');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0526816296');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0569139556');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0585938946');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0501694276');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0501717471');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0510317336');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0547664287');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0596377511');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0500995288');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0542688933');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0507664837');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0551908086');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0540024692');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0506765560');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0549751262');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0542853203');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0512960994');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0504416242');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0509754573');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0535112858');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0597634073');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0526088200');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0544571829');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0564474356');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0577086371');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0582038256');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0577760219');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0541748264');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0555010836');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0547705117');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0532833235');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0548325334');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0540110136');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0531324145');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0523725837');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0506186106');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0501015255');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0566343621');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0563366374');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0592248811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0511271389');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0554333345');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0590530612');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0535523996');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0502582602');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0538644364');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0528313806');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0580799506');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0501015255');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0524569869');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0539686928');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0514684452');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0569139556');
commit;
prompt 100 records committed...
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0520458230');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0554333345');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0592883142');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0551127903');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0532818157');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0524912831');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0506259273');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0594592130');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0599087527');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0577661021');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0519560607');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0577877385');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0556136503');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0514596993');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0569139556');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0558508452');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0528313806');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0545007956');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0552187987');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0599690689');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0566343621');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0550226706');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0570229445');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0593311899');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0518917016');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0563808753');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0536093940');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0503525885');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0555813256');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0557707249');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0509619309');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0544524116');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0549751262');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0574586960');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0546888058');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0538567428');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0535608360');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0529488499');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0575655796');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0568819541');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0590530612');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0580332361');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0558851508');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0507664837');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0540765295');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0547018526');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0531895595');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0523725837');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0573981190');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0502938640');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0501327038');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0532074703');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0585000866');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0554309626');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0598390461');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0592988124');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0531986417');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0573072506');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0592510004');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0548222148');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0592883142');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0569254186');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0514110655');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0506270485');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0526057408');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0508890461');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0512784355');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0573222797');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0514569763');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0550274513');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0586357575');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0571681099');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0539361373');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0538644364');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0557443266');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0561000159');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0526088200');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0591946782');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0577086371');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0586950873');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0554898210');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0509879038');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0569254186');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0518451940');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0593469147');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0526052352');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0599777765');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0565219854');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0504944897');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0551000200');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0592396997');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0599346865');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0517146164');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0524912831');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0502938640');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0593311899');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0595314419');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0557863783');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0540056731');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0557841767');
commit;
prompt 200 records committed...
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0501889391');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0548325334');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0555493632');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0539361373');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0534805825');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0573981190');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0544524116');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0573222797');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0575655796');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0559679521');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0574211067');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0513672669');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0528086324');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0557841767');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0590115268');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0559895612');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0593148948');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0575003422');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0514654972');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0539347618');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0558851508');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0528974262');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0512784355');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0513390767');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0550226706');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0528291399');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0573708240');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0576241402');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0510317336');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0582881688');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0542287074');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0547939892');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0557481158');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0519415809');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0589008587');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0576193712');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0588066007');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0561153057');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0578430058');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0583559384');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0549451329');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0520458230');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0516056811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0554898210');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0593197344');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0503556481');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0544960010');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0591899816');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0523644741');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0582657283');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0533173822');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0539290960');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0539842539');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0528836738');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0515610301');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0513080349');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0538243599');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0532031018');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0542688933');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0518432457');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0589194981');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0547053230');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0519415809');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0578704415');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0593215466');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0584492233');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0573585596');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0589008587');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0595314419');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0565710548');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0514569763');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0535268135');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0526843229');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0522670596');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0568308811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0510217105');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0584218123');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0528950917');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0511954017');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0519348146');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0591020249');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0583559384');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0538567428');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0501717471');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0544479475');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0588583669');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0534504508');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0592988124');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0576731225');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0538567428');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0521036197');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0598570593');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0517259216');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0517847220');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0545007956');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0564474356');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0510594048');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0547637651');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0555201497');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0533921371');
commit;
prompt 300 records committed...
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0539686928');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0582038256');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0549451329');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0595664140');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0523725837');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0578704415');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0518951361');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0505277047');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0554309626');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0511954017');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0587517709');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0563694653');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0569254186');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0561981808');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0502139249');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0503525885');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0566343621');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0549377200');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0599346865');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0501812602');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0514938011');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0597214515');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0512985614');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0517945438');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0516056811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0504944897');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0575655796');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0554442644');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0577758689');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0579370417');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0563202025');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0542287074');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0534364781');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0571838230');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0592396997');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0547018526');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0552678365');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0586357575');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0567138787');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0595664140');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0593311899');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0519415809');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0518951361');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0515610301');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0511271389');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0526756508');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0592248811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0529278556');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0550582716');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0583206356');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0500995288');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0508452551');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0576923186');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0585938946');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0568819541');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0573981190');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0575003422');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0557673859');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0517628405');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0522313715');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0510265838');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0577877385');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0595535243');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0589283325');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0554923177');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0503892731');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0517146164');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0585435867');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0568819541');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0578430058');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0504878828');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0548222148');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0599832953');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0555813256');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0506765560');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0571681099');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0526529811');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0546343616');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0563694653');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0561112519');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0531888791');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0588066007');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0506994224');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0501717471');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0555010836');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Wednesday', '0517259216');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Sunday', '0552298926');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Tuesday', '0533921371');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Monday', '0531775431');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0566308995');
insert into MANAGER_WORKING_DAYS (working_days, mainphone)
values ('Thursday', '0531775431');
commit;
prompt 391 records loaded
prompt Loading PERSON_MORE_PHONE...
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556736132', '0515235827');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0503906230', '0547840019');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0586705550', '0536093940');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0569872737', '0562932003');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0594360356', '0509694473');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588502631', '0546267936');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556367963', '0588080910');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544250276', '0596055512');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540808842', '0520795630');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0569803509', '0539591584');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573668116', '0517734166');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0563201310', '0593083669');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0538845864', '0526813005');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0566388023', '0529435216');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570481956', '0581113592');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0558577971', '0502447756');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0560862971', '0550060959');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546178460', '0509694473');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0559158983', '0519415809');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0545274426', '0575518351');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0553527202', '0559874976');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0512907412', '0578264424');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0505632367', '0523644741');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0572426183', '0570299680');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513485896', '0534451065');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0505407044', '0596659954');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599041858', '0500055352');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0559172866', '0501200707');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0517388420', '0566203471');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599225748', '0551128004');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0548242586', '0590530612');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0545496508', '0548321261');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573268453', '0571591241');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589098992', '0583559384');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0532464614', '0579936562');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571907982', '0556483883');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595446457', '0523644741');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0578757956', '0549027814');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0562900952', '0505277047');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0524611731', '0530127339');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567158335', '0544867922');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564807880', '0502776079');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0538770949', '0589283325');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0522702067', '0586782213');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544331478', '0579600814');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0518338714', '0564591647');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0563420724', '0557863783');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0593398617', '0570355788');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0561579566', '0510615273');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0525250779', '0518132305');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0512586868', '0550806344');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0554595205', '0510615273');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540577643', '0574836981');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508875069', '0556435094');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0512640023', '0575019829');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0510287444', '0517259216');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0509964430', '0519814891');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540403370', '0550806344');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0518048839', '0561756032');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513324668', '0528836738');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544247132', '0544492653');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0506093401', '0588644207');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0597859759', '0524747319');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599675459', '0596351958');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0551233748', '0558736420');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0584037663', '0557443266');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599264882', '0546075528');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0587384004', '0555116882');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0577815327', '0599400640');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0509961699', '0503550405');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570054201', '0517017524');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0539217207', '0501667138');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0526614517', '0508326097');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0572889340', '0521294781');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0522595042', '0510265838');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0524487228', '0556103009');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513879217', '0510087703');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570105848', '0524790357');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0519579564', '0598699725');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564285791', '0586284343');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599848581', '0540024692');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0577303699', '0584429699');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546431110', '0505401392');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581044727', '0517744013');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0533195682', '0546943098');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573514310', '0580799506');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0501464694', '0554627156');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564456594', '0502776079');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0597838089', '0500731266');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0587870522', '0546142962');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573054219', '0501464988');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0534609718', '0594344874');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0578905039', '0588583669');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0535312939', '0590530612');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0552308307', '0511991297');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0536246598', '0578723446');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0517323486', '0578993788');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0580758105', '0557623695');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0572339393', '0554272966');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564527159', '0589328680');
commit;
prompt 100 records committed...
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564036616', '0509367037');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581868901', '0549103769');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508697620', '0596332660');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0511139834', '0543413397');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581494985', '0569558610');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0531026596', '0558508452');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564209021', '0541112613');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0558832251', '0588577293');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0578865161', '0572642713');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0519117941', '0532777056');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0503244972', '0595355245');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0569456622', '0510263959');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0517557858', '0571086012');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0562115075', '0571329971');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0506586760', '0577539321');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0535208769', '0536663472');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544256679', '0596690164');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581663160', '0574664073');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0563804371', '0549641223');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0503234450', '0502776079');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0598202978', '0549789564');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0541422256', '0563699174');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0590472981', '0507964266');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0542542600', '0570816314');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0509819788', '0599701891');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0528402290', '0546075528');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571575236', '0561153057');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508415905', '0574851032');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0518987875', '0530392320');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0541162199', '0541900669');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0549365826', '0515087619');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0596722973', '0553348479');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0562732826', '0567992338');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0583254216', '0577967338');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0577005498', '0521035039');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0549097199', '0577900749');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0536766177', '0580802384');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567678714', '0585000866');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0579047587', '0546311833');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0580782473', '0514684452');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0529761879', '0512725036');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573827779', '0511901124');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0511467379', '0501200707');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508222063', '0546904191');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546054724', '0599960605');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0511577888', '0567707918');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0523857881', '0585435867');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0533566466', '0566688568');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0576075866', '0553090407');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571733339', '0526319624');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0527050785', '0524060739');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0530444999', '0593083669');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0505023144', '0572657786');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0593242509', '0528896146');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0548653897', '0547664287');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0511827169', '0535425043');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0593531173', '0542658043');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0533280012', '0599928540');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0575225965', '0545042516');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599055095', '0568910713');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0590930940', '0572657786');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0531679142', '0563629776');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513453760', '0525828269');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0510896044', '0528709917');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588107636', '0540775948');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573223935', '0538567428');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567769292', '0531407673');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588399498', '0553348479');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568018164', '0550854782');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0532590158', '0506270485');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595252186', '0510615273');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588474221', '0515342330');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0576486257', '0539028067');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0582183866', '0570816314');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571847247', '0575186709');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513909267', '0576378811');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588594884', '0590918086');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0587952805', '0575441910');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0550273333', '0520721761');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0575268197', '0517945438');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0538060629', '0595797584');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573632702', '0576923058');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567334943', '0543630505');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568196005', '0599225297');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0579485694', '0586782213');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0530767770', '0528631460');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570156074', '0599947268');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0542506002', '0590386286');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556262970', '0580312222');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0541215632', '0580504756');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0574644074', '0520189608');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0554178894', '0518797331');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0561911479', '0589713993');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0525296457', '0507505612');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567135114', '0506186106');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0590778598', '0569748750');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0515698536', '0596659954');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0576921591', '0542370304');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573446016', '0552260583');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0521583144', '0530421520');
commit;
prompt 200 records committed...
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0509578136', '0538977298');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0541616718', '0509717480');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546735979', '0578375057');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588286753', '0526672552');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544146972', '0512803002');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0520690257', '0559271693');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0532826802', '0556853945');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0598834568', '0594592130');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0524437130', '0545069380');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0522254323', '0542839481');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0555527029', '0517744013');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556047498', '0504416242');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0509071320', '0521952008');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564393557', '0517679723');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556248341', '0574945318');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595119284', '0586071221');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0565623819', '0507473966');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544646540', '0531457887');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0552260712', '0518132305');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0597944633', '0521864852');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540199102', '0561360263');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0564555078', '0592255019');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570898170', '0520635318');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599894484', '0594048250');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0516014771', '0578227685');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0598937356', '0579022455');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544568728', '0530698232');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0550947415', '0526843229');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0576944321', '0527464157');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0515452583', '0508326097');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0558936131', '0592255019');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568955491', '0597214515');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0507831746', '0507847718');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588715370', '0551851835');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588975841', '0556853945');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0548849799', '0524618115');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0527476049', '0555638079');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0586533847', '0576973467');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595715332', '0574586960');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0548152453', '0589252861');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599184539', '0580504756');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570434742', '0552761746');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0500394150', '0506737474');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0543626940', '0511271389');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0502340552', '0546037641');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0539864858', '0571681099');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540595881', '0566308995');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0577721783', '0503160585');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0554801289', '0549641223');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544323823', '0534885696');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567209277', '0502430929');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0516475271', '0549978963');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546237332', '0535890313');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0520009454', '0518989712');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0557466557', '0501854592');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0505115048', '0576184662');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595048288', '0567645076');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0528674886', '0565263605');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0536112730', '0557093193');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0535626243', '0548892561');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0518215520', '0543868187');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0553324794', '0593841329');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0551422216', '0517951142');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0525280647', '0544274569');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0516495439', '0526052352');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0562398551', '0516884247');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0561619075', '0532006802');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570092599', '0580733510');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0507004153', '0532031018');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0591740569', '0514597751');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0551269747', '0506345335');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0582208002', '0565263605');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0501265664', '0586428302');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595271292', '0517043030');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0541613479', '0577955022');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0532509790', '0525321159');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0582362494', '0502447756');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0522539863', '0535080391');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0574198564', '0541551605');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0547591875', '0585000866');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0529342967', '0568910713');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0592141012', '0564141880');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567549002', '0543819549');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571007443', '0565497840');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0520107699', '0568997242');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0598156159', '0553348479');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571023596', '0543630505');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0523167496', '0564042954');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513294770', '0580807423');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0571018684', '0587861653');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0592991221', '0521135218');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0527038254', '0558664403');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0569863846', '0514752133');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0570081692', '0509367037');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0585183720', '0500286837');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0526892773', '0500884148');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0522925621', '0580807423');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0557129078', '0561804941');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0549804917', '0576504473');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513210495', '0513985304');
commit;
prompt 300 records committed...
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0582310347', '0555136862');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508777476', '0557707249');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0584870081', '0509934289');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0519444791', '0543603210');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0537192927', '0514308915');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0533531909', '0535523996');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0587707648', '0564503705');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0560962812', '0531507564');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0577982548', '0511534711');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0565574634', '0581190718');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0559342060', '0509043539');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0574842545', '0584022555');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0514789887', '0551908086');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0520318777', '0567257883');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573211892', '0555493632');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0599647958', '0517679723');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0549558595', '0581423288');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0563964486', '0534392911');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0587762179', '0518279956');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0566991874', '0503999075');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589430333', '0524508219');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546845440', '0524927249');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0531151871', '0536383214');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0550885505', '0583734767');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0561513815', '0582401507');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0515359469', '0528127351');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0582613936', '0553718947');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0523445233', '0524408988');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540117227', '0510594048');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573593884', '0590670064');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581643879', '0579073484');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0559735236', '0531228073');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0541656103', '0557702023');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0596789682', '0594904747');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568813070', '0570220956');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0511124635', '0521853830');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0545763374', '0561318268');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0548668416', '0589321735');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0503761728', '0513338215');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0590773854', '0590610095');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508218300', '0562312561');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568525898', '0511069445');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0501282582', '0540063616');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0535552102', '0544924838');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0552325673', '0522421340');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0511005826', '0572497900');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0566547330', '0576621676');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0502767846', '0566515727');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556935378', '0508602088');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0551153892', '0594944968');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0504249491', '0507505612');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0500620950', '0523247419');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0569239229', '0514958495');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0591532724', '0528971362');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0522741808', '0518637651');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0595745763', '0566474207');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0529412468', '0500884148');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0585054552', '0570355788');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0510604997', '0532775819');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0572380867', '0550854782');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0586784127', '0515938589');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0505871210', '0587661760');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0578820547', '0511317538');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0593285577', '0535890313');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0566016791', '0598893373');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0565555457', '0583817251');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0520282442', '0539412887');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0502527846', '0582570661');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0552558187', '0545464410');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589433613', '0560517567');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0513785624', '0571681099');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0548691011', '0520721761');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0597751190', '0518718822');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589199677', '0522974518');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0584595187', '0508152158');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0515963518', '0594830574');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0596972742', '0524205337');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0579295640', '0543019689');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0554546562', '0577695823');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0528745127', '0594344874');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0521410547', '0546888058');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0591122789', '0595797584');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0551289398', '0539862173');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0572203739', '0558450444');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573446008', '0556134391');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0516581923', '0585000866');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581054945', '0515610301');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0546184395', '0552127026');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0590928139', '0550035618');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0584933302', '0567908267');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573931953', '0592296354');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0549319973', '0552217986');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0596713891', '0566707125');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0566354162', '0590081008');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0597314585', '0516827250');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0529863650', '0503525885');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0531406921', '0517847220');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0549590155', '0519906600');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0597536808', '0599225297');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589226507', '0539207757');
commit;
prompt 400 records committed...
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568553767', '0502061771');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0512896758', '0597153435');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0592699966', '0589020755');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568146412', '0572803395');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0572343532', '0512876990');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0506060796', '0556853945');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0587026854', '0512495200');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0524789848', '0539709035');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0530911473', '0509367037');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589922983', '0512314721');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0567385501', '0551709176');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0556716322', '0546257864');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0592374467', '0534719703');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0568841874', '0514474086');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0528939762', '0536095784');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0581001942', '0587661760');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0527912674', '0539788421');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0591352150', '0509043539');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0504708750', '0568997242');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0553960388', '0523695352');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0553743888', '0547613943');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0577441565', '0539782447');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0501708861', '0596351958');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0525870148', '0520795630');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0547915689', '0524642699');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0543975387', '0594835754');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0527945908', '0516056811');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0500771439', '0527464157');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0504624663', '0545007956');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0596732016', '0594616523');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0598287993', '0505090303');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0519505775', '0552390533');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0528511870', '0521036197');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0596583335', '0551327444');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0573641479', '0588630773');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0544549774', '0500462051');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0540097845', '0596390768');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0534387548', '0500973156');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0527664652', '0531507564');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0589350981', '0594944968');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0557244534', '0506186106');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0585805561', '0578965979');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0508929334', '0527144872');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0582712963', '0569518851');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0517393575', '0507664837');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0547028849', '0577877385');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0588214255', '0561893317');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0590171412', '0594593851');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0591773079', '0503637007');
insert into PERSON_MORE_PHONE (more_phone, mainphone)
values ('0518914244', '0559479517');
commit;
prompt 450 records loaded
prompt Enabling foreign key constraints for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR enable constraint SYS_C0010363;
prompt Enabling foreign key constraints for MANAGER...
alter table MANAGER enable constraint SYS_C0010357;
prompt Enabling foreign key constraints for EVENT...
alter table EVENT enable constraint SYS_C0010387;
alter table EVENT enable constraint SYS_C0010388;
prompt Enabling foreign key constraints for EVENT_OPERATOR...
alter table EVENT_OPERATOR enable constraint SYS_C0010392;
alter table EVENT_OPERATOR enable constraint SYS_C0010393;
prompt Enabling foreign key constraints for PARTICIPANT...
alter table PARTICIPANT enable constraint SYS_C0010367;
prompt Enabling foreign key constraints for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT enable constraint SYS_C0010401;
alter table EVENT_PARTICIPANT enable constraint SYS_C0010402;
prompt Enabling foreign key constraints for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS enable constraint SYS_C0010375;
prompt Enabling foreign key constraints for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE enable constraint SYS_C0010371;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for ACTIVITYOPERATOR...
alter table ACTIVITYOPERATOR enable all triggers;
prompt Enabling triggers for HALL...
alter table HALL enable all triggers;
prompt Enabling triggers for MANAGER...
alter table MANAGER enable all triggers;
prompt Enabling triggers for EVENT...
alter table EVENT enable all triggers;
prompt Enabling triggers for EVENT_OPERATOR...
alter table EVENT_OPERATOR enable all triggers;
prompt Enabling triggers for PARTICIPANT...
alter table PARTICIPANT enable all triggers;
prompt Enabling triggers for EVENT_PARTICIPANT...
alter table EVENT_PARTICIPANT enable all triggers;
prompt Enabling triggers for MANAGER_WORKING_DAYS...
alter table MANAGER_WORKING_DAYS enable all triggers;
prompt Enabling triggers for PERSON_MORE_PHONE...
alter table PERSON_MORE_PHONE enable all triggers;

set feedback on
set define on
prompt Done
