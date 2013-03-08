# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $("#new-attachment").fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png|pdf|ino)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        #data.context = $(tmpl("template-upload", file))
        #$('#attachments').append(data.context)
        $('.attachment-container').css('display', 'block')
        $('div.upload').css('display', 'block')
        data.context = $('div.upload')
        

        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')


$ ->
  $('input[id=new-attachment]').change (e) ->
    $('#fileCover').val($(this).val())




