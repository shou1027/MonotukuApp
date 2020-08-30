document.addEventListener("DOMContentLoaded", () ->
  post_image_file = document.getElementById("post-image-file")
  post_image = document.getElementById("post-image")
  
  if post_image_file
    document.getElementById("post-image-select").onclick = () ->
      post_image_file.click()
  
    post_image_file.onchange = (e) ->
      files = e.target.files
      if files.length == 1
        post_image.src = window.URL.createObjectURL(files[0])
)