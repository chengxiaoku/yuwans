//自定义JS

//文件上传管理中心
var FileUploadManager = {
	url: '',
	upload_url: '',
	assets_url: '',
	instance: '',
	init: function(args) {
		// args = {id:'', container:'',assetsUrl:'',upload_url:''}
		if (!plupload) {
			alert("缺少上传组件:plupload");
			return false;
		}

		var php_url = args.php_url || '',
			upload_url = args.upload_url || '',
			baseUrl = args.assetsUrl,
			button = args.button || '',
			container = args.container || button,
			assets_url = '';

		if (!button) {
			alert("缺少参数：button");
			return false;
		}

		if (!container) {
			alert("缺少参数：container");
			return false;
		}

		this.instance = new plupload.Uploader({
	        runtimes: 'html5,flash,silverlight,html4',
	        browse_button: button, // you can pass in id...
	        container: document.getElementById(container), // ... or DOM Element itself
	        url: upload_url,
	        filters: {
	            max_file_size: '10mb',
	            mime_types: [{
	                title: "Image files",
	                extensions: "jpg,gif,png"
	            }, {
	                title: "Zip files",
	                extensions: "zip"
	            }]
	        },
	        // Flash settings
	        flash_swf_url:  assets_url + '/plupload/js/Moxie.swf',
	        // Silverlight settings
	        silverlight_xap_url: assets_url + '/plupload/js/Moxie.xap',

	        init: {
	            PostInit: function() {
	                document.getElementById('filelist').innerHTML = '';
	                document.getElementById('uploadfiles').onclick = function() {
	                    Thumb_Uploader.start();
	                    return false;
	                };
	            },

	            FilesAdded: function(up, files) {
	                plupload.each(files, function(file) {
	                    document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
	                });
	            },

	            UploadProgress: function(up, file) {
	                document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
	            },

	            Error: function(up, err) {
	                document.getElementById('console').innerHTML += "\nError #" + err.code + ": " + err.message;
	            }
	        }
	    });

		this.instance.init();

	}

	
}