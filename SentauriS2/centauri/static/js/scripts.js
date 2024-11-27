// scripts.js

document.addEventListener("DOMContentLoaded", function () {
    const filterToggle = document.getElementById("filter-toggle");
    const filterMenu = document.getElementById("filter-menu");

    filterToggle.addEventListener("click", function () {
        if (filterMenu.style.display === "none" || filterMenu.style.display === "") {
            filterMenu.style.display = "block";
        } else {
            filterMenu.style.display = "none";
        }
    });

    // Oculta el menú de filtros si haces clic fuera de él
    document.addEventListener("click", function (event) {
        if (!filterMenu.contains(event.target) && !filterToggle.contains(event.target)) {
            filterMenu.style.display = "none";
        }
    });
});