<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
    <jsp:param value="공지사항" name="title"/>
</jsp:include>
   

    <style>
        .notice-section {
            background-color: #f2f2f2; /* 연한 회색 배경색 */
            padding: 10px; /* 내부 여백 설정 */
        }

        .table thead th {
            font-weight: bold;
       }
    </style>


<div class="whole">
    <div class="container">
        <div class="left-div">
            <div class="page-name">고객센터</div>
            <ul class="menu-box">
                <li><a class="detail-menu" href="list.do">공지사항<img></a></li>
                <li><a class="detail-menu" href="${pageContext.request.contextPath}/faq/faq.do">자주하는 질문<img></a></li>
                <li><a class="detail-menu" href="${pageContext.request.contextPath}/ask/ask.do">1:1 문의<img></a></li>
            </ul>
        </div>
        <div class="right-div">

            <div class="wrap wrap_8">
                <div class="table-responsive">
                    <table class="table align-middle table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>첨부파일</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${supportList}" var="s" varStatus="vs">
                                <tr class="align-bottom">
                                    <td>${beginNo - vs.index}</td>
                                    <!-- 제목에 상세보기 요청 -->
                                    <td><a href="${contextPath}/support/detail.do?annNum=${s.annNum}">${s.annTitle}</a></td>
                                    <td>${s.annContent}</td>
                                    <td>${s.annFile}</td>
                                    <td>${s.annDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" class="text-center">${paging}</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div class="text-right mb-3">
                    <a href="${contextPath}/support/write.form">
                        <button type="button" class="btn btn-dark">새글작성</button>
                    </a>
                </div>
            </div>

        </div>
    </div>
</div>


<!-- 
  const fnAddResult = () => {
    let addResult = '${addResult}';  // '', '1', '0'
    if(addResult !== ''){
      if(addResult === '1'){
        alert('공지사항이 작성되었습니다.');
      } else {
        alert('공지사항 작성이 실패했습니다.');
      }
    }
  }
 
  const fnRemoveResult = () => {
    let removeResult = '${removeResult}';  // '', '1', '0'
    if(removeResult !== ''){
      if(removeResult === '1'){
        alert('공지사항이 삭제되었습니다.');
        $('#upload_list').empty();
      } else {
        alert('공지사항 삭제가 실패했습니다.');
      }
    }
  }

  fnAddResult();
  fnRemoveResult();
  
</script>
!-->

</body>
</html>
<%@ include file="../layout/footer.jsp" %>