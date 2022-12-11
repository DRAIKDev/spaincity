var open = false;
$('#clothesmenu').fadeOut(0);
var currentMenu = null;
var hairColors = null;
var makeupColors = null;
let headBlend = {};

var isService = false;

const throttle = (func, limit) => {
    let inThrottle
    return (...args) => {
        if (!inThrottle) {
            func(...args)
            inThrottle = setTimeout(() => inThrottle = false, limit)
        }
    }
}

$(function () {
    $('.modal').modal();

    window.addEventListener('message', function (event) {
        if (event.data.type == "enableclothesmenu") {
            open = event.data.enable;
            if (open) {
                currentMenu = $('#'+event.data.menu);
                isService = event.data.isService;
                document.body.style.display = "block";
                setTimeout(function () {
                    currentMenu.fadeIn(500);
                }, 1);
            } else {
                currentMenu.fadeOut(500);
                setTimeout(function () {
                    document.body.style.display = "none";
                }, 500);
            }
        }

        if (event.data.type == "colors") {
            hairColors = createPalette(event.data.hairColors);
            AddPalettes();
            SetHairColor(event.data.hairColor);
        }

        if (event.data.type == "menutotals") {
            let drawTotal = event.data.drawTotal;
            let propDrawTotal = event.data.propDrawTotal;
            let textureTotal = event.data.textureTotal;
            let headoverlayTotal = event.data.headoverlayTotal;
            let skinTotal = event.data.skinTotal;
            let savedTotal = event.data.savedTotal;
            UpdateTotals(drawTotal, propDrawTotal, textureTotal, headoverlayTotal, skinTotal);
        }
        if (event.data.type == "clothesmenudata") {
            let drawables = event.data.drawables;
            let props = event.data.props;
            let drawtextures = event.data.drawtextures;
            let proptextures = event.data.proptextures;
            let skin = event.data.skin;
            UpdateInputs(drawables, props, drawtextures, proptextures, skin);
        }
    });

    document.onkeyup = function (data) {
        if (open) {
            // data.getModifierState("Shift") &&
            if (data.which == 27) {
                if ($('#closemenu').hasClass('open')) {
                    $('#closemenu').modal('close');
                }
                else {
                    $('#closemenu').modal('open');
                }
            }
        }
    };

    $('#save').on('click', function() {
        CloseMenu(true)
    })
    $('#kaydetmedenkapat').on('click', function() {
        $.post('http://sc_tiendaropa/resetped', JSON.stringify({}))
        CloseMenu2(true)
    })
    $('#discard').on('click', function() {
        CloseMenu(false)
    })

    function CloseMenu(save) {
        $.post('http://sc_tiendaropa/escape', JSON.stringify({save:save}));
    }

    function CloseMenu2(save) {
        $.post('http://sc_tiendaropa/escape2', JSON.stringify({save:save}));
    }

    $(document).on('contextmenu', function() {
        $.post('http://sc_tiendaropa/togglecursor', JSON.stringify({}));
    })

    $('.button-menu').on('click', function () {
        $('.button-menu').removeClass('active')
        $('.button-menu').each(function() {
            $("#" + $(this).attr('data-target')).fadeOut(100);
        })

        let t = $("#" + $(this).attr('data-target'))
        $(this).addClass('active');
        t.fadeIn(100);
    })

    $('#savedright').on('click', function () {
        var input = $(this).parent().find('.input-number')
        input.val(parseInt(input.val()) + 1)
        $.post('http://sc_tiendaropa/loadsaved', JSON.stringify({
            "number": input.val()
        }));
    })

    $('#savedleft').on('click', function () {
        var input = $(this).parent().find('.input-number')
        if (parseInt(input.val()) != 0 && parseInt(input.val()) > 0) {
            input.val(parseInt(input.val()) - 1)
            $.post('http://sc_tiendaropa/loadsaved', JSON.stringify({
                "number": input.val()
            }));
        }
    })

    $('#savedinput').on('input', function () {
        var input = $(this).parent().find('.input-number')
        if (parseInt(input.val()) > -1) {
            $.post('http://sc_tiendaropa/loadsaved', JSON.stringify({
                "number": input.val()
            }))
        }
        else if (parseInt(input.val()) <= -1) {
            input.val('0')
            $.post('http://sc_tiendaropa/loadsaved', JSON.stringify({
                "number": input.val()
            }));
        }
    })

    $('#savecurrent').on('click', function () {
        $('#savemenu').modal('open');
    })

    $('#savemenu').find('input').keypress(function (e) {
        if (e.which == 13) {
            $.post('http://sc_tiendaropa/saveescape', JSON.stringify($(this).val()))
            $('#savemenu').modal('close');
        }
    })

    function UpdateTotals(drawTotal, propDrawTotal, textureTotal, headoverlayTotal, skinTotal) {
        for (var i = 0; i < Object.keys(drawTotal).length; i++) {
            if (drawTotal[i][0] == "hair") {
                $('.hair').each(function() {
                    $(this).find('.total-number').eq(0).text(drawTotal[i][1]);
                })
            }
            $("#" + drawTotal[i][0]).find('.total-number').eq(0).text(drawTotal[i][1]);
        }

        for (var i = 0; i < Object.keys(propDrawTotal).length; i++) {
            $("#" + propDrawTotal[i][0]).find('.total-number').eq(0).text(propDrawTotal[i][1]);
        }

        for (const key of Object.keys(textureTotal)) {
            $("#" + key).find('.total-number').eq(1).text(textureTotal[key]);
        }

        // for (const key of Object.keys(headoverlayTotal)) {
        //     $("#" + key).find('.total-number').eq(0).text(headoverlayTotal[key]);
        // }

        // let skinConts = $('#skins').find('.total-number');
        // skinConts.eq(0).text(skinTotal[0]+1);
        // skinConts.eq(1).text(skinTotal[1]+1);
    }

    function UpdateInputs(drawables, props, drawtextures, proptextures, skin) {
        for (var i = 0; i < Object.keys(drawables).length; i++) {
            if (drawables[i][0] == "hair") {
                $('.hair').each(function() {
                    $(this).find('.input-number').eq(0).val(drawables[i][1]);
                })
            }
            $("#" + drawables[i][0]).find('.input-number').eq(0).val(drawables[i][1]);
        }

        for (var i = 0; i < Object.keys(props).length; i++) {
            $("#" + props[i][0]).find('.input-number').eq(0).val(props[i][1]);
        }

        for (var i = 0; i < Object.keys(drawtextures).length; i++) {
            $("#" + drawtextures[i][0]).find('.input-number').eq(1).val(drawtextures[i][1]);
        }
        for (var i = 0; i < Object.keys(proptextures).length; i++) {
            $("#" + proptextures[i][0]).find('.input-number').eq(1).val(proptextures[i][1]);
        }

        // if (skin['name'] == "skin_male") {
        //     $('#skin_male').val(skin['value'])
        //     if($('#skin_female').val() != 0){$('#skin_female').val(0)}
        // }
        // else {
        //     $('#skin_female').val(skin['value'])
        //     if($('#skin_male').val() != 0){$('#skin_male').val(0)}
        // }
    }

    $('.button-left').on('click', function () {
        var input = $(this).parent().find('.input-number')
        input.val(parseInt(input.val()) - 1)
        inputChange(input,false)
    })
    $('.button-right').on('click', function () {
        var input = $(this).parent().find('.input-number')
        input.val(parseInt(input.val()) + 1)
        inputChange(input,true)
    })

    $('.input-number').on('input', function () {
        inputChange($(this),true)
    })

    $('.input-number').on('mousewheel', function () {})

    $('#skin_string').find('input').keypress(function (e) {
        if (e.which == 13) {
            $.post('http://sc_tiendaropa/customskin', JSON.stringify($(this).val()));
        }
    })

    function inputChange(ele,inputType) {
        var inputs = $(ele).parent().parent().find('.input-number');
        var total = 0;

        if (currentMenu.is($('#clothesmenu')) || $(ele).parents('.panel').hasClass('hair')) {
            if (ele.is(inputs.eq(0))) {
                total = inputs.eq(0).parent().find('.total-number').text();
                inputs.eq(1).val(0);
            } else {
                total = inputs.eq(1).parent().find('.total-number').text();
            }

            if (parseInt($(ele).val()) > parseInt(total)-1) {
                $(ele).val(-1)
            } else if (parseInt($(ele).val()) < -1) {
                $(ele).val(parseInt(total)-1)
            }
            if (ele.is(inputs.eq(1)) && $(ele).val() == -1) {
                $(ele).val(0)
            }

            if(!isService && ($('#skin_female').val() == 1 || $('#skin_male').val() == 1)) {
                let clothingName = $(ele).parents('.panel').attr('id');
                let clothingID = parseInt($(ele).val());
                let isNotValid = true
                let gender = "male";
                if($('#skin_female').val() >= 1 && $('#skin_male').val() == 0)
                    gender = "female";

                if(ele.is(inputs.eq(0)) && whitelisted[gender][clothingName]){
                    while (isNotValid) {
                        if(whitelisted[gender][clothingName].indexOf(clothingID) > -1 ){
                            isNotValid = true
                            if(inputType){clothingID++;}else{clothingID--;}

                        }
                        else
                        {
                            isNotValid = false;
                        }
                    }
                }
                $(ele).val(clothingID)
            }

            let nameId = "";
                nameId = $(ele).parent().parent().parent().attr('id').split('#')[0]
            $.post('http://sc_tiendaropa/updateclothes', JSON.stringify({
                "name": nameId,
                "value": inputs.eq(0).val(),
                "texture": inputs.eq(1).val()
            })).done(function (data) {
                inputs.eq(1).parent().find('.total-number').text(data);
            });
        }
    }

    // camera buttons
    function toggleCam(ele) {
        $('tog_head').removeClass('active');
        $('tog_torso').removeClass('active');
        $('tog_leg').removeClass('active');
        ele.addClass('active');
    }

    $('.tog_head').on('click', function() {
        toggleCam($(this));
        $.post('http://sc_tiendaropa/switchcam', JSON.stringify({name: 'head'}))
    })
    $('.tog_torso').on('click', function() {
        toggleCam($(this));
        $.post('http://sc_tiendaropa/switchcam', JSON.stringify({name: 'torso'}))
    })
    $('.tog_leg').on('click', function() {
        toggleCam($(this));
        $.post('http://sc_tiendaropa/switchcam', JSON.stringify({name: 'leg'}))
    })
    $('.tog_cam').on('click', function() {
        toggleCam($(this));
        $.post('http://sc_tiendaropa/switchcam', JSON.stringify({name: 'cam'}))
    })


    $('.tog_hat').on('click', function() {
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "hats"}))
    })
    $('.tog_glasses').on('click', function() {
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "glasses"}))
    })
    $('.tog_tops').on('click', function() {
        // dont look at this :)
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "jackets"}))
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "undershirts"}))
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "torsos"}))
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "vest"}))
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "bags"}))
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "neck"}))
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "decals"}))
    })
    $('.tog_legs').on('click', function() {
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "legs"}))
    })
    $('.tog_mask').on('click', function() {
        $.post('http://sc_tiendaropa/toggleclothes', JSON.stringify({name: "masks"}))
    })

    $('#reset').on('click', function() {
        $.post('http://sc_tiendaropa/resetped', JSON.stringify({}))
    })


    window.addEventListener("keydown", throttle(function (ev) {
        var input = $(ev.target);
        var num = input.hasClass('input-number');
        var _key = false;
        if (ev.which == 39 || ev.which == 68) {
            if (num === false) {
                _key = "left"
            }
            else if (num) {
                input.val(parseInt(input.val()) + 1)
                inputChange(input,true)
            }
        }
        if (ev.which == 37 || ev.which == 65) {
            if (num === false) {
                _key = "right"
            }
            else if (num) {
                input.val(parseInt(input.val()) - 1)
                inputChange(input,false)
            }
        }

        if (_key) {
            $.post('http://sc_tiendaropa/rotate', JSON.stringify({key: _key}))
        }
    }, 50))




    /////////////////////////////////////////////////////////////////////////////////////////
    // Barber

    function SetHairColor(data) {
        $('.hair').each(function() {
            var palettes = $(this).find('.color_palette_container').eq(0).find('.color_palette')
            $(palettes[data[0]]).addClass('active')
            palettes = $(this).find('.color_palette_container').eq(1).find('.color_palette')
            $(palettes[data[1]]).addClass('active')
        })
    }

    function AddPalettes() {
        $('.collapsible').collapsible();
        $('.color_palette_container').each(function () {
            $(this).empty()
            if ($(this).hasClass('haircol')) {
                $(this).append($(hairColors))
            }
        });
        $('.color_palette').on('click', function() {
            var palettes = $(this).parents('.panel').find('.color_palette_container')

            $(this).parent().find('.color_palette').removeClass('active')
            $(this).addClass('active')

            if ($(this).parents('.panel').hasClass('hair')) {
                $.post('http://sc_tiendaropa/savehaircolor', JSON.stringify({
                    firstColour: palettes.eq(0).find('.active').attr('value'),
                    secondColour: palettes.eq(1).find('.active').attr('value')
                }));
            }
            else {
                $.post('http://sc_tiendaropa/saveheadoverlaycolor', JSON.stringify({
                    firstColour: palettes.eq(0).find('.active').attr('value'),
                    secondColour: palettes.eq(1).find('.active').attr('value'),
                    name: $(this).parents('.panel').attr('id')
                }));
            }
        })
    }

    function createPalette(array) {
        var ele_string = ""
        for (var i = 0; i < Object.keys(array).length; i++) {
            var color = array[i][0]+","+array[i][1]+","+array[i][2]
            ele_string += '<div class="color_palette" style="background-color: rgb('+color+')" value="'+i+'"></div>'
        }
        return ele_string
    }
});


var tooltips = document.querySelectorAll('#clothes-container, #barber-container, #tats-container');



window.onmousemove = function (e) {

    var x = (160 - e.clientX/75) + 'px',
        y = (160 - e.clientY/55) + 'px';
        z = 'matrix3d(1,0,0.00,' + (-0.0002 + e.clientX/10000000) + ',0.00,1,0.00,' + (0.000 + e.clientY/10000000) + ',0,0,1,0,0,0,0,1)';

    for (var i = 0; i < tooltips.length; i++) {
        tooltips[i].style.top = y;
        tooltips[i].style.left = x;
        tooltips[i].style.transform = z;
    }
};