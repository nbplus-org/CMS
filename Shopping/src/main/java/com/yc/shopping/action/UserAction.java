package com.yc.shopping.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yc.shopping.biz.CartInterface;
import com.yc.shopping.biz.ClothesInterface;
import com.yc.shopping.biz.UserInterface;
import com.yc.shopping.filter.BizException;
import com.yc.shopping.utils.DataUtils;
import com.yc.shopping.utils.Encrypt;
import com.yc.shopping.utils.MyUtils;
import com.yc.shopping.utils.MyUtilsPwd;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.UserVO;

/**
 * 
 * @author Computer-huangbiao
 *
 */
@Controller("UserAction")
public class UserAction {

	@Resource(name = "UserImp")
	private UserInterface uimp;
	
	@Resource(name = "CartImp")
	CartInterface ctBiz;

	/**
<<<<<<< HEAD
	 * 退出登录，注销，使会话失效--前台
	 * @return
	 */
	@RequestMapping("/outLog.do")
	public String outLog(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:show.do";
	}
	
	/**
	 * 退出登录，注销，使会话失效--后台
	 * @return
	 */
	@RequestMapping("/backManager/outLogBack.do")
	public String outLogBack(HttpServletRequest request){
		request.getSession().invalidate();
		return "redirect:back-login.jsp";
	}
	
	/**
	 * 注册用户
	 * 
	 * @author Computer-huangbiao
	 * @param user
	 * @param model
	 * @return
	 */

