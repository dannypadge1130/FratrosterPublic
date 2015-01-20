hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            driverClassName = "org.h2.Driver"
            username = "sa"
			password = ""
        }
    }
	test {
        dataSource {
			pooled = true
			url = "jdbc:mysql://localhost:3306/fratdb?useUnicode=yes&characterEncoding=UTF-8&autoReconnect=true"
            username = "DB_USER_NAME"
            password = "DB_PASSWORD"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
        }
	}
	production {
        dataSource {
			pooled = true
            url = "DB_URL"
            username = "DB_USER_NAME"
            password = "DB_PASSWORD"
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
        }
	}
}