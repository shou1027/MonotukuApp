document.addEventListener("DOMContentLoaded", function() {
  let dropdown = document.getElementById("dropdown-menu");
  let dropdown_click = document.getElementById("dropdown-click");
  let dropdown_click_flag = false;

  if(dropdown){
    document.getElementById("dropdown-click").onclick = function() {
      dropdown_click_flag = true;
  
      if(dropdown.style.display == "none" || dropdown.style.display == ""){
        dropdown.style.display = "block";
        dropdown_click.style.backgroundColor = "#aaa";
      }
      else{
        dropdown.style.display = "none";
        dropdown_click.style.backgroundColor = "rgba(0,0,0,0)";
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