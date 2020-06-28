import Rails from "@rails/ujs";

const notesDragDrop = () => {

  $("#notes-list").sortable({
    revert : 300,
    update: function(e, ui) {
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize'),
      });
  }
});
};

export { notesDragDrop };
