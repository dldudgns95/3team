<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>
  <c:if test="${empty param.title}">메인화면</c:if>
  <c:if test="${not empty param.title}">${param.title}</c:if>
</title>
<!-- 부트스트랩 사용하기 위한 cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- font-awesome을 위한 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 캐러셀을 사용하기 위한 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- jquery를 사용하기 위한 cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- ckeditor를 사용하기 위한 cdn -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/decoupled-document/ckeditor.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- Momment를 사용하기 위한 cdn -->
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/moment.min.js"></script>

<link rel="stylesheet" href="${contextPath}/resources/css/cart.css?dt=${dt}" />
<link rel="stylesheet" href="${contextPath}/resources/css/header.css?dt=${dt}" />
<link rel="stylesheet" href="${contextPath}/resources/css/main.css?dt=${dt}" />


</head>
<body>

  <div class="header_top">
    <div class="user_state">
      <ul>
        <!-- 관리자 페이지는 로그인 시에 표시되게(지금은 임시로 표시) -->
        <a href="${contextPath}/support/list.do"><li>고객센터</li></a>
        <c:if test="${sessionScope.member == null}">
          <a href="${contextPath}/member/agree.form"><li>회원가입</li></a>
          <a href="${contextPath}/member/login.form"><li>로그인</li></a>
        </c:if>
        <c:if test="${sessionScope.member != null}">
          <c:if test="${sessionScope.member.auth == 9}">
            <a href="${contextPath}/admin/admin.do"><li>관리자 페이지</li></a>
          </c:if>
          <a href="${contextPath}/member/logout.do"><li>로그아웃</li></a>
          <li>${sessionScope.member.name}님 환영합니다!</li>
        </c:if>
        
      </ul>
    </div>
    <div class="search">
      <div class="margin_left">
        <a href="${contextPath}/main.do" >
          <img src="${contextPath}/resources/images/main_logo2.PNG" class="logo_img" width="100px">
        </a>
      </div>
      <form id="frm_search" method="get" action="${contextPath}/main/search.do">
        <div class="input-group w-100 p-3" >
          <select class="form-select search_select" id="inputGroupSelect01" name="column" aria-label="Example select with button addon">
            <option value="PRDT_NAME" selected>상품명</option>
            <option value="PRDT_TITLE">상세내용</option>
          </select>
          <input type="text" class="form-control serach_text" name="query" placeholder="검색어를 입력하세요." aria-label="Username" aria-describedby="basic-addon1">
          <button class="btn btn-outline-secondary" type="submit" id="btn_search">
            <i class="fa-solid fa-magnifying-glass white"></i>
          </button>
        </div>
      </form>
      <div class="margin_right">
        <a href="${contextPath}/member/mypage.do"><i class="fa-solid fa-user-large fa-2xl" style="color: #ffffff;"></i></a>
        <a href="${contextPath}/cart/list.do"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></a>
        <a href="${contextPath}/"><i class="fa-solid fa-star fa-2xl" style="color: #ffffff;"></i></a>
      </div>
    </div>
  </div>
  <div class="navigation_bar">
    <div class="category"><a href="${contextPath}/main/list.do?categoryName=상의"><h3>상의</h3></a></div>
    <div class="category"><a href="${contextPath}/main/list.do?categoryName=하의"><h3>하의</h3></a></div>
    <div class="category"><a href="${contextPath}/main/list.do?categoryName=아우터"><h3>아우터</h3></a></div>
    <div class="category"><a href="${contextPath}/main/list.do?categoryName=기타"><h3>기타</h3></a></div>
  </div>  
  
  <script>
   const fnSearch = () => {
     $('#frm_search').submit((ev) => {
       const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
       
     })     
   }
  </script>

  <div class="main_wrap">