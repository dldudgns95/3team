<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="header.jsp">
  <jsp:param value="메인화면" name="title"/>
</jsp:include>

  
  <div class="carousel-container">
    <div class="owl-carousel owl-theme">
      <c:forEach items="${productTop10List}" var="top10" begin="0" varStatus="i">
        <div class="item">
          <a href="${contextPath}/product/detail.do?prdtNum=${top10.productDto.prdtNum}">
            <div class="a-images">
              <img src="${top10.imagePath}/${top10.filesystemName}">
            </div>
            <div><p>TOP${i.index + 1} ${top10.productDto.prdtTitle}</p></div>
            <div><p>${top10.productDto.prdtRealPrice}원</p></div>
          </a>
        </div>
      </c:forEach>
    </div>
  </div>
  
  <select id="coupon_select">
    <option>쿠폰을 선택하세요.</option>
  </select>
  
  <button type="button" class="btn btn-primary" id="openModalBtn">쿠폰 받기</button>

  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">쿠폰 목록</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <!-- 모달 내용이 들어갈 자리 -->  
        </div>
      </div>
    </div>
  </div>
  <a href="${contextPath}/main/qnaList.do">qna</a>  
  
  <script>
  
    $(document).ready(function () {
      
      // 모달 열기 버튼 클릭 시
      $("#openModalBtn").on("click", function () {
        if('${sessionScope.member}' === '') {
          if(confirm('로그인이 필요한 기능입니다. 로그인 하시겠습니까?')){
            location.href='${contextPath}//member/login.form';
          } else {
            return;            
          }          
        }
        fnCouponAjax();
        fnGetMemberCoupon();
      });
      
      
      const fnCouponAjax = () => {
        // AJAX 요청
        $.ajax({
          method: "GET", // 또는 "POST" 등 적절한 HTTP 메소드 사용
          url: "${contextPath}/main/couponList.do", // AJAX 요청을 처리할 서버 측 파일 경로
          data: "num=${sessionScope.member.num}",
          dataType: "json", // 응답 데이터 타입 설정 (JSON 등)
          success: function (resData) {
            // AJAX 요청이 성공하면 모달 내용 업데이트
            updateModalContent(resData);
            // 모달 열기
            $("#myModal").modal("show");
          },
  
          error: function (error) {
            console.error("AJAX 오류:", error);
          },
        }); 
      }
      
      // 쿠폰 받기버튼 클릭 시 
      const fnGetMemberCoupon = () => {
        $(document).on('click', '.btn_get_coupon', (ev) => {
          $.ajax({
            method: 'POST',
            url: '${contextPath}/main/addMemberCoupon.do',
            data: $(ev.target).closest('.frm_add_coupon').serialize(),
            dataType: 'json',
            success: (resData) => {
              alert('발급 완료!');
              fnCouponAjax();
            }
          })        
        });
      }
      
  
      // 모달 내용 업데이트 함수
      function updateModalContent(resData) {
        // 받아온 데이터를 사용하여 모달 내용 업데이트
        // 예: 모달 내용을 구성하는 HTML을 동적으로 생성하거나 수정
        var modalContent = '';
        if(resData.hasCouponList.length > 0) {
          modalContent +='<h1>발급 완료된 쿠폰</h1>';
          $.each(resData.hasCouponList, (i, c) => {
            const endAt = new Date(c.endAt);
            const date  = moment(endAt).format('YYYY/MM/DD');
            modalContent += '<div class="coupon_list">';
            modalContent += '  <div>';
            modalContent += '    <div>' + c.cpName + '(~' + date + ')' + '</div>';
            modalContent += '    <div>' + c.cpInfo + '</div>';
            modalContent += '    <div>최소주문금액: ' + c.cpMin + '원</div>';
            modalContent += '  </div>';
            modalContent += '  <div class="check_coupon">';
            modalContent += '    <h2>발급완료</h2>';
            modalContent += '  </div>';
            modalContent += '</div>';
            modalContent += '<hr>';
          })  
        }
        if(resData.dontHaveCouponList.length > 0) {
          modalContent += '<h1>받지 않은 쿠폰</h1>';
          $.each(resData.dontHaveCouponList, (i, c) => {
            const endAt = new Date(c.endAt);
            const date  = moment(endAt).format('YYYY/MM/DD');
            modalContent += '<div class="coupon_list">';
            modalContent += '  <div>';
            modalContent += '    <div>' + c.cpName + '(~' + date + ')' + '</div>';
            modalContent += '    <div>' + c.cpInfo + '</div>';
            modalContent += '    <div>최소주문금액: ' + c.cpMin + '원</div>';
            modalContent += '  </div>';
            modalContent += '  <div>';
            modalContent += '    <form class="frm_add_coupon">';
            modalContent += '      <input type="hidden" name="cpNum" value="'+c.cpNum+'">';
            modalContent += '      <input type="hidden" name="num"   value="${sessionScope.member.num}">';
            modalContent += '      <button type="button" class="btn_get_coupon">';
            modalContent += '        <i class="fa-solid fa-download fa-2xl" style="color: #000000;"></i>';
            modalContent += '      </button>';
            modalContent += '    </form>';
            modalContent += '  </div>';
            modalContent += '</div>';
            modalContent += '<hr>';
          })
        }
        
        // 모달 내용 업데이트
        $(".modal-body").html(modalContent);
      }
      
      // 모달창이 닫히면 이벤트
      $('#myModal').on('hidden.bs.modal', () => {
        $.ajax({
          method: 'GET',
          url: '${contextPath}/main/unusedCouponList.do',
          data: 'num=${sessionScope.member.num}',
          dataType: 'json',
          success: (resData) => {
                                               // 여기에 아이디 입력
            const select = document.getElementById('coupon_select');
            // #pets에 select 아이디 입력
            $('#coupon_select option').remove();
            $(select).append("<option>쿠폰을 선택하세요.</option>")
            $.each(resData.productList, (i, c) => {
              $(select).append("<option value='"+ c.cpNum+"'>" + c.cpName + "</option>")
            })
          } 
        })
      })
    });
    
  </script>
  
  
  <div class="main_list">
    <c:forEach items="${productList}" var="product">
      <div class="main_item">
        <a href="${contextPath}/product/detail.do?prdtNum=${product.productDto.prdtNum}">
          <c:if test="${product.productDto.prdtStock eq 0}">
            <div class="main_item_image background_image" style="background-image: url(${product.imagePath}/${product.filesystemName});">
              <img src="${contextPath}/resources/images/soldout.png" class="soldout">
            </div>
          </c:if>
          <c:if test="${product.productDto.prdtStock ne 0}">
            <div class="main_item_image">
              <img src="${product.imagePath}/${product.filesystemName}">
            </div>
          </c:if>
          <div>${product.productDto.prdtTitle}</div>
          <div><p>${product.productDto.prdtRealPrice}원</p></div>
        </a>
      </div>
    </c:forEach>
  </div>
  
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
  
  

<%@ include file="footer.jsp"%>