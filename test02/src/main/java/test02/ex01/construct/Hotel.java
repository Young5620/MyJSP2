package test02.ex01.construct;

public class Hotel {

	private Chef chef;
	
	public Hotel(Chef chef) {
		this.chef = chef;
		System.out.println("Hotel에서 DI된 Chef객체 : " +this.chef);
	}
	
	public void setChef(Chef chef) {
		this.chef = chef;
	}
	
	public Chef getChef() {
		return chef;
	}
}
