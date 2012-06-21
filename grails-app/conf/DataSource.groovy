dataSource {
	pooled = true
	//driverClassName = "org.hsqldb.jdbcDriver"
	driverClassName = "com.mysql.jdbc.Driver"
	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
	//username = "neuropathology"
	//password = "neuropathology"
	username = "root"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			//dbCreate = "update" // one of 'create', 'create-drop','update'
			//dbCreate = "create-drop"
			dbCreate = "update"
			//url = "jdbc:hsqldb:mem:devDB"
			url = "jdbc:mysql://localhost/neuropathology-prod3-test?autoReconnect=true"
			//url = "jdbc:hsqldb:file:braintumorDb;shutdown=true"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			// url = "jdbc:mysql://kimsiapp/neuropathology?autoReconnect=true" // first data set
       			//url = "jdbc:mysql://kimsiapp/neuropathology-prod2?autoReconnect=true" // second data set ... staged 4/26/2011 (copied from neuropathology-test5 db)
			url = "jdbc:mysql://kimsiapp/neuropathology-prod3?autoReconnect=true" // second data set ... staged 4/26/2011 (copied from neuropathology-test5 db)
			
		}
	}
}