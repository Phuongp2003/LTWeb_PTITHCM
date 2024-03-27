package ptithcm.bean;

import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Book {
	@Column(name = "ID")
	private String Id;

	@Column(name = "Name")
	private String Name;

	@Column(name = "Price")
	private int Price;

	private ArrayList<String> Author;

	@Column(name = "Suplier")
	private String Suplier;

	private ArrayList<String> Category;

	private String Image;

	private String Seller;

	public Book() {
		System.out.println("Book constructor");
		System.out.println(this.Id);
		System.out.println(this.Name);
		System.out.println(this.Price);
		System.out.println(this.Author);
		System.out.println(this.Suplier);
		System.out.println(this.Category);
		System.out.println(this.Image);
		System.out.println(this.Seller);

	}

}
