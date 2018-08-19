package com.yc.shopping.utils;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MyUtils {
	//设置谁发邮件	注意，不能用qq邮箱	ssl链接
	public static  String myEmailAccount = "zp1455665803@163.com";
	//这不是登录密码，是授权密码
	public static  String myEmailPassword = "zp1455665803";
	public static  String myEmailSMTPHost = "smtp.163.com";
	//邮件内容收件人邮箱
	public void sendMail(String receiveMail){
		Random rd=new Random();
		StringBuffer sbf=new StringBuffer();
		int count = 0;
		while (count<=5){
			sbf.append(rd.nextInt(10));
			count++;
		}
		String code = sbf.toString();
		//Data.code=code;		//存值
		
		try {
			//1、创建参数配置，用于连接邮件服务器的参数配置
			Properties props=new Properties();		//参数配置
			props.setProperty("mail.transport.protocol", "smtp");//使用的协议（javaMail规范要求）
			props.setProperty("mail.smtp.host", myEmailSMTPHost);//发件人的邮箱的SMTP 服务器地址
			props.setProperty("mail.smtp.auth", "true");//需要请求认证
			//2、根据配置创建会话对象，用于和邮件服务器交互
			Session session = Session.getInstance(props);
			session.setDebug(false);
			//3、创建一封邮件
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmailAccount,"源辰报考助手","UTF-8"));
			message.setRecipient(MimeMessage.RecipientType.TO,new InternetAddress(receiveMail,"用户","UTF-8"));
			message.setSubject("验证码", "UTF-8" );
			message.setContent("亲，欢迎注册源辰报考助手，愿你能找到合适的大学		你的验证码为："+code,"text/html;charset=UTF-8");
			message.setSentDate(new Date());
			message.saveChanges();
			//4、根据Session获取邮件传输对象
			Transport transport = session.getTransport();
			transport.connect(myEmailAccount,myEmailPassword);
			transport.sendMessage(message, message.getAllRecipients());
			//7、关闭连接
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

