BACKUP DATABASE DeliveryDB
TO DISK = N'C:\Backups\DeliveryDB.bak'
WITH FORMAT,
     MEDIANAME = 'DeliveryBackup',
	 NAME = 'Backup Of My Delivery DB'