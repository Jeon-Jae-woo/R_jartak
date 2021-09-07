	var singleWidget = uploadcare.SingleWidget('[role=uploadcare-uploader]')
		
	singleWidget.onUploadComplete(function(info){
	    var oEditorData = CKEDITOR.instances.ckeditor.getData();
	    var imgUrl = '<br><img src="'+info.cdnUrl+'">';
	    CKEDITOR.instances.ckeditor.setData(oEditorData + imgUrl);	    

	});



	function getImage(imagename){
		var newimg = imagename.replace(/^.*\\/,"");
		$('#display-img').html(newimg);

		const [file] = imageupload.files;
		if(file){
			imgPreview.src = URL.createObjectURL(file);
		}

	}


	$("input:text[numberOnly]").on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});



	window.onload = function(){
		console.log(content+"1");	
	}