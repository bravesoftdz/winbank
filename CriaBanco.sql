create table alineas (
   codigo         smallint         Not Null,
   descricao      Varchar(255)     Not Null,
   constraint pk_alineas primary key (codigo));

create table bancos (
   codigo         smallint         Not Null,
   Nome           varchar(50)      Not Null,
   constraint pk_bancos primary key(codigo));

create index idx_bancos_nome on bancos(nome);

create table clientes (
   cnpj           char(14)         Not Null,
   nome           varchar(45)      Not Null,
   fone           varchar(15),
   constraint pk_clientes primary key(cnpj) 
   );
create index idx_clientes_nome on clientes(nome);

create table cheques (
   cnpj           char(14)         Not Null,
   banco          smallint         Not Null,
   agencia        smallint         Not null,
   conta          smallint         Not Null,
   numero         smallint         Not Null,
   valor          Float            Not Null,
   emissao        date             Not Null,
   alinea         smallint         Not Null,
   constraint pk_cheques           primary key(cnpj,banco,agencia,conta,numero),
   constraint fk_cheques_alineas   foreign key(alinea) references alineas(codigo),
   constraint fk_cheques_bancos    foreign key(banco)  references bancos(codigo),
   constraint fk_cheques_clientes  foreign key(cnpj)   references clientes(cnpj)
   );


insert into Alineas values (11,'Cheque sem fundo - 1� apresenta��o');
insert into Alineas values (12,'Cheque sem fundo - 2� apresenta��o');
insert into Alineas values (13,'Conta encerrada');
insert into Alineas values (14,'Pr�tica espuria');
insert into Alineas values (21,'Contra ordem (ou revoga��o) ou oposi��o ( ou susta��o) ao pagamento pelo emitente ou pelo leg�timo portador');
insert into Alineas values (22,'Diverg�ncia ou insufucu�ncia de assinatura');
insert into Alineas values (23,'Cheques emitidos por entidades e Org�os da Administra��o P�blica Federal direta e indireta em desacordo com os requisitos constantes do art. 74, par�grafo 2., do D.L. n� 200, de 25/02/1967');
insert into Alineas values (24,'Bloqueio judicial ou determina��o do Banco Central do Brasil');
insert into Alineas values (25,'Cancelamento de talon�rio pelo Banco Sacado');
insert into Alineas values (26,'Inoper�ncia tempor�ria de transporte');
insert into Alineas values (27,'Feriado municipal n�o previsto');
insert into Alineas values (28,'Contra ordem (ou revoga��o) ou oposi��o (ou susta��o) ao pagamento por furto ou roubo, cuja utiliza��o fica condicionada a apresenta��o pelo emitente ou portador legitimado (no caso de oposi��o ou susta��o), da respectiva ocorr�ncia policial');
insert into Alineas values (29,'Cheque bloqueado por falta de confirma��o do recebimento do talon�rio pelo correntista');
insert into Alineas values (30,'Furto ou roubo de malotes');
insert into Alineas values (31,'Erro formal (sem data de emiss�o, com m�s grafado num�ricamente, aus�ncia de assinatura e n�o registro de valor por extenso');
insert into Alineas values (32,'Aus�ncia ou iregularidade na aplica��o do carimbo de compensa��o');
insert into Alineas values (33,'Diverg�ncia de endosso');
insert into Alineas values (34,'Cheque apresentado por estabelecimento banc�rio que n�o o indicado no cruzamento em preto, sem o endosso mandato');
insert into Alineas values (35,'Cheque fraudado');
insert into Alineas values (36,'Cheque emitido com mais de um endosso');
insert into Alineas values (37,'Registro inconsistente - CEL/Compensa��o Eletr�nica');
insert into Alineas values (40,'Mo�da inv�lida');
insert into Alineas values (41,'Cheque apresentado a banco que n�o o sacado');
insert into Alineas values (42,'Cheque n�o compens�vel na sess�o ou sitema de compensa��o em que apresentaddo e Recibos Interban�arios quando trocados na sess�o que n�o a de trocas noturnas');
insert into Alineas values (43,'Cheque devolvido anteriormente pelos motivos 21, 22, 23,  24, 31 e 34 n�o pass�vel de reapresenta��o por persistir o motivo da devolu��o');
insert into Alineas values (44,'Cheque prescrito');
insert into Alineas values (45,'Cheque emitido por entidade obrigada a realizar movimenta��o e utiliza��o de recursos financeiros do Tesouro Nacional mediante Ordem Banc�ria');
insert into Alineas values (46,'CR, quando o cheque correspondente n�o for entregue ao banco sacado nos prazos estabelecidos');
insert into Alineas values (47,'CR com aus�ncia ou inconsist�ncia de dados obrigat�rios referentesao cheque correspondente');
insert into Alineas values (48,'Cheque de valor superior sem a identifica��o do benefici�rio');
insert into Alineas values (49,'Remessa nula caracterizada pela reapresenta��o de cheques anteriormente devolvidos pelos motivos 12, 13, 14, 25, 28, 30, 35, 43, 44, 45 e 48');
insert into Alineas values (51,'Diverg�ncia no valor recebido');
insert into Alineas values (52,'Recebimento efetuado fora do prazo');
insert into Alineas values (53,'Apresenta��o indevida');
insert into Alineas values (54,'Aus�ncia ou irregularidade do carimbo de compensa��o');
insert into Alineas values (55,'Aus�ncia ou irregularidade na autentica��o mec�nica');
insert into Alineas values (56,'Transfer�ncia insuficiente para a finalidade indicada no documento de cr�dito - DOC C e Ordens Banc�rias');
insert into Alineas values (60,'Padr�o monet�rio n�o definido');
insert into Alineas values (61,'Papel n�o compens�vel');
insert into Alineas values (63,'Registro insuficiente');
insert into Alineas values (64,'Arquivo l�gico n�o processado/processado parcialmente');


