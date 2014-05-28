package com.zcm.utils;

import java.util.Map;

import com.jiangge.utils.EmailUtils;
import com.jiangge.utils.mail.EmailConst;

public class SendMail {
	
	public void sentEmail(Map<String, String> taskParam){
		String toUser = taskParam.get("toUser");
		String subject = taskParam.get("subject");
		String body = taskParam.get("body");
		EmailUtils.send(EmailConst.SMTP_QQ, ReadPropertity.getProperty("fromAddress"), ReadPropertity.getProperty("fromPass"), toUser, subject, body);
	}

}
