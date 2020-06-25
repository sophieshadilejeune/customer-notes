const customersContainerElement = document.querySelector("#customers-container-element")
const customersContainer = document.querySelector("#customers-container")
const folderTags = document.querySelectorAll("#folder-tag")
const customerCards = document.querySelectorAll("#customer-card")

const customersFilter = () => {

  if (customersContainerElement) {
  folderTags.forEach((folderTag) => {


  folderTag.addEventListener("click", (event) => {

      folderTags.forEach((folderTag) => {
        folderTag.classList.remove("folder-selected");
      });


    folderTag.classList.add("folder-selected");

    customersContainer.innerHTML = "";
    const folderName = folderTag.innerText
      if (folderName === "All Customers") {
            customerCards.forEach((customerCard) => {
      customersContainer.appendChild(customerCard)
    });
    };
    customerCards.forEach((customerCard) => {

      if (customerCard.dataset.folder === folderName) {
            customersContainer.appendChild(customerCard)
      }
    });
  });
  });
};
};
export { customersFilter }
