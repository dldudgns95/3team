<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="회원탈퇴" name="title"/>
</jsp:include>
<style>
    /* 점 없애기 */
    li {
        list-style: none;
    }

    /* 버튼을 수평으로 정렬하는 스타일 */
    ul.button-list {
        display: flex;
        justify-content: center; /* 항목을 수평으로 가운데 정렬 */
        padding: 0;
    }

    ul.button-list li {
        margin: 0 10px; /* 버튼 간격 조절 */
    }

    div.child1 {
        width: 10%;
    }
    div.parent {
        padding-left: 50px;
        display: flex;
        justify-content: flex-start;
    }    
    div.child2 {
        width: 70%;
        display: flex;
        justify-content: center;
        
    }
</style>
</head>
<div class="parent">
<div class="child1"> 
<h1>내 정보</h1>
	<ul>
		<li><a href="${contextPath}/member/orderlist.do">주문내역</a></li>
		<li><a href="${contextPath}/member/qnalist.do">문의내역</a></li>
		<li><a href="${contextPath}/cart/list.do">장바구니</a></li>
		<li><a href="${contextPath}/main/zzimList.do?num=${sessionScope.member.num}">찜한삼품</a></li>
		<li><a href="${contextPath}/member/mypageedit.form">개인정보 수정</a></li>
		<li><a href="${contextPath}/member/memberoutform.do">회원 탈퇴</a></li>
	</ul>
</div>


    <div class="child2">
        <h1 class="text-center">${sessionScope.member.name}님 회원탈퇴를 하시겠습니까?</h1><br>
        <div class="child3">
        <ul class="text-center button-list">
            <li>
                <form method="post" action="${contextPath}/member/memberout.do">
                    <input type="hidden" name="num" value="${sessionScope.member.num}">
                    <button type="submit" class="btn btn-dark">탈퇴하기</button>
                </form>
            </li>
            <li><button class="btn btn-dark" onclick="location.href='${contextPath}/main.do'">취소</button></li>
        </ul>
    </div>
    </div>
</div>
    <jsp:include page="../layout/footer.jsp" />
</body>
</html>
