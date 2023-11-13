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
<title>${param.title == null ? '메인화면' : param.title}</title>
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


<link rel="stylesheet" href="${contextPath}/resources/css/cart.css?dt=${dt}" />

<style>
  @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

  .header_top {
    background-color: #070707;
    position:fixed; 
    width: 100%;
    top: 0;
    z-index: 100;
  }
  
  .search {
    display: flex;
    justify-content: space-around;
  }
  
  .search_select {
    max-width: 150px;
  }
  
  .serach_text {
    min-width: 300px;
    width: 300px;
  }
  
  .serach_text:focus, .search_select:focus{
    box-shadow: none;
  }
  
  
  .white, .white a {
    color: #fff;
  }
  .white a:visited {
    color: #fff;
  }
  
  .main_header  {
    flex-direction: row;
  }
  
  .margin_left {
    display: flex;
    align-items: center;
  }
  
  .margin_right {
    float: right;
    display: flex;
    align-items: center;
    width: 120px;
    justify-content: space-between;
  }
  
  .header_icon {
    align-items : center;
  }
  
  .user_state ul {
    display: inline;
    list-style: none;
  }
  
  .user_state li {
    display: inline-block;
    float: right;
    margin-right: 30px;
    color: #ffffff;
  }
  
  .user_state a {
    color: #ffffff;
  }
  
  .navigation_bar  {
    padding-top: 97.33px;
    height: 131.33px;
    display: flex;
    text-align: center;
    justify-content: space-around;
  }
  
  
  .category a {
    text-decoration: none;
  }
  
  .category h3 {
    display: flex;
    justify-content: center;
    font-family: 'Montserrat', sans-serif;
    font-weight: 700;
    color: #070707;
  }
  
  .pics {      /* 전체 케러셀 */
    width: 600px;
    float: left;
    position: relative;
    left: 50%;
    object-fit: cover;
  }
  
  .carousel-inner {
    width: auto;
    height: 400px; /* 이미지 높이 변경 */
  }

  .carousel-item {
    width: auto;
    height: 100%;
  }

  .d-block {
    display: block;
    width: auto;
    height: 100%;
  }
  
  .owl-carousel .owl-next,
  .owl-carousel .owl-prev {
    font-size: 50px !important;
    position: absolute;
    width: 40px;
    height: 100px;
    top: 30%
  
  }
  
  .owl-carousel .owl-prev {
    left: 10px;
  }
  
  .owl-carousel .owl-next {
    right: 10px;
  }
  
  .owl-carousel p {
    text-align: center;
  }
  
  .carousel-container {
    position: relative;
    margin-top: 10px;
  }
  
  .owl-carousel {
    z-index: 2;
  }
  
  .owl-container {
    max-height: 200px;
  }
  
  a img {
    transition: all 0.2s linear;
  }
  
  .a-images {
    overflow: hidden;
  }
  
  a:hover img {
    transform: scale(1.1);  
  }
  
  .item a {
    text-decoration: none;
    color: black;
  }
  
  .item {
    border: 1px solid gray;
  }
    
  
</style>

</head>
<body>

  <div class="header_top">
    <div class="user_state">
      <ul>
        <!-- 관리자 페이지는 로그인 시에 표시되게(지금은 임시로 표시) -->
        <a href="${contextPath}/support/support.do"><li>고객센터</li></a>
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
      <div class="input-group w-25 p-3" >
        <select class="form-select search_select" id="inputGroupSelect01" aria-label="Example select with button addon">
          <option value="0" selected>통합검색</option>
          <option value="1">상품명</option>
          <option value="2">등록자명</option>
        </select>
        <input type="text" class="form-control serach_text" placeholder="검색어를 입력하세요." aria-label="Username" aria-describedby="basic-addon1">
        <button class="btn btn-outline-secondary " type="button">
          <i class="fa-solid fa-magnifying-glass white"></i>
        </button>
      </div>
      <div class="margin_right">
        <a href="${contextPath}/member/mypage.form"><i class="fa-solid fa-user-large fa-2xl" style="color: #ffffff;"></i></a>
        <a href="${contextPath}/cart/list.do"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></a>
        <a href="#"><i class="fa-solid fa-star fa-2xl" style="color: #ffffff;"></i></a>
      </div>
    </div>
  </div>
  <div class="navigation_bar">
    <div class="category"><a href="#"><h3>상의</h3></a></div>
    <div class="category"><a href="#"><h3>하의</h3></a></div>
    <div class="category"><a href="#"><h3>아우터</h3></a></div>
    <div class="category"><a href="#"><h3>기타</h3></a></div>
  </div>

  <div class="main_wrap">