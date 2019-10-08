/**
 * 
 */

var TiaCommon = {
	
	test: function() {		
	},
	
	post: function(url, data, success, done, fail){
		 $.ajax({
	            url: url,
	            dataType:'json',
	            type: 'POST',
	            data: data,
	            success: success,
	            done: done,
	            fail: fail
	        });		
	}
		
};

