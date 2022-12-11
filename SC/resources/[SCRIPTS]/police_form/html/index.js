$(function () {
    function display(bool) {
        if (bool) {
            $("#container").slideDown(400);
            $("#startscreen ").slideDown(400);
            $("#info").hide()
            $(".buttonsopen").hide()
            $("#warn").hide()

            $("#done").hide()



            

            
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));
            return
        }
    };
    $("#start").click(function () {
        
       $("#startscreen").fadeOut(400)
       $(".buttonsopen").show(500)
    
       $("#warn").hide()

       document.getElementById('firstname').value = ''
       document.getElementById('lastname').value = ''
       document.getElementById('age').value = ''
       document.getElementById('why').value = ''
       document.getElementById('gender').value = ''







    })


    var first = document.getElementById('firstname')
    var last = document.getElementById('lastname')
    var age = document.getElementById('age')
    var why = document.getElementById('why')
    var gender = document.getElementById('gender')


        $(".sumbit").click(function() {
                if($(first , last , age , why , gender).val() === '') {
                    $("#warn").fadeIn(400)
                    return
                    
                } else{
                $("#warn").fadeOut(400)
                $("#info").fadeOut(400)
                $("#done").fadeIn(400)
                $.post(
                    `http://${GetParentResourceName()}/name`,
                  JSON.stringify({
                    plate: $("#firstname").val(),     
                    lastname: $("#lastname").val(),
                    age: $("#age").val(),
                    why: $("#why").val(),
                    gender: $("#gender").val(),
                  })
                );
            }
        
    })
    $("#sumbit2").click(function() {
        var ft = document.getElementById('ft')
        var ln = document.getElementById('ln')
        var reason = document.getElementById('reason')
        var date = document.getElementById('date')

        
        if($(ft , ln , reason , date).val() === '') {
            $("#warn1").fadeIn(400)
            return
            
        } else{

  
      
    
        $("#warn").fadeOut(400)
        $("#complaintinfo").fadeOut(400)

        $("#done").fadeIn(400)
        $.post(
            `http://${GetParentResourceName()}/complaintinfo`,
          JSON.stringify({
            ft: $("#ft").val(),     
            ln: $("#ln").val(),
            reason: $("#reason").val(),
            date: $("#date").val(),

            myImg: $("#myImg").val(),


          })
        );
    }

})


    $(".exit").click(function() {

        $("#container").fadeOut();
        setTimeout(function(){
            $.post(`http://${GetParentResourceName()}/exit`, JSON.stringify({}));

        },400);


        return
    })
    
    $("#Form").click(function() {
        $("#warn").hide()

        $("#info").fadeIn(400)
        $(".buttonsopen").hide()
        return
    })
    $("#back").click(function(){
        $("#info").toggle("slow")
        
        $("#warn1").hide()
        $(".buttonsopen").show()
        
       document.getElementById('firstname').value = ''
       document.getElementById('lastname').value = ''
       document.getElementById('age').value = ''
       document.getElementById('why').value = ''
       document.getElementById('gender').value = ''

    })
    $("#back2").click(function(){
        $("#complaintinfo").toggle("slow")
        $("#warn").hide()

        $(".buttonsopen").show()

    })
    

    $("#complaint").click(function(){
        document.getElementById('ft').value = ''
        document.getElementById('ln').value = ''
        document.getElementById('date').value = ''
        
        document.getElementById('reason').value = ''
        document.getElementById('myImg').value = ''

        $(".buttonsopen").hide()
        $("#complaintinfo").show()
        $("#warn").hide()


    })


        
    

        
    

})
