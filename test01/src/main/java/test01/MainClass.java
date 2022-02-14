package test01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import org.springframework.context.support.GenericXmlApplicationContext;

import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;

public class MainClass {

	public static void main(String[] args) {
		//SpringTest st = new SpringTest();
		//st.method();
		String resource = "classpath:applicationContext.xml";
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext(resource);
		SpringTest test = ct.getBean("good", SpringTest.class);
		test.method();
		//applicationContext에서 저의된 Bean을 호출
		Hotel hotel = ct.getBean("hotel",Hotel.class);
		//xml에 정의된 DI에 의해서 Chef클래스를 별로 불러오지 않고, 정의하지 않은 상태에서 부러옴
		//의존성 주입 처리됨
		hotel.getChef().cook();
		
		DatabaseDev DBdev = ct.getBean("DBdev",DatabaseDev.class);
		
		DBdev.test();
		
		ResultSet rs = DBdev.testQuery("select * from users");
		try {
			System.out.println("아이디 : " + rs.getString("id") + "패스워드 : " + rs.getString("pw") + "이메일 : " + rs.getString("email"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		ct.close();
	}

}
