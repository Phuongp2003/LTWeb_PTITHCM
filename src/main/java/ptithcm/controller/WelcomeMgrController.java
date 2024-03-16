package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Student;

@Controller
@RequestMapping("student-mgr")
public class WelcomeMgrController {
	@RequestMapping()
	public String index(ModelMap model) {
		model.addAttribute("message", "Ban goi index()");
		return "student-mgr";
	}

	@RequestMapping(params = "btnInsert")
	public String insert(ModelMap model,
			@RequestParam("name") String name,
			@RequestParam("mark") Double mark,
			@RequestParam("major") String major) {
		model.addAttribute("name", name);
		model.addAttribute("mark", mark);
		model.addAttribute("major", major);

		return "success";
	}

	@RequestMapping(params = "btnUpdate")
	public String update(ModelMap model, Student student) {
		model.addAttribute("student", student);
		return "success2";
	}

	@RequestMapping(params = "btnDelete")
	public String delete(ModelMap model) {
		model.addAttribute("message", "Ban goi delete()");
		return "student-mgr";
	}

	@RequestMapping(params = "btnEdit")
	public String edit(ModelMap model) {
		model.addAttribute("message", "Ban goi edit()");
		return "student-mgr";
	}
}
