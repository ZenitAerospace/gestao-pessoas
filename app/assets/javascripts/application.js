// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require wice_grid
//= require twitter/bootstrap
//= require_tree .

$(document).on('ready', function(){
    setInterval(notify,30000);
});
function notify(){
    $.ajax({
     url: '/has_notification',
     method: 'GET',
     format: 'JSON',
     success: function(data,load){
         console.log(data,load);
         var valid = JSON.parse(data);
         if(valid) {
             $('li a.notification').attr('id','notify');
         }else{
             $('li a.notification').attr('id','');
         }
     },
     error: function(){ console.log("error on server");}
    });
}
