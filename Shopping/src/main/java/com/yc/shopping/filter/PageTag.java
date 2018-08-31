package com.yc.shopping.filter;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;


/**
 * 分页工具类
 * @author Administrator
 *
 */
public class PageTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	
	private long total;   //总信息数量
	private int rows;     //每页行数
	private String href;   //请求地址
	
	public int doStartTag() throws JspException {
		int allPage=0;    //总页数
		//计算总页数
		if(total>0 && rows>0){
			allPage=(int) (total%rows==0 ? total/rows : total/rows+1);
		}
		
		if(total<=0 || rows<=0 ||  allPage<=0){
			return SKIP_BODY;
		}
		int pages=0;     //当前页数
		String pageName=null;
		
		while(pages<allPage){

			if(pages==0){
				pageName="首页";
			}else if(pages==allPage-1){
				pageName="尾页";
			}else if(pages>0 && pages<3){
				pageName=pages+1+"";
			}else{
				pageName="";
			}		
			pages++;
			
			//判断href中是否包含?号  如果有?号则拼接&
			String wen=href.contains("?")? "&":"?";
			 String s=String.format("<a href='%s%spage=%s&rows=%s'>%s</a>",
					 href,wen,pages,rows,pageName);
			 
			 try {
					pageContext.getOut().println(s);
				} catch (IOException e) {
					e.printStackTrace();
			 }
		}
		return super.doStartTag();		
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setHref(String href) {
		this.href = href;
	}
	
}
