$("body").on 'change', "#sign_up_pages", ->
  window.location = $(this).find(":selected").data("edit-url")
