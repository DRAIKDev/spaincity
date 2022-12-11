fixH = function(size) {
    return Math.round(size * screen.height);
}
fixW = function(size) {
    return Math.round(size * screen.width);
}
minimap = [];
radarShowing = false;
notis = [];
positionNotifications = function() {
    $('#customCSS').remove();
    minimap.width ? minimap.width : minimap.width = 0.14
    minimap.x ? minimap.x : minimap.x = 0.015
    if (radarShowing) {
        $('head').append('<style id="customCSS">#noty_layout__forasteros { bottom: ' + (fixH(minimap.height) + 30) + 'px; left: ' + fixW(minimap.x) + 'px; width: ' + fixW(minimap.width) + 'px; }');
    } else {
        $('head').append('<style id="customCSS">#noty_layout__forasteros { bottom: 30px; left: ' + fixW(minimap.x) + 'px; width: ' + fixW(minimap.width) + 'px;}');
    }
}
positionNotifications();
$(function() {
    window.addEventListener("message", function(event) {

        var item = event.data;
        if (item !== undefined && item.setMinimap) {
            minimap = item.minimap;
            positionNotifications();

        } else if (item !== undefined && item.promptClose) {
            notis[item.notificationId].close();
        } else if (item !== undefined && item.resume) {
            notis[item.notificationId].setTimeout(item.timeout);
        } else if (item !== undefined && item.radarChanged) {
            radarShowing = item.isShowing;
            positionNotifications();
        } else if (item !== undefined && item.type === "ui") {
            if (item.display === true) {
                $("#progressbar").show();
                var start = new Date();
                var maxTime = item.time;
                var text = item.text;
                var timeoutVal = Math.floor(maxTime / 100);
                animateUpdate();
                $('#pbar_innertext').text(text);

                function updateProgress(percentage) {
                    $('#pbar_innerdiv').css("width", percentage + "%");
                }

                function animateUpdate() {
                    var now = new Date();
                    var timeDiff = now.getTime() - start.getTime();
                    var perc = Math.round((timeDiff / maxTime) * 100);
                    if (perc <= 100) {
                        updateProgress(perc);
                        setTimeout(animateUpdate, timeoutVal);
                    } else {
                        $("#progressbar").hide();
                    }
                }
            }
        } else if (event.data.options) {
            var options = event.data.options;
            if (options.id) {
                notis[options.id] = new Noty(options).on('afterClose', function() {
                    $.post("http://esx_notifications/notification_afterClose", JSON.stringify({
                        id: options.id
                    }));

                });
                notis[options.id].show();
            } else {
                new Noty(options).show();
            }
        } else if (event.data.maxNotifications !== undefined) {
            var maxNotifications = event.data.maxNotifications;
            Noty.setMaxVisible(maxNotifications.max, maxNotifications.queue);
        } else {
            $("#progressbar").hide();
        }


    });
});