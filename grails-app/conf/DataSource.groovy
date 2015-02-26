hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

environments {
    development {
        dataSource {
            dbCreate = ""
            driverClassName = ""
            url = ""
            username = ""
            password = ""
        }
	}
	
	test {
		dataSource {
			dbCreate = ""
			driverClassName = ""
			url = ""
			username = ""
			password = ""
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