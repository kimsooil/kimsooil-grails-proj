dataSource {
    //default HSQL
	//
	//pooled = true
    //driverClassName = "org.hsqldb.jdbcDriver"
	//username = "sa"
	//password = ""
	
	//
	//MySQL
	//
	//driverClassName = "com.mysql.jdbc.Driver"
	//dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
	//username = "u56"
	//password = "u56"
	
	// Oracle
	//
	//pooled = true
	//driverClassName = "oracle.jdbc.driver.OracleDriver"
	//username = "u56survey"
	//password = "K6jn3ec"
	
	// Postgres
	//
	pooled = true
	driverClassName = "org.postgresql.Driver"
	dialect = net.sf.hibernate.dialect.PostgreSQLDialect
	username = "u56"
	password = "u56"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = 'update' // one of 'create', 'create-drop','update'
            //url = "jdbc:hsqldb:mem:devDB"
			//url = "jdbc:mysql://kimsiapp/u56survey-test?autoReconnect=true"
			//url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			//url = "jdbc:oracle:thin:@genome:1523:Bioinfod"
			url = "jdbc:postgresql://kimsiapp:5432/u56survey"
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
            /////dbCreate = "update"
            /////url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			//url = "jdbc:hsqldb:mem:devDB"
			//url = "jdbc:mysql://kimsiapp/u56survey?autoReconnect=true"
			dbCreate = "update" // one of 'create', 'create-drop','update'
			//url = "jdbc:hsqldb:mem:devDB"
			//url = "jdbc:mysql://kimsiapp/u56survey-test?autoReconnect=true"
			//url = "jdbc:hsqldb:file:prodDb;shutdown=true"
			//url = "jdbc:oracle:thin:@genome:1523:Bioinfod"
			url = "jdbc:postgresql://10.6.97.22:5432/u56survey" // psmsurvdbtest=10.6.97.223
        }
    }
}
