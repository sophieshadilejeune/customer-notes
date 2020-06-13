const customersContainer = document.querySelector("#customers-container")
const folderTags = document.querySelectorAll("#folder-tag")
const customerCards = document.querySelectorAll("#customer-card")

const customersFilter = () => {
  folderTags.forEach((folderTag) => {
  folderTag.addEventListener("click", (event) => {
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

export { customersFilter }
