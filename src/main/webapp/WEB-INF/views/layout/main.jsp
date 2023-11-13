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
      <c:forEach items="${productTop10List}" var="top10" begin="0" varStatus="i">
        <div class="item">
          <a href="${contextPath}/product/detail.do?prdtNum=${top10.productDto.prdtNum}"><div class="a-images"><img src="${top10.imagePath}/${top10.filesystemName}"></div><div><p>TOP${i.index + 1} ${top10.productDto.prdtTitle}</p></div><div><p>${top10.productDto.prdtRealPrice}원</p></div></a>
        </div>
      </c:forEach>
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
      autoplyTimeout: 10000,
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