#encoding:utf-8
module MessageProperties
  NEED_LOGIN = '请先登录'
  LOGIN_ERROR_MESSAGE='用户名或密码错误'
  OLD_PASSWORD_ERROR = '当前密码错误'
  ACCOUNT_NAME_AND_PASSWORD_CANNOT_NULL = '用户名或密码不能为空'

  CONFIRM_PASSWORD_ERROR='两次密码输入不一致'
  #credit_cashing
  CASHING_CARD_ERROR = '兑现银行卡错误'
  CASHING_AMOUNT_ERROR='兑现金额小于可兑现金额'

  #sms captcha
  CAPTCHA_UNEXSITS = '验证码失效，请重新发送。'
  CAPTCHA_ERROR = '验证码错误。'
  CAPTCHA_ERROR_TOO_MUCH = '验证码错误次数太多，请重新发送。'
  CAPTCHA_REQUEST_TOO_FAST = '请不要频繁发送验证码。'
  SMS_REQUEST_TOO_FAST = '请不要频繁发送短信。'


  SMS_RESEND_TIP = '秒后可重新发送。'

  MOBILE_NOT_VALID = '手机号码格式错误'
  MOBILE_HAS_BEEN_TAKEN = '手机号码已经被注册'
  MOBILE_NOT_REG = '手机号码未注册'

  IMAGE_CAPTCHA_ERROR = '图片验证码错误。'
  MERCHANT_STORE_NOT_FOUND = '商家不存在。'

  ACCOUNT_NAME_LENGTH_ERROR = '用户名为6-16个字母，数字，汉字或者下划线'
  ACCOUNT_NAME_CHAR_ERROR = '用户名为字母，数字，汉字或者下划线组成，不能包含特殊字符'

  AREA_CAN_NOT_EDIT = '当前区域不能编辑'
  AREA_CAN_NOT_DESTROY = '当前区域不能被删除'

  SYSTEM_ERROR = '系统繁忙，请稍候再试。'
end
