/*global $ */
document.addEventListener("turbolinks:load", function() {
    
  /* フラッシュメッセージの時間設定 */
　setTimeout("$('.alert-danger').fadeOut('slow')", 3000)
　setTimeout("$('.alert-success').fadeOut('slow')", 3000)
　
　$(function() {
    var slider = $('.example'); //最初に指定していたほうが余計なオブジェクトを作らないので軽くなる
    slider.slick({
       arrows:false,
       dots:true,
       infinite: false,
    });
    $('.example_fire').click(function () { //タブなど切り替えの要素を指定
       slider.slick('setPosition'); //今回のキモ「setPosition」
    });
  });
　
　/* スライドショーの設定 */
　$('.slider-for').slick({
      slidesToShow: 1,
      slidesToScroll: 1,
      arrows: false,
      fade: true,
      asNavFor: '.slider-nav'
  });
  
  $('.slider-nav').slick({
      slidesToShow: 3,
      slidesToScroll: 1,
      asNavFor: '.slider-for',
      dots: false,
      arrows: false,
      centerMode: true,
      focusOnSelect: true
  });
　
  $('.slider').slick({
      autoplay: true, //自動再生
      autoplaySpeed: 4000, //再生スピード
      slidesToShow: 1,
      arrows: true,
  });
  
  
  $('.header-list').click(function() {

       if($(this).hasClass('fa-bars')) {
           
       　  $('.phone-header-list-wrapper, .mens-category, .woman-category').removeClass('display-none');
          $('footer, .login-form-wrapper, .create-form-wrapper').addClass('display-none');
          $(this).addClass('fa-times');
          $(this).removeClass('fa-bars');
          $('.fa-male').removeClass('close-male')
          $('.phone-user-info-list-wrapper').addClass('display-none');
          $('.phone-user-menu').removeClass('down');
          $('.phone-user-menu').addClass('up');

       } else {
         
         $('.phone-header-list-wrapper, .woman-list-wrapper, .mens-list-wrapper, .woman-category').addClass('display-none');
         $('footer').removeClass('display-none');
         $(this).addClass('fa-bars');
         $(this).removeClass('fa-times');
    
       }
       
  });
  
  $('.mens-category').click(function() {
      
       $('.mens-list-wrapper').removeClass('display-none');
       $('.phone-header-list-wrapper').addClass('display-none');
  });
  
  $('.woman-category').click(function() {
      
       $('.woman-list-wrapper').removeClass('display-none');
       $('.phone-header-list-wrapper').addClass('display-none');
  });
  
  $('.fa-angle-left').click(function() {
      
       $('.woman-list-wrapper, .mens-list-wrapper').addClass('display-none');
       $('.phone-header-list-wrapper').removeClass('display-none');
  });
  
  $('.header-mens-category').click(function() {
    
    if($('.pc-mens-list-wrapper').hasClass('display-none')) {
     
      $('.pc-mens-list-wrapper, .pc-header-list-wrapper').removeClass('display-none');
      $('footer, .pc-woman-list-wrapper, .login-form-wrapper, .create-form-wrapper').addClass('display-none');
      $('.header-woman-category').removeClass('underline');
      $(this).addClass('underline');
      $('.pc-male').removeClass('close-male');
      
    } else {
     
      $('footer').removeClass('display-none');
      $('.pc-mens-list-wrapper, .pc-header-list-wrapper').addClass('display-none');
      $(this).removeClass('underline');
     
    }
    
     
  })
  
  $('.header-woman-category').click(function() {
    
     if($('.pc-woman-list-wrapper').hasClass('display-none')) {
     
      $('.pc-woman-list-wrapper, .pc-header-list-wrapper').removeClass('display-none');
      $('footer, .pc-mens-list-wrapper, .login-form-wrapper, .create-form-wrapper').addClass('display-none');
      $('.header-mens-category').removeClass('underline');
      $(this).addClass('underline');
      $('.pc-male').removeClass('close-male');
      
    } else {
     
      $('footer').removeClass('display-none');
      $('.pc-woman-list-wrapper, .pc-header-list-wrapper').addClass('display-none');
      $(this).removeClass('underline');
    }
  })
  
  $('.pc-header-list-close').click(function() {
      
      $('footer').removeClass('display-none');
      $('.pc-mens-list-wrapper, .pc-woman-list-wrapper, .pc-header-list-wrapper').addClass('display-none');
      $('.header-woman-category, .header-mens-category').removeClass('underline');
  })
  
  $('.login-male').click(function() {
      
    if($(this).hasClass('close-male')) {
        
      $('.login-form-wrapper, .create-form-wrapper').addClass('display-none'); 
      $('footer').removeClass('display-none');
      $(this).removeClass('close-male');
      $('.header-mens-category, .header-woman-category').removeClass('underline');
         
    } else {
        
      $('.login-form-wrapper').removeClass('display-none');
      $('footer, .mens-list-wrapper, .woman-list-wrapper, .pc-woman-list-wrapper, .pc-mens-list-wrapper, .pc-header-list-wrapper, .cart-wrapper').addClass('display-none');
      $('.header-list').addClass('fa-bars');
      $('.header-list').removeClass('fa-times');
      $(this).addClass('close-male');
      $('.pc-shopping-icon').removeClass('close-shopping');
      $('.header-mens-category, .header-woman-category').removeClass('underline');
      
    }
     
  })
  
  $('.pc-shopping-icon').click(function() {
      
      if($(this).hasClass('close-shopping')) {
        
      $('.cart-wrapper').addClass('display-none'); 
      $('footer').removeClass('display-none');
      $(this).removeClass('close-shopping');
      $('.header-mens-category, .header-woman-category').removeClass('underline');
         
    } else {
        
      $('.cart-wrapper').removeClass('display-none');
      $('footer, .mens-list-wrapper, .woman-list-wrapper, .pc-woman-list-wrapper, .pc-mens-list-wrapper, .pc-header-list-wrapper, .login-form-wrapper, .create-form-wrapper').addClass('display-none');
      $('.header-list').addClass('fa-bars');
      $('.header-list').removeClass('fa-times');
      $('.login-male').removeClass('close-male');
      $(this).addClass('close-shopping');
      $('.header-mens-category, .header-woman-category').removeClass('underline'); 
      
    }
      
  })
  
  $('.pc-login-form-left').click(function() {
      
      $('.login-form-wrapper, .create-form-wrapper, .phone-header-list-wrapper, .mens-category, .woman-categor, .mens-list-wrapper, .woman-list-wrapper, .pc-woman-list-wrapper, .pc-mens-list-wrapper, .cart-wrapper').addClass('display-none'); 
      $('footer').removeClass('display-none');
      $('.pc-male').removeClass('close-male');
      $('.pc-shopping-icon').removeClass('close-shopping');
      $('.header-mens-category, .header-woman-category').removeClass('underline');
         
  })
  
  $('.user-create-btn').click(function() {
      
      $('.login-form-wrapper').addClass('display-none');
      $('.create-form-wrapper').removeClass('display-none');
  })
  
  if($('.alert-login_error').length) {
    
     $('.login-form-wrapper').removeClass('display-none');
     $('footer').addClass('display-none');
     $(this).addClass('close-male');

  }
  
  if($('.alert-user_create_error').length) {

    $('.create-form-wrapper').removeClass('display-none');
  }
  
  $('.phone-user-menu').click(function() {
     
      if($(this).hasClass('down')) {
        
       $('.phone-user-info-list-wrapper').addClass('display-none');
       $('.phone-user-menu').removeClass('down');
       $('.phone-user-menu').addClass('up');
       
      } else {
         
       $('.phone-user-info-list-wrapper').removeClass('display-none');
       $('.phone-user-menu').removeClass('up');
       $('.phone-user-menu').addClass('down');
       
      }
    
   });
　
　/* 商品詳細ページの画像がうまく読み込まれない為リロード(携帯のみ) */
　
　/*if(document.URL.match(/items/)){ 
　 if (window.name != "any") {
     window.location.reload();
     window.name = "any";}
   else {
     window.name = "";
   }
　} */
　
　
  
  
});

