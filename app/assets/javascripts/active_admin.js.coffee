#= require active_admin/base
#= require jquery-ui/widgets/autocomplete

$ ->
  $('.autocomplete').each (index, input) ->
    $input = $(input)
    $hiddenInput = $($(input).data('hidden-input'))

    $input
      .autocomplete
        minLength: 3
        delay: 600
        source: (request, response) ->
          $.ajax
            url: $input.data('url')
            dataType: 'json'
            data: 
              term: request.term
            success: (data) -> response(data)
        select: (event, ui) ->
          $input.val(ui.item.name)
          $hiddenInput.val(ui.item.id)
          false
      .data('ui-autocomplete')._renderItem = (ul, item) ->
        $('<li></li>')
         .data('item.autocomplete', item)
         .append('<a>' + item.name + '</a>')
         .appendTo(ul)