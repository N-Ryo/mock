$(document).on 'turbolinks:load', ->
  $('#hack-tags').tagit
    fieldName:   'hack[tag_list]'
    singleField: true
  count = 0
  $("#tag-add-btn").click ->
    count += 1
    if count == 1
      tag = $(".tag_lists").text()
      $("#hack-tags").tagit("createTag", tag)
    if count % 2 == 1
      $("#tag_lists").css(display: "none")
      $(this).html("ー")
    else
      $("#tag_lists").css(display: "inline")
      $(this).html("＋")