	@RequestMapping(value = "/regist.do"/*, method = RequestMethod.POST*/)
	public void registerUser(UserVO user,String code, Model model,HttpServletResponse response) {
         
		if(user.getUname()==null || "".equals(user.getUname()) ||
		   user.getUpwd()==null  || "".equals(user.getUpwd())  ||	
		   user.getUphone()==null ||"".equals(user.getUphone()) ||
		   user.getUemail()==null ||"".equals(user.getUemail()) ||
		   code==null || "".equals(code)
				){
			try {
				response.getWriter().print("0");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else{
			// 得到当前时间
			user.setUbirthday(new Date());
			user.setNickname(user.getUname());

			user.setNickname(user.getUname());

			// 密码加密存入数据库
			user.setUpwd(Encrypt.md5(user.getUpwd()));

			int u=uimp.registerUser(user);
			if(u>0){
				try {
					response.getWriter().print("1");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}else{
				try {
					response.getWriter().print("2");
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			
            
		}
		
		
	
	}
	
	/**
	 * huang发邮件 注册
	 */
	@RequestMapping("fayoujian.do")
	public void fayoujian (String email, HttpServletResponse response){
		
		MyUtils sendemail = new MyUtils();
		if(email!=null || !"".equals(email)){
			sendemail.sendMail(email);
			try {
				response.getWriter().print("1");//邮箱发送成功
			} catch (IOException e) {
				try {
					response.getWriter().print("2");
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}else{
			try {
				response.getWriter().print("0");
			} catch (IOException e) {
				e.printStackTrace();
			}//请填写邮箱
			
		}
		
	}
	
	

	/**
	 * wang 根据用户账号查找邮箱
	 * 
	 * @throws IOException
	 */
	@RequestMapping("zid.do")
	public void seeEmailByUserName(HttpServletResponse response, UserVO user) throws IOException {
		try {
			UserVO u = uimp.findEmailByName(user);
			// 隐藏邮箱
			String[] str = u.getUemail().split("@");
			String f = str[0].substring(0, 3);// 前面三位数
			System.out.println(f + "==" + str[1]);// 邮箱信息
			response.getWriter().print("：" + f + "****@" + str[1]);// 前面三维+邮箱信息

		} catch (BizException e) {
			response.getWriter().print("1");
		}
	}

	/**
	 * huang 忘记密码邮件发送
	 * 
	 * @throws IOException
	 */
	@RequestMapping("/semail.do")
	public void emailSend(HttpServletResponse response, String name) {
		if (name == null || "".equals(name)) {
			try {
				response.getWriter().print("请输入邮箱");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@RequestMapping("email.do")
	public void emailSend(HttpServletResponse response, UserVO user, String email) throws IOException {
		MyUtils my = new MyUtils();
		try {
			UserVO u = uimp.findEmailByName(user);
			if (email == null || "".equals(email)) {
				response.getWriter().print("2");// 异常---请输入邮箱
			} else {
				// 判断输入的邮箱和数据库的是否一致
				if (email.equals(u.getUemail())) {
					// 一致的话发送验证码
					my.sendMail(u.getUemail());
					response.getWriter().print("4");// 发送验证码成功
				} else {
					response.getWriter().print("3");// 异常---邮箱错误
				}

			}
		} catch (BizException e) {
			response.getWriter().print("1");// 异常该用户未注册
		}
	}

	/**
	 * 判断验证码是否正确 huang
	 */
	@RequestMapping(value = "/judgeCode.do", method = RequestMethod.POST)
	public void judgeCode(HttpServletResponse response, String name) {
		System.out.println("=========判断验证码是否正确 huang===============" + DataUtils.code);
		if (DataUtils.code.equals(name)) {
			// 验证码正确
			try {
				response.getWriter().print("验证码正确");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print("验证码错误");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 判断用户名是否已被注册 huang
	 */
	@RequestMapping(value = "/judgeuName.do", method = RequestMethod.POST)
	public void judgeuName(HttpServletResponse response, String uname) {
		System.out.println("======uimp.selectUserByUname(uname)========" + uimp.selectUserByUname(uname).size());
		if (uimp.selectUserByUname(uname).size() == 0) {
			// 数据库无该用户名,可创建
			try {
				response.getWriter().print("用户名可用");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 数据库有该用户名,不可创建
			try {
				response.getWriter().print("用户名已存在，请换一个");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 判断电子邮箱是否已被注册 huang
	 */
	@RequestMapping(value = "/judgeuEmail.do", method = RequestMethod.POST)
	public void judgeuEmail(HttpServletResponse response, String uemail) {

		if (uimp.selectUserByUemail(uemail).size() == 0) {
			// 数据库无该邮箱,可创建
			try {
				response.getWriter().print("邮箱可用");
				
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 数据库有该邮箱,不可创建
			try {
				response.getWriter().print("邮箱已存在，请换一个");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * wang 判断验证码是否正确//表单提交
	 */
	@RequestMapping("judgecode.do")
	public String judge(String code, Model model, String zid) {

		if (zid == null || "".equals(zid)) {
			model.addAttribute("msg1", "该用户未注册");
			return "forgetpwd";
		}
		if (code == null || "".equals(code)) {
			model.addAttribute("msg", "验证码不能为空");
			return "forgetpwd";
		}
		if (code.equals(DataUtils.code)) {
			model.addAttribute("zid", zid);
			return "resetpwd";
		} else {
			model.addAttribute("msg", "验证码错误");
			return "forgetpwd";
		}

	}

	/**
	 * wang 重置密码
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("resetpwd.do")
	public void resetPwd(HttpServletResponse response, String pwd, String npwd, String zid) throws IOException {
		System.out.println(pwd + "++" + npwd);
		if (pwd.equals(npwd)) {
			if (zid != null) {
				int result = uimp.modifyPwdByName(zid, npwd);
				if (result > 0) {
					response.getWriter().print("1");// 重置成功，跳转页面
				} else {
					response.getWriter().print("2");// 重置失败，请与管理员联系
				}
			} else {
				response.getWriter().print("3");// 身份失效
			}
		} else {
			response.getWriter().print("4");// 新密码与确认新密码不匹配
		}
	}

	/**
	 * 判断电话号码是否已被注册 huang
	 */
	@RequestMapping(value = "/judgeuPhone.do", method = RequestMethod.POST)

	public void judgeuPhone(HttpServletResponse response, String uphone) {
		System.out.println("======手机号=======" + uphone);
		if (uimp.selectUserByUphone(uphone) == null) {
			// 数据库无该手机号,可创建
			try {
				response.getWriter().print("手机号可用");
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			// 数据库有该邮箱,不可创建
			try {
				response.getWriter().print("手机号已存在，请换一个");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	@RequestMapping(path = { "/", "/index" })
	public String index() {
		return "index";
	}

	/**
	 * 登录
	 * 
	 * @param userVo
	 * @param request
	 * @param model
	 * @return
	 * @throws BizException
	 *             liu
	 */
	@RequestMapping("/login.do")
	public String login(UserVO userVo, HttpServletRequest request, Model model,HttpSession session,HttpServletResponse response) throws BizException {
		System.out.println(userVo.getUname() + "=========" + userVo.getUpwd());
		// 获取输入验证码
		String vcode = request.getParameter("vcode");
		// 取会话中的验证码
		String vscode = (String) request.getSession().getAttribute("vscode");
			

		userVo = uimp.checkByNP(userVo.getUname(), userVo.getUpwd());
		if (userVo != null) {
			if (vcode.equalsIgnoreCase(vscode)) {
				model.addAttribute("userVo", userVo);
				request.getSession().setAttribute("UserVO", userVo);
	
				return "redirect:show.do";
			} else {
				model.addAttribute("msgcode", "验证码错误!");

				return "reglogin";
			}
		} else {
			model.addAttribute("msg", "用户名或密码错误!");
			return "reglogin";
		}
	}

	/**
	 * 查所有用户huang
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/backManager/selectAllUser.do")
	public String selectAllUser(Model model, @Param("page") String page) {
		// 每条页面显示数据条数pageSize
		int pageSize = 5;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;
		List<UserVO> allUser = uimp.selectAllUser(startPage, pageSize);

		// 查询总页数
		int count = uimp.selectCount();
		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allUser", allUser);
		return "backManager/user-manager";
	}

	/**
	 * 给某些用户重置密码-huang
	 * 
	 * @return
	 */
	@RequestMapping("/backManager/resetPwd.do")
	public void deleteUser(@RequestParam("ids") Object[] ids, Model model, HttpServletResponse response) {

		// 随机生成6位数的密码存入数据库并md5加密
		Random r = new Random();
		MyUtilsPwd mypwd = new MyUtilsPwd();

		for (int id = 0; id < ids.length; id++) {
			String pwd = "";
			for (int i = 0; i < 6; i++) {
				pwd += r.nextInt(10);
			}
			String md5Pwd = Encrypt.md5(pwd);
			// 通过id重置密码
			uimp.resetPwd(ids[id], md5Pwd);
			// 发送邮件的密码不能是加密的
			mypwd.sendMail(uimp.selectEmailByUid(ids[id]), pwd);
		}
		try {
			response.getWriter().print("重置密码成功");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 普通查询用户（后台）huang
	 * 
	 * @param keyWord
	 * @param model
	 * @return
	 *//*
		 * @RequestMapping(value = "/backManager/commonSearch.do") public String
		 * commonSearch(String keyWord, Model model, @Param("page") String page)
		 * {
		 * 
		 * // 每条页面显示数据条数pageSize int pageSize = 5; // 初始化默认为第一页 if (page ==
		 * null) { page = "1"; } // 从第几条开始 int startPage =
		 * (Integer.parseInt(page) - 1) * pageSize;
		 * 
		 * List<UserVO> allUser = uimp.commonSelect(keyWord, startPage,
		 * pageSize);
		 * 
		 * // 查询总页数 int count = uimp.selectCountCommon(keyWord); int pageTimes;
		 * if (count % pageSize == 0) { pageTimes = count / pageSize; } else {
		 * pageTimes = count / pageSize + 1; } model.addAttribute("currentPage",
		 * Integer.parseInt(page)); model.addAttribute("pageTimes", pageTimes);
		 * model.addAttribute("allUser", allUser);
		 * 
		 * if ("男".equals(keyWord)) { keyWord = "1"; } else if
		 * ("女".equals(keyWord)) { keyWord = "0"; }
		 * System.out.println("======keyWord=====" + keyWord);
		 * System.out.println("===============allUser==================" +
		 * allUser); model.addAttribute("allUser", allUser); System.out.println(
		 * "===============model.addAttribute=================="); return
		 * "backManager/user-manager";
		 * 
		 * }
		 */
	/**
	 * 高级搜索（后台） huang
	 * 
	 * @param keyWord
	 * @param model
	 * @return var usexTop=$("#usexTop").val(); var
	 *         unameTop=$("#unameTop").val(); var
	 *         uemailTop=$("#uemailTop").val(); var
	 *         uphoneTop=$("#uphoneTop").val();
	 */
	@RequestMapping(value = "/backManager/topSearch.do")
	public String topSearch(UserVO user, Model model, @Param("page") String page) {

		if(user.getUname()==null){
			user.setUname("");
		}
		if(user.getUemail()==null){
			user.setUemail("");
		}
		if(user.getUphone()==null){
			user.setUphone("");
		}
		if(user.getUsex().equals("1")){
			user.setUsex("男");
		}else if(user.getUsex().equals("0")){
			user.setUsex("女");
		}
		
		if ("女".equals(user.getUsex())) {
			user.setUsex("0");
		} else if ("男".equals(user.getUsex())) {
			user.setUsex("1");
		} else {
			user.setUsex("");
		}
		
		// 每条页面显示数据条数pageSize
		int pageSize = 5;
		// 初始化默认为第一页
		if (page == null) {
			page = "1";
		}
		// 从第几条开始
		int startPage = (Integer.parseInt(page) - 1) * pageSize;

		List<UserVO> allUser = uimp.topSelect(user, startPage, pageSize);

		// 查询总页数
		int count = uimp.selectCountTop(user);
		int pageTimes;
		if (count % pageSize == 0) {
			pageTimes = count / pageSize;
		} else {
			pageTimes = count / pageSize + 1;
		}
		model.addAttribute("user", user);
		model.addAttribute("currentPage", Integer.parseInt(page));
		model.addAttribute("pageTimes", pageTimes);
		model.addAttribute("allUser", allUser);
		System.out.println("====allUser.size()=======" + allUser.size());
		return "backManager/user-manager";
	}

}
