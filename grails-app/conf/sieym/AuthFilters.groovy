package sieym

class AuthFilters {

    def filters = {
        authorized(controller:'auth', action:'*', invert: true) {
            before = {
				if (!session.user) {
					redirect(controller:'auth', action: 'login')
					return false
				}
            }
        }
    }
}
