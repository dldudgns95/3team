<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis() %>" />

<jsp:include page="../layout/header.jsp">
    <jsp:param value="${support.annNum}번 공지사항" name="title"/>
</jsp:include>

<style>
    .btn-primary {
        background-color: #000; /* 검정색 배경색 */
        color: #fff; /* 흰색 글자색 */
    }
</style>

<div>
    <h1>공지사항 수정</h1>
    <div>번호 : ${support.annNum}</div>
    <div>제목 : ${support.annTitle}</div>
    <div>내용 : ${support.annContent}</div>
    <img src="${contextPath}${support.annFile}">
    <div>등록일 : ${support.annDate}</div>
</div>
<div>
<!-- 관리자만 편집/삭제를 수행할 수 있다. -->
<c:if test="${sessionScope.member.auth == 9}">
    <!-- 로그인한 회원 정보 -->
    <form id="frm_btn" method="post">
        <input type="hidden" name="annNum" value="${support.annNum}">
        <button type="submit" id="btn_edit" class="btn btn-outline-dark">편집</button>
        <button type="button" id="btn_remove" class="btn btn-outline-dark">삭제</button>
        <!-- 목록보기를 눌렀을 때 list.do로 이동 -->
         <a href="${contextPath}/support/list.do" class="btn btn-outline-dark">목록보기</a>
    </form>
</c:if>
</div>
<!-- 수정과 삭제의 이벤트 -->
<script>
    const frmBtn = $('#frm_btn');
    

    // 수정하러 가기
    const fnEditSupport = () => {
        $('#btn_edit').click(() => {
            frmBtn.attr('action', '${contextPath}/support/edit.form');
            frmBtn.submit();
        });
    }
    
    

    // 삭제하기
    const fnRemoveSupport = () => {
        $('#btn_remove').click(() => {
            if(confirm('삭제할까요?')){
                frmBtn.attr('action', '${contextPath}/support/remove.do');
                frmBtn.submit();
            }
        });
    }

    // 수정 결과 확인
    const fnModifyResult = () => {
        let modifyResult = '${modifyResult}';
        if (modifyResult !== '') {
            if (modifyResult === '1') {
                alert('공지사항이 수정되었습니다.');
            } else {
                alert('공지사항이 수정되지 않았습니다.');
            }
        }
    }
    
    
    fnEditSupport();
    fnRemoveSupport();
    fnModifyResult();
</script>

<%@ include file="../layout/footer.jsp" %>
