jQuery(document).on("turbolinks:load", function() {
  $(".cooks_index_table_tr").on('click', function() {
      window.location = $(this).data("href");
  });
});
