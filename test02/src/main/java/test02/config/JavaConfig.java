package test02.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import test01.SpringTest;
import test02.ex01.construct.Chef;
import test02.ex01.construct.Hotel;
import test02.ex02.setter.DatabaseDev;

@Configuration
public class JavaConfig {
	//<bean id="good" class="test01.SpringTest" />
	@Bean
	public SpringTest good() {
		return new SpringTest();
	}
	
	//<bean id="chef" class="test02.ex01.construct.Chef" />
	@Bean
	public Chef chef() {
		return new Chef();
	}
	
	//<bean id="hotel" class="test02.ex01.construct.Hotel" >
	//	<constuctor-arg ref="chef"></constructor>
	//</bean>
	@Bean
	public Hotel hotel() {
		//Hotel은 생성자로 Chef객체를 받기 때문에 매개값으로 chef() 함수의 값을 넣은 것
		return new Hotel(chef());
	}
	
	@Bean
	public DatabaseDev DBdev() {
		DatabaseDev dv = new DatabaseDev();
		dv.setDriver("oracle.jdbc.driver.OracleDriver");
		dv.setUrl("jdbc:oracle:thin:@localhost:1521/XEPDB1");
		dv.setUid("myjsp");
		dv.setUpw("myjsp");
		
		return dv;
	}
}
