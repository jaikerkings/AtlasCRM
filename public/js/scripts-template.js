function initializeJS() {

    //tool tips
    jQuery('.tooltips').tooltip();

    //popovers
    jQuery('.popovers').popover();

    //custom scrollbar
        //for html
    jQuery("html").niceScroll({styler:"fb",cursorcolor:"#007AFF", cursorwidth: '6', cursorborderradius: '10px', background: '#F7F7F7', cursorborder: '', zindex: '1000'});
        //for sidebar
    jQuery("#sidebar").niceScroll({styler:"fb",cursorcolor:"#007AFF", cursorwidth: '3', cursorborderradius: '10px', background: '#F7F7F7', cursorborder: ''});
        // for scroll panel
    jQuery(".scroll-panel").niceScroll({styler:"fb",cursorcolor:"#007AFF", cursorwidth: '3', cursorborderradius: '10px', background: '#F7F7F7', cursorborder: ''});
    
    //sidebar dropdown menu
    jQuery('#sidebar .sub-menu > a').click(function () {
        var last = jQuery('.sub-menu.open', jQuery('#sidebar'));        
        jQuery('.menu-arrow').removeClass('arrow_carrot-right');
        jQuery('.sub', last).slideUp(200);
        var sub = jQuery(this).next();
        if (sub.is(":visible")) {
            jQuery('.menu-arrow').addClass('arrow_carrot-right');            
            sub.slideUp(200);
        } else {
            jQuery('.menu-arrow').addClass('arrow_carrot-down');            
            sub.slideDown(200);
        }
        var o = (jQuery(this).offset());
        diff = 200 - o.top;
        if(diff>0)
            jQuery("#sidebar").scrollTo("-="+Math.abs(diff),500);
        else
            jQuery("#sidebar").scrollTo("+="+Math.abs(diff),500);
    });

    // sidebar menu toggle
   jQuery(function() {
        function responsiveView() {
            var wSize = jQuery(window).width();
            /*if (wSize <= 768) {
                jQuery('#container').addClass('sidebar-close');
                jQuery('#sidebar > ul').hide();
            }*/

            /*if (wSize > 768) {
                jQuery('#container').removeClass('sidebar-close');
                jQuery('#sidebar > ul').show();
            }*/
        }
        /*jQuery(window).on('load', responsiveView);
        jQuery(window).on('resize', responsiveView);*/
    });

    jQuery('.toggle-nav').click(function () {
        if (jQuery("#container").hasClass( "" )) {
            jQuery('#main-content').css({
                'margin-left': '0px'
            });
            jQuery('#sidebar').css({
                'margin-left': '-180px'
            });
            jQuery('#sidebar > ul').hide();
            jQuery("#container").addClass("sidebar-closed");
        } else {
            jQuery('#main-content').css({
                'margin-left': '180px'
            });
            jQuery('#sidebar > ul').show();
            jQuery('#sidebar').css({
                'margin-left': '0'
            });
            jQuery("#container").removeClass("sidebar-closed");
        }
    });

    //boton iniciar sesion
    jQuery('#btnLogin').click(function () {
        var username = $("#username").val();
        var password = $("#password").val();

        if ((username!="") && (password!="")){
            var url = $('#frmLogin').attr('action');
            var datos = {nombreUsu:username, password:password};

            $.ajax({
                type: "POST",
                url: url,
                data: datos,
                dataType: "json"
            }).done(function(respJSON) {
                //alert( "success" );
                if(respJSON.exito){
                    $("#imgAvaUsuario").attr("src",respJSON.foto);
                    //location.reload();
                    var openedWindow = window.open("app");
                }else{
                    alert(respJSON.msg);
                    $("#username").focus();
                }
            }).fail(function( jqXHR, textStatus ) {
              alert( "Request failed: " + textStatus );
              alert(jqXHR.responseText);
            });
            
        }else{
            if (username=="") {
                alert("Por favor ingresa tu Email...");
                $("#username").focus();
            }else{
                alert("Por favor ingresa tu clave de acceso...");
                $("#password").focus();
            }
            return false; //Si devolvemos false, el formulario ya no se enviara.
        }
    });
    
    jQuery('#btnLogout').click(function (event) {
        event.preventDefault();
        var url = "/sessions/destroy";
        var datos = {};  
        $.post(url, datos, function(json){ 
            location.reload(true);
            close();
        });
    });
    
    //bar chart
    if (jQuery(".custom-custom-bar-chart")) {
        jQuery(".bar").each(function () {
            var i = jQuery(this).find(".value").html();
            jQuery(this).find(".value").html("");
            jQuery(this).find(".value").animate({
                height: i
            }, 2000)
        })
    }
    //comentar estas dos lineas para que habra el menu al iniciar la pagina:
    jQuery("#container").addClass("sidebar-closed");
    jQuery('#sidebar > ul').hide();
}

jQuery(document).ready(function(){
    initializeJS();

});