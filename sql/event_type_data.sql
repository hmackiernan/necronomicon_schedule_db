
LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;

INSERT INTO `event_type` (`id`, `event_type`)
VALUES
	(1,'panel'),
	(2,'film'),
	(3,'other');

/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

