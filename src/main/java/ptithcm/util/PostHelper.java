package ptithcm.util;

import java.util.List;

import ptithcm.bean.Post;

public class PostHelper {
    public void cleanContent(List<Post> posts) {
        for (Post post : posts) {
            post.setContent("");
        }
    }
}
