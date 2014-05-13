// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.tokeninput
//= require jquery.ui.dialog




// Or peek any of them yourself
//= require bootstrap


//= require turbolinks
//= require redactor-rails
//= require fotorama


//= require_tree .


$(document).ready(function() {



$('.fotorama').fotorama({
  maxwidth: '100%',
  ratio: 16/9,
  allowfullscreen: true,
  nav: 'thumbs'
  
});


// убирает флеш сообщения через некоторое время
// $("div[id^='flash_box']").fadeOut(10000);
// !!! нужно изменить способ адресации фоторамы здесь чтобы не трогало фотораму на главной
$('.fotorama').on(
  'fotorama:show',
  function (e, fotorama, extra) {
    // console.log(fotorama.activeFrame.img);
    var re = /\d+/;
    var href = fotorama.activeFrame.img
    var id = href.match(re)
    var image_path = "/gallery/show/"+id;  

    $(".comlink").attr('href',image_path)
    
  }
);

 $(".jury_estimate").jRating({
         // step:true,
         length : 10, // nb of stars
         phpPath: "/jury_rating",
         bigStarsPath: 'assets/stars.png',
         nbRates: 10,
         type: "big",
         rateMax: 10,
         canRateAgain: true,  
         decimalLength: 2  ,
         
         // onSuccess : function(){
         //   alert('Success : your rate has been saved :)');
         // },
         // onError : function(){
         //   alert('Error !');
         // }
         


       });


 $(".final_estimate").jRating({
         // step:true,
         length : 3, // nb of stars
         phpPath: "/admin/final_rating",
         bigStarsPath: 'assets/stars.png',
         nbRates: 3,
         type: "big",
         rateMax: 3,
         canRateAgain: true,  
         step: true
         // decimalLength: 1,
         
         // onSuccess : function(){
         //   alert('Success : your rate has been saved :)');
         // },
         // onError : function(){
         //   alert('Error !');
         // }
         


       });
 
     


});

