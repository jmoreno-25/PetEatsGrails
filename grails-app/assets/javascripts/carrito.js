// carrito.js

let carrito = JSON.parse(sessionStorage.getItem("carrito")) || [];

function actualizarContador() {
  const contador = document.getElementById("contador-carrito");
  if (contador) {
    contador.textContent = carrito.length;
  }
}

function mostrarCarrito() {
  const contenedor = document.getElementById("carrito-contenedor");
  const subtotalElement = document.getElementById("subtotal");
  const ivaElement = document.getElementById("iva");
  const totalElement = document.getElementById("total");

  contenedor.innerHTML = "";

  if (carrito.length === 0) {
    contenedor.innerHTML = "<p>No hay productos en el carrito.</p>";
    subtotalElement.textContent = "$0.00";
    ivaElement.textContent = "$0.00";
    totalElement.textContent = "$0.00";
    return;
  }

  let subtotal = 0;

  carrito.forEach((producto, index) => {
    const totalProducto = producto.precio * producto.cantidad;
    subtotal += totalProducto;

    const item = document.createElement("div");
    item.classList.add("card", "p-3", "shadow-sm");

    item.innerHTML = `
      <div class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center gap-3">
          <img src="${producto.imagen}" alt="${producto.nombre}" style="width: 60px; height: 60px; object-fit: cover;" class="rounded shadow-sm" />
          <div>
            <h6 class="mb-1">${producto.nombre}</h6>
            <small>${producto.cantidad} x $${producto.precio.toFixed(2)}</small>
          </div>
        </div>
        <div>
          <strong>$${totalProducto.toFixed(2)}</strong>
          <button class="btn btn-sm btn-danger ms-2" onclick="eliminarDelCarrito(${index})">
            <i class="bi bi-trash"></i>
          </button>
        </div>
      </div>
    `;
    contenedor.appendChild(item);
  });

  const iva = subtotal * 0.15;
  const total = subtotal + iva;

  subtotalElement.textContent = `$${subtotal.toFixed(2)}`;
  ivaElement.textContent = `$${iva.toFixed(2)}`;
  totalElement.textContent = `$${total.toFixed(2)}`;
}

function eliminarDelCarrito(index) {
  carrito.splice(index, 1);
  sessionStorage.setItem("carrito", JSON.stringify(carrito));
  mostrarCarrito();
  actualizarContador();
}

function completarPedido() {
  sessionStorage.removeItem('carrito');
  carrito = [];
  window.location.href = "/carritoCli/confirmacion";
}

document.addEventListener("DOMContentLoaded", function () {
  const botonesAgregar = document.querySelectorAll(".añadir_carrito");

  botonesAgregar.forEach((boton) => {
    boton.addEventListener("click", () => {
      const id = boton.getAttribute("data-id");
      const nombre = boton.getAttribute("data-nombre");
      const precio = parseFloat(boton.getAttribute("data-precio"));
      const cantidad = parseInt(document.getElementById("cantidad_" + id).value);
      const imagen = boton.getAttribute("data-imagen") || ""; // opcional

      const productoExistente = carrito.find((p) => p.id === id);
      if (productoExistente) {
        productoExistente.cantidad += cantidad;
      } else {
        carrito.push({ id, nombre, precio, cantidad, imagen });
      }

      sessionStorage.setItem("carrito", JSON.stringify(carrito));
      actualizarContador();

      // Feedback visual
      boton.innerHTML = "✔ Agregado";
      boton.disabled = true;
      setTimeout(() => {
        boton.innerHTML = "Agregar al carrito";
        boton.disabled = false;
      }, 1500);
    });
  });

  actualizarContador(); // por si acaso hay elementos previos
});
document.addEventListener("DOMContentLoaded", function () {
  mostrarCarrito();
});
