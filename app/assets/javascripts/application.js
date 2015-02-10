// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$("#bill_bill_type").live("click", function(event){
 
 if($(this).attr("checked") == "checked"){
 	$(".amount_field").show();
 }
 else{
 	$(".amount_field").hide();
}


});



$("#status_his").live("change", function(event){
	$.get('/bills/filter_bills.js?filter_type='+$(this).val(),function(data){
	});
	// if($(this).attr("ALL") == "ALL"){
	// 	return 3;
	// }
	// else if($(this).attr("PENDING") == "PENDING"){
	// 	return 0;
	// }
	// else if($(this).attr("ACCEPTED") == "ACCEPTED"){
	// 	return 1;
	// } 
	// else if($(this).attr("DECLINED") == "DECLINED"){
	// 	return 2;
	// }
});
