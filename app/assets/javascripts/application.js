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
  let header_dropdown = document.getElementById("header-dropdown-menu");
  let header_dropdown_click = document.getElementById("header-dropdown-click");
  let header_dropdown_click_flag = false;
  
  let dropdown = document.getElementById("dropdown-menu");
  let dropdown_click = document.getElementById("dropdown-click");
  let dropdown_click_flag = false;

  if(header_dropdown){
    header_dropdown_click.onclick = function() {
      header_dropdown_click_flag = true;
  
      if(header_dropdown.style.display == "none" || header_dropdown.style.display == ""){
        header_dropdown.style.display = "block";
      }
      else{
        header_dropdown.style.display = "none";
      }
    };
  }
  
  if(dropdown){
    dropdown_click.onclick = function(){
      dropdown_click_flag = true
  
      if((dropdown.style.display == "none") || (dropdown.style.display == "")){
        dropdown.style.display = "block"
        dropdown_click.style.backgroundColor = "#aaa"
      }
      else{
        dropdown.style.display = "none"
        dropdown_click.style.backgroundColor = "rgba(0,0,0,0)"
      }
    }
  }
  
  document.onclick = function(){
    if(header_dropdown && (window.clientWidth <= 800)){
      if(!header_dropdown_click_flag){
        header_dropdown.style.display = "none";
        header_dropdown_click.style.backgroundColor = "rgba(0,0,0,0)";
      }
      else header_dropdown_click_flag = false;
    }
    
    if(dropdown && (window.clientWidth <= 860)){
      if(!dropdown_click_flag){
        dropdown.style.display = "none";
        dropdown_click.style.backgroundColor = "rgba(0,0,0,0)";
      }
      else dropdown_click_flag = false;
    }
  };
});
