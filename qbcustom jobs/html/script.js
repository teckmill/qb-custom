window.addEventListener("message", function(event) {
    if (event.data.action === "openMenu") {
        const menu = event.data.menu;
        const menuList = document.getElementById("menu-list");
        menuList.innerHTML = "";

        menu.forEach((item) => {
            const listItem = document.createElement("li");
            const link = document.createElement("a");
            link.href = "#";
            link.textContent = item.label;
            link.addEventListener("click", () => {
                item.action();
            });
            listItem.appendChild(link);
            menuList.appendChild(listItem);
        });
    }
});