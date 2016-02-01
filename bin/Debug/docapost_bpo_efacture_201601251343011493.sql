-- MySqlBackup.NET 2.0.9.2
-- Dump Time: 2016-01-25 13:43:01
-- --------------------------------------
-- Server version 10.0.21-MariaDB-wsrep MariaDB Server, wsrep_25.10.r4144




-- 
-- Definition of indexfiche_edi
-- 

DROP TABLE IF EXISTS `indexfiche_edi`;
CREATE TABLE IF NOT EXISTS `indexfiche_edi` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `documentsassocies` text,
  `vdm_localisation` text,
  `refpapier` varchar(10) DEFAULT NULL,
  `nombrepages` int(11) DEFAULT NULL,
  `PurgeArchivSecur` enum('N','Y') DEFAULT 'N',
  `CdArchivSecur` varchar(50) DEFAULT NULL,
  `lot_index` varchar(100) DEFAULT NULL,
  `lot_production` int(11) DEFAULT '0',
  `interbox` enum('N','Y') NOT NULL DEFAULT 'N',
  `visible` enum('N','Y') NOT NULL DEFAULT 'Y',
  `provenance` enum('PRODUCTION','INTERUPLOAD') NOT NULL DEFAULT 'PRODUCTION',
  `DocumentType` varchar(5) DEFAULT NULL,
  `DocumentFormatDescription` varchar(50) DEFAULT NULL,
  `DocumentNumber` varchar(15) DEFAULT NULL,
  `DocumentUUID` varchar(25) DEFAULT NULL,
  `DocumentDate` date DEFAULT NULL,
  `SenderVATCode` varchar(25) DEFAULT NULL,
  `SenderSIREN` varchar(25) DEFAULT NULL,
  `SenderSIRET` varchar(25) DEFAULT NULL,
  `SenderName` varchar(100) DEFAULT NULL,
  `SenderAddress` varchar(255) DEFAULT NULL,
  `SenderCountryCode` varchar(5) DEFAULT NULL,
  `RecipientVATCode` varchar(25) DEFAULT NULL,
  `RecipientSIREN` varchar(25) DEFAULT NULL,
  `RecipientSIRET` varchar(25) DEFAULT NULL,
  `RecipientName` varchar(100) DEFAULT NULL,
  `RecipientAddress` varchar(255) DEFAULT NULL,
  `RecipientCountryCode` varchar(5) DEFAULT NULL,
  `ProcessingDate` varchar(20) DEFAULT NULL,
  `CurrencyCode` varchar(5) DEFAULT NULL,
  `TaxExclusiveAmount` decimal(10,2) DEFAULT NULL,
  `TaxInclusiveAmount` decimal(10,2) DEFAULT NULL,
  `TaxTotalAmount` decimal(10,2) DEFAULT NULL,
  `Direction` varchar(25) DEFAULT NULL,
  `PaymentDueDate` date DEFAULT NULL,
  PRIMARY KEY (`enreg`),
  KEY `nombrepages` (`nombrepages`),
  KEY `PurgeArchivSecur` (`PurgeArchivSecur`),
  KEY `CdArchivSecur` (`CdArchivSecur`),
  KEY `lot_index` (`lot_index`),
  KEY `lot_production` (`lot_production`),
  KEY `visible` (`visible`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table indexfiche_docapost_bpo_efacture';

-- 
-- Dumping data for table indexfiche_edi
-- 



-- 
-- Definition of indexfiche_pdf_signes
-- 

DROP TABLE IF EXISTS `indexfiche_pdf_signes`;
CREATE TABLE IF NOT EXISTS `indexfiche_pdf_signes` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `documentsassocies` text,
  `vdm_localisation` text,
  `refpapier` varchar(10) DEFAULT NULL,
  `nombrepages` int(11) DEFAULT NULL,
  `PurgeArchivSecur` enum('N','Y') DEFAULT 'N',
  `CdArchivSecur` varchar(50) DEFAULT NULL,
  `lot_index` varchar(100) DEFAULT NULL,
  `lot_production` int(11) DEFAULT '0',
  `interbox` enum('N','Y') NOT NULL DEFAULT 'N',
  `visible` enum('N','Y') NOT NULL DEFAULT 'Y',
  `provenance` enum('PRODUCTION','INTERUPLOAD') NOT NULL DEFAULT 'PRODUCTION',
  `REFERENCEFICHIER` int(15) DEFAULT NULL,
  `DATEEMISSION` varchar(20) DEFAULT NULL,
  `SENS` varchar(25) DEFAULT NULL,
  `NUMFACTURE` varchar(15) DEFAULT NULL,
  `TYPEDOCUMENT` varchar(25) DEFAULT NULL,
  `DATEDOCUMENT` date DEFAULT NULL,
  `TVAEMETTEUR` varchar(25) DEFAULT NULL,
  `TVADESTINATAIRE` varchar(25) DEFAULT NULL,
  `RAISOCDESTINATAIRE` varchar(100) DEFAULT NULL,
  `MONTANTTTC` decimal(10,2) DEFAULT NULL,
  `MONTANTHT` decimal(10,2) DEFAULT NULL,
  `DEVISE` varchar(5) DEFAULT NULL,
  `STATUT` varchar(10) DEFAULT NULL,
  `CANAL` varchar(10) DEFAULT NULL,
  `PUSHMAIL` varchar(10) DEFAULT NULL,
  `RAISOCEMETTEUR` varchar(50) DEFAULT NULL,
  `REFCLIENTEMETTEUR` varchar(100) DEFAULT NULL,
  `REFCLIENTDESTINATAIRE` varchar(15) DEFAULT NULL,
  `PAYSEMETTEUR` varchar(50) DEFAULT NULL,
  `PAYSDESTINATAIRE` varchar(50) DEFAULT NULL,
  `OUTILVERIFSIGNATURE` varchar(100) DEFAULT NULL,
  `DATEVERIFSIGNATURE` varchar(20) DEFAULT NULL,
  `STATUTVERIFSIGNATURE` varchar(5) DEFAULT NULL,
  `TYPE_DEMAT` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`enreg`),
  KEY `nombrepages` (`nombrepages`),
  KEY `PurgeArchivSecur` (`PurgeArchivSecur`),
  KEY `CdArchivSecur` (`CdArchivSecur`),
  KEY `lot_index` (`lot_index`),
  KEY `lot_production` (`lot_production`),
  KEY `visible` (`visible`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table indexfiche_pdf_signes
-- 



-- 
-- Definition of mail_retours
-- 

DROP TABLE IF EXISTS `mail_retours`;
CREATE TABLE IF NOT EXISTS `mail_retours` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `WSQID` varchar(50) DEFAULT NULL,
  `TYPE_RETOUR` varchar(50) DEFAULT NULL,
  `DATE_RETOUR` datetime DEFAULT NULL,
  `MESSAGE` varchar(100) DEFAULT NULL,
  `REFRESLINK` varchar(100) DEFAULT NULL,
  `HEUREDEBUT` datetime DEFAULT NULL,
  `HEUREFIN` datetime DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`enreg`),
  KEY `WSQID` (`WSQID`),
  KEY `TYPE_RETOUR` (`TYPE_RETOUR`),
  KEY `DATE_RETOUR` (`DATE_RETOUR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dumping data for table mail_retours
-- 



-- 
-- Definition of vdm_alerte_securite_opn
-- 

DROP TABLE IF EXISTS `vdm_alerte_securite_opn`;
CREATE TABLE IF NOT EXISTS `vdm_alerte_securite_opn` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `heure` time NOT NULL DEFAULT '00:00:00',
  `referer` text NOT NULL,
  `machine` text NOT NULL,
  `request_method` text NOT NULL,
  `request_uri` text NOT NULL,
  PRIMARY KEY (`enreg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des alertes securite NATION';

-- 
-- Dumping data for table vdm_alerte_securite_opn
-- 



-- 
-- Definition of vdm_applications
-- 

DROP TABLE IF EXISTS `vdm_applications`;
CREATE TABLE IF NOT EXISTS `vdm_applications` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_application` varchar(100) NOT NULL DEFAULT '0',
  `ordre` tinyint(4) NOT NULL DEFAULT '0',
  `libelle_lg0` varchar(100) NOT NULL DEFAULT '',
  `libelle_lg1` varchar(100) NOT NULL DEFAULT '',
  `filtre_indexfiche` varchar(255) NOT NULL DEFAULT '',
  `table_indexfiche` varchar(50) NOT NULL DEFAULT '',
  `outlines` text NOT NULL,
  `deplacement_interbox` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `id_appli` (`id_application`),
  UNIQUE KEY `ordre` (`ordre`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Liste des applications';

-- 
-- Dumping data for table vdm_applications
-- 

INSERT INTO `vdm_applications`(`enreg`,`id_application`,`ordre`,`libelle_lg0`,`libelle_lg1`,`filtre_indexfiche`,`table_indexfiche`,`outlines`,`deplacement_interbox`) VALUES
(1,'Factures_EDI',10,'Factures EDI','','','indexfiche_edi','','N'),
(2,'suivi_prod',0,'Suivi de la production','Suivi de la production','','vdm_suivi_prod','','N'),
(3,'PDF',20,'PDF','','','indexfiche_pdf_signes','','N');

-- 
-- Definition of vdm_baskets
-- 

DROP TABLE IF EXISTS `vdm_baskets`;
CREATE TABLE IF NOT EXISTS `vdm_baskets` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(20) NOT NULL DEFAULT '0',
  `fiche` int(11) NOT NULL DEFAULT '0',
  `documentsassocies` text NOT NULL,
  `vdm_localisation` text NOT NULL,
  `numdoc` int(11) NOT NULL DEFAULT '0',
  `id_application` varchar(100) NOT NULL DEFAULT '0',
  `libelle` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`enreg`),
  KEY `user_login` (`user_login`),
  KEY `id_application` (`id_application`),
  KEY `libelle` (`libelle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste élements du panier';

-- 
-- Dumping data for table vdm_baskets
-- 



-- 
-- Definition of vdm_cfg
-- 

DROP TABLE IF EXISTS `vdm_cfg`;
CREATE TABLE IF NOT EXISTS `vdm_cfg` (
  `variable` varchar(100) NOT NULL,
  `valeur` text NOT NULL,
  `label` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`variable`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table des configurations';

-- 
-- Dumping data for table vdm_cfg
-- 

INSERT INTO `vdm_cfg`(`variable`,`valeur`,`label`,`date`) VALUES
('META_TAG_DESCRIPTION','docapost_bpo_efacture','','2015-12-17 10:08:11'),
('DEBUG','1','','2009-11-17 12:16:04'),
('ERROR_REPORTING','2047','','2009-11-17 12:16:04'),
('EXIT_ON_ERROR','1','','2009-11-17 12:16:04'),
('MAINTENANCE','0','','2009-11-17 12:16:04'),
('STYLE','docapost_bpo_efacture.css','','2015-12-17 10:08:11'),
('ARRONDI_SPACER','5','','2009-11-17 12:16:04'),
('LOGIN_WARNING','1','','2009-11-17 12:16:04'),
('URL_SITE_ORSID','http://www.docapost.com','','2009-11-17 12:16:04'),
('DATE','1','','2009-11-17 12:16:04'),
('MAX_EXECUTION_TIME','300','','2009-11-17 12:16:04'),
('NAV_DEMARRAGE','formulaire','','2009-11-17 12:16:04'),
('HELP','0','','2015-12-17 10:08:11'),
('UTILITAIRES','0','','2009-11-17 12:16:04'),
('SECURITE_FINGERPRINT','0','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_LOGIN','off','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_FORMULAIRE','on','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_USER','on','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_STATS','on','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_LISTEINDEX','on','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_LLK','on','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_MAIL','on','','2009-11-17 12:16:04'),
('AUTOCOMPLETE_FAX','on','','2009-11-17 12:16:04'),
('HAUTEUR_LISTE_INDEX','500','','2009-11-17 12:16:04'),
('LARGEUR_LISTE_INDEX','400','','2009-11-17 12:16:04'),
('MAX_LIGNES_LISTEINDEX','10','','2009-11-17 12:16:04'),
('MAX_LIGNES_LISTEINDEX_AUTO','1','','2009-11-17 12:16:04'),
('MAX_LIGNES_REPONSES','15','','2009-11-17 12:16:04'),
('MAX_LIGNES_REPONSES_AUTO','1','','2009-11-17 12:16:04'),
('MAX_LIGNES_BASKET','10','','2009-11-17 12:16:04'),
('MAX_LIGNES_UTILISATEURS','20','','2009-11-17 12:16:04'),
('MAX_LIGNES_STAT_DETAIL','20','','2009-11-17 12:16:04'),
('MAX_LIGNES_TELECHARGEMENTS','10','','2009-11-17 12:16:04'),
('USERS_TRI','alogin','','2009-11-17 12:16:04'),
('SUIVIPROD_TRI','adate','','2009-11-17 12:16:04'),
('WARNING_TAILLE_FICHIER','1048576','','2009-11-17 12:16:04'),
('WARNING_NOMBRE_PAGES','200','','2009-11-17 12:16:04'),
('TABLE_APPLICATIONS','vdm_applications','','2009-11-17 12:16:04'),
('TABLE_BASKETS','vdm_baskets','','2009-11-17 12:16:04'),
('TABLE_FDP','vdm_fdp','','2009-11-17 12:16:04'),
('TABLE_FORM_ELEMENTS','vdm_form_elements','','2009-11-17 12:16:04'),
('TABLE_GROUPES','vdm_groupes','','2009-11-17 12:16:04'),
('TABLE_LASERLIKE','vdm_laserlike','','2009-11-17 12:16:04'),
('TABLE_PROFILS','vdm_profils','','2009-11-17 12:16:04'),
('TABLE_STOCKAGE','vdm_stockage','','2009-11-17 12:16:04'),
('TABLE_SUIVI_PROD','vdm_suivi_prod','','2009-11-17 12:16:04'),
('TABLE_TAMPONS','vdm_tampons','','2009-11-17 12:16:04'),
('TABLE_TELECHARGEMENTS','vdm_telechargements','','2009-11-17 12:16:04'),
('TABLE_USERS','vdm_users','','2009-11-17 12:16:04'),
('TABLE_UTILITAIRES','vdm_utilitaires','','2009-11-17 12:16:04'),
('TABLE_LOGINS','vdm_logins','','2009-11-17 12:16:04'),
('TABLE_TOOLTIP','vdm_tooltip','','2009-11-17 12:16:04'),
('TABLE_INTERBOX','vdm_interbox','','2009-11-17 12:16:04'),
('TABLE_REQUETE','vdm_requete','','2009-11-17 12:16:04'),
('TABLE_INTERSCAN','vdm_scan','','2009-11-17 12:16:04'),
('TABLE_INTERUPLOAD','vdm_upload','','2009-11-17 12:16:04'),
('TABLE_INFOS_CFEC','vdm_info_cfec','','2009-11-17 12:16:04'),
('TABLE_FORGOT_PASSWORD','vdm_forgot_password','','2009-11-17 12:16:04'),
('CHAMP_ENREG','enreg','','2009-11-17 12:16:04'),
('CHAMP_DOCUMENTS','documentsassocies','','2009-11-17 12:16:04'),
('CHAMP_FONDDEPAGE','refpapier','','2009-11-17 12:16:04'),
('CHAMP_NOMBREPAGES','nombrepages','','2009-11-17 12:16:04'),
('CHAMP_LOCALISATION','vdm_localisation','','2009-11-17 12:16:04'),
('WILDCARDS','*%?_','','2009-11-17 12:16:04'),
('CONFIDENTIALITE','0','','2009-11-17 12:16:04'),
('CONF_NIVEAUX','3','','2009-11-17 12:16:04'),
('CONF_NIVEAUX_GROUPES','1','','2009-11-17 12:16:04'),
('CONF_PRESENTATION','0','','2009-11-17 12:16:04'),
('CONF_PRESENTATION_GROUPES','0','','2009-11-17 12:16:04'),
('CONF_CHAMP_NIVEAU_1','conf1','','2009-11-17 12:16:04'),
('CONF_CHAMP_NIVEAU_2','conf2','','2009-11-17 12:16:04'),
('CONF_CHAMP_NIVEAU_3','conf3','','2009-11-17 12:16:04'),
('CONF_TABLE_NIVEAU_1','conf_n1','','2009-11-17 12:16:04'),
('CONF_TABLE_NIVEAU_2','conf_n2','','2009-11-17 12:16:04'),
('CONF_TABLE_NIVEAU_3','conf_n3','','2009-11-17 12:16:04'),
('CONF_LIAISON_N1_N2','conf_n1_n2','','2009-11-17 12:16:04'),
('CONF_LIAISON_N2_N3','conf_n2_n3','','2009-11-17 12:16:04'),
('MAILS','1','','2009-11-17 12:16:04'),
('MAIL_DEBUG','0','','2009-11-17 12:16:04'),
('MAIL_XMAILER','ORSID MAILER','','2009-11-17 12:16:04'),
('MAIL_HOST','192.168.10.2','','2009-11-17 12:16:04'),
('MAIL_PORT','25','','2009-11-17 12:16:04'),
('MAIL_TIMEOUT','30','','2009-11-17 12:16:04'),
('MAIL_DOMAIN','orsid.com','','2009-11-17 12:16:04'),
('MAIL_LARGEUR','480','','2009-11-17 12:16:04'),
('MAIL_HAUTEUR','480','','2009-11-17 12:16:04'),
('MAIL_ADRESSE_FROM','orsid-mailer@orsid.com','','2009-11-17 12:16:04'),
('MAIL_ADRESSE_REPLY','test@orsid.com','','2009-11-17 12:16:04'),
('MAIL_EN-TETE','','','2009-11-17 12:16:04'),
('MAIL_PIED','','','2009-11-17 12:16:04'),
('MAIL_COPY_TO_SENDER','1','','2009-11-17 12:16:04'),
('MAIL_COPY_TO_SENDER_DEFAULT','1','','2009-11-17 12:16:04'),
('MAIL_CC','1','','2009-11-17 12:16:04'),
('MAIL_CCI','1','','2009-11-17 12:16:04'),
('MAIL_NOTIFY','1','','2009-11-17 12:16:04'),
('MAIL_CCI_AUTO','1','','2009-11-17 12:16:04'),
('FRAME_DOCUMENT','1','','2009-11-17 12:16:04'),
('FRAME_FICHE','0','','2009-11-17 12:16:04'),
('FRAME_FICHE_DOCS','1','','2009-11-17 12:16:04'),
('AFFICHAGE_AUTO','1','','2009-11-17 12:16:04'),
('MAX_PAGE_AFFICHAGE_AUTO','50','','2009-11-17 12:16:04'),
('CURL_TIMEOUT','900','','2009-11-17 12:16:04'),
('ORSID_VIS_DEBUG','0','','2009-11-17 12:16:04'),
('VIS_DEF_INI','FileUniqueOnName=1','','2009-11-17 12:16:04'),
('VIS_PAGE_MODE','20','','2009-11-17 12:16:04'),
('OUTLINES_DOCUMENT','0','','2009-11-17 12:16:04'),
('OUTLINES_IMPRESSION_LOT','1','','2009-11-17 12:16:04'),
('CGV','0','','2009-11-17 12:16:04'),
('RECHERCHE_LLK_DROIT','GLB','','2009-11-17 12:16:04'),
('RECHERCHE_LLK','0','','2009-11-17 12:16:04'),
('MOTS_ENTIERS','1','','2009-11-17 12:16:04'),
('MOTS_ENTIERS_DEFAUT','1','','2009-11-17 12:16:04'),
('MAJ_MIN','1','','2009-11-17 12:16:04'),
('MAJ_MIN_DEFAUT','0','','2009-11-17 12:16:04'),
('EXPORT_MAX_LIGNES','250000','','2009-11-17 12:16:04'),
('EXPORT_SEPARATEUR_CSV',';','','2009-11-17 12:16:04'),
('EXPORT_DROIT','USR','','2009-11-17 12:16:04'),
('EXPORT_CSV','Y','','2009-11-17 12:16:04'),
('EXPORT_XLS','Y','','2009-11-17 12:16:04'),
('EXPORT_DOC','Y','','2009-11-17 12:16:04'),
('EXPORT_CSV_ENTETE','Y','','2009-11-17 12:16:04'),
('EXPORT_XLS_ENTETE','Y','','2009-11-17 12:16:04'),
('EXPORT_DOC_ENTETE','Y','','2009-11-17 12:16:04'),
('BASKETS','1','','2009-11-17 12:16:04'),
('BASKET_WARNING_PAS_VIDE','1','','2009-11-17 12:16:04'),
('BASKET_INDICE_DOC','0','','2009-11-17 12:16:04'),
('BASKET_MAX_ELEMENTS','1000','','2009-11-17 12:16:04'),
('LOT','1','','2009-11-17 12:16:04'),
('LOT_AFFICHAGE_AUTO','1','','2009-11-17 12:16:04'),
('LOT_MAX_FICHES','1000','','2009-11-17 12:16:04'),
('SESSION_TIME_DEFAUT','900','','2009-11-17 12:16:04'),
('USER_PASSWORD_MIN_LENGTH','7','','2009-11-17 12:16:04'),
('USER_PASSWORD_MAX_LENGTH','50','','2009-11-17 12:16:04'),
('USER_OLD_PASSWORD_LIST','3','','2009-11-17 12:16:04'),
('USER_PASSWORD_LIFE_TIME','90','','2009-11-17 12:16:04'),
('USER_PASSWORD_WARNING','5','','2009-11-17 12:16:04'),
('USER_SELECT_LOGIN','0','','2009-11-17 12:16:04'),
('USER_SELECT_LOGIN_HAUTEUR','400','','2009-11-17 12:16:04'),
('USER_SELECT_LOGIN_LARGEUR','400','','2009-11-17 12:16:04'),
('USER_LOGIN_MAX_ELEMENTS','10','','2009-11-17 12:16:04'),
('USER_PASS_NEVER_EXPIRES','USR','','2009-11-17 12:16:04'),
('USER_PASS_NEVER_EXPIRES_DEFAULT','N','','2009-11-17 12:16:04'),
('USER_CAN_CHANGE_PASS','USR','','2009-11-17 12:16:04'),
('USER_CAN_CHANGE_PASS_DEFAULT','Y','','2009-11-17 12:16:04'),
('USER_MUST_CHANGE_PASS','USR','','2009-11-17 12:16:04'),
('USER_MUST_CHANGE_PASS_DEFAULT','Y','','2009-11-17 12:16:04'),
('USER_TENTATIVES','Y','','2009-11-17 12:16:04'),
('USER_MAX_TENTATIVES','3','','2009-11-17 12:16:04'),
('STATS_NAVS_ACTIONS','doc_image/doc_panier/docs_panier/doc_lot/doc_tele/doc_sommaire/doc_bloc/mail_send/recherche/fiche/zip_one/zip_all/zip_panier','','2009-11-17 12:16:04'),
('STATS_NAVS_REQUETES','doc_image/doc_panier/docs_panier/doc_lot/doc_tele/doc_sommaire/doc_bloc/mail_send/zip_one/zip_all/zip_panier','','2009-11-17 12:16:04'),
('STATS_EXPORTS','1','','2009-11-17 12:16:04'),
('STATS_POPUP_LARGEUR','450','','2009-11-17 12:16:04'),
('STATS_POPUP_HAUTEUR','350','','2009-11-17 12:16:04'),
('TELECHARGEMENTS','0','','2009-11-17 12:16:04'),
('TELE_TIMEOUT_FICHIER','600','','2009-11-17 12:16:04'),
('TELE_WARNING_FICHIER','500','','2009-11-17 12:16:04'),
('TELE_FORCE_DOWNLOAD','0','','2009-11-17 12:16:04'),
('TELE_ORDERBY','order by date','','2009-11-17 12:16:04'),
('TELE_CHAMP_DATE','date','','2009-11-17 12:16:04'),
('TELE_DEMANDE_VALIDATION','1','','2009-11-17 12:16:04'),
('TELE_CHAMPS_USER','date_mise_en_ligne/date_fr/num_lot/nombrepages/octets/deja_vu/commentaire','','2009-11-17 12:16:04'),
('TELE_CHAMPS_ADMIN','date_mise_en_ligne/date_fr/num_lot/nombrepages/octets/deja_vu/conf1/conf2/conf3/commentaire/utilisateur/reserve_admin','','2009-11-17 12:16:04'),
('TELE_CONFIDENTIALITE','0','','2009-11-17 12:16:04'),
('TA','0','','2009-11-17 12:16:04'),
('TA_LARGEUR','800','','2009-11-17 12:16:04'),
('TA_HAUTEUR','600','','2009-11-17 12:16:04'),
('MULTI','1','','2009-11-17 12:16:04'),
('MULTI_SEPARATEUR',';','','2009-11-17 12:16:04'),
('CONN_UNIQUE','0','','2009-11-17 12:16:04'),
('PROFILS_LARGEUR','350','','2009-11-17 12:16:04'),
('PROFILS_HAUTEUR','500','','2009-11-17 12:16:04'),
('CONF_IMAGE','0','','2009-11-17 12:16:04'),
('CONF_IMAGE_CHAMP','conf1','','2009-11-17 12:16:04'),
('LIMIT_PAGE_POUR_BLOC','10000','','2009-11-17 12:16:04'),
('INTERVALLE_BLOC','500','','2009-11-17 12:16:04'),
('MODE_BLOC','1','','2009-11-17 12:16:04'),
('CREATEUR','A.ESTEVES','','2015-12-17 10:08:11'),
('DATE_CREATION','17/12/2015','','2015-12-17 10:08:11'),
('ZIP_ALL','0','','2009-11-17 12:16:04'),
('ZIP_ONE','0','','2009-11-17 12:16:04'),
('ZIP_PANIER','0','','2009-11-17 12:16:04'),
('MODIFICATION_CHAMP_SIMPLE','0','','2009-11-17 12:16:04'),
('INTERBOX','0','','2009-11-17 12:16:04'),
('INTERBOX_BOUTON_SUPPRIMER','0','','2009-11-17 12:16:04'),
('INTERBOX_FORCER_ENREGISTREMENT','0','','2009-11-17 12:16:04'),
('INTERBOX_DEPLACEMENT_INTERBOX','0','','2009-11-17 12:16:04'),
('INTERSCAN','0','','2009-11-17 12:16:04'),
('INTERSCAN_EXTENSION','jpg;pdf;tif;tiff','','2009-11-17 12:16:04'),
('INTERUPLOAD_EXTENSION','jpg;pdf;tif;tiff','','2009-11-17 12:16:04'),
('YUI_VERSION','2.9.0','','2009-11-17 12:16:04'),
('COFFRE_COMPTE_RENDU','1','','2009-11-17 12:16:04'),
('FAX','0','','2011-01-20 13:55:22'),
('FAX_LARGEUR','480','','2011-01-20 13:55:22'),
('FAX_HAUTEUR','450','','2011-01-20 13:55:22'),
('FAX_URL','http://192.168.46.62/orsid/orsid_fax/interfaces/index.php','','2011-01-20 13:55:22'),
('E_FAX_BASE','orsid_fax','','2011-01-20 13:55:22'),
('E_FAX_USER','fax','','2011-01-20 13:55:22'),
('E_FAX_PASS','HJOcuVBdG9gRDRGO','','2011-01-20 13:55:22'),
('COOKIE','1','','2011-01-20 13:55:22'),
('FORGOT_PASSWORD','1','','2011-11-27 14:47:01'),
('ZIP_MAX_LIGNES','500','','2011-05-12 21:10:22'),
('VERSIONSQL','1','','2015-12-17 10:08:49'),
('VERSIONSQLDATE','1450343329','','2015-12-17 10:08:49'),
('TABLE_SUIVIPROD','vdm_suivi_prod','','2011-05-12 21:10:22'),
('MAX_LIGNES_SUIVIPROD','25','','2011-05-12 21:10:22'),
('INTERUPLOAD','0','','2011-03-08 15:03:22'),
('INTERUPLOAD_TABLE','indexfiche','','2011-03-08 15:03:22'),
('INTERUPLOAD_FORM','INTERUPLOAD','','2011-03-08 15:03:22'),
('INTERUPLOADCREATION','https://archiv-e-service.orsid.com/interuploadreception/interupload.0.27/InterUpload.jar','','2011-03-08 15:03:22'),
('WEBSERVICE_INTERUPLOAD','1','','2011-03-08 15:03:22'),
('USER_PASSWORD_CORRELATION','1','Sécurité supplémentaire du mot de passe','2011-03-08 15:03:22'),
('USER_PASSWORD_CORRELATION_NIVEAU','3','Niveau de confidentialité pour le mot de passe','2011-03-08 15:03:22'),
('USER_PASSWORD_REGLE_MAJ','1','Au moins une majuscule','2011-03-08 15:03:22'),
('USER_PASSWORD_REGLE_MIN','1','Au moins une minuscule','2011-03-08 15:03:22'),
('USER_PASSWORD_REGLE_CHIFFRE','1','Au moins un chiffre','2011-03-08 15:03:22'),
('USER_PASSWORD_REGLE_SIGNE','1','Au moins un signe présent dans cette liste','2011-03-08 15:03:22'),
('USER_PASSWORD_REGLE__LISTE_SIGNE','(#,_,@,*,$,%,&,>,<,-,:)','','2011-03-08 15:03:22'),
('USER_PASSWORD_REGLE_LOGIN','1','Sécurité de base du mot de passe. Le login  est toujours différent du mot de passe.','2011-03-08 15:03:22'),
('salt','#j.+}3/3P~)#w4g','// le grain de sel -> http://strongpasswordgenerator.com/ #j.+}3/3P~)#w4g','2011-03-08 15:03:22');

-- 
-- Definition of vdm_fax_opn
-- 

DROP TABLE IF EXISTS `vdm_fax_opn`;
CREATE TABLE IF NOT EXISTS `vdm_fax_opn` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(50) NOT NULL,
  `fax_date` date NOT NULL,
  `fax_time` time NOT NULL,
  `emetteur_nom` varchar(255) NOT NULL,
  `emetteur_societe` varchar(255) NOT NULL,
  `emetteur_tel` varchar(20) NOT NULL,
  `emetteur_fax` varchar(20) NOT NULL,
  `emetteur_mail` varchar(100) NOT NULL,
  `destinataire_nom` varchar(255) NOT NULL,
  `destinataire_societe` varchar(255) NOT NULL,
  `destinataire_tel` varchar(20) NOT NULL,
  `destinataire_fax` varchar(20) NOT NULL,
  `fax_objet` varchar(255) NOT NULL,
  `fax_message` text NOT NULL,
  `fax_id` int(11) NOT NULL,
  PRIMARY KEY (`enreg`),
  KEY `user_login` (`user_login`),
  KEY `fax_date` (`fax_date`),
  KEY `fax_time` (`fax_time`),
  KEY `fax_id` (`fax_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des faxs NATION';

-- 
-- Dumping data for table vdm_fax_opn
-- 



-- 
-- Definition of vdm_fdp
-- 

DROP TABLE IF EXISTS `vdm_fdp`;
CREATE TABLE IF NOT EXISTS `vdm_fdp` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL DEFAULT '',
  `id_application` varchar(100) NOT NULL DEFAULT '',
  `id_fdp` varchar(100) NOT NULL DEFAULT '',
  `chemin_on` varchar(255) NOT NULL DEFAULT '',
  `chemin_off` varchar(255) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `scale_x` int(11) NOT NULL DEFAULT '100',
  `scale_y` int(11) NOT NULL DEFAULT '100',
  `rotation` int(11) NOT NULL DEFAULT '0',
  `cgv` varchar(255) NOT NULL DEFAULT '',
  `as_chemin_on` varchar(255) NOT NULL DEFAULT '',
  `as_x` int(11) NOT NULL DEFAULT '0',
  `as_y` int(11) NOT NULL DEFAULT '0',
  `as_scale_x` int(11) NOT NULL DEFAULT '100',
  `as_scale_y` int(11) NOT NULL DEFAULT '100',
  `as_rotation` int(11) NOT NULL DEFAULT '0',
  `as_calage_valide` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `NOM` (`nom`,`id_application`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='liste des fonds de page';

-- 
-- Dumping data for table vdm_fdp
-- 

INSERT INTO `vdm_fdp`(`enreg`,`nom`,`id_application`,`id_fdp`,`chemin_on`,`chemin_off`,`x`,`y`,`scale_x`,`scale_y`,`rotation`,`cgv`,`as_chemin_on`,`as_x`,`as_y`,`as_scale_x`,`as_scale_y`,`as_rotation`,`as_calage_valide`) VALUES
(1,'vide','DOCUMENTS','vide_DOCUMENTS','','',0,0,100,100,0,'','',0,0,100,100,0,'N'),
(2,'vide','PDF','tampon_PDF','','',0,0,100,100,0,'','',0,0,100,100,0,'N');

-- 
-- Definition of vdm_forgot_password
-- 

DROP TABLE IF EXISTS `vdm_forgot_password`;
CREATE TABLE IF NOT EXISTS `vdm_forgot_password` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_forgot_password` varchar(32) NOT NULL,
  `captcha` varchar(10) NOT NULL,
  `date_demande` datetime NOT NULL,
  `date_validation` datetime NOT NULL,
  `login` varchar(20) NOT NULL,
  `email` text NOT NULL,
  `status` enum('EN_ATTENTE','TRAITE') NOT NULL DEFAULT 'EN_ATTENTE',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `id_forgot_password` (`id_forgot_password`),
  KEY `date_demande` (`date_demande`),
  KEY `login` (`login`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='liste des demandes de mot de passe';

-- 
-- Dumping data for table vdm_forgot_password
-- 



-- 
-- Definition of vdm_form_elements
-- 

DROP TABLE IF EXISTS `vdm_form_elements`;
CREATE TABLE IF NOT EXISTS `vdm_form_elements` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_formulaire` varchar(100) NOT NULL DEFAULT '',
  `ordre` int(11) NOT NULL DEFAULT '0',
  `libelle_lg0` varchar(255) NOT NULL DEFAULT '',
  `libelle_lg1` varchar(255) NOT NULL DEFAULT '',
  `champ_sql` varchar(50) NOT NULL DEFAULT '',
  `longueur` int(11) NOT NULL DEFAULT '0',
  `type_champ` enum('STANDARD','INDEX_SIMPLE_DYNAMIQUE','INDEX_DOUBLE_DYNAMIQUE','INDEX_SIMPLE_PRECALCULE','INDEX_DOUBLE_PRECALCULE','CHOIX_SIMPLE_DYNAMIQUE','CHOIX_DOUBLE_DYNAMIQUE','CHOIX_SIMPLE_PRECALCULE','CHOIX_DOUBLE_PRECALCULE') NOT NULL DEFAULT 'STANDARD',
  `table_index` varchar(30) NOT NULL DEFAULT '',
  `champ_beetween` enum('N','Y') NOT NULL DEFAULT 'N',
  `btwn_lib_lg0` varchar(50) NOT NULL DEFAULT '',
  `btwn_lib_lg1` varchar(50) NOT NULL DEFAULT '',
  `occurences` enum('N','Y') NOT NULL DEFAULT 'N',
  `auto_complete` enum('N','Y') NOT NULL DEFAULT 'N',
  `nowrap` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`enreg`),
  KEY `ordre` (`ordre`),
  KEY `num_formulaire` (`id_formulaire`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=latin1 COMMENT='Liste des elements de formulaires';

-- 
-- Dumping data for table vdm_form_elements
-- 

INSERT INTO `vdm_form_elements`(`enreg`,`id_formulaire`,`ordre`,`libelle_lg0`,`libelle_lg1`,`champ_sql`,`longueur`,`type_champ`,`table_index`,`champ_beetween`,`btwn_lib_lg0`,`btwn_lib_lg1`,`occurences`,`auto_complete`,`nowrap`) VALUES
(1,'RESPONSE_FORM_SP',7,'numéro','number','enreg',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(2,'RESPONSE_FORM_SP',8,'Heure','Time','heure',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(3,'RESPONSE_FORM_SP',9,'Lot index','Lot index','lot_index',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(4,'RESPONSE_FORM_SP',10,'Numéro bdl','BDL number','numero_bdl',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(5,'RESPONSE_FORM_SP',5,'Nbre pages','Page number','nombre_pages',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(6,'RESPONSE_FORM_SP',6,'Date','Date','date',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(7,'RESPONSE_FORM_SP',4,'Nbre dossiers','Directory number','nombre_dossiers',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(8,'RESPONSE_FORM_SP',2,'Code application','Application code','code_application',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(9,'RESPONSE_FORM_SP',3,'Type opération','Action type','type_operation',0,'INDEX_DOUBLE_DYNAMIQUE','vdm_suivi_prod','N','','','N','N','N'),
(10,'SEARCH_FORM_SP',3,'Numéro BDL','BDL number','numero_bdl',0,'INDEX_DOUBLE_DYNAMIQUE','vdm_suivi_prod','N','','','N','N','N'),
(11,'SEARCH_FORM_SP',4,'Lot index','Lot index','lot_index',0,'INDEX_DOUBLE_DYNAMIQUE','vdm_suivi_prod','N','','','N','N','N'),
(12,'RESPONSE_FORM_SP',1,'Code client','Client code','code_client',0,'INDEX_DOUBLE_DYNAMIQUE','vdm_suivi_prod','N','','','N','N','N'),
(13,'SEARCH_FORM_SP',2,'Type opération','Action type','type_operation',0,'INDEX_DOUBLE_DYNAMIQUE','vdm_suivi_prod','N','','','N','N','N'),
(14,'SEARCH_FORM_SP',1,'Date opération','Action date','date',0,'STANDARD','vdm_suivi_prod','N','','','N','N','N'),
(15,'FORM_EDI',1,'Type du document','','DocumentType',0,'STANDARD','','N','','','N','N','N'),
(16,'FORM_EDI',2,'Description du format du document','','DocumentFormatDescription',0,'STANDARD','','N','','','N','N','N'),
(17,'FORM_EDI',3,'Numéro du document\r\n','','DocumentNumber',0,'STANDARD','','N','','','N','N','N'),
(18,'FORM_EDI',4,'UUID du document\r\n','','DocumentUUID',0,'STANDARD','','N','','','N','N','N'),
(19,'FORM_EDI',5,'Date du document\r\n','','DocumentDate',0,'INDEX_SIMPLE_DYNAMIQUE','','Y','Du/au','','N','N','N'),
(20,'FORM_EDI',6,'Code TVA émeteur','','SenderVATCode',0,'STANDARD','','N','','','N','N','N'),
(21,'FORM_EDI',7,'SIREN éméteur\r\n','','SenderSIREN',0,'STANDARD','','N','','','N','N','N'),
(22,'FORM_EDI',8,'SIRET éméteur\r\n','','SenderSIRET',0,'STANDARD','','N','','','N','N','N'),
(23,'FORM_EDI',9,'Nom éméteur\r\n','','SenderName',0,'STANDARD','','N','','','N','N','N'),
(24,'FORM_EDI',10,'Adresse éméteur','','SenderAddress',0,'STANDARD','','N','','','N','N','N'),
(25,'FORM_EDI',11,'Code pays éméteur\r\n','','SenderCountryCode',0,'STANDARD','','N','','','N','N','N'),
(26,'FORM_EDI',12,'Code TVA destinataire','','RecipientVATCode',0,'STANDARD','','N','','','N','N','N'),
(27,'FORM_EDI',13,'SIREN destinataire','','RecipientSIREN',0,'STANDARD','','N','','','N','N','N'),
(28,'FORM_EDI',14,'SIRET destinataire','','RecipientSIRET',0,'STANDARD','','N','','','N','N','N'),
(29,'FORM_EDI',15,'Nom destinataire','','RecipientName',0,'STANDARD','','N','','','N','N','N'),
(30,'FORM_EDI',16,'Adresse destinataire\r\n','','RecipientAddress',0,'STANDARD','','N','','','N','N','N'),
(31,'FORM_EDI',17,'Code pays destinataire','','RecipientCountryCode',0,'STANDARD','','N','','','N','N','N'),
(32,'FORM_EDI',18,'Date de traitement','','ProcessingDate',0,'STANDARD','','N','','','N','N','N'),
(33,'FORM_EDI',19,'Devise','','CurrencyCode',0,'STANDARD','','N','','','N','N','N'),
(34,'FORM_EDI',20,'Montant HT\r\n','','TaxExclusiveAmount',0,'STANDARD','','N','','','N','N','N'),
(35,'FORM_EDI',21,'Montant TTC\r\n','','TaxInclusiveAmount',0,'STANDARD','','N','','','N','N','N'),
(36,'FORM_EDI',22,'Montant total TVA\r\n','','TaxTotalAmount',0,'STANDARD','','N','','','N','N','N'),
(37,'FORM_EDI',23,'Sens','','Direction',0,'STANDARD','','N','','','N','N','N'),
(38,'FORM_EDI',24,'Date limite de paiement\r\n','','PaymentDueDate',0,'INDEX_SIMPLE_DYNAMIQUE','','Y','Du/au','','N','N','N'),
(39,'FORM_PDF',1,'Référence fichier','','REFERENCEFICHIER',0,'STANDARD','','N','','','N','N','N'),
(40,'FORM_PDF',2,'Date d''émission','','DATEEMISSION',0,'STANDARD','','N','','','N','N','N'),
(41,'FORM_PDF',3,'Sens','','SENS',0,'STANDARD','','N','','','N','N','N'),
(42,'FORM_PDF',4,'Numéro de facture','','NUMFACTURE',0,'STANDARD','','N','','','N','N','N'),
(43,'FORM_PDF',5,'Type du document','','TYPEDOCUMENT',0,'STANDARD','','N','','','N','N','N'),
(44,'FORM_PDF',6,'Date du document','','DATEDOCUMENT',0,'INDEX_SIMPLE_DYNAMIQUE','','Y','Du/au','','N','N','N'),
(45,'FORM_PDF',7,'TVA Emetteur','','TVAEMETTEUR',0,'STANDARD','','N','','','N','N','N'),
(46,'FORM_PDF',8,'TVA Destinataire','','TVADESTINATAIRE',0,'STANDARD','','N','','','N','N','N'),
(47,'FORM_PDF',9,'Raison sociale destinataire','','RAISOCDESTINATAIRE',0,'STANDARD','','N','','','N','N','N'),
(48,'FORM_PDF',10,'Montant TTC','','MONTANTTTC',0,'STANDARD','','N','','','N','N','N'),
(49,'FORM_PDF',11,'Montant HT','','MONTANTHT',0,'STANDARD','','N','','','N','N','N'),
(50,'FORM_PDF',12,'Devise','','DEVISE',0,'STANDARD','','N','','','N','N','N'),
(51,'FORM_PDF',13,'Statut','','STATUT',0,'STANDARD','','N','','','N','N','N'),
(52,'FORM_PDF',14,'Canal','','CANAL',0,'STANDARD','','N','','','N','N','N'),
(53,'FORM_PDF',15,'Push Mail','','PUSHMAIL',0,'STANDARD','','N','','','N','N','N'),
(54,'FORM_PDF',16,'Raison sociale émetteur','','RAISOCEMETTEUR',0,'STANDARD','','N','','','N','N','N'),
(55,'FORM_PDF',17,'Référence client émetteur','','REFCLIENTEMETTEUR',0,'STANDARD','','N','','','N','N','N'),
(56,'FORM_PDF',18,'Référence client destinataire','','REFCLIENTDESTINATAIRE',0,'STANDARD','','N','','','N','N','N'),
(57,'FORM_PDF',19,'Pays émetteur','','PAYSEMETTEUR',0,'STANDARD','','N','','','N','N','N'),
(58,'FORM_PDF',20,'Pays destinataire','','PAYSDESTINATAIRE',0,'STANDARD','','N','','','N','N','N'),
(59,'FORM_PDF',21,'Outil de vérification de la signature','','OUTILVERIFSIGNATURE',0,'STANDARD','','N','','','N','N','N'),
(60,'FORM_PDF',22,'Date de vérification de la signature','','DATEVERIFSIGNATURE',0,'STANDARD','','N','','','N','N','N'),
(61,'FORM_PDF',23,'Statut de vérification de la signature','','STATUTVERIFSIGNATURE',0,'STANDARD','','N','','','N','N','N'),
(62,'FORM_PDF',24,'Type de DEMAT','','TYPE_DEMAT',0,'STANDARD','','N','','','N','N','N');

-- 
-- Definition of vdm_groupes
-- 

DROP TABLE IF EXISTS `vdm_groupes`;
CREATE TABLE IF NOT EXISTS `vdm_groupes` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_groupe` varchar(255) NOT NULL DEFAULT '',
  `orsid` enum('Y','N') NOT NULL DEFAULT 'Y',
  `confidentialite` text NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `id_groupe` (`id_groupe`),
  KEY `orsid` (`orsid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Liste des groupes';

-- 
-- Dumping data for table vdm_groupes
-- 

INSERT INTO `vdm_groupes`(`enreg`,`id_groupe`,`orsid`,`confidentialite`,`commentaire`) VALUES
(1,'DOCAPOST_DPS','Y','',''),
(2,'DOCAPOST_BPO_EFACTURE','N','','');

-- 
-- Definition of vdm_info_cfec
-- 

DROP TABLE IF EXISTS `vdm_info_cfec`;
CREATE TABLE IF NOT EXISTS `vdm_info_cfec` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_alias` varchar(100) NOT NULL,
  `cfec_base_principal` varchar(255) NOT NULL,
  `cfec_cert_principal` varchar(255) NOT NULL,
  `cfec_numero_cfec_principal` varchar(10) NOT NULL,
  `cfec_numero_cfe_principal` varchar(10) NOT NULL,
  `cfec_base_secondaire` varchar(255) NOT NULL,
  `cfec_cert_secondaire` varchar(255) NOT NULL,
  `cfec_numero_cfec_secondaire` varchar(10) NOT NULL,
  `cfec_numero_cfe_secondaire` varchar(10) NOT NULL,
  `ci_url_principal` varchar(255) NOT NULL,
  `ci_rep_transfer_principal` varchar(255) NOT NULL,
  `ci_rep_cr_principal` varchar(255) NOT NULL,
  `ci_url_secondaire` varchar(255) NOT NULL,
  `ci_rep_transfer_secondaire` varchar(255) NOT NULL,
  `ci_rep_cr_secondaire` varchar(255) NOT NULL,
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `id_alias` (`id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des coffres';

-- 
-- Dumping data for table vdm_info_cfec
-- 



-- 
-- Definition of vdm_interbox
-- 

DROP TABLE IF EXISTS `vdm_interbox`;
CREATE TABLE IF NOT EXISTS `vdm_interbox` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_application` varchar(100) NOT NULL DEFAULT '',
  `controle_doublon` enum('N','Y') NOT NULL DEFAULT 'N',
  `base_doublon` text NOT NULL,
  `table_doublon` text NOT NULL,
  `champ_doublon` text NOT NULL,
  `controle_presence` text NOT NULL,
  `base_presence` text NOT NULL,
  `table_presence` text NOT NULL,
  `champ_presence` text NOT NULL,
  PRIMARY KEY (`enreg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des interbox';

-- 
-- Dumping data for table vdm_interbox
-- 



-- 
-- Definition of vdm_interupload
-- 

DROP TABLE IF EXISTS `vdm_interupload`;
CREATE TABLE IF NOT EXISTS `vdm_interupload` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `ticket` varchar(72) NOT NULL,
  `challenge` varchar(72) NOT NULL,
  `statut` varchar(100) NOT NULL,
  `date_creation` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_production` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_archivage` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `config` text NOT NULL,
  `metadata_creation` text NOT NULL,
  `metadata_production` text NOT NULL,
  `metadata_archivage` text NOT NULL,
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table vdm_interupload';

-- 
-- Dumping data for table vdm_interupload
-- 



-- 
-- Definition of vdm_interupload_cfg
-- 

DROP TABLE IF EXISTS `vdm_interupload_cfg`;
CREATE TABLE IF NOT EXISTS `vdm_interupload_cfg` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_interupload` varchar(100) NOT NULL COMMENT 'ID de la configuration Interupload',
  `codeClient` varchar(100) NOT NULL COMMENT 'Code Client attaché à cette upload',
  `codeAppli` varchar(100) NOT NULL COMMENT 'Code Application attaché à cet upload',
  `param` varchar(100) NOT NULL COMMENT 'Code param ici l''url du webservice du site',
  `date_creation` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'date de la création de la configuration',
  `date_modification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `config` text NOT NULL COMMENT 'configuration XML',
  `script_archivage_specifique` varchar(100) NOT NULL COMMENT 'script php d''archivage se trouvant dans spécifique ''x_interupload.php'' dans spécifique, si vide utilise le script générique ',
  `interuploadWeb` varchar(255) NOT NULL COMMENT 'webservice interuploadProduction pour la partie Web',
  `versionApplet` varchar(10) NOT NULL DEFAULT '0.27',
  `id_upload` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `id_interupload` (`id_interupload`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='table vdm_interupload';

-- 
-- Dumping data for table vdm_interupload_cfg
-- 

INSERT INTO `vdm_interupload_cfg`(`enreg`,`id_interupload`,`codeClient`,`codeAppli`,`param`,`date_creation`,`date_modification`,`config`,`script_archivage_specifique`,`interuploadWeb`,`versionApplet`,`id_upload`) VALUES
(1,'INTERUPLOAD','','','http://192.168.46.62/maquettes/docapost_bpo_efacture/webservices/?interupload','0001-01-01 00:00:00','0001-01-01 00:00:00','<config>\r\n<traitements>\r\n<traitement type=\"pdf/a\" compression = \"normal\" toutenun= \"oui\"><![CDATA[*.doc;*.xls;*.pdf;*.docx;*.xlsx;*.msg;*.csv;*.ppt;*.pptx;*.axx;*.txt;*.tif;*.tiff;*.jpg;*.jpeg;*.gif;*.png;]]> </traitement>\r\n</traitements>\r\n  <document>\r\n    <depot>\r\n      <type>DEPOTESC</type>\r\n      <url>https://192.168.46.172:443/EscSAE/</url>\r\n      <salle>id_salle</salle>\r\n      <coffre>id_coffre</coffre>     \r\n     <certificat><![CDATA[  ]]></certificat>\r\n     <passCertif><passCertif>\r\n    </depot>\r\n </document>\r\n</config>','','http://192.168.46.62/interupload/interuploadProduction/interuploadWeb/?wsdl','0.27',0);

-- 
-- Definition of vdm_laserlike
-- 

DROP TABLE IF EXISTS `vdm_laserlike`;
CREATE TABLE IF NOT EXISTS `vdm_laserlike` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `debut` varchar(20) NOT NULL DEFAULT '',
  `fin` varchar(20) NOT NULL DEFAULT '',
  `chemin` varchar(255) NOT NULL DEFAULT '',
  `libelle` varchar(255) NOT NULL DEFAULT '',
  `id_application` varchar(100) NOT NULL DEFAULT '',
  `ESC_url` text NOT NULL,
  `ESC_certificat` text NOT NULL,
  PRIMARY KEY (`enreg`),
  KEY `DEBUT` (`debut`),
  KEY `FIN` (`fin`),
  KEY `id_application` (`id_application`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Liste des plages laserlike';

-- 
-- Dumping data for table vdm_laserlike
-- 

INSERT INTO `vdm_laserlike`(`enreg`,`debut`,`fin`,`chemin`,`libelle`,`id_application`,`ESC_url`,`ESC_certificat`) VALUES
(1,'0','0','c:\\inetpub\\wwwroot\\orsid_vis\\temp\\','','','https://192.168.186.75:4009/EscBO/f0ef2c45304c45218dcb65d4b4f9e418/e429a472524842e4a9188fdef486470d/','-----BEGIN CERTIFICATE-----\r\nMIICQTCCAaoCCQD5YF7OvjqhFTANBgkqhkiG9w0BAQUFADBlMQswCQYDVQQGEwJG\r\nUjEMMAoGA1UECAwDSURGMQ4wDAYDVQQHDAVQYXJpczEPMA0GA1UECgwGQ0xJRU5U\r\nMQ8wDQYDVQQLDAZDTElFTlQxFjAUBgNVBAMMDUVTQy1TaWduYXR1cmUwHhcNMTMx\r\nMDI4MTUwMTE2WhcNMTQxMDI4MTUwMTE2WjBlMQswCQYDVQQGEwJGUjEMMAoGA1UE\r\nCAwDSURGMQ4wDAYDVQQHDAVQYXJpczEPMA0GA1UECgwGQ0xJRU5UMQ8wDQYDVQQL\r\nDAZDTElFTlQxFjAUBgNVBAMMDUVTQy1TaWduYXR1cmUwgZ8wDQYJKoZIhvcNAQEB\r\nBQADgY0AMIGJAoGBALUXlIKD4Mng8iE6omCI3R23lvv2ViMOPzr2x6QrwN+xiYMU\r\naye0yM2Ykh4iSmMPrxU4nzOAb5nBhyOgvXEuB4XFbiuJZ/t3/hCCHgPj7i+AeCSD\r\nfJ+P8xAVacUCKwYkjaP+5NhKku4OONI2M2inTP3MPDg+KSFb8uMgAX1onDSfAgMB\r\nAAEwDQYJKoZIhvcNAQEFBQADgYEATFj1lMGmDAzOfi+QLJTsSA04VJVkwSDf+4WH\r\nLZmRxsOqWUH/Iw9lvSIdUu4dNaCWipkIvOU5+7FJbtNyOnGcTahJlIuH4XiaMGxg\r\nw8gbHhDU1nlqU6047sL4mkgb7A4lMmqEq2JCBmKwWtcF9EPO/J4sZLLdWSKldGGl\r\nCVOQK6Q=\r\n-----END CERTIFICATE-----\r\n-----BEGIN RSA PRIVATE KEY-----\r\nMIICXQIBAAKBgQC1F5SCg+DJ4PIhOqJgiN0dt5b79lYjDj869sekK8DfsYmDFGsn\r\ntMjNmJIeIkpjD68VOJ8zgG+ZwYcjoL1xLgeFxW4riWf7d/4Qgh4D4+4vgHgkg3yf\r\nj/MQFWnFAisGJI2j/uTYSpLuDjjSNjNop0z9zDw4PikhW/LjIAF9aJw0nwIDAQAB\r\nAoGBAIIT7P4PApGgPew2dNqIlOO6sv5LhLXrjumox+CZ+RH1McRxD0NXLYHY3OQ+\r\nV1ZutqG0qU5SLFeyVoL1+/3nRUjRCVS/GRoBLIEwqGd+GR/yiKp86JwqfXQMwXXi\r\ny60TtjI76n5ziJauRawn+iiaXjsezRsYx2eOZDuAbdulWjXJAkEA3QxATU6+ivvM\r\n6K28vHiDXbLy93HKZl3bwWIlA3TMIPXR24pNQW+yeJCkxQwEQ8OGuJZYA+k6y1GB\r\nYv3wYDy86wJBANG5+AXdbGYx33dX/Y0/SnU93C/gWBnoIgnmXKRvkHIRM0HPBp9c\r\nPrTzkyoFe3RaQm96/cjOtwrQwmXDNkQk6h0CQGJJFD5LiQWbOF0tAwJ6Q07iRo4n\r\nlms1yISP8w06XZk6M/l94SP7WkupZNoIoczPn5Nrpe73QSEuOG2fo8Xmu8kCQQCe\r\nTBnSg3BgKmCbOcTdKdpPZ+OcF18oHrgidMeULcj+79CaaWJ8QinqdrarTvwBtGbU\r\nsiZ/vNcXyL4SBSgegyZZAkB9F1aqABuRcZLNUTJgtfL3hoeccdAj5Js/DifXEaPi\r\nbNMl36FTP4z6jRvS9y1RPuDrg4NThv7h7G9eCCv0xvzD\r\n-----END RSA PRIVATE KEY-----');

-- 
-- Definition of vdm_logins
-- 

DROP TABLE IF EXISTS `vdm_logins`;
CREATE TABLE IF NOT EXISTS `vdm_logins` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL DEFAULT '',
  `prenom` varchar(50) NOT NULL DEFAULT '',
  `login` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `login` (`login`),
  KEY `nom` (`nom`),
  KEY `prenom` (`prenom`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des logins';

-- 
-- Dumping data for table vdm_logins
-- 



-- 
-- Definition of vdm_mails_opn
-- 

DROP TABLE IF EXISTS `vdm_mails_opn`;
CREATE TABLE IF NOT EXISTS `vdm_mails_opn` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(20) NOT NULL DEFAULT '',
  `mail_from` varchar(255) NOT NULL DEFAULT '',
  `mail_to` text NOT NULL,
  `mail_copy` text NOT NULL,
  `mail_hidden_copy` text NOT NULL,
  `mail_notify` enum('N','Y') NOT NULL DEFAULT 'N',
  `mail_copy_to_sender` enum('N','Y') NOT NULL DEFAULT 'N',
  `mail_subject` text NOT NULL,
  `mail_message` text NOT NULL,
  `mail_date` date NOT NULL DEFAULT '0000-00-00',
  `mail_time` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`enreg`),
  KEY `user_login` (`user_login`),
  KEY `mail_date` (`mail_date`),
  KEY `mail_time` (`mail_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des mails NATION';

-- 
-- Dumping data for table vdm_mails_opn
-- 



-- 
-- Definition of vdm_profils
-- 

DROP TABLE IF EXISTS `vdm_profils`;
CREATE TABLE IF NOT EXISTS `vdm_profils` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_profil` varchar(100) NOT NULL DEFAULT '',
  `id_formulaire` varchar(100) NOT NULL DEFAULT '',
  `id_reponse` varchar(100) NOT NULL DEFAULT '',
  `id_fiche` varchar(100) NOT NULL DEFAULT '',
  `id_panier` varchar(100) NOT NULL DEFAULT '',
  `id_export` varchar(100) NOT NULL DEFAULT '',
  `id_modification_champ_simple` varchar(100) NOT NULL DEFAULT '',
  `id_interbox` varchar(100) NOT NULL DEFAULT '',
  `id_interupload` varchar(100) NOT NULL DEFAULT '',
  `lg_0_formulaire` varchar(255) NOT NULL DEFAULT '',
  `lg_1_formulaire` varchar(255) NOT NULL DEFAULT '',
  `lg_0_reponse` varchar(255) NOT NULL DEFAULT '',
  `lg_1_reponse` varchar(255) NOT NULL DEFAULT '',
  `lg_0_fiche` varchar(255) NOT NULL DEFAULT '',
  `lg_1_fiche` varchar(255) NOT NULL DEFAULT '',
  `lg0` varchar(255) NOT NULL DEFAULT '',
  `lg1` varchar(255) NOT NULL DEFAULT '',
  `ordre` int(11) NOT NULL DEFAULT '0',
  `id_application` varchar(20) NOT NULL DEFAULT '',
  `orsid` enum('Y','N') NOT NULL DEFAULT 'Y',
  `blob_panier_lg0` text NOT NULL,
  `blob_panier_lg1` text NOT NULL,
  `fusion_defaut` enum('Y','N') NOT NULL DEFAULT 'Y',
  `fusion_modif` enum('N','Y') NOT NULL DEFAULT 'N',
  `tampon_defaut` enum('Y','N') NOT NULL DEFAULT 'Y',
  `tampon_modif` enum('N','Y') NOT NULL DEFAULT 'N',
  `tri_defaut` varchar(50) NOT NULL DEFAULT '',
  `conf_image` text NOT NULL,
  `fiche_une_reponse` enum('N','Y') NOT NULL DEFAULT 'Y',
  `groupes` text NOT NULL,
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `ordre` (`ordre`),
  UNIQUE KEY `id_profil` (`id_profil`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Liste des profils';

-- 
-- Dumping data for table vdm_profils
-- 

INSERT INTO `vdm_profils`(`enreg`,`id_profil`,`id_formulaire`,`id_reponse`,`id_fiche`,`id_panier`,`id_export`,`id_modification_champ_simple`,`id_interbox`,`id_interupload`,`lg_0_formulaire`,`lg_1_formulaire`,`lg_0_reponse`,`lg_1_reponse`,`lg_0_fiche`,`lg_1_fiche`,`lg0`,`lg1`,`ordre`,`id_application`,`orsid`,`blob_panier_lg0`,`blob_panier_lg1`,`fusion_defaut`,`fusion_modif`,`tampon_defaut`,`tampon_modif`,`tri_defaut`,`conf_image`,`fiche_une_reponse`,`groupes`) VALUES
(1,'P1','FORM_EDI','FORM_EDI','FORM_EDI','FORM_EDI','FORM_EDI','','','','Recherche Factures EDI','','Factures EDI trouv&eacute;s','','Information Factures EDI','','Profil Factures EDI','',1,'Factures_EDI','N','','','N','N','N','N','','*','N','*'),
(2,'P2','FORM_PDF','FORM_PDF','FORM_PDF','FORM_PDF','FORM_PDF','','','','Recherche PDF','','PDF trouv&eacute;s','','Information PDF','','Profil PDF','',2,'PDF','N','','','N','N','Y','Y','','*','N','*');

-- 
-- Definition of vdm_requete
-- 

DROP TABLE IF EXISTS `vdm_requete`;
CREATE TABLE IF NOT EXISTS `vdm_requete` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_profil` varchar(100) NOT NULL,
  `login` varchar(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `champ` text NOT NULL,
  PRIMARY KEY (`enreg`),
  KEY `id_profil` (`id_profil`,`login`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='table des requêtes enregistrés';

-- 
-- Dumping data for table vdm_requete
-- 



-- 
-- Definition of vdm_sessions_opn
-- 

DROP TABLE IF EXISTS `vdm_sessions_opn`;
CREATE TABLE IF NOT EXISTS `vdm_sessions_opn` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_session` varchar(32) NOT NULL DEFAULT '',
  `user_login` varchar(20) NOT NULL DEFAULT '0',
  `machine` text NOT NULL,
  `first_action` bigint(20) NOT NULL DEFAULT '0',
  `last_action` bigint(20) NOT NULL DEFAULT '0',
  `variables` text NOT NULL,
  PRIMARY KEY (`enreg`),
  KEY `id_session` (`id_session`),
  KEY `user_login` (`user_login`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COMMENT='Liste des sessions NATION';

-- 
-- Dumping data for table vdm_sessions_opn
-- 



-- 
-- Definition of vdm_stats_opn
-- 

DROP TABLE IF EXISTS `vdm_stats_opn`;
CREATE TABLE IF NOT EXISTS `vdm_stats_opn` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(20) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `heure` tinyint(4) NOT NULL DEFAULT '0',
  `compteur` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`enreg`),
  KEY `mode` (`mode`),
  KEY `date` (`date`),
  KEY `heure` (`heure`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COMMENT='Liste des stats AeS';

-- 
-- Dumping data for table vdm_stats_opn
-- 



-- 
-- Definition of vdm_stockage
-- 

DROP TABLE IF EXISTS `vdm_stockage`;
CREATE TABLE IF NOT EXISTS `vdm_stockage` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `volume` varchar(20) NOT NULL DEFAULT '',
  `libelle` varchar(255) NOT NULL DEFAULT '',
  `chemin` varchar(255) NOT NULL DEFAULT '',
  `code_client` varchar(4) NOT NULL DEFAULT '',
  `code_application` varchar(4) NOT NULL DEFAULT '',
  `use_vis` enum('N','Y') NOT NULL DEFAULT 'Y',
  `ESC_url` text NOT NULL,
  `ESC_certificat` text NOT NULL,
  PRIMARY KEY (`enreg`),
  KEY `volume` (`volume`),
  KEY `code_client` (`code_client`),
  KEY `code_application` (`code_application`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des volumes de stockage';

-- 
-- Dumping data for table vdm_stockage
-- 



-- 
-- Definition of vdm_suivi_prod
-- 

DROP TABLE IF EXISTS `vdm_suivi_prod`;
CREATE TABLE IF NOT EXISTS `vdm_suivi_prod` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `fichier_dat` varchar(50) NOT NULL DEFAULT '',
  `numero_bdl` varchar(20) NOT NULL DEFAULT '',
  `chrono_odin` int(11) NOT NULL DEFAULT '0',
  `banniere_debut` varchar(255) NOT NULL DEFAULT '',
  `banniere_fin` varchar(255) NOT NULL DEFAULT '',
  `code_client` varchar(4) NOT NULL DEFAULT '',
  `code_application` varchar(4) NOT NULL DEFAULT '',
  `type_operation` enum('INJECTION','SUPPRESSION','MODIFICATION','FF','USERS') NOT NULL DEFAULT 'INJECTION',
  `chrono_client` int(11) NOT NULL DEFAULT '0',
  `spool` varchar(20) NOT NULL DEFAULT '',
  `fichier_log_empreinte` varchar(255) NOT NULL DEFAULT '',
  `max_enreg_avant` int(11) NOT NULL DEFAULT '0',
  `nombre_enregs_avant` int(11) NOT NULL DEFAULT '0',
  `max_enreg_apres` int(11) NOT NULL DEFAULT '0',
  `nombre_enregs_apres` int(11) NOT NULL DEFAULT '0',
  `nombre_pages_hebergees_avant` int(11) NOT NULL DEFAULT '0',
  `nombre_pages_hebergees_apres` int(11) NOT NULL DEFAULT '0',
  `nombre_dossiers` int(11) NOT NULL DEFAULT '0',
  `nombre_pages` int(11) NOT NULL DEFAULT '0',
  `nombre_pages_vides` int(11) NOT NULL DEFAULT '0',
  `premier_index` text NOT NULL,
  `dernier_index` text NOT NULL,
  `temps_pdf` int(11) NOT NULL DEFAULT '0',
  `temps_indexation` int(11) NOT NULL DEFAULT '0',
  `temps_injection` int(11) NOT NULL DEFAULT '0',
  `temps_autre` int(11) NOT NULL DEFAULT '0',
  `compteur_dossiers_theorique` int(11) NOT NULL DEFAULT '0',
  `compteur_pages_theorique` int(11) NOT NULL DEFAULT '0',
  `table_indexfiche` varchar(50) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `heure` time NOT NULL DEFAULT '00:00:00',
  `audit` text NOT NULL,
  `lot_index` varchar(100) NOT NULL DEFAULT '',
  `lot_production` int(11) NOT NULL DEFAULT '0',
  `code_client_appelant` varchar(10) NOT NULL DEFAULT '',
  `code_application_appelant` varchar(10) NOT NULL DEFAULT '',
  `numerobdl_appelant` varchar(20) NOT NULL DEFAULT '',
  `information_client` text NOT NULL,
  `poids_octets` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`enreg`),
  KEY `fichier_dat` (`fichier_dat`),
  KEY `numero_bdl` (`numero_bdl`),
  KEY `chrono_odin` (`chrono_odin`),
  KEY `code_client` (`code_client`),
  KEY `code_application` (`code_application`),
  KEY `type_operation` (`type_operation`),
  KEY `max_enreg_avant` (`max_enreg_avant`),
  KEY `nombre_enregs_avant` (`nombre_enregs_avant`),
  KEY `max_enreg_apres` (`max_enreg_apres`),
  KEY `nombre_enregs_apres` (`nombre_enregs_apres`),
  KEY `nombre_dossiers` (`nombre_dossiers`),
  KEY `nombre_pages` (`nombre_pages`),
  KEY `nombre_pages_vides` (`nombre_pages_vides`),
  KEY `temps_pdf` (`temps_pdf`),
  KEY `temps_indexation` (`temps_indexation`),
  KEY `temps_autre` (`temps_autre`),
  KEY `compteur_dossiers_theorique` (`compteur_dossiers_theorique`),
  KEY `compteur_pages_theorique` (`compteur_pages_theorique`),
  KEY `table_indexfiche` (`table_indexfiche`),
  KEY `date` (`date`),
  KEY `heure` (`heure`),
  KEY `banniere_debut` (`banniere_debut`),
  KEY `banniere_fin` (`banniere_fin`),
  KEY `spool` (`spool`),
  KEY `lot_index` (`lot_index`,`lot_production`),
  KEY `poids_octets` (`poids_octets`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='table de suivi de production';

-- 
-- Dumping data for table vdm_suivi_prod
-- 



-- 
-- Definition of vdm_tampons
-- 

DROP TABLE IF EXISTS `vdm_tampons`;
CREATE TABLE IF NOT EXISTS `vdm_tampons` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `id_fdp` varchar(20) NOT NULL DEFAULT '',
  `chemin` varchar(255) NOT NULL DEFAULT '',
  `x` int(11) NOT NULL DEFAULT '0',
  `y` int(11) NOT NULL DEFAULT '0',
  `scale_x` int(11) NOT NULL DEFAULT '100',
  `scale_y` int(11) NOT NULL DEFAULT '100',
  `rotation` int(11) NOT NULL DEFAULT '0',
  `mode_overlay` enum('N','Y') NOT NULL DEFAULT 'N',
  `add_free_text` text NOT NULL,
  `as_x` int(11) NOT NULL DEFAULT '0',
  `as_y` int(11) NOT NULL DEFAULT '0',
  `as_scale_x` int(11) NOT NULL DEFAULT '100',
  `as_scale_y` int(11) NOT NULL DEFAULT '100',
  `as_rotation` int(11) NOT NULL DEFAULT '0',
  `as_mode_overlay` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `id_fdp` (`id_fdp`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='Liste des tampons';

-- 
-- Dumping data for table vdm_tampons
-- 

INSERT INTO `vdm_tampons`(`enreg`,`id_fdp`,`chemin`,`x`,`y`,`scale_x`,`scale_y`,`rotation`,`mode_overlay`,`add_free_text`,`as_x`,`as_y`,`as_scale_x`,`as_scale_y`,`as_rotation`,`as_mode_overlay`) VALUES
(1,'vide_DOCUMENTS','',0,0,100,100,0,'N','',0,0,100,100,0,'N'),
(2,'tampon_PDF','\\\\192.168.186.108\\stock\\tampon_bpo_A.pdf',0,0,100,100,0,'N','',0,0,100,100,0,'N');

-- 
-- Definition of vdm_telechargements
-- 

DROP TABLE IF EXISTS `vdm_telechargements`;
CREATE TABLE IF NOT EXISTS `vdm_telechargements` (
  `date_mise_en_ligne` date NOT NULL DEFAULT '0000-00-00',
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `date_fr` varchar(10) NOT NULL DEFAULT '',
  `num_lot` varchar(10) NOT NULL DEFAULT '',
  `conf1` varchar(5) NOT NULL DEFAULT '',
  `conf2` char(3) NOT NULL DEFAULT '',
  `conf3` char(3) NOT NULL DEFAULT '',
  `documentsassocies` text NOT NULL,
  `vdm_localisation` text NOT NULL,
  `deja_vu` enum('N','Y') NOT NULL DEFAULT 'N',
  `termine` enum('N','Y') NOT NULL DEFAULT 'N',
  `verrouille` enum('N','Y') NOT NULL DEFAULT 'N',
  `nombrepages` int(11) NOT NULL DEFAULT '0',
  `octets` int(11) NOT NULL DEFAULT '0',
  `commentaire` text NOT NULL,
  `utilisateur` varchar(255) NOT NULL DEFAULT '',
  `reserve_admin` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`enreg`),
  KEY `date` (`date`),
  KEY `num_lot` (`num_lot`),
  KEY `conf1` (`conf1`),
  KEY `conf2` (`conf2`),
  KEY `conf3` (`conf3`),
  KEY `termine` (`termine`),
  KEY `verrouille` (`verrouille`),
  KEY `date_mise_en_ligne` (`date_mise_en_ligne`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des telechargements';

-- 
-- Dumping data for table vdm_telechargements
-- 



-- 
-- Definition of vdm_tooltip
-- 

DROP TABLE IF EXISTS `vdm_tooltip`;
CREATE TABLE IF NOT EXISTS `vdm_tooltip` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `tooltip` varchar(20) NOT NULL DEFAULT '',
  `libelle` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`enreg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des tooltips';

-- 
-- Dumping data for table vdm_tooltip
-- 



-- 
-- Definition of vdm_trace_opn
-- 

DROP TABLE IF EXISTS `vdm_trace_opn`;
CREATE TABLE IF NOT EXISTS `vdm_trace_opn` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `nav` varchar(50) NOT NULL DEFAULT '',
  `user` varchar(50) NOT NULL DEFAULT '',
  `groupe` varchar(255) NOT NULL DEFAULT '',
  `orsid` enum('','N','Y') NOT NULL DEFAULT '',
  `pages` int(11) NOT NULL DEFAULT '0',
  `octets` int(11) NOT NULL DEFAULT '0',
  `id_session` varchar(50) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `adresse_ip` varchar(15) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `heure` time NOT NULL DEFAULT '00:00:00',
  `facturable` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`enreg`),
  KEY `user` (`user`),
  KEY `id_session` (`id_session`),
  KEY `adresse_ip` (`adresse_ip`),
  KEY `user_agent` (`user_agent`),
  KEY `quantite` (`pages`),
  KEY `date` (`date`),
  KEY `heure` (`heure`),
  KEY `facturable` (`facturable`),
  KEY `appartenance` (`groupe`),
  KEY `orsid` (`orsid`),
  KEY `nav` (`nav`)
) ENGINE=MyISAM AUTO_INCREMENT=1201 DEFAULT CHARSET=latin1 COMMENT='Liste des traces NATION';

-- 
-- Dumping data for table vdm_trace_opn
-- 



-- 
-- Definition of vdm_users
-- 

DROP TABLE IF EXISTS `vdm_users`;
CREATE TABLE IF NOT EXISTS `vdm_users` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) NOT NULL DEFAULT '',
  `pass` varchar(255) NOT NULL DEFAULT '',
  `old_password_list` text NOT NULL,
  `change_pass` enum('N','Y') NOT NULL DEFAULT 'N',
  `pass_last_modif` bigint(20) NOT NULL DEFAULT '0',
  `pass_never_expires` enum('N','Y') NOT NULL DEFAULT 'N',
  `must_change_pass` enum('N','Y') NOT NULL DEFAULT 'N',
  `session_time` int(20) NOT NULL DEFAULT '900',
  `actif` enum('N','Y') NOT NULL DEFAULT 'N',
  `raison` text NOT NULL,
  `confidentialite` text NOT NULL,
  `prend_conf_groupe` enum('N','Y') NOT NULL DEFAULT 'N',
  `profils` text NOT NULL,
  `type` enum('SA','GG','USR') NOT NULL DEFAULT 'USR',
  `statistiques` enum('N','Y') NOT NULL DEFAULT 'N',
  `orsid` enum('Y','N') NOT NULL DEFAULT 'N',
  `mail` enum('N','Y') NOT NULL DEFAULT 'N',
  `fax` enum('N','Y') NOT NULL DEFAULT 'N',
  `adresse_mail` text NOT NULL,
  `commentaires` text NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `adresse_post` text NOT NULL,
  `tel` text NOT NULL,
  `rsoc` text NOT NULL,
  `groupe` varchar(255) NOT NULL DEFAULT '',
  `export_csv` enum('N','Y') NOT NULL DEFAULT 'N',
  `export_xls` enum('N','Y') NOT NULL DEFAULT 'N',
  `export_doc` enum('N','Y') NOT NULL DEFAULT 'N',
  `recherche_llk` enum('N','Y') NOT NULL DEFAULT 'N',
  `telechargements` enum('N','Y') NOT NULL DEFAULT 'N',
  `admin_tele` enum('N','Y') NOT NULL DEFAULT 'N',
  `tiers_archivage` enum('N','Y') NOT NULL DEFAULT 'N',
  `createur` text NOT NULL,
  `tentatives` tinyint(4) NOT NULL DEFAULT '0',
  `mail_cci_auto` enum('N','Y') NOT NULL DEFAULT 'N',
  `adresse_mail_cci_auto` text NOT NULL,
  `nb_panier` int(11) NOT NULL DEFAULT '10',
  `nb_requete` int(11) NOT NULL DEFAULT '10',
  `interupload` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `login` (`login`),
  KEY `pass` (`pass`),
  KEY `orsid` (`orsid`),
  KEY `groupe` (`groupe`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Liste des utilisateurs';

-- 
-- Dumping data for table vdm_users
-- 

INSERT INTO `vdm_users`(`enreg`,`login`,`pass`,`old_password_list`,`change_pass`,`pass_last_modif`,`pass_never_expires`,`must_change_pass`,`session_time`,`actif`,`raison`,`confidentialite`,`prend_conf_groupe`,`profils`,`type`,`statistiques`,`orsid`,`mail`,`fax`,`adresse_mail`,`commentaires`,`nom`,`prenom`,`adresse_post`,`tel`,`rsoc`,`groupe`,`export_csv`,`export_xls`,`export_doc`,`recherche_llk`,`telechargements`,`admin_tele`,`tiers_archivage`,`createur`,`tentatives`,`mail_cci_auto`,`adresse_mail_cci_auto`,`nb_panier`,`nb_requete`,`interupload`) VALUES
(1,'flatapie','9232573ce9d1d9f1dbd93956d7cd8867a11273e714a80a417759250addc037bb61e217121296d0e14689af658d1655d8085d0cd21793b61eac76cdf45f5e9e86','9232573ce9d1d9f1dbd93956d7cd8867a11273e714a80a417759250addc037bb61e217121296d0e14689af658d1655d8085d0cd21793b61eac76cdf45f5e9e86','Y',1144047684,'Y','N',9000,'Y','','','N','P1/P2','SA','Y','Y','Y','N','florent.latapie@docapost-dps.com','','LATAPIE','Florent','','','DOCAPOST DPS','DOCAPOST_DPS','Y','Y','Y','Y','Y','Y','Y','',0,'N','',10,10,'N'),
(2,'aesteves','ac7c31026ed349a471da86172f86bff6e90ef6ee807078a4dd5215d6d836e771899f940a847999b8bbfb4591784aa7135ed23d92c6982f5edf1f62c1da875f59','ac7c31026ed349a471da86172f86bff6e90ef6ee807078a4dd5215d6d836e771899f940a847999b8bbfb4591784aa7135ed23d92c6982f5edf1f62c1da875f59','Y',1144047684,'Y','N',9000,'Y','','','N','P1/P2','SA','Y','Y','Y','N','antonio.esteves@docapost-dps.com','','ESTEVES','Antonio','','','DOCAPOST DPS','DOCAPOST_DPS','Y','Y','Y','Y','Y','Y','Y','',0,'N','',10,10,'N'),
(3,'ndobignard','45afc761ece4c4c2ee4c612cd8c33b79e67fff61fb03d4008f0dfdbff810a298ee02b1221611c63b02f32f7c66b38ef948d7784c9e7a7b84daaf512b89612093','45afc761ece4c4c2ee4c612cd8c33b79e67fff61fb03d4008f0dfdbff810a298ee02b1221611c63b02f32f7c66b38ef948d7784c9e7a7b84daaf512b89612093','Y',1144047684,'Y','N',9000,'Y','','','N','P1/P2','SA','Y','Y','Y','N','nicolas.dobignard@docapost-dps.com','','DOBIGNARD','Nicolas','','','DOCAPOST DPS','DOCAPOST_DPS','Y','Y','Y','Y','Y','Y','Y','',0,'N','',10,10,'N'),
(4,'mmoniot','4ba27eae6efd25662f586309aa84db0cc58a4b7f15f6f20cc2035ef41a795c4ec8c372aad86459a48bfb206467486ecef4a0c9c7b1b008ce94478921c8dfa0bb','4ba27eae6efd25662f586309aa84db0cc58a4b7f15f6f20cc2035ef41a795c4ec8c372aad86459a48bfb206467486ecef4a0c9c7b1b008ce94478921c8dfa0bb','Y',1144047684,'Y','N',9000,'Y','','','N','P1','SA','Y','Y','Y','Y','mickael.moniot@docapost-dps.com','','MONIOT','Mickael','','','DOCAPOST DPS','DOCAPOST_DPS','Y','Y','Y','Y','Y','Y','Y','',1,'N','',10,10,'N'),
(5,'ngirard','b5ed5a6b8dfed48e127550fbe062b48cdc103053c3767bbddb4655b2bdc7258b06a68ca175bc47fc27d4cacec3154b747db99c5036e3bc2419243e5771a285cb','b5ed5a6b8dfed48e127550fbe062b48cdc103053c3767bbddb4655b2bdc7258b06a68ca175bc47fc27d4cacec3154b747db99c5036e3bc2419243e5771a285cb','Y',1144047684,'Y','N',9000,'Y','','','N','P1','SA','Y','Y','Y','Y','nicolas.girard@docapost-dps.com','','GIRARD','Nicolas','','','DOCAPOST DPS','DOCAPOST_DPS','Y','Y','Y','Y','Y','Y','Y','',0,'N','',10,10,'N'),
(6,'folivier','6993b3c1d0deb54fc0edc24b5f05e81262668e6a05c93f2135ed976e64a25fe19dd332bc6361b18f0d2208697fd3f82a3442c9a50f990d067aadcd336aaeb58a','','Y',1453297910,'N','Y',900,'Y','','','N','P1/P2','SA','Y','N','Y','N','folivier@seres.fr','','OLIVIER','Frederic','','','','DOCAPOST_BPO_EFACTURE','Y','Y','Y','N','N','N','N','aesteves',0,'N','',10,10,'N'),
(7,'mphan','92a7611176bd1d9b03159fce267d746ffa0a1b3d4e4983895cff1fd5cbc7bb376a640381c5f44b34a5fdb23b846f3fe628d7c81f60d0023632ff976975f7b19e','','Y',1453297999,'N','Y',900,'Y','','','N','P1/P2','SA','Y','N','Y','N','myly.phan@docapost.fr','','PHAN','Myly','','','','DOCAPOST_DPS','Y','Y','Y','N','N','N','N','aesteves',0,'N','',10,10,'N');

-- 
-- Definition of vdm_utilitaires
-- 

DROP TABLE IF EXISTS `vdm_utilitaires`;
CREATE TABLE IF NOT EXISTS `vdm_utilitaires` (
  `enreg` int(11) NOT NULL AUTO_INCREMENT,
  `visible` enum('N','Y') NOT NULL DEFAULT 'N',
  `lg0` varchar(255) NOT NULL DEFAULT '',
  `lg1` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `ordre` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`enreg`),
  UNIQUE KEY `ordre` (`ordre`),
  KEY `visible` (`visible`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Liste des utilitaires';

-- 
-- Dumping data for table vdm_utilitaires
-- 






-- Dump completed on 2016-01-25 13:43:01
-- Total time: 0:0:0:0:445 (d:h:m:s:ms)
