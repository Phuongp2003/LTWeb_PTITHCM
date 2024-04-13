package ptithcm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.bean.Post;

// @Controller
// @RequestMapping("/forum/post")
// public class PostController {
// Post postTest;

// @RequestMapping(value = "/{id}")
// public String post(Model model, @PathVariable("id") String id) {
// List<Post> post = new ArrayList<Post>();

// model.addAttribute("title", "PTITHCM Forum");
// model.addAttribute("type", "forum");
// for (Post i : post) {
// if (i.getId().equals(id)) {
// postTest = i;
// break;
// }
// }

// model.addAttribute("post", postTest);
// return "post";
// }
// }
