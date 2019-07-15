  document.addEventListener("DOMContentLoaded", function(){
    document.getElementById('message_image').addEventListener('change', function(e) {
      var files = e.target.files;
      previewUserFiles(files);
    });
  }, false);

function previewUserFiles(files) {
  resetPreview();
  for (var i = 0; i < files.length; i++) {
     var file = files[i];
     if( file.type.indexOf("image") < 0 ) {
        continue;
     }
     var img = document.createElement("img");
     img.file = file;
     img.style.width = '100%';
     document.getElementById('preview_box').appendChild(img);
     var reader = new FileReader();
     reader.onload = (function(tImg) { return function(e) { tImg.src = e.target.result; }; })(img);
     reader.readAsDataURL(file);
  }
}
function resetPreview() {
  var element = document.getElementById("preview_box");
  while (element.firstChild) {
     element.removeChild(element.firstChild);
  }
}