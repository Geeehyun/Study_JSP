/**
 * 
 */
package common;

/**
 * 
 */
public class Person {
	private String name;      // Private 선언함으로써 객체 생성 시 필드에 직접 접근할 수 없고, setter/getter 통해서만 접근할 수 있도록 하는 방식 (빈 생성규약 중 하나)
	private int age;
	
	@Override
	public String toString() {        // 해쉬코드 나오는게 싫어서 내맘대로 toString 오버라이딩함.
		return name + " : " + age;
	}
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {    // Setter private 접근지정자를 붙여버리면 해당 필드에 대해서 getter 조회만 할 수 있도록 하는 방식
		this.name = name;
	}
	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}
	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}
	public Person() {}
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
}
