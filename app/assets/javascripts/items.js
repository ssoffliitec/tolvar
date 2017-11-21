
$(document).ready(function() {

    var marcas_suggested = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("name"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: window.location.origin + '/marcas_suggestion',
      remote: {
        url: window.location.origin + '/marcas_suggestion?query=%QUERY',
        wildcard: '%QUERY'
      }
    });

    $('#item_marca').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
    },
    {
      displayKey: 'name',
      source: marcas_suggested,
      templates: {
        suggestion: function (marca) {
            return '<p>' + marca.name + '</p>';
        }
      }
    });


    $('#item_marca').typeahead('val', $('#item_marca_name').val() );

    $('#item_marca').on('typeahead:select', function(object, datum){
        $('#item_marca_id').val(datum.id);
    });

    $('#item_marca').on('typeahead:change', function(event, data){
        $('#item_marca_id').val(data);
        $(this).trigger('typeahead:_propia', data)
    });

    $('#item_marca').on('blur', function() {
        data = $('#item_marca').val();
        $(this).trigger('typeahead:_propia', data)
        url = '/validate_suggested_marca';
        $.ajax({
            url: url,
            data: { marca_name: data },
            success: function(res){
                if (res["0"].valid == false){
                    // Marca no válida
                    $('#item_marca').css('border-color', 'red');
                }else{
                    // Marca correcta
                    $('#item_marca_id').val(res["0"].id.toString());
                    $('#item_marca').css('border-color', '#ccc');
                }
            }
        });
    });

    $('#item_marca').on('typeahead:_propia', function(evt, datum){
    });
});


  