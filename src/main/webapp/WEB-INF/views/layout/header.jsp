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

<!-- jquery를 사용하기 위한 cdn -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- ckeditor를 사용하기 위한 cdn -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/decoupled-document/ckeditor.js"></script>

<style>
  .header_top {
    background-color: #070707;
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
  
  .main_header {
    flex-direction: row;
  }
  
  .margin_right {
    filter: invert(100%) sepia(0%) saturate(7500%) hue-rotate(216deg) brightness(104%) contrast(101%);
    float: right;
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
  
  
    
  
</style>

</head>
<body>

  <div class="header_top">
    <div class="user_state">
      <ul>
        <a href="#"><li>회원가입</li></a>
        <a href="#"><li>로그인</li></a>
      </ul>
    </div>
    <div class="search">
      <div>
        <a href="${contextPath}/main.do" >
          <img src="${contextPath}/resources/image/main_logo2.PNG" class="logo_img" width="100px">
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
        <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="white" class="bi bi-person-fill" viewBox="0 0 16 16">
          <a href="#"><path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/></a>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="white" class="bi bi-cart-fill" viewBox="0 0 16 16">
          <a href="#"><path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/></a>
        </svg>
        <svg xmlns="http://www.w3.org/2000/svg" width="38" height="38" fill="white" class="bi bi-star-fill" viewBox="0 0 16 16">
          <a href="#"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></a>
        </svg>
      </div>
    </div>
  </div>
  
  

  <div class="main_wrap">