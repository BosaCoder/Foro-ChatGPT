package com.example.forum.service;

import com.example.forum.model.Post;
import com.example.forum.model.User;
import com.example.forum.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
public class PostService {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private Gpt3Service gpt3Service;

    @Autowired
    private UserService userService;

    public List<Post> getAllPosts() {
        return postRepository.findAll();
    }

    public Post savePost(Post post) {
        return postRepository.save(post);
    }

    public Post createGpt3Response(Post originalPost) throws IOException, InterruptedException {
        String gpt3Response = gpt3Service.calculateIntegral(originalPost.getContent());

        Post responsePost = new Post();
        responsePost.setTitle("Response to " + originalPost.getTitle());
        responsePost.setContent(gpt3Response);
        User gpt3User = userService.getGpt3User();
        responsePost.setUser(gpt3User);

        return postRepository.save(responsePost);
    }
}
