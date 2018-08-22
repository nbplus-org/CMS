package com.yc.shopping.filter;

import com.yc.shopping.filter.BizException;

public class VaildUtils {
/**
 * 允许为空
 */
	public static String ALLOW_EMPTY=null;
/**
 * 判断对象是否为空或空字符串
 * @param object
 * @return
 */
	public static boolean isEmpty(Object object) {
		if(object==null){
			return true;
		}else if(object instanceof String){
			return ((String) object).trim().isEmpty();
		}else{
			return false;
		}
	}
/**
 * 判断字符串长度是否超过范围
 * @param string   String 潘端端长度的字符串
 * @param min   最小长度   为 0不判断
 * @param max   最大长度   为0不判断
 * @return
 */
	public static boolean isOutBound(String string, int min, int max) {
		if(min>0 && string.trim().length()<min || max>0 && string.trim().length()>max){
			return true;
		}else{
			return false;
		}
	}
/**
 * 根据正则表达式判断字符串是否合法,不合法则抛出业务异常
 * @param string  要判断的字符串
 * @param emptyMsg    字符串为空的信息  如果该参数为空
 * @param regexWithMsg   格式为{表达式,信息1,表达式2,信息2,表达式3,信息3......}
 */
	public static void check(Object object, String emptyMsg, String... regexWithMsg) throws BizException {
		if(isEmpty(object)){
			if(emptyMsg!=null){
			//字符串为空输出的信息
				throw new BizException(emptyMsg);
			}else{
				//字符串为空的信息为空则直接退出    表示允许该字符串为空
				return;
			}
		}else{
			for(int i=0;i<regexWithMsg.length-1;i+=2){
				if(!(""+object).matches(regexWithMsg[i])){
					//不匹配则返回对应信息(数组下一个元素就是报错信息)
					throw new BizException(regexWithMsg[i+1]);
				}
			}
		}
	}

}
