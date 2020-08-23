document.addEventListener("DOMContentLoaded", function() {
  let post_image_file = document.getElementById("post-image-file");
  let post_image = document.getElementById("post-image");
  
  if(post_image_file){
    document.getElementById("post-image-select").onclick = function(){
      post_image_file.click();
    }
  
    post_image_file.onchange = function(e){
      let files = e.target.files;
      if(files.length == 1){
        post_image.src = window.URL.createObjectURL(files[0]);
      }
    }
  }
});