<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>

    <style>

    </style>

</head>
<body>

<jsp:include page="header.jsp" />

<!-- ANIMATED STRIP -->
<div class="tech-slideshow">
    <div class="mover-1">
        <img src="images/fea-1.webp">
        <img src="images/fea-2.webp">
        <img src="images/fea-3.webp">
        <img src="images/fea-4.webp">
        <img src="images/fea5.webp">

        <img src="images/fea-1.webp">
        <img src="images/fea-2.webp">
        <img src="images/fea-3.webp">
        <img src="images/fea-4.webp">
        <img src="images/fea5.webp">

        <img src="images/fea-1.webp">
        <img src="images/fea-2.webp">
        <img src="images/fea-3.webp">
        <img src="images/fea-4.webp">
        <img src="images/fea5.webp">

        <img src="images/fea-1.webp">
        <img src="images/fea-2.webp">
        <img src="images/fea-3.webp">
        <img src="images/fea-4.webp">
        <img src="images/fea5.webp">
    </div>
</div>


<!-- Carousel Slider -->

<div class="carausal">
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="3000">
                <img src="images/bnn1.webp" class="d-block w-100 " alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="3000">
                <img src="images/bnn2.webp" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item " data-bs-interval="3000">
                <img src="images/bnn3.webp" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item " data-bs-interval="3000">
                <img src="images/bnn4.webp" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item " data-bs-interval="3000">
                <img src="images/bnn5.webp" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item " data-bs-interval="3000">
                <img src="images/bnn6.webp" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<!--features-->
<section id="features" class="section-p1">
    <div class="fe-box">
        <img src="images/f1.png" alt="img">
        <h6>free shipping</h6>
    </div>
    <div class="fe-box">
        <img src="images/f2.png" alt="img">
        <h6>Online order</h6>
    </div>
    <div class="fe-box">
        <img src="images/f3.png" alt="img">
        <h6>Save money</h6>
    </div>
    <div class="fe-box">
        <img src="images/f4.png" alt="img">
        <h6>24/7 support</h6>
    </div>
    <div class="fe-box">
        <img src="images/f5.png" alt="img">
        <h6>24/7 support</h6>
    </div>
    <div class="fe-box">
        <img src="images/f6.png" alt="img">
        <h6>24/7 support</h6>
    </div>
</section>

<hr class="d-flex" style="height: 4px;">
<h5 class="fs-2 fw-bold mt-5 mb-5 " style="text-align: center;">OUR PRODUCTS</h5>
<hr class="d-flex" style="height: 4px;">


<!-- watch slider -->

<div class="swipper_slider">
    <p class="h2 text-center fw-bold">TOP SELLING SMARTWATCHES</p>
    <p class="fw-light mb-5 text-center">Most demanding and best selling computers and laptops</p>
    <div class="splide mt-5" role="group" aria-label="Splide Basic HTML Example">
        <div class="splide__track">
            <ul class="splide__list ">
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/product2-1.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/product2-2.jpg">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/product2-3.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/product2-4.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/product2-5.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/product2-6.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- tv slider  -->
<div class="swipper_slider">
    <p class="h2 text-center fw-bold">TOP SELLING TELEVISIONS</p>
    <p class="fw-light mb-5 text-center">Most demanding and best selling Televisions</p>
    <div class="splide first mt-5" role="group" aria-label="Splide Basic HTML Example">
        <div class="splide__track">
            <ul class="splide__list ">
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/tv-1.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/tv-2.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/tv-3.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/tv-4.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
                <li class="splide__slide">
                    <div class="card card-body">
                        <img class="img-fluid" src="images/tv-5.webp">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the
                            bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">ADD TO CART</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- second carousel  -->
<section id="image-carousel" class="splide" aria-label="Beautiful Images" data-splide='{"type":"loop","perPage":1}'>
    <div class="splide__track">
        <ul class="splide__list">
            <li class="splide__slide" data-splide-interval="5000">
                <img src="images/bnn2-1.jpg" alt="">
            </li>
            <li class="splide__slide" data-splide-interval="5000">
                <img src="images/bnn2-2.jpg" alt="">
            </li>
            <li class="splide__slide" data-splide-interval="5000">
                <img src="images/bnn2-3.avif" alt="">
            </li>
            <li class="splide__slide" data-splide-interval="5000">
                <img src="images/bnn2-4.jpg" alt="">
            </li>
        </ul>
    </div>
</section>

<hr>
<div class="banners">
    <h3 style="text-align: center;">Great deals on electronics</h3>
    <div class="row banner m-5">
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal1.jpg" class="img-fluid" alt=""></a></div>
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal2.jpg" class="img-fluid" alt=""></a></div>
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal3.jpg" class="img-fluid" alt=""></a></div>
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal4.jpg" class="img-fluid" alt=""></a></div>
    </div>
    <div class="row banner m-5">
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal5.jpg" class="img-fluid" alt=""></a></div>
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal6.jpg" class="img-fluid" alt=""></a></div>
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal7.jpg" class="img-fluid" alt=""></a></div>
        <div class="col-md-3 col-sm-6"><a href="#"><img src="images/deal8.jpg" class="img-fluid" alt=""></a></div>
    </div>
</div>
<!-- video -->
<section id="mp4">
    <video height="auto" width="auto" loop autoplay muted>
        <source src="images/video2.mp4" type="video/mp4">
    </video>
</section>

<div class="container-md mt-5">
    <img src="images/buttom_banner.jpg" alt="banner" class="img-fluid ">
</div>

<h4 class="glow mt-5">THANKS FOR VISITING</h4>


<jsp:include page="footer.html" />

</body>
</html>
