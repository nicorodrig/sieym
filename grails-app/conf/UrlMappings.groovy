class UrlMappings {

	static mappings = {
		"/"(controller:"auth", action:"login")
		"/grails"(view:"/index")
		"500"(view:'/error')
		"/msg"(view:'/message')

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
	}
}
