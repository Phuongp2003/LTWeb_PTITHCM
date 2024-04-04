package ptithcm.bean;

import javax.persistence.*;

@Entity
@Table(name = "Book")
public class Book {
	@Id
	@GeneratedValue
	private String Id;

	public String getId() {
		return Id;
	}
}
