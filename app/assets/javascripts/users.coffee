document.addEventListener("DOMContentLoaded", () ->
  user_image_file = document.getElementById("user-image-file")
  user_image = document.getElementById("user-image")
  
  if user_image_file
    document.getElementById("user-image-select").onclick = () ->
      user_image_file.click()
  
    user_image_file.onchange = (e) ->
      files = e.target.files
      if files.length == 1
        user_image.src = window.URL.createObjectURL(files[0])
)