<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="header.jsp">
  <jsp:param value="메인화면" name="title"/>
</jsp:include>

  
  <div class="carousel-container">
    <div class="owl-carousel owl-theme">
      <div class="item">
        <a href="${contextPath}/product/detail.do?prdtNum=1"><div class="a-images"><img src="${contextPath}/resources/images/bottom/b1.jpeg"></div><div><p>바지1</p></div><div><p>50000원</p></div></a>
      </div>
      <div class="item">
        <a href="111"><div class="a-images"><img src="${contextPath}/resources/images/bottom/b2.jpeg"></div><div><p>바지2</p></div><div><p>55000원</p></div></a>
      </div>
      <div class="item">
        <a href="111"><div class="a-images"><img src="${contextPath}/resources/images/bottom/b3.jpeg"></div><div><p>바지3</p></div><div><p>55000원</p></div></a>
      </div>
      <div class="item">
        <a href="111"><div class="a-images"><img src="${contextPath}/resources/images/bottom/b4.jpeg"></div><div><p>바지4</p></div><div><p>60000원</p></div></a>
      </div>
      <div class="item">
        <a href="111"><div class="a-images"><img src="${contextPath}/resources/images/bottom/b5.jpeg"></div><div><p>바지5</p></div><div><p>70000원</p></div></a>
      </div>
      <div class="item">
        <a href="111"><div class="a-images"><img src="${contextPath}/resources/images/bottom/b6.jpeg"></div><div><p>바지6</p></div><div><p>75000원</p></div></a>
      </div>
    </div>
  </div>
  
  <div class="main_list">
  <c:forEach items="${productList}" var="product">
    <a href="${contextPath}/product/detail.do?prdtNum=${product.productDto.prdtNum}">
      <div class="main_item">
       <div class="main_item_image"><img src="${product.imagePath}/${product.filesystemName}"></div>
       <div>${product.productDto.prdtTitle}</div>
       <div><p>${product.productDto.prdtRealPrice}원</p></div>
     </div>
   </a>
  </c:forEach>
  </div>
  
  <script>
    $('.owl-carousel').owlCarousel({
      loop:true,
      margin:10,
      nav:true,
      dots: false,
      autoplay: true,
      autoplyTimeout: 1000,
      responsive:{
          0:{
              items:1   
          },
          600:{
              items:3
          },
          1000:{
              items:5
          }
        }
    })
  </script>
  
  

<%@ include file="footer.jsp"%>