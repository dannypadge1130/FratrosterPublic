package com.fratroster

class CommonService {
	def String generateNewPassword() {
		def pool = ['a'..'z','A'..'Z',0..9,'_'].flatten()
		Random rand = new Random(System.currentTimeMillis())
		def passChars = (0..10).collect { pool[rand.nextInt(pool.size())] }
		def password = passChars.join()
		return password
	}
	
	def String generatePin() {
		def pool = [0..9,'_'].flatten()
		Random rand = new Random(System.currentTimeMillis())
		def pinChars = (0..15).collect { pool[rand.nextInt(pool.size())] }
		def pin = pinChars.join()
		return pin
	}
}
