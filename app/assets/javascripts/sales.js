
$(document).ready(function() {

    var customers_suggested = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/customers_suggestion',
      remote: {
        url: window.location.origin + '/customers_suggestion?query=%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#sale_customer').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
    },
    {
      displayKey: 'name',
      source: customers_suggested,
      templates: {
        suggestion: function (customer) {
            return '<p>' + customer.name + '</p>';
        }
      }
    });


    $('#sale_customer').typeahead('val', $('#sale_customer_name').val() );

    $('#sale_customer').on('typeahead:select', function(object, datum){
        $('#sale_customer_id').val(datum.id);
    });

    $('#sale_customer').on('typeahead:change', function(event, data){
        $('#sale_customer_id').val(data);
        $(this).trigger('typeahead:_propia', data)
    });

    $('#sale_customer').on('blur', function() {
        data = $('#sale_customer').val();
        $(this).trigger('typeahead:_propia', data)
        url = '/validate_suggested_customer';
        $.ajax({
            url: url,
            data: { customer_name: data },
            success: function(res){
                if (res["0"].valid == false){
                    // customer no válida
                    $('#sale_customer').css('border-color', 'red');
                }else{
                    // customer correcta
                    $('#sale_customer_id').val(res["0"].id.toString());
                    $('#sale_customer').css('border-color', 'green');
                }
            }
        });
    });

    $('#sale_customer').on('typeahead:_propia', function(evt, datum){
    });
});