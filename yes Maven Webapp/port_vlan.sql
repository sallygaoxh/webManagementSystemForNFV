Drop table if exists lo_port;
Create TABLE lo_port (
  `id` int not null auto_increment,
  `valid` int NOT NULL,
  `status` int NOT NULL ,
  `ipAdd` varchar(50) NOT NULL,
  `inter` varchar(50) NOT NULL,
  `prol` varchar(50) NOT NULL,
  `vir` int NOT NULL,
  `method` int  NOT NULL,
  `bw` int not null,
  `vlCy` varchar(50) NOT NULL,
  /*`vlans` varchar(50) NOT NULL,*/
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  Drop table if exists lo_vlan;
  Create TABLE lo_vlan (
  `id` int NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `ptCy` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  
Drop table if exists port_vlan;
  Create TABLE port_vlan (
  `port_id` int NOT NULL,
  `vlan_id` int NOT NULL,
  KEY `FK_lo_vlan_port_id` (`port_id`),  
  KEY `FK_lo_vlan_vlan_id` (`vlan_id`),  
  CONSTRAINT `FK_lo_vlan_port_id` FOREIGN KEY (`port_id`) REFERENCES `lo_port` (`id`),  
  CONSTRAINT `FK_lo_vlan_vlan_id` FOREIGN KEY (`vlan_id`) REFERENCES `lo_vlan` (`id`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  select * from lo_port;
  select * from lo_vlan;
  

  