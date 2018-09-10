package com.yc.shopping.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MyUtilsPwd {
	// 设置谁发邮件 注意，不能用qq邮箱 ssl链接
	public static String myEmailAcc = "15570921217@163.com";
	// 这不是登录密码，是授权密码
	public static String myEmailPwd = "1628443167hb";
	public static String myEmailSMTP = "smtp.163.com";

	// 邮件内容收件人邮箱
	public void sendMail(String receiveMail, String md5Pwd) {
		String code = md5Pwd;
		DataUtils.code = code; // 存值
		try {
			// 1、创建参数配置，用于连接邮件服务器的参数配置
			Properties props = new Properties(); // 参数配置
			props.setProperty("mail.transport.protocol", "smtp");// 使用的协议（javaMail规范要求）
			props.setProperty("mail.smtp.host", myEmailSMTP);// 发件人的邮箱的SMTP
																	// 服务器地址
			props.setProperty("mail.smtp.auth", "true");// 需要请求认证
			// 2、根据配置创建会话对象，用于和邮件服务器交互
			Session session = Session.getInstance(props);
			session.setDebug(false);
			// 3、创建一封邮件
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmailAcc, "nbsp购物系统", "UTF-8"));
			message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "用户", "UTF-8"));
			message.setSubject("新密码", "UTF-8");
			message.setContent("亲，您的新密码为：" + code + " ,请妥善保管好自己的密码，以防泄露信息哦。", "text/html;charset=UTF-8");
			message.setSentDate(new Date());
			message.saveChanges();
			// 4、根据Session获取邮件传输对象
			Transport transport = session.getTransport();
			transport.connect(myEmailAcc, myEmailPwd);
			transport.sendMessage(message, message.getAllRecipients());
			// 7、关闭连接
			transport.close();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
