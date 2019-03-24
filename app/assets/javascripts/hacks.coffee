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
$ ->
  
  $("#comments").find('form button').hover(
    ->
      $(this).parent().parent().find(".evaluation-stars").css 'opacity', 0
      $(this).css "opacity", 1
    ->
      $(this).css 'opacity', 0
      $(this).parent().parent().find(".evaluation-stars").css 'opacity', 1
  )