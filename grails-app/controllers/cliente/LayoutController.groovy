package cliente

class LayoutController {

    def header() {
        render(view: '/layouts/header')
    }

    def footer() {
        render(view: '/layouts/footer')
    }
}