insert into bancos values (204,'American Express Bank Brasil Banco M�ltiplo S.A.');
insert into bancos values (246,'Banco ABC Brasil S.A.');
insert into bancos values (356,'Banco ABN AMRO Real S.A');
insert into bancos values (025,'Banco Alfa S.A.');
insert into bancos values (641,'Banco Alvorada S.A.');
insert into bancos values (029,'Banco Banerj S.A.');
insert into bancos values (038,'Banco Banestado S.A.');
insert into bancos values (740,'Banco Barclays S.A.');
insert into bancos values (107,'Banco BBM S.A.');
insert into bancos values (031,'Banco Beg S.A.');
insert into bancos values (036,'Banco Bem S.A.');
insert into bancos values (394,'Banco BMC S.A.');
insert into bancos values (318,'Banco BMG S.A.');
insert into bancos values (752,'Banco BNP Paribas Brasil S.A.');
insert into bancos values (248,'Banco Boavista Interatl�ntico S.A.');
insert into bancos values (237,'Banco Bradesco S.A.');
insert into bancos values (225,'Banco Brascan S.A.');
insert into bancos values (263,'Banco Cacique S.A.');
insert into bancos values (222,'Banco Calyon Brasil S.A.');
insert into bancos values (040,'Banco Cargill S.A.');
insert into bancos values (745,'Banco Citibank S.A.');
insert into bancos values (215,'Banco Comercial e de Investimento Sudameris S.A.');
insert into bancos values (756,'Banco Cooperativo do Brasil S.A. - BANCOOB');
insert into bancos values (748,'Banco Cooperativo Sicredi S.A. - BANSICREDI');
insert into bancos values (505,'Banco Credit Suisse (Brasil) S.A.');
insert into bancos values (229,'Banco Cruzeiro do Sul S.A.');
insert into bancos values (003,'Banco da Amaz�nia S.A.');
insert into bancos values (707,'Banco Daycoval S.A.');
insert into bancos values (024,'Banco de Pernambuco S.A. - BANDEPE');
insert into bancos values (456,'Banco de Tokyo-Mitsubishi UFJ Brasil S.A.');
insert into bancos values (214,'Banco Dibens S.A.');
insert into bancos values (001,'Banco do Brasil S.A.');
insert into bancos values (027,'Banco do Estado de Santa Catarina S.A.');
insert into bancos values (033,'Banco do Estado de S�o Paulo S.A. - Banespa');
insert into bancos values (047,'Banco do Estado de Sergipe S.A.');
insert into bancos values (037,'Banco do Estado do Par� S.A.');
insert into bancos values (041,'Banco do Estado do Rio Grande do Sul S.A.');
insert into bancos values (004,'Banco do Nordeste do Brasil S.A.');
insert into bancos values (265,'Banco Fator S.A.');
insert into bancos values (224,'Banco Fibra S.A.');
insert into bancos values (175,'Banco Finasa S.A.');
insert into bancos values (252,'Banco Fininvest S.A.');
insert into bancos values (233,'Banco GE Capital S.A.');
insert into bancos values (734,'Banco Gerdau S.A.');
insert into bancos values (612,'Banco Guanabara S.A.');
insert into bancos values (063,'Banco Ibi S.A. Banco M�ltiplo');
insert into bancos values (604,'Banco Industrial do Brasil S.A.');
insert into bancos values (320,'Banco Industrial e Comercial S.A.');
insert into bancos values (653,'Banco Indusval S.A.');
insert into bancos values (630,'Banco Intercap S.A.');
insert into bancos values (249,'Banco Investcred Unibanco S.A.');
insert into bancos values (048,'Banco Ita� BBA S.A.');
insert into bancos values (652,'Banco Ita� Holding Financeira S.A.');
insert into bancos values (341,'Banco Ita� S.A.');
insert into bancos values (376,'Banco J. P. Morgan S.A.');
insert into bancos values (074,'Banco J. Safra S.A.');
insert into bancos values (757,'Banco KEB do Brasil S.A.');
insert into bancos values (600,'Banco Luso Brasileiro S.A.');
insert into bancos values (392,'Banco Mercantil de S�o Paulo S.A.');
insert into bancos values (389,'Banco Mercantil do Brasil S.A.');
insert into bancos values (755,'Banco Merrill Lynch de Investimentos S.A.');
insert into bancos values (151,'Banco Nossa Caixa S.A.');
insert into bancos values (045,'Banco Opportunity S.A. ');
insert into bancos values (208,'Banco Pactual S.A.');
insert into bancos values (623,'Banco Panamericano S.A.');
insert into bancos values (611,'Banco Paulista S.A.');
insert into bancos values (643,'Banco Pine S.A.');
insert into bancos values (638,'Banco Prosper S.A.');
insert into bancos values (747,'Banco Rabobank International Brasil S.A.');
insert into bancos values (633,'Banco Rendimento S.A.');
insert into bancos values (072,'Banco Rural Mais S.A.');
insert into bancos values (453,'Banco Rural S.A.');
insert into bancos values (422,'Banco Safra S.A.');
insert into bancos values (353,'Banco Santander Brasil S.A.');
insert into bancos values (008,'Banco Santander Meridional S.A.');
insert into bancos values (351,'Banco Santander S.A.');
insert into bancos values (250,'Banco Schahin S.A.');
insert into bancos values (749,'Banco Simples S.A.');
insert into bancos values (366,'Banco Soci�t� G�n�rale Brasil S.A.');
insert into bancos values (637,'Banco Sofisa S.A.');
insert into bancos values (347,'Banco Sudameris Brasil S.A.');
insert into bancos values (464,'Banco Sumitomo Mitsui Brasileiro S.A.');
insert into bancos values (634,'Banco Tri�ngulo S.A.');
insert into bancos values (247,'Banco UBS S.A.');
insert into bancos values (116,'Banco �nico S.A.');
insert into bancos values (655,'Banco Votorantim S.A.');
insert into bancos values (610,'Banco VR S.A.');
insert into bancos values (370,'Banco WestLB do Brasil S.A.');
insert into bancos values (021,'BANESTES S.A. Banco do Estado do Esp�rito Santo');
insert into bancos values (719,'Banif-Banco Internacional do Funchal (Brasil)S.A.');
insert into bancos values (479,'BankBoston Banco M�ltiplo S.A.');
insert into bancos values (744,'BankBoston N.A.');
insert into bancos values (073,'BB Banco Popular do Brasil S.A.');
insert into bancos values (069,'BPN Brasil Banco M�tiplo S.A.');
insert into bancos values (070,'BRB - Banco de Bras�lia S.A.');
insert into bancos values (104,'Caixa Econ�mica Federal');
insert into bancos values (477,'Citibank N.A.');
insert into bancos values (487,'Deutsche Bank S.A. - Banco Alem�o');
insert into bancos values (751,'Dresdner Bank Brasil S.A.');
insert into bancos values (210,'Dresdner Bank Lateinamerika Aktiengesellschaft');
insert into bancos values (062,'Hipercard Banco M�ltiplo S.A.');
insert into bancos values (399,'HSBC Bank Brasil S.A. - Banco M�ltiplo');
insert into bancos values (492,'ING Bank N.V.');
insert into bancos values (488,'JPMorgan Chase Bank');
insert into bancos values (065,'Lemon Bank Banco M�ltiplo S.A.');
insert into bancos values (409,'UNIBANCO - Uni�o de Bancos Brasileiros S.A.');
insert into bancos values (230,'Unicard Banco M�ltiplo S.A.');
insert into bancos values (654,'Banco A.J.Renner S.A.');
insert into bancos values (213,'Banco Arbi S.A.');
insert into bancos values (035,'Banco BEC S.A.');
insert into bancos values (739,'Banco BGN S.A.');
insert into bancos values (218,'Banco Bonsucesso S.A.');
insert into bancos values (044,'Banco BVA S.A.');
insert into bancos values (412,'Banco Capital S.A.');
insert into bancos values (266,'Banco C�dula S.A.');
insert into bancos values (241,'Banco Cl�ssico S.A.');
insert into bancos values (753,'Banco Comercial Uruguai S.A.');
insert into bancos values (075,'Banco CR2 S.A.');
insert into bancos values (721,'Banco Credibel S.A.');
insert into bancos values (300,'Banco de La Nacion Argentina');
insert into bancos values (495,'Banco de La Provincia de Buenos Aires');
insert into bancos values (494,'Banco de La Republica Oriental del Uruguay');
insert into bancos values (039,'Banco do Estado do Piau� S.A. - BEP');
insert into bancos values (626,'Banco Ficsa S.A.');
insert into bancos values (217,'Banco John Deere S.A.');
insert into bancos values (076,'Banco KDB S.A.');
insert into bancos values (212,'Banco Matone S.A.');
insert into bancos values (243,'Banco M�xima S.A.');
insert into bancos values (746,'Banco Modal S.A.');
insert into bancos values (738,'Banco Morada S.A.');
insert into bancos values (066,'Banco Morgan Stanley Dean Witter S.A.');
insert into bancos values (613,'Banco Pec�nia S.A.');
insert into bancos values (724,'Banco Porto Seguro S.A.');
insert into bancos values (735,'Banco Pottencial S.A.');
insert into bancos values (741,'Banco Ribeir�o Preto S.A.');
insert into bancos values (743,'Banco Semear S.A.');
insert into bancos values (064,'Goldman Sachs do Brasil Banco M�ltiplo S.A.');
insert into bancos values (254,'Paran� Banco S.A.');
commit;
