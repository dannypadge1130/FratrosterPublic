databaseChangeLog = {

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-1") {
		createTable(tableName: "alumni_list_app") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "alumni_list_aPK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-2") {
		createTable(tableName: "alumni_member") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "alumni_memberPK")
			}

			column(name: "profession", type: "varchar(255)")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-3") {
		createTable(tableName: "brother_list_app") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "brother_list_PK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-4") {
		createTable(tableName: "brother_member") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "brother_membePK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-5") {
		createTable(tableName: "college") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "collegePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "college_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "email_domain", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "image_id", type: "bigint")

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "long_description", type: "varchar(256)")

			column(name: "short_description", type: "varchar(128)")

			column(name: "social_network_info_id", type: "bigint")

			column(name: "state_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-6") {
		createTable(tableName: "comment") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "commentPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "author_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "message", type: "varchar(140)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-7") {
		createTable(tableName: "facebook_user") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "facebook_userPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "access_token", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "access_token_expires", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "uid", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-8") {
		createTable(tableName: "frat") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "fratPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "average_gpa", type: "double precision")

			column(name: "college_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "founded_year", type: "datetime")

			column(name: "frat_admin_id", type: "bigint")

			column(name: "frat_description", type: "varchar(400)")

			column(name: "frat_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "frat_type", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "image_id", type: "bigint")

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "social_network_info_id", type: "bigint")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-9") {
		createTable(tableName: "frat_app") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "frat_appPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "app_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "frat_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "globally_viewable", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "identifier", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "image", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-10") {
		createTable(tableName: "frat_member") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "frat_memberPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "frat_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "type", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-11") {
		createTable(tableName: "frat_member_app_permission") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "frat_member_aPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "frat_app_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "frat_member_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "permissions", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-12") {
		createTable(tableName: "history_app") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "history_appPK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-13") {
		createTable(tableName: "notification") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "notificationPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "mark_for_delete", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "message", type: "varchar(140)") {
				constraints(nullable: "false")
			}

			column(name: "read_note", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-14") {
		createTable(tableName: "pending_alumni") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pending_alumnPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "alum_frat_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-15") {
		createTable(tableName: "pending_member") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pending_membePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "frat_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-16") {
		createTable(tableName: "pending_rush") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pending_rushPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "frat_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "invited", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-17") {
		createTable(tableName: "pending_user_app") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pending_user_PK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-18") {
		createTable(tableName: "pledge_list_app") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pledge_list_aPK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-19") {
		createTable(tableName: "pledge_member") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "pledge_memberPK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-20") {
		createTable(tableName: "profile_image_upload") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "profile_imagePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "file_path", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-21") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-22") {
		createTable(tableName: "rush_list_app") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rush_list_appPK")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-23") {
		createTable(tableName: "rush_member") {
			column(name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rush_memberPK")
			}

			column(name: "accepted", type: "bit") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-24") {
		createTable(tableName: "rush_member_comment") {
			column(name: "rush_member_comments_id", type: "bigint")

			column(name: "comment_id", type: "bigint")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-25") {
		createTable(tableName: "rush_member_vote") {
			column(name: "rush_member_votes_id", type: "bigint")

			column(name: "vote_id", type: "bigint")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-26") {
		createTable(tableName: "s3image") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "s3imagePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "image_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "image_url", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-27") {
		createTable(tableName: "social_network_info") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "social_networPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "facebook", type: "varchar(255)")

			column(name: "googleplus", type: "varchar(255)")

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "linkedin", type: "varchar(255)")

			column(name: "twitter", type: "varchar(255)")

			column(name: "website", type: "varchar(255)")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-28") {
		createTable(tableName: "state") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "statePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "state_abrv", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "state_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-29") {
		createTable(tableName: "user") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "userPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "active_rush", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "college_id", type: "bigint")

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "password", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "profile_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "valid_edu_email", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "verification_pin", type: "varchar(255)")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-30") {
		createTable(tableName: "user_contact") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "user_contactPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "address1", type: "varchar(255)")

			column(name: "address2", type: "varchar(255)")

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "phone", type: "varchar(255)")

			column(name: "preferred_email", type: "varchar(255)")

			column(name: "state_id", type: "bigint")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-31") {
		createTable(tableName: "user_profile") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "user_profilePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "birthday", type: "datetime")

			column(name: "contact_info_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "varchar(128)")

			column(name: "first_name", type: "varchar(60)") {
				constraints(nullable: "false")
			}

			column(name: "gpa", type: "double precision")

			column(name: "graduation_year", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "highschool", type: "varchar(128)")

			column(name: "is_profile_setup", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "last_name", type: "varchar(60)") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "major", type: "varchar(255)")

			column(name: "profile_image_id", type: "bigint")

			column(name: "social_network_info_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-32") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-33") {
		createTable(tableName: "vote") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "votePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "author_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date_created", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "last_updated", type: "datetime") {
				constraints(nullable: "false")
			}

			column(name: "liked", type: "bit") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-34") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-70") {
		createIndex(indexName: "FK3897619791D0B723", tableName: "college") {
			column(name: "state_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-71") {
		createIndex(indexName: "FK38976197CA984263", tableName: "college") {
			column(name: "image_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-72") {
		createIndex(indexName: "FK38976197F9B52841", tableName: "college") {
			column(name: "social_network_info_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-73") {
		createIndex(indexName: "college_name_uniq_1416416214915", tableName: "college", unique: "true") {
			column(name: "college_name")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-74") {
		createIndex(indexName: "email_domain_uniq_1416416214917", tableName: "college", unique: "true") {
			column(name: "email_domain")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-75") {
		createIndex(indexName: "FK38A5EE5FABCB4326", tableName: "comment") {
			column(name: "author_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-76") {
		createIndex(indexName: "FK609FD5A44B1250E6", tableName: "facebook_user") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-77") {
		createIndex(indexName: "uid_uniq_1416416214924", tableName: "facebook_user", unique: "true") {
			column(name: "uid")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-78") {
		createIndex(indexName: "FK3015FFB027B323", tableName: "frat") {
			column(name: "college_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-79") {
		createIndex(indexName: "FK3015FFB0B84522", tableName: "frat") {
			column(name: "frat_admin_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-80") {
		createIndex(indexName: "FK3015FFCA984263", tableName: "frat") {
			column(name: "image_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-81") {
		createIndex(indexName: "FK3015FFF9B52841", tableName: "frat") {
			column(name: "social_network_info_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-82") {
		createIndex(indexName: "FK9E53A7E149515D31", tableName: "frat_app") {
			column(name: "frat_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-83") {
		createIndex(indexName: "FKBCFC84DA49515D31", tableName: "frat_member") {
			column(name: "frat_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-84") {
		createIndex(indexName: "FKBCFC84DA4B1250E6", tableName: "frat_member") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-85") {
		createIndex(indexName: "FK3EA70CB2474AFAB0", tableName: "frat_member_app_permission") {
			column(name: "frat_member_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-86") {
		createIndex(indexName: "FK3EA70CB26418A6A4", tableName: "frat_member_app_permission") {
			column(name: "frat_app_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-87") {
		createIndex(indexName: "FK237A88EB4B1250E6", tableName: "notification") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-88") {
		createIndex(indexName: "FK62A3A0A64B1250E6", tableName: "pending_alumni") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-89") {
		createIndex(indexName: "FK62A3A0A657600CF5", tableName: "pending_alumni") {
			column(name: "alum_frat_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-90") {
		createIndex(indexName: "FK76B7564249515D31", tableName: "pending_member") {
			column(name: "frat_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-91") {
		createIndex(indexName: "FK76B756424B1250E6", tableName: "pending_member") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-92") {
		createIndex(indexName: "FK9B92D8049515D31", tableName: "pending_rush") {
			column(name: "frat_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-93") {
		createIndex(indexName: "FK9B92D804B1250E6", tableName: "pending_rush") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-94") {
		createIndex(indexName: "FK8805D03B4B1250E6", tableName: "profile_image_upload") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-95") {
		createIndex(indexName: "authority_uniq_1416416214937", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-96") {
		createIndex(indexName: "FK5C821101585A6FFD", tableName: "rush_member_comment") {
			column(name: "rush_member_comments_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-97") {
		createIndex(indexName: "FK5C821101ACF96455", tableName: "rush_member_comment") {
			column(name: "comment_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-98") {
		createIndex(indexName: "FKD8503881202C704", tableName: "rush_member_vote") {
			column(name: "rush_member_votes_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-99") {
		createIndex(indexName: "FKD85038844C7685F", tableName: "rush_member_vote") {
			column(name: "vote_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-100") {
		createIndex(indexName: "FK36EBCB7CA14A43", tableName: "user") {
			column(name: "profile_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-101") {
		createIndex(indexName: "FK36EBCBB027B323", tableName: "user") {
			column(name: "college_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-102") {
		createIndex(indexName: "username_uniq_1416416214942", tableName: "user", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-103") {
		createIndex(indexName: "FK93A6BBAC91D0B723", tableName: "user_contact") {
			column(name: "state_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-104") {
		createIndex(indexName: "FK487E2135C3E81A76", tableName: "user_profile") {
			column(name: "contact_info_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-105") {
		createIndex(indexName: "FK487E2135D434B839", tableName: "user_profile") {
			column(name: "profile_image_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-106") {
		createIndex(indexName: "FK487E2135F9B52841", tableName: "user_profile") {
			column(name: "social_network_info_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-107") {
		createIndex(indexName: "FK143BF46A4B1250E6", tableName: "user_role") {
			column(name: "user_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-108") {
		createIndex(indexName: "FK143BF46AA5E78D06", tableName: "user_role") {
			column(name: "role_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-109") {
		createIndex(indexName: "FK3752EAABCB4326", tableName: "vote") {
			column(name: "author_id")
		}
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-35") {
		addForeignKeyConstraint(baseColumnNames: "image_id", baseTableName: "college", constraintName: "FK38976197CA984263", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "s3image", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-36") {
		addForeignKeyConstraint(baseColumnNames: "social_network_info_id", baseTableName: "college", constraintName: "FK38976197F9B52841", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "social_network_info", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-37") {
		addForeignKeyConstraint(baseColumnNames: "state_id", baseTableName: "college", constraintName: "FK3897619791D0B723", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "state", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-38") {
		addForeignKeyConstraint(baseColumnNames: "author_id", baseTableName: "comment", constraintName: "FK38A5EE5FABCB4326", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-39") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "facebook_user", constraintName: "FK609FD5A44B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-40") {
		addForeignKeyConstraint(baseColumnNames: "college_id", baseTableName: "frat", constraintName: "FK3015FFB027B323", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "college", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-41") {
		addForeignKeyConstraint(baseColumnNames: "frat_admin_id", baseTableName: "frat", constraintName: "FK3015FFB0B84522", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-42") {
		addForeignKeyConstraint(baseColumnNames: "image_id", baseTableName: "frat", constraintName: "FK3015FFCA984263", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "s3image", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-43") {
		addForeignKeyConstraint(baseColumnNames: "social_network_info_id", baseTableName: "frat", constraintName: "FK3015FFF9B52841", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "social_network_info", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-44") {
		addForeignKeyConstraint(baseColumnNames: "frat_id", baseTableName: "frat_app", constraintName: "FK9E53A7E149515D31", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-45") {
		addForeignKeyConstraint(baseColumnNames: "frat_id", baseTableName: "frat_member", constraintName: "FKBCFC84DA49515D31", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-46") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "frat_member", constraintName: "FKBCFC84DA4B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-47") {
		addForeignKeyConstraint(baseColumnNames: "frat_app_id", baseTableName: "frat_member_app_permission", constraintName: "FK3EA70CB26418A6A4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat_app", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-48") {
		addForeignKeyConstraint(baseColumnNames: "frat_member_id", baseTableName: "frat_member_app_permission", constraintName: "FK3EA70CB2474AFAB0", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat_member", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-49") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "notification", constraintName: "FK237A88EB4B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-50") {
		addForeignKeyConstraint(baseColumnNames: "alum_frat_id", baseTableName: "pending_alumni", constraintName: "FK62A3A0A657600CF5", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-51") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "pending_alumni", constraintName: "FK62A3A0A64B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-52") {
		addForeignKeyConstraint(baseColumnNames: "frat_id", baseTableName: "pending_member", constraintName: "FK76B7564249515D31", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-53") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "pending_member", constraintName: "FK76B756424B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-54") {
		addForeignKeyConstraint(baseColumnNames: "frat_id", baseTableName: "pending_rush", constraintName: "FK9B92D8049515D31", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "frat", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-55") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "pending_rush", constraintName: "FK9B92D804B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-56") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "profile_image_upload", constraintName: "FK8805D03B4B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-57") {
		addForeignKeyConstraint(baseColumnNames: "comment_id", baseTableName: "rush_member_comment", constraintName: "FK5C821101ACF96455", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "comment", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-58") {
		addForeignKeyConstraint(baseColumnNames: "rush_member_comments_id", baseTableName: "rush_member_comment", constraintName: "FK5C821101585A6FFD", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "rush_member", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-59") {
		addForeignKeyConstraint(baseColumnNames: "rush_member_votes_id", baseTableName: "rush_member_vote", constraintName: "FKD8503881202C704", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "rush_member", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-60") {
		addForeignKeyConstraint(baseColumnNames: "vote_id", baseTableName: "rush_member_vote", constraintName: "FKD85038844C7685F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "vote", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-61") {
		addForeignKeyConstraint(baseColumnNames: "college_id", baseTableName: "user", constraintName: "FK36EBCBB027B323", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "college", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-62") {
		addForeignKeyConstraint(baseColumnNames: "profile_id", baseTableName: "user", constraintName: "FK36EBCB7CA14A43", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user_profile", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-63") {
		addForeignKeyConstraint(baseColumnNames: "state_id", baseTableName: "user_contact", constraintName: "FK93A6BBAC91D0B723", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "state", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-64") {
		addForeignKeyConstraint(baseColumnNames: "contact_info_id", baseTableName: "user_profile", constraintName: "FK487E2135C3E81A76", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user_contact", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-65") {
		addForeignKeyConstraint(baseColumnNames: "profile_image_id", baseTableName: "user_profile", constraintName: "FK487E2135D434B839", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "s3image", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-66") {
		addForeignKeyConstraint(baseColumnNames: "social_network_info_id", baseTableName: "user_profile", constraintName: "FK487E2135F9B52841", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "social_network_info", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-67") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK143BF46AA5E78D06", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-68") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK143BF46A4B1250E6", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}

	changeSet(author: "dan.padgett (generated)", id: "1416416214996-69") {
		addForeignKeyConstraint(baseColumnNames: "author_id", baseTableName: "vote", constraintName: "FK3752EAABCB4326", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
