package test01;

import java.sql.ResultSet;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import test02.config.JavaConfig;
import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;

public class MainClass {

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(JavaConfig.class);
		
		SpringTest t = ctx.getBean("good", SpringTest.class);
		t.method();
		
		Hotel h = ctx.getBean("hotel",Hotel.class);
		h.getChef().cook();
		
		DatabaseDev dev = ctx.getBean("DBdev",DatabaseDev.class);
		dev.test();
		
		ResultSet rs = null;
		try {
			rs = dev.testQuery("select * from board order by num asc");
			while(rs.next()) {
				System.out.println("================");
				System.out.println("작성자 : " + rs.getString("writer") + "\n제목 : " + rs.getString("title") + "\n내용 : " + rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
