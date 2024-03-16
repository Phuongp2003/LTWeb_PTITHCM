package ptithcm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.Student;
import ptithcm.bean.majors;

@Controller
@RequestMapping("student")
public class StudentController {
	@RequestMapping("index")
	public String index(ModelMap model) {
		Student student = new Student("Nguyễn Văn Tèo", 9.5, "WEB");
		model.addAttribute(student);
		return "student2";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String showForm() {
		return "student/form";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String saveData(HttpServletRequest request) {
		String name = request.getParameter("name");
		String mark = request.getParameter("mark");
		String major = request.getParameter("major");

		request.setAttribute("name", name);
		request.setAttribute("mark", mark);
		request.setAttribute("major", major);

		return "student/success";
	}

	@ModelAttribute("major")
	public Map<String, String> getMajors() {
		Map<String, String> mj = new HashMap<>();
		mj.put("IT", "Information Technology");
		mj.put("ML", "Multi Media");
		mj.put("IOS", "IOS");
		return mj;
	}

	@ModelAttribute("major_list")
	public List<majors> getMajorList() {
		List<majors> mjl = new ArrayList<>();
		mjl.add(new majors("APP", "Ứng dụng phần mềm"));
		mjl.add(new majors("ML", "Multi Media"));
		System.out.print(mjl);
		return mjl;
	}
}
