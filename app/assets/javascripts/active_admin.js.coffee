#= require active_admin/base
#= require ckeditor/init
#= require jquery
#= require jquery_ujs
#= require jquery.fileupload

$ ->
  $("#new-attachment-admin").fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png|pdf)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        console.log(file)
        #data.context = $(tmpl("template-upload", file))
        #$('#attachments').append(data.context)
        $('.attachment-container').css('display', 'block')
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
        #    progress: (e, data) ->
        #      if data.context
        #        progress = parseInt(data.loaded / data.total * 100, 10)
        #        data.context.find('.bar').css('width', progress + '%')


$ ->
  $(".attachment-remove").click (e) ->
    $(this).closest('.thumbnail-container').remove()

$ -> 
  $("form.new_comment input[type=submit]").click (e) ->
    e.preventDefault()
    url = $("form.new_comment").attr("action")
    $.ajax({
          url: url
        , type: "POST"
        , data: $('form.new_comment').serialize()
        , dataType: 'json'
        , success: (res) ->
            value = $("#comment_content").val()
            $("#comment_content").val("")
            $("div.Comments").append("<p><strong>You -> </strong>" + value )

      })





