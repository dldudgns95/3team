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

<!-- jquery를 사용하기 위한 cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- ckeditor를 사용하기 위한 cdn -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/decoupled-document/ckeditor.js"></script>

<style>
  @import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');

  .header_top {
    background-color: #070707;
    position: sticky;
    top: 0;
  }
  
  .search {
    display: flex;
    justify-content: space-around;
  }
  
  .search_select {
    max-width: 150px;
  }
  
  .serach_text {
    width: 300px;
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
  }
  
  .user_state a {
    color: #ffffff;
  }
  
  .navigation_bar  {
    display: flex;
    justify-content: space-around;
  }
  
  .category {
    padding-top: 15px;
  }
  
  .category a {
    text-decoration: none;
  }
  
  .category h2 {
    display: flex;
    justify-content: center;
    font-family: 'Montserrat', sans-serif;
    font-weight: 700;
    color: #070707;
  }
    
  
</style>

</head>
<body>

  <div class="header_top">
    <div class="user_state">
      <ul>
        <!-- 관리자 페이지는 로그인 시에 표시되게(지금은 임시로 표시) -->
        <a href="${contextPath}/admin/admin.do"><li>관리자 페이지</li></a>
        <a href="#"><li>회원가입</li></a>
        <a href="${contextPath}/member/login.form"><li>로그인</li></a>
        
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
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search white header_icon" viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
          </svg>
        </button>
      </div>
      <div class="margin_right">
        <a href="#"><i class="fa-solid fa-user-large fa-2xl" style="color: #ffffff;"></i></a>
        <a href="${contextPath}/cart/cart.form"><i class="fa-solid fa-cart-shopping fa-2xl" style="color: #ffffff;"></i></a>
        <a href="#"><i class="fa-solid fa-star fa-2xl" style="color: #ffffff;"></i></a>
      </div>
    </div>
  </div>
  <div class="navigation_bar">
    <div class="category"><a href="#"><h2>모자</h2></a></div>
    <div class="category"><a href="#"><h2>상의</h2></a></div>
    <div class="category"><a href="#"><h2>하의</h2></a></div>
    <div class="category"><a href="#"><h2>아우터</h2></a></div>
    <div class="category"><a href="#"><h2>신발</h2></a></div>
  </div>
  
  <hr>

  <div class="main_wrap">