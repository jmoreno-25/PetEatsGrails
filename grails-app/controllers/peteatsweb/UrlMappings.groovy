package peteatsweb

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'login', action: 'login')
        "/inicioCli"(controller: 'inicioCli', action: 'indexCli')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
