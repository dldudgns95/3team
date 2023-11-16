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
</style>
    
</head>
    <div>
        <h1>${sessionScope.member.name}님 회원탈퇴를 하시겠습니까?</h1>
        <ul class="text-center">
            <li>
                <form method="post" action="${contextPath}/member/memberout.do">
                	<input type="hidden" name="num" value="${sessionScope.member.num}">
                    <button type="submit" class="btn btn-dark">탈퇴하기</button>
                </form>
            </li>
            <li><button class="btn btn-dark" onclick="location.href='${contextPath}/main.do'">취소</button></li>
        </ul>
    </div>

    <jsp:include page="../layout/footer.jsp" />
</body>

</html>
