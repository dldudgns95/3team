<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="header.jsp">
  <jsp:param value="메인화면" name="title"/>
</jsp:include>

  <div class="owl-carousel owl-theme">
    <div class="item">
      <a href="111">
        <div>
          <img src="${contextPath}/resources/images/outer1.jpg">
        </div>
        <div>
          <p>11111111111</p>
        </div>
      </a>
    </div>
    <div class="item"><a href="222"><img src="${contextPath}/resources/images/outer2.jpg"></a></div>
    <div class="item"><a href="333"><img src="${contextPath}/resources/images/outer3.jpg"></a></div>
    <div class="item"><a href="444"><img src="${contextPath}/resources/images/outer4.jpg"></a></div>
    <div class="item"><a href="555"><img src="${contextPath}/resources/images/outer5.jpg"></a></div>
    <div class="item"><a href="666"><img src="${contextPath}/resources/images/outer6.jpg"></a></div>

  </div>



  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  <h1>메인화면</h1>
  
  <script>
    $('.owl-carousel').owlCarousel({
      loop:true,
      margin:10,
      nav:true,
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