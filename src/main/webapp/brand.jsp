<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="/WEB-INF/mytld.tld" prefix="mt" %>
    
<!--  品牌区    -->    
<div class="branding_area branding_home2">
			<div class="container">
				<div class="branding_home2_list">
					<div class="row">
						<div class="carousel_branding" >
						<%if(session.getAttribute("clothesbigtag")!=null){%>
						<c:forEach items="${brandpic }" var="brandpic">
							<div class="col-lg-2" style="margin-left:120px;">
								<div class="single_branding" >	
									 	<a href="showShop.do?op=brandpic&brandpic=${brandpic.brandpic}"><img src="${brandpic.brandpic}" width="100px" height="100px" alt="" /></a>									 
								</div>
							</div>
					   </c:forEach> 
					   <%}%>
						</div>
					</div>
				</div>
			</div>
		</div>