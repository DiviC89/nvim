const button = document.getElementById("btn-delete");
const input = document.getElementById("input-item");
const list = document.getElementById("list");

function listItemFactory() {
  let id = 0;
  return (name) => {
    const itemWrapper = document.createElement("div");
    const btnDelete = document.createElement("button");
    const itemName = document.createElement("span");
    itemWrapper.className = "item-wrapper";
    itemName.className = "item-name";
    itemName.innerHTML = name;
    btnDelete.className = "btn-delete";
    btnDelete.id = id;
    btnDelete.addEventListener("click", handleDelete);

    itemWrapper.appendChild(itemName);
    itemWrapper.appendChild(btnDelete);

    list.appendChild(itemWrapper);
    id++;
  };
}
const createNewListItem = listItemFactory();

function handleDelete(event) {
  const currentItem = document.getElementById(event.target.id).parentNode;
  currentItem.remove();
}

function handleInput(event) {
  createNewListItem(event.target.value);
  event.target.value = "";
}

input.addEventListener("change", handleInput);
