# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$ ->
  $("#new-source-code").fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(c|ino)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        #data.context = $(tmpl("template-upload", file))
        #$('#attachments').append(data.context)
        $('div.source-upload').css('display', 'block')
        data.context = $('div.source-upload')
        data.submit()
      else
        alert("#{file.name} is not an arduino source-code (ino) file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')

$ ->
  $('input[id=new-source-code]').change (e) ->
    $('#sourceCover').val($(this).val())

$ -> 
  $('#source_code table').addClass 'table'
  $('#source_code table').addClass 'table-condensed'



