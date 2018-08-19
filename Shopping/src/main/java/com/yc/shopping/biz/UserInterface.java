package com.yc.shopping.biz;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.shopping.filter.BizException;
import com.yc.shopping.vo.UserVO;

/**
 * 用户类接口
 * @author wang
 *
 */
@Service
public interface UserInterface {
  /**
   * 验证用户名密码是否正确，实现登录
   * @param uname
   * @param upwd
   * @return
   * @throws BizException
   * 
   *  @author liu
   */
	public UserVO checkByNP(String uname,String upwd) throws BizException;
	
}
