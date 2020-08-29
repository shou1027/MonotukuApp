// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
// require turbolinks
//= require_tree .

document.addEventListener("DOMContentLoaded", function() {
  let dropdown = document.getElementById("header-dropdown-menu");
  let dropdown_click = document.getElementById("header-dropdown-click");
  let dropdown_click_flag = false;

  if(dropdown){
    dropdown_click.onclick = function() {
      dropdown_click_flag = true;
  
      if(dropdown.style.display == "none" || dropdown.style.display == ""){
        dropdown.style.display = "block";
      }
      else{
        dropdown.style.display = "none";
      }
    };
  
    if(document.body.clientWidth <= 860){
      document.onclick = function(){
        if(!dropdown_click_flag){
          dropdown.style.display = "none";
          dropdown_click.style.backgroundColor = "rgba(0,0,0,0)";
        }
        else dropdown_click_flag = false;
      };
    }
  }
});
