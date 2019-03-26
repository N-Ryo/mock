$(document).on 'turbolinks:load', ->
  $('#hack-tags').tagit
    fieldName:   'hack[tag_list]'
    singleField: true
  count = 0
  $("#tag-add-btn").click ->
    count += 1
    if count == 1
      if gon.hack_tags?
        for tag in gon.hack_tags
          $('#hack-tags').tagit 'createTag', tag
    if count % 2 == 1
      $("#tag-label").css(display: "none")
      $(this).html("ー")
    else
      $("#tag-label").css(display: "inline")
      $(this).html("＋")
$ ->
  $('.reaction-button').hover(
    ->
      $(this).parent().parent().parent().find(".evaluation-stars").css 'opacity', 0
      $(this).css "opacity", 1
    ->
      $(this).css 'opacity', 0
      $(this).parent().parent().parent().find(".evaluation-stars").css 'opacity', 1
  )

  