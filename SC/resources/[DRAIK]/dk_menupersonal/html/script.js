$(function(){
    window.addEventListener("message", function(event){

        if ( event.data.ponerbarras == true ) {
            var selector  = document.querySelector("#barras")
            selector.style = "display:block;"
            var selector2  = document.querySelector("#All")
            selector2.style = "display:none;"
        }

        if ( event.data.quitarbarras == true ) {
            var selector  = document.querySelector("#barras")
            selector.style = "display:none;"
            var selector2  = document.querySelector("#All")
            selector2.style = "display:block;"
        }

    })

})