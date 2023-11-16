<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="${query}검색화면" name="title"/>
</jsp:include>

  <!-- 나중에 바꾸기 -->
    <div style="text-align: center;"><h1>"${query}"에 대한 검색 결과</h1></div>
    <c:if test="${empty productList}">
      <div><h1>${query}에 대한 검색 결과는 없습니다.</h1></div>
      <div style="text-align: center;"><h3>이런 제품은 어떠신가요?</h3></div>
      <div class="carousel-container">
        <div class="owl-carousel owl-theme">
          <c:forEach items="${productTop10List}" var="top10" begin="0" varStatus="i">
            <div class="item">
              <a href="${contextPath}/product/detail.do?prdtNum=${top10.productDto.prdtNum}"><div class="a-images"><img src="${contextPath}${top10.imagePath}/${top10.filesystemName}"></div><div><p>TOP${i.index + 1} ${top10.productDto.prdtTitle}</p></div><div><p>${top10.productDto.prdtRealPrice}원</p></div></a>
            </div>
          </c:forEach>
        </div>
      </div>
    </c:if>
    <c:if test="${not empty productList}">
      <div style="width: 1500px;">
        <select name="orderBy" id="orderBy">
          <option value="new">최신순</option>
          <option value="hit">조회순</option>
          <option value="zzim">찜한순</option>
          <option value="topPrice">높은가격순</option>
          <option value="lowPrice">낮은가격순</option>
        </select>    
      </div>
    </c:if>
  
  <div class="main_list">
  <c:forEach items="${productList}" var="product">
    <div class="main_item">
      <a href="${contextPath}/product/detail.do?prdtNum=${product.productDto.prdtNum}">
       <c:if test="${product.productDto.prdtStock eq 0}">
            <div class="main_item_image background_image" style="background-image: url(${contextPath}${product.imagePath}/${product.filesystemName});">
              <img src="${contextPath}/resources/images/soldout.png" class="soldout">
            </div>
          </c:if>
          <c:if test="${product.productDto.prdtStock ne 0}">
            <div class="main_item_image">
              <img src="${contextPath}${product.imagePath}/${product.filesystemName}">
            </div>
          </c:if>
       <div>${product.productDto.prdtTitle}</div>
       <div><p>${product.productDto.prdtRealPrice}원</p></div>
     </a>
   </div>
  </c:forEach>
  </div>
  
  <script>
    $("select[name=orderBy]").change(function(){
      location.href='${contextPath}/main/search.do?column=${column}&query=${query}&orderBy=' + $(this).val();
    });
    
    const urlParams = new URL(location.href).searchParams;
    const orderBy = urlParams.get('orderBy');
    if(orderBy !== null) {
      const orderBySelect = document.getElementById('orderBy');
      orderBySelect.value = orderBy;
    }
  </script>
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
  
  

<%@ include file="../layout/footer.jsp"%>