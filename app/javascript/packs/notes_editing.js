const editBtn = document.querySelector("#notes-edit-btn")
const notesCard = document.querySelector(".customer-card-notes")
const notesEditing = () => {
  console.log(editBtn);
  editBtn.addEventListener("click", (event => {
    Rails.notesCard.innerHTML =
("<%= j ( render partial: '/shared/notes_edit_form' ) %>")
  }));
};

export { notesEditing };
