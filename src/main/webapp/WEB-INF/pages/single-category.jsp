<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="language" value="${sessionScope.language != null ? sessionScope.language : 'ru'}"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="text"/>
<c:set var="disabled" value="${sessionScope.user.isAuth ? false : true}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Блюда</title>
    <link href="<c:url value="/resource/css/single-category.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resource/css/footer.css"/>" rel="stylesheet" type="text/css"/>
</head>
<body>
<header>
    <div class="container">
        <div class="navigation-bar">
            <div class="brand">
                <h1><a href="/">Baloven</a></h1>
            </div>
            <nav class="navigation">
                <ul class="navigation-list">
                    <li class="navigation-list-item"><a href="/"><fmt:message key="nav.main"/></a></li>
                    <li class="navigation-list-item"><a href="/#menu"><fmt:message key="nav.menu"/></a></li>
                    <li class="navigation-list-item"><a href="/basket"><fmt:message key="nav.basket"/></a></li>
                    <li class="navigation-list-item"><a id="tel" href="tel:+375331112233">+375(33)111-22-33</a></li>
                    <c:if test="${sessionScope.user.isAuth}">
                        <li class="navigation-list-item">
                            <form method="POST" action="/logout">
                                <input type="submit" class="loginbtn" value="<fmt:message key="nav.logout"/>"/>
                            </form>

                        </li>
                    </c:if>
                    <c:if test="${!sessionScope.user.isAuth}">
                        <li class="navigation-list-item">
                            <a href="login" class="loginbtn"><fmt:message key="nav.login"/></a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</header>
<section class="single-category">
    <div class="container">
        <h2 class="single-category-title"><fmt:message key="single.dihes"/></h2>
        <div class="dishes">
            <div class='dish-item-wrapper'>
                <c:forEach var="dish" items="${dishes}">
                    <div class='dish-item'>
                        <div>
                            <div class='dish-item-img'>
                                <img src="${dish.img}" alt="${dish.name}">
                                <span class='dish-item-price'>${dish.price} <fmt:message key="single.currency"/></span>
                            </div>
                            <div class='dish-item-info'>
                                <h3 class='dish-item-title'>${dish.name}</h3>
                                <p class='dish-item-description'>
                                        ${dish.description}
                                </p>
                            </div>
                        </div>

                        <form method='post' action="/single-category/${dish.id}/${category_id}/add-to-basket">
                            <c:if test="${disabled == true}">
                                <button type="submit" class='tobasket' disabled><fmt:message key="single.addToBasket"/></button>
                            </c:if>
                            <c:if test="${disabled == false}">
                                <button type="submit" class='tobasket' ><fmt:message key="single.addToBasket"/></button>
                            </c:if>

                        </form>
                    </div>

                </c:forEach>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <h3 class="footer-title"><fmt:message key="location.our"/></h3>
        <div class="map">
            <a class="map-link" href="https://goo.gl/maps/JMnpTyQd8CUJm8pz7" target="_blank">
                <div class="map-item">
                    <iframe width="100%"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2350.1197435668223!2d27.59273715106426!3d53.911848039805776!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46dbcfaefc7ace77%3A0x108d2d965ec4df2f!2z0YPQuy4g0JPQuNC60LDQu9C-IDksINCc0LjQvdGB0Lo!5e0!3m2!1sru!2sby!4v1677136102096!5m2!1sru!2sby"
                            style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                    <span class="map-title">map</span>
                </div>
            </a>
        </div>
        <div class="copyright">
            All rights are reserved &#169;
        </div>
    </div>
</footer>
</body>
</html>
