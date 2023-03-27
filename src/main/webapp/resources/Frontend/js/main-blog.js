let obsever = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add("show");
        } else {
            entry.target.classList.remove("show");
        }
    });
});

let blog_item = document.querySelectorAll(".blog-item");
blog_item.forEach((el) => obsever.observe(el));
