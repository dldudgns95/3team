/**
 * 회원 가입 페이지
 */

/* 함수 호출 */
$(() => {
  fnCheckEmail();
})


/* 전역변수 선언 */
var emailPassed = false;
var pwPassed = false;
var pw2Passed = false;
var namePassed = false;
var mobilePassed = false;


/* 함수 정의 */

const getContextPath = () => {
  let begin = location.href.indexOf(location.host) + location.host.length;
  let end = location.href.indexOf('/', begin + 1);
  return location.href.substring(begin, end);
}
const fnCheckEmail = () => {
    $('#btn_get_code').click(() => {
        let email = $('#email').val();
        new Promise((resolve, reject) => {
            // 1. 정규식 검사
            let regEmail = /^[A-Za-z0-9-_]+@[A-Za-z0-9]{2,}([.][A-Za-z]{2,6}){1,2}$/;
            if (!regEmail.test(email)) {
                reject(1);
                return;
            }
            // 2. 이메일 중복 체크
            $.ajax({
                // 요청
                type: 'get',
                url: getContextPath() + '/member/checkPwEmail.do',
                data: 'email=' + email,
                // 응답
                dataType: 'json',
                success: (resData) => {  // resData === {"checkPwEmail": true}
                    if (resData.checkPwEmail) {
                        reject(2);
                    } else {
                        resolve();
                    }
                }
            });
        }).then(() => {
            // 3. 인증코드 전송
            $.ajax({
                // 요청
                type: 'get',
                url: getContextPath() + '/member/sendCode.do',
                data: 'email=' + email,
                // 응답
                dataType: 'json',
                success: (resData) => {  // resData === {"code": "6자리코드"}
                    alert(email + "로 인증코드를 전송했습니다.");
                    $('#code').prop('disabled', false);
                    $('#btn_verify_code').prop('disabled', false);
                    $('#btn_verify_code').click(() => {
                        emailPassed = $('#code').val() === resData.code;
                        if (emailPassed) {
                            alert('이메일이 인증되었습니다. 메일함에 임시비밀번호를 확인하세요');
                            $('#updatepw').submit();
                        } else {
                            alert('이메일 인증이 실패했습니다.');
                        }
                    });
                }
            }).catch((state) => {
                emailPassed = false;
                switch (state) {
                    case 1:
                        $('#msg_email').text('이메일 형식이 올바르지 않습니다.');
                        break;
                    case 2:
                        $('#msg_email').text('가입되지 않은 이메일입니다.');
                        break;
                }
            });
        });
    });
}
