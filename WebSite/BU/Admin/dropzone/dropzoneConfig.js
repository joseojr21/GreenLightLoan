//File Upload response from the server
var minImageWidth = 800, minImageHeight = 800;
        Dropzone.options.dropzoneForm = {
            maxFiles: 50,  //The number of files allwed to upload at a time
            maxFileSize: 50, //MB
            parallelUploads: 1,
            autoQueue: true,
            uploadMultiple: false,
            clickable: ".fileinput-button",
            acceptedFiles: "image/jpeg,image/png,image/gif,.folder", //allowed file types
            url: "Code/hdl_FileUpload.ashx",  //my handler that takes care of the uploading
            init: function () {
                this.on("maxfilesexceeded", function (data) {
                    var res = eval('(' + data.xhr.responseText + ')');
                });
                this.on("removedfile", function (file) {
                    var name = file.name;
                    $.ajax({
                        type: 'POST',
                        url: 'Code/hdl_removeFile.ashx',
                        data: "id=" + name,
                        dataType: 'html'
                    });
                });
                this.on("processing", function (file) {
                    document.querySelector("#tempImage").style.display = 'none';
                });
                this.on("success", function (file, response) {
                    //Gather image information
                    var name = response.substring(0, response.indexOf('||'));
                    var dimensions = response.substring(response.lastIndexOf("||"));
                    var imgWidth = dimensions.substring(0, dimensions.indexOf(' |'));
                    imgWidth = imgWidth.replace("||", "");
                    var imgHeight = dimensions.substring(dimensions.lastIndexOf(" |"));
                    imgHeight = imgHeight.replace(" | ", "");

                    var isrejected = false;
                    if (imgWidth < minImageWidth || imgHeight < minImageHeight) {
                        isrejected = true;
                        file.rejectDimensions(isrejected);
                        file.previewElement.classList.add("dz-error");
                    }
                    else{
                        file.previewElement.classList.add("dz-success");
                    }

                    this.emit("thumbnail", file, "http://localhost/Uploads/" + response);

                });
                
            },
            accept: function (file, done) {
                file.rejectDimensions = function (isrejected) {
                    if (isrejected == true) {
                        done("Image is too small.");
                        var name = file.name;
                        $.ajax({
                            type: 'POST',
                            url: 'Code/hdl_removeFile.ashx',
                            data: "id=" + name,
                            dataType: 'html'
                        });
                    }
                    else { done(); }
                };

                done();
            }


        };