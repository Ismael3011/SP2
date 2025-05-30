<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sapestore</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" rel="stylesheet">
  <link href="styleindex.css?v=<?php echo time(); ?>" rel="stylesheet">
  <style>

    @media (max-width: 768px) {
      html, body {
        overflow-x: hidden;
      }

      .popular-products-row, .streetwear-products-row {
        display: grid; 
        grid-template-columns: repeat(2, 1fr); 
        gap: 15px; 
      }

      .popular-product-card, .streetwear-product-card {
        width: 100%; 
      }
    }
  </style>
</head>
<body>
  <?php include 'partes/navbar.php'; ?>

  <a id="dynamicBackgroundLink" href="categoria_marca.php?id=5">
    <div class="fondo" id="dynamicBackground"></div>
  </a>

  <script>
    const images = [
      { url: 'fotos/fondo1.png', link: 'categoria_marca.php?id=5' }, // Bad Bunny
      { url: 'fotos/fondo7.png', link: 'marca.php?id=1' }, // Nike
    ];
    let currentIndex = 0;
    // Que roten las imahenes principales, cada una con su path
    function changeBackground() {
      const backgroundElement = document.getElementById('dynamicBackground');
      const backgroundLink = document.getElementById('dynamicBackgroundLink');
      const nextIndex = (currentIndex + 1) % images.length;

      backgroundElement.style.backgroundImage = `url('${images[nextIndex].url}')`;
      backgroundLink.setAttribute('href', images[nextIndex].link); 
      backgroundElement.classList.add('fade-in'); 

      setTimeout(() => {
        backgroundElement.classList.remove('fade-in');
        currentIndex = nextIndex; 
      }, 1000); 
    }

    setInterval(changeBackground, 5000); 
  </script>

  <div class="container py-5">
    <div id="brandCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
      <div class="carousel-inner">
        <?php
        include_once 'config.php';

        $sql = "SELECT ID, nombre, logo_url FROM marca";
        $result = $conn->query($sql);
        // Carrousel de marcas
        if ($result->num_rows > 0):
          $brands = $result->fetch_all(MYSQLI_ASSOC);
          $chunks = array_chunk($brands, 4);
          foreach ($chunks as $index => $chunk): ?>
            <div class="carousel-item <?php echo $index === 0 ? 'active' : ''; ?>">
              <div class="row">
                <?php foreach ($chunk as $brand): ?>
                  <div class="col-6 col-md-3 mb-4">
                    <a href="marca.php?id=<?php echo $brand['ID']; ?>" class="brand-card d-block text-center p-3">
                      <img src="<?php echo $brand['logo_url']; ?>" alt="<?php echo $brand['nombre']; ?>" class="brand-logo">
                      <span class="d-block font-weight-bold"><?php echo $brand['nombre']; ?></span>
                    </a>
                  </div>
                <?php endforeach; ?>
              </div>
            </div>
          <?php endforeach;
        else: ?>
          <p class="text-center">No hay marcas disponibles.</p>
        <?php endif;

        $conn->close();
        ?>
      </div>
    </div>
  </div>
  <div class="container py-5">
    <h2 class="section-title text-center mb-4 text-uppercase font-weight-bold">
      <span class="section-title-underline">Productos Populares</span>
    </h2>
    <div class="popular-products-wrapper">
      <button class="scroll-button left" onclick="scrollProducts('.popular-products-container', -1)">&#8249;</button>
      <div class="popular-products-container">
        <div class="popular-products-row">
          <?php
          $popularFile = 'admin/popular_products.json'; 
          $popularProducts = [];

          if (file_exists($popularFile)) {
              $popularProducts = json_decode(file_get_contents($popularFile), true) ?? [];
          }
          // Ver los productos de entrega rapida
          $fastDeliveryFile = 'admin/fast_delivery_products.json'; 
          $fastDeliveryProducts = [];

          if (file_exists($fastDeliveryFile)) {
              $fastDeliveryProducts = json_decode(file_get_contents($fastDeliveryFile), true) ?? [];
          }

          if (!empty($popularProducts)) {
              $conn = new mysqli("db", "root", "rootpassword", "sapestore");
              if ($conn->connect_error) {
                  die("Conexión fallida: " . $conn->connect_error);
              }

              $ids = implode(',', $popularProducts);
              $sql = "SELECT p.ID, p.nombre AS producto_nombre, p.imagen_url, m.nombre AS marca_nombre, 
                             (SELECT MIN(t.precio) FROM talla t 
                              INNER JOIN producto_talla pt ON t.ID = pt.talla_id 
                              WHERE pt.producto_id = p.ID) AS precio_minimo
                      FROM producto p
                      LEFT JOIN marca m ON p.marca_id = m.ID
                      WHERE p.ID IN ($ids)";
              $result = $conn->query($sql);
              // Ver si hay productos populares
              if ($result->num_rows > 0):
                while ($producto = $result->fetch_assoc()): ?>
                  <div class="popular-product-card">
                    <a href="producto.php?id=<?php echo $producto['ID']; ?>" class="product-card-link">
                      <div class="product-card">
                        <?php if (in_array($producto['ID'], $popularProducts)): ?>
                          <img src="fotos/fuego.gif" alt="Popular" class="popular-icon">
                        <?php endif; ?>
                        <?php if (in_array($producto['ID'], $fastDeliveryProducts)): ?>
                          <img src="fotos/cohete.webp" alt="Entrega Rápida" class="fast-delivery-icon">
                        <?php endif; ?>
                        <div class="card-img-container">
                          <img src="<?php echo $producto['imagen_url']; ?>" class="card-img-top" alt="<?php echo $producto['producto_nombre']; ?>">
                        </div>
                        <div class="card-body">
                          <p class="marca-nombre"><?php echo $producto['marca_nombre'] ?: 'Sin marca'; ?></p>
                          <h5 class="card-title"><?php echo $producto['producto_nombre']; ?></h5>
                          <p class="precio-minimo">Desde: <?php echo $producto['precio_minimo'] ? '€' . number_format($producto['precio_minimo'], 2) : 'No disponible'; ?></p>
                        </div>
                      </div>
                    </a>
                  </div>
                <?php endwhile;
              else: ?>
                <p class="text-center">No hay productos populares disponibles.</p>
              <?php endif;

              $conn->close();
          } else {
              echo '<p class="text-center">No hay productos populares disponibles.</p>';
          }
          ?>
        </div>
      </div>
      <button class="scroll-button right" onclick="scrollProducts('.popular-products-container', 1)">&#8250;</button>
    </div>
  </div>

  <div class="container py-5">
    <h2 class="section-title text-center mb-4 text-uppercase font-weight-bold">
      <span class="section-title-underline">StreetWear</span>
    </h2>
    <div class="streetwear-products-wrapper">
      <button class="scroll-button left" onclick="scrollProducts('.streetwear-products-container', -1)">&#8249;</button>
      <div class="streetwear-products-container">
        <div class="streetwear-products-row">
          <?php
          $popularFile = 'admin/popular_products.json';
          $popularProducts = [];

          if (file_exists($popularFile)) {
              $popularProducts = json_decode(file_get_contents($popularFile), true) ?? [];
          }

          $fastDeliveryFile = 'admin/fast_delivery_products.json'; 
          $fastDeliveryProducts = [];

          if (file_exists($fastDeliveryFile)) {
              $fastDeliveryProducts = json_decode(file_get_contents($fastDeliveryFile), true) ?? [];
          }

          $conn = new mysqli("db", "root", "rootpassword", "sapestore");
          if ($conn->connect_error) {
              die("Conexión fallida: " . $conn->connect_error);
          }

          $sql = "SELECT p.ID, p.nombre AS producto_nombre, p.imagen_url, m.nombre AS marca_nombre, 
                         (SELECT MIN(t.precio) FROM talla t 
                          INNER JOIN producto_talla pt ON t.ID = pt.talla_id 
                          WHERE pt.producto_id = p.ID) AS precio_minimo
                  FROM producto p
                  LEFT JOIN marca m ON p.marca_id = m.ID
                  LEFT JOIN categoria c ON p.categoria_id = c.ID
                  WHERE c.nombre IS NOT NULL AND c.nombre != 'Zapatillas'";
          $result = $conn->query($sql);

          if ($result === false) {
              echo '<p class="text-center text-danger">Error en la consulta: ' . $conn->error . '</p>';
          } elseif ($result->num_rows > 0) {
            while ($producto = $result->fetch_assoc()): ?>
              <div class="streetwear-product-card">
                <a href="producto.php?id=<?php echo $producto['ID']; ?>" class="product-card-link">
                  <div class="product-card">
                    <?php if (in_array($producto['ID'], $popularProducts)): ?>
                      <img src="fotos/fuego.gif" alt="Popular" class="popular-icon">
                    <?php endif; ?>
                    <?php if (in_array($producto['ID'], $fastDeliveryProducts)): ?>
                      <img src="fotos/cohete.webp" alt="Entrega Rápida" class="fast-delivery-icon">
                    <?php endif; ?>
                    <div class="card-img-container">
                      <img src="<?php echo $producto['imagen_url']; ?>" class="card-img-top" alt="<?php echo $producto['producto_nombre']; ?>">
                    </div>
                    <div class="card-body">
                      <p class="marca-nombre"><?php echo $producto['marca_nombre'] ?: 'Sin marca'; ?></p>
                      <h5 class="card-title"><?php echo $producto['producto_nombre']; ?></h5>
                      <p class="precio-minimo">Desde: <?php echo $producto['precio_minimo'] ? '€' . number_format($producto['precio_minimo'], 2) : 'No disponible'; ?></p>
                    </div>
                  </div>
                </a>
              </div>
            <?php endwhile; ?>
          <?php } else { ?>
            <p class="text-center">No hay artículos de StreetWear disponibles.</p>
          <?php } ?>
        </div>
      </div>
      <button class="scroll-button right" onclick="scrollProducts('.streetwear-products-container', 1)">&#8250;</button>
    </div>
  </div>

  <?php include 'partes/footer.php'; ?>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    function scrollProducts(containerSelector, direction) {
      const container = document.querySelector(containerSelector);
      const scrollAmount = 320;
      container.scrollBy({
        left: direction * scrollAmount,
        behavior: 'smooth'
      });
    }
  </script>
</body>
</html>