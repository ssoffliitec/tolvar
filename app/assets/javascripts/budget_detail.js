$(document).ready(function(){

    $(document).on("shown.bs.modal", "#new-detail-modal", function() {


    	var items_suggested = new Bloodhound({
    	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("description"),
    	  queryTokenizer: Bloodhound.tokenizers.whitespace,
          prefetch: window.location.origin + '/items_suggestion',
    	  remote: {
            url: window.location.origin + '/items_suggestion?query=%QUERY',
        	wildcard: '%QUERY'
    	  }
    	});

    	$('#budget_details_item').typeahead({
    		  hint: true,
    		  highlight: true,
    		  minLength: 1
    	},
    	{
    	  displayKey: 'description',
    	  source: items_suggested,
          templates: {
            suggestion: function (item) {
                return '<p>' + item.code + '-' + item.description + '</p>';
            }
          }
    	});

        $('#budget_details_item').focus();

    	$('#budget_details_item').typeahead('val', $('#budget_details_item_description').val() );

    	$('#budget_details_item').on('typeahead:select', function(object, datum){
            $('#budget_details_item').val(datum.id);
            $('#budget_details_qty').focus();
            subtotal();
        });

        $('#budget_details_item').on('typeahead:change', function(event, data){
            $('#budget_details_item').val(data);
        });

        $('#budget_details_item').on('blur', function() {
        	data = $('#budget_details_item').val();
        	url = '/validate_suggested_item';
        	$.ajax({
        		url: url,
        		data: { item_description: data },
        		success: function(res){
        			if (res["0"].valid == false){
        				// Item no válido
        				$('#budget_details_item').css('border-color', 'red');
					 } else {
						// Item correcto
						$('#budget_details_item_id').val(res["0"].id.toString());
						$('#budget_details_price').val(res["0"].price.toString());
						$('#budget_details_item').css('border-color', 'green');
						subtotal();
					}
        		}
        	});
        });

        function subtotal() {
            $('#budget_details_subtotal').val($('#budget_details_qty').val() * $('#budget_details_price').val());
        };

        $('#budget_details_qty').blur(function(){
			subtotal();
        });

        $('#budget_details_price').blur(function(){
             subtotal();
        });

    });
});