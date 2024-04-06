package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "Book")
public class Book {
	@Id
	@GeneratedValue
	private String Id;
	private String Name;
	private String Description;
	private Integer Price;

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Integer getPrice() {
		return Price;
	}

	public void setPrice(Integer price) {
		Price = price;
	}

	@Override
	public String toString() {
		return "Book [Id=" + Id + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + "]";
	}
}
