package sieym

class AuthController {

	static allowedMethods = [dologin: "POST"]

	def login() {
		// display login page
	}

	def dologin() {
		User user = User.findByUsername(params.username)
		if(user && user.password == params.password) {
			session.user = user
			redirect(uri: user.role == Role.ADMIN ? '/user/list' : '/')
		} else {
		 flash.message = "Usuario o contraseña incorrecta"
		 redirect(action: 'login')
		}
		
	}

	def dologout() {
		session.invalidate()
		redirect(uri: '/')
	}
	
	def index() {
		redirect(action: "login", params: params)
	}

}
