jQuery(document).on("turbolinks:load", function() {
  $(".cooks_index_tbody_tr").on('click', function() {
      window.location = $(this).data("href");
  });
});