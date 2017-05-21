// $(document).ready(function(){
//     $(this).scrollTop(0);
// });

$(document).ready(function(){
    $('#start_search').on('click', function(event){
      event.preventDefault();
      $('main').removeClass('hidden');
      document.querySelector('#search').scrollIntoView({
        behavior: 'smooth' });
    });
});

