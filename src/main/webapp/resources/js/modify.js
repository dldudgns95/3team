/**
 * 마이페이지
 */

/* 함수 호출 */
$(() => {

  fnLeaveMember();
})






const fnLeaveMember = () => {
  $('#btn_leave').click(() => {
    if(confirm('회원 탈퇴하시겠습니까?')){
      $('#frm_mypage').prop('action', getContextPath() + '/member/memberout.do');
      $('#frm_mypage').submit();
    }
  })
}
