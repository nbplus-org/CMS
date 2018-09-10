package sendMessageTest;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.yc.shopping.dao.OrderDao;
import com.yc.shopping.vo.ClothesVO;
import com.yc.shopping.vo.UserVO;


@RunWith(SpringRunner.class)
@ContextConfiguration("/beans.xml")
public class SendMessageTest {
	@Resource
	private OrderDao odao;
    @Test
	public void test(){
		
		int[] a={3,4};
	   
    System.out.println(odao.selectCartByUser(a));
    	
    	
	}
	
}
