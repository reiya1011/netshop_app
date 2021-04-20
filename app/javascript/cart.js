/*global $ */
document.addEventListener("turbolinks:load", function() {
    

   $(function submit(item_id){
     $(`select_form_${item_id}`).submit();
   });
   
   $('.shopping-items-icon').click(function() {
     
      if($(this).hasClass('fa-plus')) {
        
       $('.phone-shopping-item-info').css('display', 'flex');
       $(this).addClass('fa-minus');
       $(this).removeClass('fa-plus');
       
      } else {
         
       $('.phone-shopping-item-info').css('display', 'none');
       $(this).addClass('fa-plus');
       $(this).removeClass('fa-minus');
       
      }
    
     
    
  });
})