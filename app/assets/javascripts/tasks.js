// window.onload = function(){
document.addEventListener('turbolinks:load' ,function(){
  document.querySelectorAll('.delete').forEach(function(a){
    a.addEventListener('ajax:success', function(){
      var td = a.parentNode;
      var tr = td.parentNode;
      tr.style.display = 'none';
      // e.currentTarget.style.backgroundColor = '#eff';
    });

    // td.addEventListener('mouseout',function(e){
    //   e.currentTarget.style.backgroundColor = '';
    // });
  });
});