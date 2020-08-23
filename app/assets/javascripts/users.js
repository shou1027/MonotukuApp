document.addEventListener("DOMContentLoaded", function() {
  let user_image_file = document.getElementById("user-image-file");
  let user_image = document.getElementById("user-image");
  
  if(user_image_file){
    document.getElementById("user-image-select").onclick = function(){
      user_image_file.click();
    }
  
    user_image_file.onchange = function(e){
      let files = e.target.files;
      if(files.length == 1){
        user_image.src = window.URL.createObjectURL(files[0]);
      }
    }
  }
});