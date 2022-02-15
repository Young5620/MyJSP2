package test03.ex01.auto;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class AuTest {
	
	private MemTest mem;

	public AuTest() {
		System.out.println(this.mem);		
	}

	public MemTest getMem() {
		return mem;
	}
	
	@Resource(name="memTest")
	//@Autowired
	//@Qualifier("t1")
	public void setMem(MemTest mem) {
		//System.out.println("setter :"+mem);
		this.mem = mem;
	}
	
	

	
	
    

}
