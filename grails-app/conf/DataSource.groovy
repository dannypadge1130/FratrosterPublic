hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

environments {
    development {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			pooled = true
			driverClassName = "org.h2.Driver"
			username = "sa"
			password =	""
		}
	}
	
	test {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
			pooled = true
			driverClassName = "org.h2.Driver"
			username = "sa"
			password =	""
		}
	}
	
	production {
        dataSource {
            dbCreate = ""
            driverClassName = ""
            url = ""
            username = ""
            password = ""
        }
	}
}