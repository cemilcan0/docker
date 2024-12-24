// Kutunun rengini değiştiren fonksiyon
document.getElementById("changeColor").addEventListener("click", function () {
  const box = document.getElementById("box");
  const colors = ["lightblue", "lightgreen", "lightcoral", "lightpink", "lightgoldenrodyellow"];
  const randomColor = colors[Math.floor(Math.random() * colors.length)];
  box.style.backgroundColor = randomColor;
});

// Kutunun boyutunu değiştiren fonksiyon
document.getElementById("resizeBox").addEventListener("click", function () {
  const box = document.getElementById("box");
  const newSize = box.style.width === "100px" ? "150px" : "100px";
  box.style.width = newSize;
  box.style.height = newSize;
});
