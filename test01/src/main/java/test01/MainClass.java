package test01;

import java.sql.ResultSet;

import org.springframework.context.support.GenericXmlApplicationContext;

import test02.ex01.construct.Chef;
import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;
import test03.ex01.auto.AuTest;
import test03.ex01.auto.MemTest;

public class MainClass {

	public static void main(String[] args) {
		//SpringTest st = new SpringTest();
		//st.method();
		String resource = "classpath:applicationContext.xml";
		GenericXmlApplicationContext ct = new GenericXmlApplicationContext(resource);

		System.out.println("===프로토타입예제===");
		SpringTest test = ct.getBean("good", SpringTest.class);
		SpringTest test2 = ct.getBean("good", SpringTest.class);
		
		System.out.println("프로토타입 1 : " + test);
		System.out.println("프로토타입 2 : " + test2);
		

		//applicationContext에서 저의된 Bean을 호출
		Hotel hotel = ct.getBean("hotel",Hotel.class);
		//xml에 정의된 DI에 의해서 Chef클래스를 별로 불러오지 않고, 정의하지 않은 상태에서 부러옴
		//의존성 주입 처리됨
		hotel.getChef().cook();
		
		System.out.println("===싱글톤예제===");
		System.out.println("hotel 객체 : " + hotel);
		Hotel hotel2 = ct.getBean("hotel",Hotel.class);
		System.out.println("hotel 객체 : " + hotel2);
		
		//Qualifier 예제
		Chef cf = ct.getBean("chef",Chef.class);
		System.out.println("Chef 객체 : " + cf);
		Chef cf2 = ct.getBean("chef2",Chef.class);
		System.out.println("Chef 객체 : " + cf2);
		
		
		DatabaseDev DBdev = ct.getBean("DBdev",DatabaseDev.class);
		
		DBdev.test();
		
		ResultSet rs = DBdev.testQuery("select * from board order by num asc");
		try {
			if(rs.next()) {
				System.out.println("================");
				System.out.println("작성자 : " + rs.getString("writer") + "\n제목 : " + rs.getString("title") + "\n내용 : " + rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		AuTest atest = ct.getBean("auTest", AuTest.class);
		MemTest mtest = ct.getBean("memTest", MemTest.class);
		MemTest mtest2 = ct.getBean("memTest2", MemTest.class);
		
		System.out.println("atest 결과 : "+atest.getMem().getUid());
		System.out.println("memTest 결과 : "+mtest.getUid());
		System.out.println("memtest2 결과 : "+mtest2.getUid());
		
		ct.close();
	}

}
