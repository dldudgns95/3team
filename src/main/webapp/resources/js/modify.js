/**
 * 마이페이지
 */

/* 함수 호출 */
$(() => {
  fnCheckPassword();
  fnCheckPassword2();
  fnModifyPassword();
  fnCheckName();
  fnCheckMobile();
  fnModifyMember();


})


/* 전역변수 선언 */
var namePassed = false;
var mobilePassed = false; 
var pwPassed = false;
var pw2Passed = false;


/* 함수 정의 */

const getContextPath = () => {
  let begin = location.href.indexOf(location.host) + location.host.length;
  let end = location.href.indexOf('/', begin + 1);
  return location.href.substring(begin, end);
}

const fnCheckName = () => {
  $('#name').blur((ev) => {
    let name = ev.target.value;
    let bytes = 0;
    for(let i = 0; i < name.length; i++){
      if(name.charCodeAt(i) > 128){  // 코드값이 128을 초과하는 문자는 한 글자 당 2바이트임
        bytes += 2;
      } else {
        bytes++;
      }
    }
    namePassed = (bytes <= 50);
    if(!namePassed){
      $('#msg_name').text('이름은 50바이트 이내로 작성해야 합니다.');
    }
  })
}

const fnCheckMobile = () => {
  $('#mobile').keyup((ev) => {
    ev.target.value = ev.target.value.replaceAll('-', '');
    // 휴대전화번호 검사 정규식 (010숫자8개)
    let regMobile = /^010[0-9]{8}$/;
    mobilePassed = regMobile.test(ev.target.value);
    if(mobilePassed){
      $('#msg_mobile').text('');
    } else {
      $('#msg_mobile').text('휴대전화번호를 확인하세요.');       
    }
  })
}

const fnModifyMember = () => {
  $('#btn_modify').click(() => {
    if(!namePassed){
      alert('이름을 확인하세요.');
      return;
    } else if(!mobilePassed){
      alert('휴대전화번호를 확인하세요.');
      return;
    }
    $.ajax({
      // 요청
      type: 'post',
      url: getContextPath() + '/member/modify.do',
      data: $('#frm_mypage').serialize(),
      // 응답
      dataType: 'json',
      success: (resData) => {  // {"modifyResult": 1}
        if(resData.modifyResult === 1){
          alert('회원 정보가 수정되었습니다.');
        } else {
          alert('회원 정보가 수정되지 않았습니다.');
        }
      }
    })
  })
}


/**
 * 비밀번호 변경 페이지
 */



/* 함수 정의 */

const fnCheckPassword = () => {
  $('#pw').keyup((ev) => {
    let pw = $(ev.target).val();
    // 비밀번호 : 8~20자, 영문,숫자,특수문자, 2가지 이상 포함
    let validPwCount = /[A-Z]/.test(pw)          // 대문자가 있으면   true
                     + /[a-z]/.test(pw)          // 소문자가 있으면   true
                     + /[0-9]/.test(pw)          // 숫자가 있으면     true
                     + /[^A-Za-z0-9]/.test(pw);  // 특수문자가 있으면 true
    pwPassed = pw.length >= 8 && pw.length <= 20 && validPwCount >= 2;
    if(pwPassed){
      $('#msg_pw').text('사용 가능한 비밀번호입니다.');
    } else {
      $('#msg_pw').text('비밀번호는 8~20자, 영문/숫자/특수문자를 2가지 이상 포함해야 합니다.');       
    }
  })
}

const fnCheckPassword2 = () => {
  $('#pw2').blur((ev) => {
    let pw = $('#pw').val();
    let pw2 = ev.target.value;
    pw2Passed = (pw !== '') && (pw === pw2);
    if(pw2Passed){
      $('#msg_pw2').text('');
    } else {
      $('#msg_pw2').text('비밀번호 입력을 확인하세요.');
    }
  })
}

const fnModifyPassword = () => {
  $('#frm_modify_pw').submit((ev) => {
    if(!pwPassed || !pw2Passed){
      alert('비밀번호를 확인하세요.');
      ev.preventDefault();
      return;
    }
  })
}
 